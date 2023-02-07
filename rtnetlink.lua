local M={R={},F={},S={},RA={},G={}}
local function expand(F,R,start,pref,n)
	for i,v in ipairs(pref) do
		--print(v..n,start+i-1)
		F[v..n]=start+i-1
		R[start+i-1]=v..n
	end

end
local NDGS={"RTM_NEW","RTM_DEL","RTM_GET","RTM_SET"}
local NDG={"RTM_NEW","RTM_DEL","RTM_GET"}
local G={"RTM_GET"}
local N={"RTM_NEW"}
local GS={"RTM_GET","RTM_SET"}
expand(M.F,M.R,16,NDGS,"LINK")
expand(M.F,M.R,20,NDG,"ADDR")
expand(M.F,M.R,24,NDG,"ROUTE")
expand(M.F,M.R,28,NDG,"NEIGH")
expand(M.F,M.R,32,NDG,"RULE")
expand(M.F,M.R,36,NDG,"QDISC")
expand(M.F,M.R,40,NDG,"TCLASS")
expand(M.F,M.R,44,NDG,"TFILTER")
expand(M.F,M.R,48,NDG,"ACTION")
expand(M.F,M.R,52,NDG,"PREFIX")
expand(M.F,M.R,58,G,"MULTICAST")
expand(M.F,M.R,62,G,"ANYCAST")
expand(M.F,M.R,64,N,"NEIGHTBL")
expand(M.F,M.R,66,GS,"NEIGHTBL")
expand(M.F,M.R,68,N,"NDUSEROPT")
expand(M.F,M.R,72,NDG,"ADDRLABEL")
expand(M.F,M.R,78,GS,"DCB")
expand(M.F,M.R,80,NDG,"NETCONF")
expand(M.F,M.R,84,NDG,"MDB")
expand(M.F,M.R,88,NDG,"NSID")
expand(M.F,M.R,92,N,"STATS")
expand(M.F,M.R,94,G,"STATS")
expand(M.F,M.R,96,N,"CACHEREPORT")
expand(M.F,M.R,100,NDG,"CHAIN")
expand(M.F,M.R,104,NDG,"NEXTHOP")
expand(M.F,M.R,108,NDG,"LINKPROP")
expand(M.F,M.R,112,NDG,"VLAN")
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
]]
local su=string.unpack
M.G.AF_INET6=10
M.G.AF_INET=2
--local sp=string.pack
M.S.ndmsg = { pack="Bxxxi4I2BB", fields={"ndm_family","ndm_ifindex","ndm_state","ndm_flags","ndm_type" }}
M.S.nda_cacheinfo = { pack="I4I4I4I4", fields={"ndm_confirmed","ndm_used","ndm_updated","ndm_refcnt" }}
function M.parse(struct,data,offset)
	local S=M.S[struct]
	print("offset:",offset)
	if S then
		local Fs=S.fields
		local r={}
		local U={su(S.pack,data,offset)}
		for i,v in ipairs(U) do
			if i <= #Fs then
				r[Fs[i]] = v
				print(i,v,Fs[i])
			else
				print(i,v)
				offset=v
			end
		end
		return r, offset
	else
		return nil, "Unknown struct name"
	end
