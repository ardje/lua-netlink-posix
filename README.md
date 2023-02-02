# lua netlink posix

This project is based on lua-posix's netlink example.

I tried to use lua-netlink, but lua-netlink uses libmnl, which is a library that is only a C library to iterate.
Since netlink is a protocol, we don't need a C library for iteration. We can do most of it using string.unpack and string.pack.

What we do need however is an easy way to convert most of the "header" files to protocol descriptions and iterators.
