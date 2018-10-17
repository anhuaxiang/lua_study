-- os.rename('test.txt', 'test01.txt')
-- os.remove('test.txt')
-- os.execute('mkdir hello')
print(os.getenv('hello'))
print(os.time())
print(os.time{year=2018, month=9, day=30, hour=14})
print(os.date())
date = os.date('*t')
for k, v in pairs(date) do
	print(k, v)
end
print(os.date('%Y-%m-%d %H:%M:%S'))

start_time = os.time()
for i=1, 10000000 do 
	io.write('')
end
end_time = os.time()
print(os.difftime(start_time, end_time))
print(start_time, end_time)

local x = os.clock()
local s = 0
for i=1, 10^7 do 
	s = s +i
end
print(s, os.clock() - x)