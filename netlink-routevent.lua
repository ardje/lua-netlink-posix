#! /usr/bin/env lua-any
-- Lua-Versions: 5.3 5.4

local M = require 'posix.sys.socket'
-- local I = require "inspect"
local N = require "rtnetlink"

local F=N.F
local R=N.R

local function hexdump(buffer)
	local r={}
	for i = 1,buffer:len() do
		r[#r+1]=string.format("%02x",buffer:byte(i))
	end
	return table.concat(r," ")
end
local su=string.unpack
if M.AF_NETLINK ~= nil then
   local getpid = require 'posix.unistd'.getpid
   local fd,ok,err
   fd, err = M.socket(M.AF_NETLINK, M.SOCK_RAW, M.NETLINK_ROUTE)
   assert(fd, err)

   ok, err = M.bind(fd, {family=M.AF_NETLINK, pid=getpid(), groups=0x2FFFF})
   assert(ok, err)
   local offset
   while true do
      local data
      offset=1
      data, err = M.recv(fd, 16384)
      assert(data, err)
      --print(hexdump(data))
      local msgl,msgt,msgf,msgs,msgpid
      msgl,msgt,msgf,msgs,msgpid,offset=su("I4I2I2I4I4",data,offset)
      local submsg=data:sub(offset)
      local t=msgt and R[msgt] or msgt
      print(("%s size:%02x flags:%04x sequence:%08x pid:%d"):format(t,msgl,msgf,msgs,msgpid))
      --print("got bytes:",t,msgf,msgs,msgpid)
      local r
      local submsg=data:sub(offset)
      print(hexdump(submsg))
      if t=="RTM_NEWNEIGH" then
	      --print"parse data"
	      --print(hexdump(data))
	      r,offset=N.parse("ndmsg",data,offset)
	      --assert(r,offset)
	      --print(r,offset)
	      if r then
		    	for k,v in pairs(r) do
				print("ndmsg",k,v)
			end
		end
		while offset < msgl do
			local l,t,loffset=su("I2I2!4",data,offset)
			local attr=data:sub(loffset,offset+l-1)
			print("type:",N.RA.ndmsg[t])
			if N.RA.ndmsg[t]=="NDA_CACHEINFO" then
				r=N.parse("nda_cacheinfo",data,loffset)
			      if r then
					for k,v in pairs(r) do
						print("nda_cacheinfo",k,v)
					end
				end
			else
				print(hexdump(attr))
			end
			print(offset,l,((offset+l+2)&(-1-3))+1)
			offset=(offset+l+2)&(-1-3)+1
      local submsg=data:sub(offset)
      print(hexdump(submsg))
		end
      end
      print("-")
   end
end
