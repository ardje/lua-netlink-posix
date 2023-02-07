# lua netlink posix

This project is based on lua-posix's netlink example.

I tried to use lua-netlink, but lua-netlink uses libmnl, which is a library that is only a C library to iterate.
Since netlink is a protocol, we don't need a C library for iteration. We can do most of it using string.unpack and string.pack.

What we do need however is an easy way to convert most of the "header" files to protocol descriptions and iterators.

# more

Netlink is a generic protocol between the linux kernel and userspace. It really is a message passing API, or in other words, it's a protocol.
My main concern is network, so I renamed netlink to rtnetlink.

Rtnetlink has come a long way and that's obvious from the protocol: it has a wide range of RT attributes of which some of them in itself have a struct of multiple values.

To be generic, the rtnetlink interface will return the basic structure and every RTA. If the RTA is a struct in itself, it will be nested.