end

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
M.RA.ndmsg={
	"NDA_DST",
	"NDA_LLADDR",
	"NDA_CACHEINFO",
	"NDA_PROBES",
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

-- /usr/include/linux/rtnetlink.h
--[=[
/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
#ifndef __LINUX_RTNETLINK_H
#define __LINUX_RTNETLINK_H

#include <linux/types.h>
#include <linux/netlink.h>
#include <linux/if_link.h>
#include <linux/if_addr.h>
#include <linux/neighbour.h>

/* rtnetlink families. Values up to 127 are reserved for real address
 * families, values above 128 may be used arbitrarily.
 */
#define RTNL_FAMILY_IPMR		128
#define RTNL_FAMILY_IP6MR		129
#define RTNL_FAMILY_MAX			129

/****
 *		Routing/neighbour discovery messages.
 ****/

/* Types of messages */

enum {
	RTM_BASE	= 16,
	RTM_NEWLINK	= 16, NDGS
	RTM_NEWADDR	= 20, NDG
	RTM_NEWROUTE	= 24, NDG
	RTM_NEWNEIGH	= 28, NDG
	RTM_NEWRULE	= 32, NDG
	RTM_NEWQDISC	= 36, NDG
	RTM_NEWTCLASS	= 40, NDG
	RTM_NEWTFILTER	= 44, NDG
	RTM_NEWACTION	= 48, NDG
	RTM_NEWPREFIX	= 52, NDG
	RTM_GETMULTICAST = 58, G
	RTM_GETANYCAST	= 62, G
	RTM_NEWNEIGHTBL	= 64, N
	RTM_GETNEIGHTBL	= 66, GS
	RTM_NEWNDUSEROPT = 68, N
	RTM_NEWADDRLABEL = 72, NDG
	RTM_GETDCB = 78, GS
	RTM_NEWNETCONF = 80, NDG
	RTM_NEWMDB = 84, NDG
	RTM_NEWNSID = 88, NDG
	RTM_NEWSTATS = 92, N
	RTM_GETSTATS = 94, G
	RTM_NEWCACHEREPORT = 96, N
	RTM_NEWCHAIN = 100, NDG
	RTM_NEWNEXTHOP = 104,NDG
	RTM_NEWLINKPROP = 108, NDG
	RTM_NEWVLAN = 112, NDG

	__RTM_MAX,
#define RTM_MAX		(((__RTM_MAX + 3) & ~3) - 1)
};

#define RTM_NR_MSGTYPES	(RTM_MAX + 1 - RTM_BASE)
#define RTM_NR_FAMILIES	(RTM_NR_MSGTYPES >> 2)
#define RTM_FAM(cmd)	(((cmd) - RTM_BASE) >> 2)

/* 
   Generic structure for encapsulation of optional route information.
   It is reminiscent of sockaddr, but with sa_family replaced
   with attribute type.
 */

struct rtattr {
	unsigned short	rta_len;
	unsigned short	rta_type;
};

/* Macros to handle rtattributes */

#define RTA_ALIGNTO	4U
#define RTA_ALIGN(len) ( ((len)+RTA_ALIGNTO-1) & ~(RTA_ALIGNTO-1) )
#define RTA_OK(rta,len) ((len) >= (int)sizeof(struct rtattr) && \
			 (rta)->rta_len >= sizeof(struct rtattr) && \
			 (rta)->rta_len <= (len))
#define RTA_NEXT(rta,attrlen)	((attrlen) -= RTA_ALIGN((rta)->rta_len), \
				 (struct rtattr*)(((char*)(rta)) + RTA_ALIGN((rta)->rta_len)))
#define RTA_LENGTH(len)	(RTA_ALIGN(sizeof(struct rtattr)) + (len))
#define RTA_SPACE(len)	RTA_ALIGN(RTA_LENGTH(len))
#define RTA_DATA(rta)   ((void*)(((char*)(rta)) + RTA_LENGTH(0)))
#define RTA_PAYLOAD(rta) ((int)((rta)->rta_len) - RTA_LENGTH(0))




/******************************************************************************
 *		Definitions used in routing table administration.
 ****/

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

/* rtm_type */

enum {
	RTN_UNSPEC,
	RTN_UNICAST,		/* Gateway or direct route	*/
	RTN_LOCAL,		/* Accept locally		*/
	RTN_BROADCAST,		/* Accept locally as broadcast,
				   send as broadcast */
	RTN_ANYCAST,		/* Accept locally as broadcast,
				   but send as unicast */
	RTN_MULTICAST,		/* Multicast route		*/
	RTN_BLACKHOLE,		/* Drop				*/
	RTN_UNREACHABLE,	/* Destination is unreachable   */
	RTN_PROHIBIT,		/* Administratively prohibited	*/
	RTN_THROW,		/* Not in this table		*/
	RTN_NAT,		/* Translate this address	*/
	RTN_XRESOLVE,		/* Use external resolver	*/
	__RTN_MAX
};

#define RTN_MAX (__RTN_MAX - 1)


/* rtm_protocol */

#define RTPROT_UNSPEC		0
#define RTPROT_REDIRECT		1	/* Route installed by ICMP redirects;
					   not used by current IPv4 */
#define RTPROT_KERNEL		2	/* Route installed by kernel		*/
#define RTPROT_BOOT		3	/* Route installed during boot		*/
#define RTPROT_STATIC		4	/* Route installed by administrator	*/

/* Values of protocol >= RTPROT_STATIC are not interpreted by kernel;
   they are just passed from user and back as is.
   It will be used by hypothetical multiple routing daemons.
   Note that protocol values should be standardized in order to
   avoid conflicts.
 */

#define RTPROT_GATED		8	/* Apparently, GateD */
#define RTPROT_RA		9	/* RDISC/ND router advertisements */
#define RTPROT_MRT		10	/* Merit MRT */
#define RTPROT_ZEBRA		11	/* Zebra */
#define RTPROT_BIRD		12	/* BIRD */
#define RTPROT_DNROUTED		13	/* DECnet routing daemon */
#define RTPROT_XORP		14	/* XORP */
#define RTPROT_NTK		15	/* Netsukuku */
#define RTPROT_DHCP		16	/* DHCP client */
#define RTPROT_MROUTED		17	/* Multicast daemon */
#define RTPROT_KEEPALIVED	18	/* Keepalived daemon */
#define RTPROT_BABEL		42	/* Babel daemon */
#define RTPROT_BGP		186	/* BGP Routes */
#define RTPROT_ISIS		187	/* ISIS Routes */
#define RTPROT_OSPF		188	/* OSPF Routes */
#define RTPROT_RIP		189	/* RIP Routes */
#define RTPROT_EIGRP		192	/* EIGRP Routes */

/* rtm_scope

   Really it is not scope, but sort of distance to the destination.
   NOWHERE are reserved for not existing destinations, HOST is our
   local addresses, LINK are destinations, located on directly attached
   link and UNIVERSE is everywhere in the Universe.

   Intermediate values are also possible f.e. interior routes
   could be assigned a value between UNIVERSE and LINK.
*/

enum rt_scope_t {
	RT_SCOPE_UNIVERSE=0,
/* User defined values  */
	RT_SCOPE_SITE=200,
	RT_SCOPE_LINK=253,
	RT_SCOPE_HOST=254,
	RT_SCOPE_NOWHERE=255
};

/* rtm_flags */

#define RTM_F_NOTIFY		0x100	/* Notify user of route change	*/
#define RTM_F_CLONED		0x200	/* This route is cloned		*/
#define RTM_F_EQUALIZE		0x400	/* Multipath equalizer: NI	*/
#define RTM_F_PREFIX		0x800	/* Prefix addresses		*/
#define RTM_F_LOOKUP_TABLE	0x1000	/* set rtm_table to FIB lookup result */
#define RTM_F_FIB_MATCH	        0x2000	/* return full fib lookup match */
#define RTM_F_OFFLOAD		0x4000	/* route is offloaded */
#define RTM_F_TRAP		0x8000	/* route is trapping packets */

/* Reserved table identifiers */

enum rt_class_t {
	RT_TABLE_UNSPEC=0,
/* User defined values */
	RT_TABLE_COMPAT=252,
	RT_TABLE_DEFAULT=253,
	RT_TABLE_MAIN=254,
	RT_TABLE_LOCAL=255,
	RT_TABLE_MAX=0xFFFFFFFF
};


/* Routing message attributes */

enum rtattr_type_t {
	RTA_UNSPEC,
	RTA_DST,
	RTA_SRC,
	RTA_IIF,
	RTA_OIF,
	RTA_GATEWAY,
	RTA_PRIORITY,
	RTA_PREFSRC,
	RTA_METRICS,
	RTA_MULTIPATH,
	RTA_PROTOINFO, /* no longer used */
	RTA_FLOW,
	RTA_CACHEINFO,
	RTA_SESSION, /* no longer used */
	RTA_MP_ALGO, /* no longer used */
	RTA_TABLE,
	RTA_MARK,
	RTA_MFC_STATS,
	RTA_VIA,
	RTA_NEWDST,
	RTA_PREF,
	RTA_ENCAP_TYPE,
	RTA_ENCAP,
	RTA_EXPIRES,
	RTA_PAD,
	RTA_UID,
	RTA_TTL_PROPAGATE,
	RTA_IP_PROTO,
	RTA_SPORT,
	RTA_DPORT,
	RTA_NH_ID,
	__RTA_MAX
};

#define RTA_MAX (__RTA_MAX - 1)

#define RTM_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct rtmsg))))
#define RTM_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct rtmsg))

/* RTM_MULTIPATH --- array of struct rtnexthop.
 *
 * "struct rtnexthop" describes all necessary nexthop information,
 * i.e. parameters of path to a destination via this nexthop.
 *
 * At the moment it is impossible to set different prefsrc, mtu, window
 * and rtt for different paths from multipath.
 */

struct rtnexthop {
	unsigned short		rtnh_len;
	unsigned char		rtnh_flags;
	unsigned char		rtnh_hops;
	int			rtnh_ifindex;
};

/* rtnh_flags */

#define RTNH_F_DEAD		1	/* Nexthop is dead (used by multipath)	*/
#define RTNH_F_PERVASIVE	2	/* Do recursive gateway lookup	*/
#define RTNH_F_ONLINK		4	/* Gateway is forced on link	*/
#define RTNH_F_OFFLOAD		8	/* offloaded route */
#define RTNH_F_LINKDOWN		16	/* carrier-down on nexthop */
#define RTNH_F_UNRESOLVED	32	/* The entry is unresolved (ipmr) */

#define RTNH_COMPARE_MASK	(RTNH_F_DEAD | RTNH_F_LINKDOWN | RTNH_F_OFFLOAD)

/* Macros to handle hexthops */

#define RTNH_ALIGNTO	4
#define RTNH_ALIGN(len) ( ((len)+RTNH_ALIGNTO-1) & ~(RTNH_ALIGNTO-1) )
#define RTNH_OK(rtnh,len) ((rtnh)->rtnh_len >= sizeof(struct rtnexthop) && \
			   ((int)(rtnh)->rtnh_len) <= (len))
