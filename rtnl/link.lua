local M={_S={},_RA={}}
local lib=require"rtnl/lib"
-- /usr/include/linux/if_link.h
-- /usr/include/linux/rtnetlink.h
--[[
struct ifinfomsg {
	unsigned char	ifi_family;
	unsigned char	__ifi_pad;
	unsigned short	ifi_type;		/* ARPHRD_* */
	int		ifi_index;		/* Link index	*/
	unsigned	ifi_flags;		/* IFF_* flags	*/
	unsigned	ifi_change;		/* IFF_* change mask */
};
]]
local _ifla_stats64={
"rx_packets", "tx_packets", "rx_bytes", "tx_bytes",
"rx_errors", "tx_errors", "rx_dropped", "tx_dropped", "multicast",
"collisions", "rx_length_errors", "rx_over_errors", "rx_crc_errors",
"rx_frame_errors", "rx_fifo_errors", "rx_missed_errors", "tx_aborted_errors",
"tx_carrier_errors", "tx_fifo_errors", "tx_heartbeat_errors",
"tx_window_errors", "rx_compressed", "tx_compressed", "rx_nohandler",
"rx_otherhost_dropped"}

local _ifla_stats={
"rx_packets", "tx_packets", "rx_bytes", "tx_bytes",
"rx_errors", "tx_errors", "rx_dropped", "tx_dropped", "multicast",
"collisions", "rx_length_errors", "rx_over_errors", "rx_crc_errors",
"rx_frame_errors", "rx_fifo_errors", "rx_missed_errors", "tx_aborted_errors",
"tx_carrier_errors", "tx_fifo_errors", "tx_heartbeat_errors",
"tx_window_errors", "rx_compressed", "tx_compressed", "rx_nohandler"}
--M._S.nda_cacheinfo = { pack="I4I4I4I4", fields={"ndm_confirmed","ndm_used","ndm_updated","ndm_refcnt" }}
M._S.ifla_stats64={ pack="I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8I8", fields=_ifla_stats64 }
M._S.ifla_stats={ pack="I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4", fields=_ifla_stats }

