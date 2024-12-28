local M={}
local sf=string.format
local su=string.unpack
function M.align(offset)
	-- Lua indices start at 1, and we actually use index instead of offset
	--return (offset-1+3)&(-1-3)+1
	-- Somehow + was messing up the offset
	return ((offset-1+3)&(-1-3))+1
	--return ((offset-1+7)&(-1-7))+1
end
function M.itoa(buffer,rtmsg)
	if rtmsg.family == "AF_INET" then
		return sf("%d.%d.%d.%d",su("BBBB",buffer))
	else
		return sf("%x:%x:%x:%x:%x:%x:%x:%x",su(">I2I2I2I2I2I2I2I2",buffer))
	end
end
function M.sfq(buffer)
	return sf("%q",buffer)
end
function M.hexdump(buffer)
	local r={}
	for i = 1,buffer:len() do
		r[#r+1]=string.format("%02x",buffer:byte(i))
	end
	return table.concat(r," ")
end
function M.hexdumpcolon(buffer)
	local r={}
	for i = 1,buffer:len() do
		r[#r+1]=string.format("%02x",buffer:byte(i))
	end
	return table.concat(r,":")
end
M.familys={ [2]="AF_INET",[10]="AF_INET6" }

return M