#define RTNH_NEXT(rtnh)	((struct rtnexthop*)(((char*)(rtnh)) + RTNH_ALIGN((rtnh)->rtnh_len)))
#define RTNH_LENGTH(len) (RTNH_ALIGN(sizeof(struct rtnexthop)) + (len))
#define RTNH_SPACE(len)	RTNH_ALIGN(RTNH_LENGTH(len))
#define RTNH_DATA(rtnh)   ((struct rtattr*)(((char*)(rtnh)) + RTNH_LENGTH(0)))

/* RTA_VIA */
struct rtvia {
	__kernel_sa_family_t	rtvia_family;
	__u8			rtvia_addr[0];
};

/* RTM_CACHEINFO */

struct rta_cacheinfo {
	__u32	rta_clntref;
	__u32	rta_lastuse;
	__s32	rta_expires;
	__u32	rta_error;
	__u32	rta_used;

#define RTNETLINK_HAVE_PEERINFO 1
	__u32	rta_id;
	__u32	rta_ts;
	__u32	rta_tsage;
};

/* RTM_METRICS --- array of struct rtattr with types of RTAX_* */

enum {
	RTAX_UNSPEC,
#define RTAX_UNSPEC RTAX_UNSPEC
	RTAX_LOCK,
#define RTAX_LOCK RTAX_LOCK
	RTAX_MTU,
#define RTAX_MTU RTAX_MTU
	RTAX_WINDOW,
#define RTAX_WINDOW RTAX_WINDOW
	RTAX_RTT,
#define RTAX_RTT RTAX_RTT
	RTAX_RTTVAR,
#define RTAX_RTTVAR RTAX_RTTVAR
	RTAX_SSTHRESH,
#define RTAX_SSTHRESH RTAX_SSTHRESH
	RTAX_CWND,
#define RTAX_CWND RTAX_CWND
	RTAX_ADVMSS,
#define RTAX_ADVMSS RTAX_ADVMSS
	RTAX_REORDERING,
#define RTAX_REORDERING RTAX_REORDERING
	RTAX_HOPLIMIT,
#define RTAX_HOPLIMIT RTAX_HOPLIMIT
	RTAX_INITCWND,
#define RTAX_INITCWND RTAX_INITCWND
	RTAX_FEATURES,
#define RTAX_FEATURES RTAX_FEATURES
	RTAX_RTO_MIN,
#define RTAX_RTO_MIN RTAX_RTO_MIN
	RTAX_INITRWND,
#define RTAX_INITRWND RTAX_INITRWND
	RTAX_QUICKACK,
#define RTAX_QUICKACK RTAX_QUICKACK
	RTAX_CC_ALGO,
#define RTAX_CC_ALGO RTAX_CC_ALGO
	RTAX_FASTOPEN_NO_COOKIE,
#define RTAX_FASTOPEN_NO_COOKIE RTAX_FASTOPEN_NO_COOKIE
	__RTAX_MAX
};

