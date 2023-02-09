#! /usr/bin/env lua-any
-- Lua-Versions: 5.3
--package.path = package.path .. ";/opt/zbstudio/lualibs/mobdebug/?.lua"
--require('mobdebug').start()

local M = require 'posix.sys.socket'
local I = require "inspect"
local N = require "rtnetlink"

local F=N.F
local R=N.R

local su=string.unpack
if M.AF_NETLINK ~= nil then
   local getpid = require 'posix.unistd'.getpid
   local fd,ok,err
   fd, err = M.socket(M.AF_NETLINK, M.SOCK_RAW, M.NETLINK_ROUTE)
   assert(fd, err)

   ok, err = M.bind(fd, {family=M.AF_NETLINK, pid=getpid(), groups=0x2FFFF})
   assert(ok, err)
   local offset,r
   while true do
      local data
      offset=1
      data, err = M.recv(fd, 16384)
      assert(data, err)
	r,offset=N:parsemessage(data,offset)
	print(I.inspect(r))
   end
end
