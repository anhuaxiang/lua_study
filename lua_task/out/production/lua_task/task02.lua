local lfs = require("lfs")
print(lfs.currentdir())
for k in lfs.dir(lfs.currentdir()) do
    print(k)
end