#define RTAX_MAX (__RTAX_MAX - 1)

#define RTAX_FEATURE_ECN	(1 << 0)
#define RTAX_FEATURE_SACK	(1 << 1)
#define RTAX_FEATURE_TIMESTAMP	(1 << 2)
#define RTAX_FEATURE_ALLFRAG	(1 << 3)

#define RTAX_FEATURE_MASK	(RTAX_FEATURE_ECN | RTAX_FEATURE_SACK | \
				 RTAX_FEATURE_TIMESTAMP | RTAX_FEATURE_ALLFRAG)

struct rta_session {
	__u8	proto;
	__u8	pad1;
	__u16	pad2;

	union {
		struct {
			__u16	sport;
			__u16	dport;
		} ports;

		struct {
			__u8	type;
			__u8	code;
			__u16	ident;
		} icmpt;

		__u32		spi;
	} u;
};

struct rta_mfc_stats {
	__u64	mfcs_packets;
	__u64	mfcs_bytes;
	__u64	mfcs_wrong_if;
};

/****
 *		General form of address family dependent message.
 ****/

struct rtgenmsg {
	unsigned char		rtgen_family;
};

/*****************************************************************
 *		Link layer specific messages.
 ****/

/* struct ifinfomsg
 * passes link level specific information, not dependent
 * on network protocol.
 */

