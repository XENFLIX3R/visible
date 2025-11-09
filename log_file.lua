local log_file = {}
local sessionId = math.random(1000, 9999)
local file_name = os.date("%Y_%m_%d_" .. sessionId)

if not isfolder("dioxide") then
	makefolder("dioxide")
end

writefile("dioxide/"..file_name..".txt", "["..os.date("%Y-%m-%d %H:%M:%S").."] : [DIOXIDE] : [TRACE]: Initialization successful")

function log_file:write(str, trace_name)
	local t = "["..os.date("%Y-%m-%d %H:%M:%S").."] : ["..(trace_name or "DIOXIDE").."] : [TRACE]: "
	appendfile("dioxide/"..file_name..".txt", "\n"..t..str)
end

function log_file:warn(str, trace_name)
	local t = "["..os.date("%Y-%m-%d %H:%M:%S").."] : ["..(trace_name or "DIOXIDE").."] : [WARN]: "
	appendfile("dioxide/"..file_name..".txt", "\n"..t..str)
end

function log_file:error(str, trace_name)
	local t = "["..os.date("%Y-%m-%d %H:%M:%S").."] : ["..(trace_name or "DIOXIDE").."] : [ERROR]: "
	appendfile("dioxide/"..file_name..".txt", "\n"..t..str)
end

return log_file
