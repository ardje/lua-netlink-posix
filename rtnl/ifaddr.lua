local M={_S={},_RA={}}
local lib=require"rtnl/lib"
-- /usr/include/linux/if_addr.h
--[[
struct ifaddrmsg {
	__u8		ifa_family;
	__u8		ifa_prefixlen;	/* The prefix length		*/
	__u8		ifa_flags;	/* Flags			*/
	__u8		ifa_scope;	/* Address scope		*/
	__u32		ifa_index;	/* Link index			*/
};
]]

M._S.ifaddrmsg = {
	pack="BBBBI4", fields={
		{"family",lib.familys},
		"prefixlen",
		"flags",
		"scope",
		"index" }
}
--[[
struct ifa_cacheinfo {
	__u32	ifa_prefered;
	__u32	ifa_valid;
	__u32	cstamp; /* created timestamp, hundredths of seconds */
	__u32	tstamp; /* updated timestamp, hundredths of seconds */
};
]]
M._S.ifa_cacheinfo = {
	pack="I4I4I4I4", fields={
		"prefered",
		"valid",
		"cstamp",
		"tstamp",
	}
}

--[[
enum {
	IFA_UNSPEC,
	IFA_ADDRESS,
	IFA_LOCAL,
	IFA_LABEL,
	IFA_BROADCAST,
	IFA_ANYCAST,
	IFA_CACHEINFO,
	IFA_MULTICAST,
	IFA_FLAGS,
	IFA_RT_PRIORITY,  /* u32, priority/metric for prefix route */
	IFA_TARGET_NETNSID,
	__IFA_MAX,
};
--]]
M._RA.ifaddrmsg={
	--"IFA_UNSPEC",
	{"IFA_ADDRESS",lib.itoa},
	{"IFA_LOCAL",lib.itoa},
	"IFA_LABEL",
	{"IFA_BROADCAST",lib.itoa},
	"IFA_ANYCAST",
	{"IFA_CACHEINFO","ifa_cacheinfo"},
	"IFA_MULTICAST",
	"IFA_FLAGS",
	{"IFA_RT_PRIORITY","I4" }, --  /* u32, priority/metric for prefix route */
	"IFA_TARGET_NETNSID",
	{"IFA_PROTO",{"B","IFAPROT_UNSPEC","IFAPROT_KERNEL_LO","IFAPROT_KERNEL_RA","IFAPROT_KERNEL_LL"}},
}
return M
