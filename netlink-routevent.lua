#! /usr/bin/env lua

local M = require 'posix.sys.socket'
local I = require "inspect"


if M.AF_NETLINK ~= nil then
   local getpid = require 'posix.unistd'.getpid

   local fd, err = M.socket(M.AF_NETLINK, M.SOCK_RAW, M.NETLINK_ROUTE)
   assert(fd, err)

   local ok, err = M.bind(fd, {family=M.AF_NETLINK, pid=getpid(), groups=0x2FFFF})
   assert(ok, err)

   while true do
      local data, err = M.recv(fd, 16384)
      assert(data, err)
      print("got bytes:",string.len(data))
      local msgl,msgt,msgf,msgs,msgpid=string.unpack("I4I2I2I4I4",data)
      print("got bytes:",msgl,msgt,msgf,msgs,msgpid)
   end
end