struct ifinfomsg {
	unsigned char	ifi_family;
	unsigned char	__ifi_pad;
	unsigned short	ifi_type;		/* ARPHRD_* */
	int		ifi_index;		/* Link index	*/
	unsigned	ifi_flags;		/* IFF_* flags	*/
	unsigned	ifi_change;		/* IFF_* change mask */
};

/********************************************************************
 *		prefix information 
 ****/

struct prefixmsg {
	unsigned char	prefix_family;
	unsigned char	prefix_pad1;
	unsigned short	prefix_pad2;
	int		prefix_ifindex;
	unsigned char	prefix_type;
	unsigned char	prefix_len;
	unsigned char	prefix_flags;
	unsigned char	prefix_pad3;
};

enum 
{
	PREFIX_UNSPEC,
	PREFIX_ADDRESS,
	PREFIX_CACHEINFO,
	__PREFIX_MAX
};

#define PREFIX_MAX	(__PREFIX_MAX - 1)

struct prefix_cacheinfo {
	__u32	preferred_time;
	__u32	valid_time;
};


/*****************************************************************
 *		Traffic control messages.
 ****/

struct tcmsg {
	unsigned char	tcm_family;
	unsigned char	tcm__pad1;
	unsigned short	tcm__pad2;
	int		tcm_ifindex;
	__u32		tcm_handle;
	__u32		tcm_parent;
/* tcm_block_index is used instead of tcm_parent
 * in case tcm_ifindex == TCM_IFINDEX_MAGIC_BLOCK
 */
#define tcm_block_index tcm_parent
	__u32		tcm_info;
};

/* For manipulation of filters in shared block, tcm_ifindex is set to
 * TCM_IFINDEX_MAGIC_BLOCK, and tcm_parent is aliased to tcm_block_index
 * which is the block index.
 */
#define TCM_IFINDEX_MAGIC_BLOCK (0xFFFFFFFFU)

enum {
	TCA_UNSPEC,
	TCA_KIND,
	TCA_OPTIONS,
	TCA_STATS,
	TCA_XSTATS,
	TCA_RATE,
	TCA_FCNT,
	TCA_STATS2,
	TCA_STAB,
	TCA_PAD,
	TCA_DUMP_INVISIBLE,
	TCA_CHAIN,
	TCA_HW_OFFLOAD,
	TCA_INGRESS_BLOCK,
	TCA_EGRESS_BLOCK,
	TCA_DUMP_FLAGS,
	__TCA_MAX
};

