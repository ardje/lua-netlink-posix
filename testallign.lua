--[[
local lib=require"rtnl/lib"

local function align(offset)
	 return ((offset-1+3)&(-1-3))+1
end
for i=1,20 do print(i,lib.align(i)) end
print(lib.align(33+17))
]]
data=[[a0 05 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 fe ff 09 00 00 00 90 00 00 00 ff ff ff ff 08 00 03 00 77 67 32 00 08 00 0d 00 e8 03 00 00 05 00 10 00 02 00 00 00 05 00 11 00 00 00 00 00 08 00 04 00 8c 05 00 00 08 00 32 00 00 00 00 00 08 00 33 00 a0 ff ff 7f 08 00 1b 00 00 00 00 00 08 00 1e 00 00 00 00 00 08 00 3d 00 00 00 00 00 08 00 1f 00 01 00 00 00 08 00 28 00 ff ff 00 00 08 00 29 00 00 00 01 00 08 00 3a 00 00 00 01 00 08 00 3f 00 00 00 01 00 08 00 40 00 00 00 01 00 08 00 3b 00 00 00 01 00 08 00 3c 00 ff ff 00 00 08 00 20 00 01 00 00 00 05 00 21 00 01 00 00 00 09 00 06 00 6e 6f 6f 70 00 00 00 00 08 00 23 00 00 00 00 00 08 00 2f 00 00 00 00 00 08 00 30 00 00 00 00 00 05 00 27 00 00 00 00 00 24 00 0e 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 cc 00 17 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 64 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0c 00 2b 00 05 00 02 00 00 00 00 00 14 00 12 00 0e 00 01 00 77 69 72 65 67 75 61 72 64 00 00 00 38 03 1a 00 0c 00 2d 00 08 00 01 00 01 00 00 00 8c 00 02 00 88 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 27 00 00 e8 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 9c 02 0a 00 08 00 01 00 00 00 00 00 14 00 05 00 ff ff 00 00 02 55 49 00 2a ac 00 00 e8 03 00 00 f0 00 02 00 00 00 00 00 40 00 00 00 8c 05 00 00 01 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 ff ff ff ff a0 0f 00 00 e8 03 00 00 ff ff ff ff 80 3a 09 00 80 51 01 00 03 00 00 00 58 02 00 00 10 00 00 00 00 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 60 ea 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00 10 27 00 00 e8 03 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 ee 36 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 00 ff ff 00 00 ff ff ff ff 01 00 00 00 00 00 00 00 00 00 00 00 34 01 03 00 26 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3c 00 06 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 14 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 05 00 08 00 00 00 00 00 04 00 3e 80 04 00 41 80]]
--[[
IFLA_IFNAME	33	8	3	77 67 32 00
the function
IFLA_TXQLEN	41	13	e8 03 00 00
IFLA_OPERSTATE	49	16	02
IFLA_LINKMODE	57	17	00
IFLA_MTU	65	4	8c 05 00 00
IFLA_MIN_MTU	73	50	00 00 00 00
IFLA_MAX_MTU	81	51	a0 ff ff 7f
IFLA_GROUP	89	27	00 00 00 00
IFLA_PROMISCUITY	97	30	00 00 00 00
IFLA_ALLMULTI	105	61	00 00 00 00
IFLA_NUM_TX_QUEUES	113	31	01 00 00 00
IFLA_GSO_MAX_SEGS	121	40	ff ff 00 00
IFLA_GSO_MAX_SIZE	129	41	00 00 01 00
IFLA_GRO_MAX_SIZE	137	58	00 00 01 00
IFLA_GRO_IPV4_MAX_SIZE	145	63	00 00 01 00
IFLA_DPLL_PIN	153	64	00 00 01 00
IFLA_TSO_MAX_SIZE	161	59	00 00 01 00
IFLA_TSO_MAX_SEGS	169	60	ff ff 00 00
IFLA_NUM_RX_QUEUES	177	32	01 00 00 00
IFLA_CARRIER	185	33	01
IFLA_QDISC	193	9	6	6e 6f 6f 70 00
the function
IFLA_CARRIER_CHANGES	205	35	00 00 00 00
IFLA_CARRIER_UP_COUNT	213	47	00 00 00 00
IFLA_CARRIER_DOWN_COUNT	221	48	00 00 00 00
IFLA_PROTO_DOWN	229	39	00
IFLA_MAP	237	14	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
IFLA_STATS64	273	204	23	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
the struct
IFLA_STATS	477	100	7	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
the struct
IFLA_XDP	577	43	05 00 02 00 00 00 00 00
IFLA_LINKINFO	589	18	0e 00 01 00 77 69 72 65 67 75 61 72 64 00 00 00
IFLA_AF_SPEC	609	26	0c 00 2d 00 08 00 01 00 01 00 00 00 8c 00 02 00 88 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 27 00 00 e8 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 9c 02 0a 00 08 00 01 00 00 00 00 00 14 00 05 00 ff ff 00 00 02 55 49 00 2a ac 00 00 e8 03 00 00 f0 00 02 00 00 00 00 00 40 00 00 00 8c 05 00 00 01 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 ff ff ff ff a0 0f 00 00 e8 03 00 00 ff ff ff ff 80 3a 09 00 80 51 01 00 03 00 00 00 58 02 00 00 10 00 00 00 00 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 60 ea 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00 10 27 00 00 e8 03 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 ee 36 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 00 ff ff 00 00 ff ff ff ff 01 00 00 00 00 00 00 00 00 00 00 00 34 01 03 00 26 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3c 00 06 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 14 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 05 00 08 00 00 00 00 00
nil	1433	32830	
nil	1437	32833	
{
  nlmsg = {
    nlmsg_flags = 0,
    nlmsg_len = 1440,
    nlmsg_pid = 0,
    nlmsg_seq = 0,
    nlmsg_type = "RTM_NEWLINK"
  },
  rtmsg = {
    [32830] = "",
    [32833] = "",
    IFLA_AF_SPEC = "0c 00 2d 00 08 00 01 00 01 00 00 00 8c 00 02 00 88 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 27 00 00 e8 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 9c 02 0a 00 08 00 01 00 00 00 00 00 14 00 05 00 ff ff 00 00 02 55 49 00 2a ac 00 00 e8 03 00 00 f0 00 02 00 00 00 00 00 40 00 00 00 8c 05 00 00 01 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 ff ff ff ff a0 0f 00 00 e8 03 00 00 ff ff ff ff 80 3a 09 00 80 51 01 00 03 00 00 00 58 02 00 00 10 00 00 00 00 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00 60 ea 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00 10 27 00 00 e8 03 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 ee 36 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 00 ff ff 00 00 ff ff ff ff 01 00 00 00 00 00 00 00 00 00 00 00 34 01 03 00 26 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3c 00 06 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 14 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 05 00 08 00 00 00 00 00",
    IFLA_ALLMULTI = "00 00 00 00",
    IFLA_CARRIER = "01",
    IFLA_CARRIER_CHANGES = "00 00 00 00",
    IFLA_CARRIER_DOWN_COUNT = "00 00 00 00",
    IFLA_CARRIER_UP_COUNT = "00 00 00 00",
    IFLA_DPLL_PIN = "00 00 01 00",
    IFLA_GROUP = "00 00 00 00",
    IFLA_GRO_IPV4_MAX_SIZE = "00 00 01 00",
    IFLA_GRO_MAX_SIZE = "00 00 01 00",
    IFLA_GSO_MAX_SEGS = "ff ff 00 00",
    IFLA_GSO_MAX_SIZE = "00 00 01 00",
    IFLA_IFNAME = '"wg2\\0"',
    IFLA_LINKINFO = "0e 00 01 00 77 69 72 65 67 75 61 72 64 00 00 00",
    IFLA_LINKMODE = "00",
    IFLA_MAP = "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00",
    IFLA_MAX_MTU = "a0 ff ff 7f",
    IFLA_MIN_MTU = "00 00 00 00",
    IFLA_MTU = "8c 05 00 00",
    IFLA_NUM_RX_QUEUES = "01 00 00 00",
    IFLA_NUM_TX_QUEUES = "01 00 00 00",
    IFLA_OPERSTATE = "02",
    IFLA_PROMISCUITY = "00 00 00 00",
    IFLA_PROTO_DOWN = "00",
    IFLA_QDISC = '"noop\\0"',
    IFLA_STATS = {
      collisions = 0,
      multicast = 0,
      rx_bytes = 0,
      rx_compressed = 0,
      rx_crc_errors = 0,
      rx_dropped = 0,
      rx_errors = 0,
      rx_fifo_errors = 0,
      rx_frame_errors = 0,
      rx_length_errors = 0,
      rx_missed_errors = 0,
      rx_nohandler = 0,
      rx_over_errors = 0,
      rx_packets = 0,
      tx_aborted_errors = 0,
      tx_bytes = 0,
      tx_carrier_errors = 0,
      tx_compressed = 0,
      tx_dropped = 0,
      tx_errors = 0,
      tx_fifo_errors = 0,
      tx_heartbeat_errors = 0,
      tx_packets = 0,
      tx_window_errors = 0
    },
    IFLA_STATS64 = {
      collisions = 0,
      multicast = 0,
      rx_bytes = 0,
      rx_compressed = 0,
      rx_crc_errors = 0,
      rx_dropped = 0,
      rx_errors = 0,
      rx_fifo_errors = 0,
      rx_frame_errors = 0,
      rx_length_errors = 0,
      rx_missed_errors = 0,
      rx_nohandler = 0,
      rx_otherhost_dropped = 0,
      rx_over_errors = 0,
      rx_packets = 0,
      tx_aborted_errors = 0,
      tx_bytes = 0,
      tx_carrier_errors = 0,
      tx_compressed = 0,
      tx_dropped = 0,
      tx_errors = 0,
      tx_fifo_errors = 0,
      tx_heartbeat_errors = 0,
      tx_packets = 0,
      tx_window_errors = 0
    },
    IFLA_TSO_MAX_SEGS = "ff ff 00 00",
    IFLA_TSO_MAX_SIZE = "00 00 01 00",
    IFLA_TXQLEN = "e8 03 00 00",
    IFLA_XDP = "05 00 02 00 00 00 00 00",
    _pad = 0,
    change = 4294967295,
    family = 0,
    flags = 144,
    index = 9,
    type = 65534
  }
}
]]

local I=require"inspect"
local function makeblobfromdata(d)
	local r=''
	for v in d:gmatch("[0-9a-fA-F]+") do
		v=tonumber(v,16)
		-- print(v)
		r=r..string.char(v)
	end
	return r
end
local message= makeblobfromdata(data)
--print(inspect.inspect(message))

local N = require "rtnetlink"
local offset=1
r,offset=N:parsemessage(message,offset)
print(offset,message:len())
print(I.inspect(r))
