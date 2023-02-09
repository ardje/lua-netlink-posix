local M={_S={},_RA={}}
local lib=require"rtnl/lib"
-- /usr/include/linux/neighbour.h
--[[
struct ndmsg {
	__u8		ndm_family;
	__u8		ndm_pad1;
	__u16		ndm_pad2;
	__s32		ndm_ifindex;
	__u16		ndm_state;
	__u8		ndm_flags;
	__u8		ndm_type;
};
/*
 *	Neighbor Cache Entry States.
 */

#define NUD_INCOMPLETE	0x01
#define NUD_REACHABLE	0x02
#define NUD_STALE	0x04
#define NUD_DELAY	0x08
#define NUD_PROBE	0x10
#define NUD_FAILED	0x20

/* Dummy states */
#define NUD_NOARP	0x40
#define NUD_PERMANENT	0x80
]]
local ndm_states={
	[0x01]="NUD_INCOMPLETE",
	[0x02]="NUD_REACHABLE",
	[0x04]="NUD_STALE",
	[0x08]="NUD_DELAY",
	[0x10]="NUD_PROBE",
	[0x20]="NUD_FAILED",
	[0x40]="NUD_NOARP",
	[0x80]="NUD_PERMANENT"}

M._S.ndmsg = {
	pack="Bxxxi4I2BB", fields={
		{"family",lib.familys},
		"ifindex",
		{"state", ndm_states },
		"flags","type" }
}
M._S.nda_cacheinfo = { pack="I4I4I4I4", fields={"ndm_confirmed","ndm_used","ndm_updated","ndm_refcnt" }}

-- /usr/include/linux/neighbour.h
--[[
enum {
	NDA_UNSPEC,
	NDA_DST,
	NDA_LLADDR,
	NDA_CACHEINFO,
	NDA_PROBES,
	NDA_VLAN,
	NDA_PORT,
	NDA_VNI,
	NDA_IFINDEX,
	NDA_MASTER,
	NDA_LINK_NETNSID,
	NDA_SRC_VNI,
	NDA_PROTOCOL,  /* Originator of entry */
	NDA_NH_ID,
	NDA_FDB_EXT_ATTRS,
	__NDA_MAX
};
--]]
M._RA.ndmsg={
	{"NDA_DST",lib.itoa},
	{"NDA_LLADDR",lib.hexdumpcolon},
	{"NDA_CACHEINFO", "nda_cacheinfo"},
	{"NDA_PROBES","I4"},
	"NDA_VLAN",
	"NDA_PORT",
	"NDA_VNI",
	"NDA_IFINDEX",
	"NDA_MASTER",
	"NDA_LINK_NETNSID",
	"NDA_SRC_VNI",
	"NDA_PROTOCOL",
	"NDA_NH_ID",
	"NDA_FDB_EXT_ATTRS",
}
return M