#define TCA_MAX (__TCA_MAX - 1)

#define TCA_DUMP_FLAGS_TERSE (1 << 0) /* Means that in dump user gets only basic
				       * data necessary to identify the objects
				       * (handle, cookie, etc.) and stats.
				       */

#define TCA_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct tcmsg))))
#define TCA_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct tcmsg))

/********************************************************************
 *		Neighbor Discovery userland options
 ****/

struct nduseroptmsg {
	unsigned char	nduseropt_family;
	unsigned char	nduseropt_pad1;
	unsigned short	nduseropt_opts_len;	/* Total length of options */
	int		nduseropt_ifindex;
	__u8		nduseropt_icmp_type;
	__u8		nduseropt_icmp_code;
	unsigned short	nduseropt_pad2;
	unsigned int	nduseropt_pad3;
	/* Followed by one or more ND options */
};

enum {
	NDUSEROPT_UNSPEC,
	NDUSEROPT_SRCADDR,
	__NDUSEROPT_MAX
};

#define NDUSEROPT_MAX	(__NDUSEROPT_MAX - 1)

/* RTnetlink multicast groups - backwards compatibility for userspace */
#define RTMGRP_LINK		1
#define RTMGRP_NOTIFY		2
#define RTMGRP_NEIGH		4
#define RTMGRP_TC		8

#define RTMGRP_IPV4_IFADDR	0x10
#define RTMGRP_IPV4_MROUTE	0x20
#define RTMGRP_IPV4_ROUTE	0x40
#define RTMGRP_IPV4_RULE	0x80

#define RTMGRP_IPV6_IFADDR	0x100
#define RTMGRP_IPV6_MROUTE	0x200
#define RTMGRP_IPV6_ROUTE	0x400
#define RTMGRP_IPV6_IFINFO	0x800

#define RTMGRP_DECnet_IFADDR    0x1000
#define RTMGRP_DECnet_ROUTE     0x4000

#define RTMGRP_IPV6_PREFIX	0x20000

