#!/bin/bash

if [ $# -lt 1 -o "$1" = "help" ]; then
        echo
        echo "**** KILOVIEW基于Docker的开发环境管理器 ****"
        echo "*    ( Version: 0.1, 2017-05-27 )          *"
        echo "********************************************"
        echo
        echo "您可以使用kvd命令并带以下参数来进行操作："
        echo "  list             : 列出当前所有可操作的开发容器。"
        echo "  list-packages    : 列出当前由管理员预先定义好的开发环境包。你可以基于这"
        echo "                     些包来创建工作容器。"
        echo "  start <id>       : 启动由<id>指定的开发容器。"
        echo "  stop <id>        : 停止由<id>指定的开发容器。"
        echo "  enter <id>       : 进入由<id>指定的容器 (进入交互式shell)。"
        echo "  delete <id>      : 删除由<id>指定的容器。"
        echo "  create [package] : 由指定的<package>环境包来创建容器。如不指定，将由向导"
        echo "                     提示您进行选择。"
        echo "  help             : 获得本帮助。"
        exit 1
fi

if [ "$1" = "list" ]; then
        rslt=`docker ps -a -f name="${USER}" -f name="public" --format="{{.Names}}"`
        echo "当前用户可用的开发容器："
        for item in ${rslt}; do
                echo "  $item"
        done
        echo
        echo "以及所有可用的容器（非当前用户的容器最好不要操作它！）："
        rslt=`docker ps -a --format="{{.Names}}"`
        for item in ${rslt}; do
                echo "  $item"
        done
        exit 0
fi

if [ "$1" = "list-packages" ]; then
        rslt=`ls ${KSYS_DATA_DISK}/public/docker-env/packages/ 2>/dev/null`
        echo "可用于创建容器的开发环境包："
        for item in ${rslt}; do
                source ${KSYS_DATA_DISK}/public/docker-env/packages/${item}
                echo "  $item           : $DESC"
        done
        exit 0
fi
dock
if [ "$1" = "start" ]; then
        if [ "$2" = "" ]; then
                echo "需要指定要启动的容器ID。您可以使用 kvd list 来列出可用的容器ID。"
                exit 1
        fi
        fnd=n
        rslt=`docker ps -a --format="{{.Names}}"`
        for item in ${rslt}; do
                if [ "$2" = "$item" ]; then
                        fnd=y
                        break
                fi
        done

        if [ "$fnd" = "n" ]; then
                echo "** 无效的容器ID。使用 kvd list 可以获得可用的容器ID列表。"
                exit 1
        fi

        docker start $2
        exit 0
fi

if [ "$1" = "stop" ]; then
        if [ "$2" = "" ]; then
                echo "需要指定要停止的容器ID。您可以使用 kvd list 来列出可用的容器ID。"
                exit 1
        fi
        fnd=n
        rslt=`docker ps -a --format="{{.Names}}"`
        for item in ${rslt}; do
                if [ "$2" = "$item" ]; then
                        fnd=y
                        break
                fi
        done

        if [ "$fnd" = "n" ]; then
                echo "** 无效的容器ID。使用 kvd list 可以获得可用的容器ID列表。"
                exit 1
        fi

        docker stop $2
        exit 0
fi

if [ "$1" = "enter" ]; then
        if [ "$2" = "" ]; then
                echo "需要指定要进入的容器ID。您可以使用 kvd list 来列出可用的容器ID。"
                exit 1
        fi
        fnd=n
        rslt=`docker ps -a --format="{{.Names}}"`
        for item in ${rslt}; do
                if [ "$2" = "$item" ]; then
                        fnd=y
                        break
                fi
        done

        if [ "$fnd" = "n" ]; then
                echo "** 无效的容器ID。使用 kvd list 可以获得可用的容器ID列表。"
                exit 1
        fi

        docker start $2 > /dev/null 2>&1
        docker exec -it $2 /bin/bash
        exit 0
fi

if [ "$1" = "delete" ]; then
        if [ "$2" = "" ]; then
                echo "需要指定要删除的容器ID。您可以使用 kvd list 来列出所有的容器ID。"
                exit 1
        fi
        fnd=n
        rslt=`docker ps -a --format="{{.Names}}"`
        for item in ${rslt}; do
                if [ "$2" = "$item" ]; then
                        fnd=y
                        break
                fi
        done

        if [ "$fnd" = "n" ]; then
                echo "** 无效的容器ID。使用 kvd list 可以获得所有的容器ID列表。"
                exit 1
        fi

        rslt=`docker ps -f name="$2" --format="{{.Names}}"`
        if [ "$rslt" != "" ]; then
                echo "** 当前容器还在运行中！请先使用 kvd stop <id> 停止容器后，再尝试删除！"
                exit 1
        fi

        answer=
        echo -n "确定要删除开发容器[$2]吗？（回答yes确认）[yes/no]"
        read answer
        if [ "$answer" = "yes" ]; then
                docker rm $2
                exit 0
        else
                echo "** 没有删除容器。"
                exit 1
        fi
fi

if [ "$1" = "create" ]; then
        if [ "$2" = "" ]; then
                echo "需要指定创建容器所基于的开发环境包。使用 kvd list-packages 来列出所有可用的包。"
                exit 1
        fi

        find ${KSYS_DATA_DISK}/public/docker-env/packages -name "$2" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
                echo "** 无效的开发环境包ID。使用 kvd list-packages 可以获得所有的开发环境包列表。"
                exit 1
        fi

        source ${KSYS_DATA_DISK}/public/docker-env/packages/$2
        if [ $NAME = "" ]; then
                echo "** 无效的开发环境包！这可能是包的配置文件错误？请联系系统管理员。"
                exit 1
        fi

        container_name=
        ispublic=n
        filebase=${KSYS_DATA_DISK}/${USER}
        if [ "$USED_FOR" = "public" ]; then
                container_name=public
                ispublic=y
                filebase=${KSYS_DATA_DISK}/public
        else
                container_name=${USER}
        fi
        container_name=${container_name}_${NAME}

        fnd=n
        rslt=`docker ps -a --format="{{.Names}}"`
        for item in ${rslt}; do
                if [ "$container_name" = "$item" ]; then
                        fnd=y
                        break
                fi
        done

        if [ "$fnd" = "y" ]; then
                echo "** 要创建的容器[$container_name]看起来已经存在！没有必要在这台机器上创建几个相同的开发容器吧？"
                exit 1
        fi

        echo "正在准备创建开发容器[$container_name], 基于 $2 ..."


        if [ ${#GIT_SOURCES[@]} -gt 0 ]; then
                echo "开始检查和签出git..."
                for idx in ${!GIT_SOURCES[@]}; do
                        if [ -d $filebase/${GIT_LOCALS[$idx]} ]; then
                                echo "注意：拟签出 ${GIT_SOURCES[$idx]} 到 $filebase/${GIT_LOCALS[$idx]}，但是目标路径已经存在！因此，我不会
主动执行git clone来签出。如果这个目录下没有实际签出，请您在后面的时间里，自己执行以下命令完成签出："
                                echo "  git clone ${GIT_SOURCES[$idx]} $filebase/${GIT_LOCALS[$idx]}"
                                echo
                        else
                                echo "正在签出 ${GIT_SOURCES[$idx]} 到 $filebase/${GIT_LOCALS[$idx]} ，请稍候..."
                                git clone ${GIT_SOURCES[$idx]} $filebase/${GIT_LOCALS[$idx]}
                                echo "签出结束。"
                        fi
                done
        fi

        echo "正在准备Docker的文件映射..."
        create_cmd="docker run -i -t --name=$container_name"

        if [ ${#GIT_LOCALS[@]} -gt 0 ]; then
                for idx in ${!GIT_LOCALS[@]}; do
                        echo "映射git工作目录 ${GIT_LOCALS[$idx]} --> ${GIT_MAPS[$idx]} ..."
                        create_cmd="$create_cmd -v $filebase/${GIT_LOCALS[$idx]}:${GIT_MAPS[$idx]}"
                done
        fi

        for idx in ${!MAP_FROM[@]}; do
                echo "映射路径 ${MAP_FROM[$idx]} --> ${MAP_TO[$idx]} ..."
                create_cmd="$create_cmd -v ${MAP_FROM[$idx]}:${MAP_TO[$idx]}"
        done

        create_cmd="$create_cmd -d $DOCKER_IMAGE /bin/bash"

        echo "Docker创建容器的完整命令："
        echo $create_cmd
        $create_cmd
        exit $?
fi

exit 0