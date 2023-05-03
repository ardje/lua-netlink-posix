local M={_S={},_RA={}}
local lib=require"rtnl/lib"
-- /usr/include/linux/rtnetlink.h
--[[
struct rtmsg {
	unsigned char		rtm_family;
	unsigned char		rtm_dst_len;
	unsigned char		rtm_src_len;
	unsigned char		rtm_tos;

	unsigned char		rtm_table;	/* Routing table id */
	unsigned char		rtm_protocol;	/* Routing protocol; see below	*/
	unsigned char		rtm_scope;	/* See below */	
	unsigned char		rtm_type;	/* See below	*/

	unsigned		rtm_flags;
};
]]

M._S.rtmsg = {
	pack="BBBBBBBBI4", fields={
		{"family",lib.familys},
		"dst_len",
		"src_len",
		"tos",
		"table",
		"protocol",
		"scope",
		"type",
		"flags",
	}
}
return M