/* RTnetlink multicast groups */
enum rtnetlink_groups {
	RTNLGRP_NONE,
#define RTNLGRP_NONE		RTNLGRP_NONE
	RTNLGRP_LINK,
#define RTNLGRP_LINK		RTNLGRP_LINK
	RTNLGRP_NOTIFY,
#define RTNLGRP_NOTIFY		RTNLGRP_NOTIFY
	RTNLGRP_NEIGH,
#define RTNLGRP_NEIGH		RTNLGRP_NEIGH
	RTNLGRP_TC,
#define RTNLGRP_TC		RTNLGRP_TC
	RTNLGRP_IPV4_IFADDR,
#define RTNLGRP_IPV4_IFADDR	RTNLGRP_IPV4_IFADDR
	RTNLGRP_IPV4_MROUTE,
#define	RTNLGRP_IPV4_MROUTE	RTNLGRP_IPV4_MROUTE
	RTNLGRP_IPV4_ROUTE,
#define RTNLGRP_IPV4_ROUTE	RTNLGRP_IPV4_ROUTE
	RTNLGRP_IPV4_RULE,
#define RTNLGRP_IPV4_RULE	RTNLGRP_IPV4_RULE
	RTNLGRP_IPV6_IFADDR,
#define RTNLGRP_IPV6_IFADDR	RTNLGRP_IPV6_IFADDR
	RTNLGRP_IPV6_MROUTE,
#define RTNLGRP_IPV6_MROUTE	RTNLGRP_IPV6_MROUTE
	RTNLGRP_IPV6_ROUTE,
#define RTNLGRP_IPV6_ROUTE	RTNLGRP_IPV6_ROUTE
	RTNLGRP_IPV6_IFINFO,
#define RTNLGRP_IPV6_IFINFO	RTNLGRP_IPV6_IFINFO
	RTNLGRP_DECnet_IFADDR,
#define RTNLGRP_DECnet_IFADDR	RTNLGRP_DECnet_IFADDR
	RTNLGRP_NOP2,
	RTNLGRP_DECnet_ROUTE,
#define RTNLGRP_DECnet_ROUTE	RTNLGRP_DECnet_ROUTE
	RTNLGRP_DECnet_RULE,
#define RTNLGRP_DECnet_RULE	RTNLGRP_DECnet_RULE
	RTNLGRP_NOP4,
	RTNLGRP_IPV6_PREFIX,
#define RTNLGRP_IPV6_PREFIX	RTNLGRP_IPV6_PREFIX
	RTNLGRP_IPV6_RULE,
#define RTNLGRP_IPV6_RULE	RTNLGRP_IPV6_RULE
	RTNLGRP_ND_USEROPT,
#define RTNLGRP_ND_USEROPT	RTNLGRP_ND_USEROPT
	RTNLGRP_PHONET_IFADDR,
#define RTNLGRP_PHONET_IFADDR	RTNLGRP_PHONET_IFADDR
	RTNLGRP_PHONET_ROUTE,
#define RTNLGRP_PHONET_ROUTE	RTNLGRP_PHONET_ROUTE
	RTNLGRP_DCB,
#define RTNLGRP_DCB		RTNLGRP_DCB
	RTNLGRP_IPV4_NETCONF,
#define RTNLGRP_IPV4_NETCONF	RTNLGRP_IPV4_NETCONF
	RTNLGRP_IPV6_NETCONF,
#define RTNLGRP_IPV6_NETCONF	RTNLGRP_IPV6_NETCONF
	RTNLGRP_MDB,
#define RTNLGRP_MDB		RTNLGRP_MDB
	RTNLGRP_MPLS_ROUTE,
#define RTNLGRP_MPLS_ROUTE	RTNLGRP_MPLS_ROUTE
	RTNLGRP_NSID,
#define RTNLGRP_NSID		RTNLGRP_NSID
	RTNLGRP_MPLS_NETCONF,
#define RTNLGRP_MPLS_NETCONF	RTNLGRP_MPLS_NETCONF
	RTNLGRP_IPV4_MROUTE_R,
#define RTNLGRP_IPV4_MROUTE_R	RTNLGRP_IPV4_MROUTE_R
	RTNLGRP_IPV6_MROUTE_R,
#define RTNLGRP_IPV6_MROUTE_R	RTNLGRP_IPV6_MROUTE_R
	RTNLGRP_NEXTHOP,
#define RTNLGRP_NEXTHOP		RTNLGRP_NEXTHOP
	RTNLGRP_BRVLAN,
#define RTNLGRP_BRVLAN		RTNLGRP_BRVLAN
	__RTNLGRP_MAX
};
#define RTNLGRP_MAX	(__RTNLGRP_MAX - 1)

/* TC action piece */
struct tcamsg {
	unsigned char	tca_family;
	unsigned char	tca__pad1;
	unsigned short	tca__pad2;
};

enum {
	TCA_ROOT_UNSPEC,
	TCA_ROOT_TAB,
#define TCA_ACT_TAB TCA_ROOT_TAB
#define TCAA_MAX TCA_ROOT_TAB
	TCA_ROOT_FLAGS,
	TCA_ROOT_COUNT,
	TCA_ROOT_TIME_DELTA, /* in msecs */
	__TCA_ROOT_MAX,
#define	TCA_ROOT_MAX (__TCA_ROOT_MAX - 1)
};

#define TA_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct tcamsg))))
#define TA_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct tcamsg))
/* tcamsg flags stored in attribute TCA_ROOT_FLAGS
 *
 * TCA_FLAG_LARGE_DUMP_ON user->kernel to request for larger than TCA_ACT_MAX_PRIO
 * actions in a dump. All dump responses will contain the number of actions
 * being dumped stored in for user app's consumption in TCA_ROOT_COUNT
 *
 */
#define TCA_FLAG_LARGE_DUMP_ON		(1 << 0)

/* New extended info filters for IFLA_EXT_MASK */
#define RTEXT_FILTER_VF		(1 << 0)
#define RTEXT_FILTER_BRVLAN	(1 << 1)
#define RTEXT_FILTER_BRVLAN_COMPRESSED	(1 << 2)
#define	RTEXT_FILTER_SKIP_STATS	(1 << 3)
#define RTEXT_FILTER_MRP	(1 << 4)

/* End of information exported to user level */



#endif /* __LINUX_RTNETLINK_H */
]=]
return M
