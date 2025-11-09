local log_file = {}

local sessionId = math.random(1000, 9999)
local file_name = os.date("%Y_%m_%d_" .. sessionId)
local timestamp = "[".. os.date("%Y-%m-%d %H:%M:%S") .."] : [DIOXIDE] : [TRACE]: " 

if not isfile("dioxide") then
	makefolder("dioxide")
end

local log_data_file = writefile("dioxide/" .. file_name..".txt", timestamp .."Initialization successful")

function log_file:write(str, trace_name)
	timestamp = "[".. os.date("%Y-%m-%d %H:%M:%S") .."] : ["..trace_name or "DIOXIDE".."] : [TRACE]: " 
	appendfile("dioxide/"..file_name..".txt", "\n" .. timestamp .. str)
end

function log_file:warn(str, trace_name)
	timestamp = "[".. os.date("%Y-%m-%d %H:%M:%S") .."] : ["..trace_name or "DIOXIDE".."] : [WARN]: " 
	appendfile("dioxide/"..file_name..".txt", "\n" .. timestamp .. str)
end

function log_file:error(str, trace_name)
	timestamp = "[".. os.date("%Y-%m-%d %H:%M:%S") .."] : ["..trace_name or "DIOXIDE".."] : [ERROR]: " 
	appendfile("dioxide/"..file_name..".txt", "\n" .. timestamp .. str)
end

return log_file