M._S.ifinfomsg = {
	pack="BBI2i4I4I4", fields={
		"family",
		"_pad",
		"type",
		"index",
		"flags",
		"change"}
}
--[=[
--[[

--[[
enum {
	IFLA_UNSPEC,
	IFLA_ADDRESS,
	IFLA_BROADCAST,
	IFLA_IFNAME,
	IFLA_MTU,
	IFLA_LINK,
	IFLA_QDISC,
	IFLA_STATS,
	IFLA_COST,
#define IFLA_COST IFLA_COST
	IFLA_PRIORITY,
#define IFLA_PRIORITY IFLA_PRIORITY
	IFLA_MASTER,
#define IFLA_MASTER IFLA_MASTER
	IFLA_WIRELESS,		/* Wireless Extension event - see wireless.h */
#define IFLA_WIRELESS IFLA_WIRELESS
	IFLA_PROTINFO,		/* Protocol specific information for a link */
#define IFLA_PROTINFO IFLA_PROTINFO
	IFLA_TXQLEN,
#define IFLA_TXQLEN IFLA_TXQLEN
	IFLA_MAP,
#define IFLA_MAP IFLA_MAP
	IFLA_WEIGHT,
#define IFLA_WEIGHT IFLA_WEIGHT
	IFLA_OPERSTATE,
	IFLA_LINKMODE,
	IFLA_LINKINFO,
#define IFLA_LINKINFO IFLA_LINKINFO
	IFLA_NET_NS_PID,
	IFLA_IFALIAS,
	IFLA_NUM_VF,		/* Number of VFs if device is SR-IOV PF */
	IFLA_VFINFO_LIST,
	IFLA_STATS64,
	IFLA_VF_PORTS,
	IFLA_PORT_SELF,
	IFLA_AF_SPEC,
	IFLA_GROUP,		/* Group the device belongs to */
	IFLA_NET_NS_FD,
	IFLA_EXT_MASK,		/* Extended info mask, VFs, etc */
	IFLA_PROMISCUITY,	/* Promiscuity count: > 0 means acts PROMISC */
#define IFLA_PROMISCUITY IFLA_PROMISCUITY
	IFLA_NUM_TX_QUEUES,
	IFLA_NUM_RX_QUEUES,
	IFLA_CARRIER,
	IFLA_PHYS_PORT_ID,
	IFLA_CARRIER_CHANGES,
	IFLA_PHYS_SWITCH_ID,
	IFLA_LINK_NETNSID,
	IFLA_PHYS_PORT_NAME,
	IFLA_PROTO_DOWN,
	IFLA_GSO_MAX_SEGS,
	IFLA_GSO_MAX_SIZE,
	IFLA_PAD,
	IFLA_XDP,
	IFLA_EVENT,
	IFLA_NEW_NETNSID,
	IFLA_IF_NETNSID,
	IFLA_TARGET_NETNSID = IFLA_IF_NETNSID, /* new alias */
	IFLA_CARRIER_UP_COUNT,
	IFLA_CARRIER_DOWN_COUNT,
	IFLA_NEW_IFINDEX,
	IFLA_MIN_MTU,
	IFLA_MAX_MTU,
	IFLA_PROP_LIST,
	IFLA_ALT_IFNAME, /* Alternative ifname */
	IFLA_PERM_ADDRESS,
	IFLA_PROTO_DOWN_REASON,
	__IFLA_MAX
};
--]]
]=]
--[[
IFLA_STATS64: 25 8 byte integers
		[{nla_len=204, nla_type=IFLA_STATS64}, {
			rx_packets=3067815, tx_packets=420709, rx_bytes=4243037748, tx_bytes=52021560,
			rx_errors=0, tx_errors=0, rx_dropped=9636, tx_dropped=0, multicast=0,
			collisions=0, rx_length_errors=0, rx_over_errors=0, rx_crc_errors=0,
			rx_frame_errors=0, rx_fifo_errors=0, rx_missed_errors=0, tx_aborted_errors=0,
			tx_carrier_errors=0, tx_fifo_errors=0, tx_heartbeat_errors=0,
			tx_window_errors=0, rx_compressed=0, tx_compressed=0, rx_nohandler=0,
			rx_otherhost_dropped=0}],
IFLA_STATS: 24 8 byte integers
		[{nla_len=100, nla_type=IFLA_STATS}, {
			rx_packets=3067815, tx_packets=420709, rx_bytes=4243037748, tx_bytes=52021560,
			rx_errors=0, tx_errors=0, rx_dropped=9636, tx_dropped=0, multicast=0,
			collisions=0, rx_length_errors=0, rx_over_errors=0, rx_crc_errors=0,
			rx_frame_errors=0, rx_fifo_errors=0, rx_missed_errors=0, tx_aborted_errors=0,
			tx_carrier_errors=0, tx_fifo_errors=0, tx_heartbeat_errors=0,
			tx_window_errors=0, rx_compressed=0, tx_compressed=0, rx_nohandler=0}],
--]]

M._RA.ifinfomsg={
	--"IFLA_UNSPEC",
	"IFLA_ADDRESS",
	"IFLA_BROADCAST",
	{"IFLA_IFNAME",lib.sfq},
	"IFLA_MTU",
	"IFLA_LINK",
	"IFLA_QDISC",
	--"IFLA_STATS",
	{"IFLA_STATS", "ifla_stats"},
	"IFLA_COST",
--#define IFLA_COST IFLA_COST
	"IFLA_PRIORITY",
--#define IFLA_PRIORITY IFLA_PRIORITY
	"IFLA_MASTER",
--#define IFLA_MASTER IFLA_MASTER
	"IFLA_WIRELESS",--		/* Wireless Extension event - see wireless.h */
--#define IFLA_WIRELESS IFLA_WIRELESS
	"IFLA_PROTINFO",--		/* Protocol specific information for a link */
--#define IFLA_PROTINFO IFLA_PROTINFO
	"IFLA_TXQLEN",
--#define IFLA_TXQLEN IFLA_TXQLEN
	"IFLA_MAP",
--#define IFLA_MAP IFLA_MAP
	"IFLA_WEIGHT",
--#define IFLA_WEIGHT IFLA_WEIGHT
	"IFLA_OPERSTATE",
	"IFLA_LINKMODE",
	"IFLA_LINKINFO",
--#define IFLA_LINKINFO IFLA_LINKINFO
	"IFLA_NET_NS_PID",
	"IFLA_IFALIAS",
	"IFLA_NUM_V",	--	/* Number of VFs if device is SR-IOV PF */
	"IFLA_VFINFO_LIST",
	--"IFLA_STATS64",
	{"IFLA_STATS64", "ifla_stats64"},
	--{"NDA_CACHEINFO", "nda_cacheinfo"},
	"IFLA_VF_PORTS",
	"IFLA_PORT_SELF",
	"IFLA_AF_SPEC",
	"IFLA_GROUP",--		/* Group the device belongs to */
	"IFLA_NET_NS_FD",
	"IFLA_EXT_MASK",--		/* Extended info mask, VFs, etc */
	"IFLA_PROMISCUITY",--	/* Promiscuity count: > 0 means acts PROMISC */
-- #define IFLA_PROMISCUITY IFLA_PROMISCUITY
	"IFLA_NUM_TX_QUEUES",
	"IFLA_NUM_RX_QUEUES",
	"IFLA_CARRIER",
	"IFLA_PHYS_PORT_ID",
	"IFLA_CARRIER_CHANGES",
	"IFLA_PHYS_SWITCH_ID",
	"IFLA_LINK_NETNSID",
	"IFLA_PHYS_PORT_NAME",
	"IFLA_PROTO_DOWN",
	"IFLA_GSO_MAX_SEGS",
	"IFLA_GSO_MAX_SIZE",
	"IFLA_PAD",
	"IFLA_XDP",
	"IFLA_EVENT",
	"IFLA_NEW_NETNSID",
	"IFLA_IF_NETNSID",
	-- "IFLA_TARGET_NETNSID = IFLA_IF_NETNSID, /* new alias */
	"IFLA_CARRIER_UP_COUNT",
	"IFLA_CARRIER_DOWN_COUNT",
	"IFLA_NEW_IFINDEX",
	"IFLA_MIN_MTU",
	"IFLA_MAX_MTU",
	"IFLA_PROP_LIST",
	"IFLA_ALT_IFNAME",-- /* Alternative ifname */
	"IFLA_PERM_ADDRESS",
	"IFLA_PROTO_DOWN_REASON",
	"IFLA_PARENT_DEV_NAME",
	"IFLA_PARENT_DEV_BUS_NAME",
	"IFLA_GRO_MAX_SIZE",
	"IFLA_TSO_MAX_SIZE",
	"IFLA_TSO_MAX_SEGS",
	"__IFLA_MAX",
}
return M
