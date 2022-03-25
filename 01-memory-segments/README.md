# Memory segments 8086

* It's necessary to understand how the 8086 architecture addresses
memory using a system of segments and offsets.

* Each byte has a unique location, called the _physical address_, which
programs specify to read and write the bytes they need.

* If the computer has only 64K, the address of any byte would fit in 16
bits, which can represent values from 0 to 65 353 ($2^{16} - 1$) or
64K in round numbers.

* To address 1MB, 20 bits ($2^{20} - 1$ = 1 048 575 = 0xFFFFF) are
required.

* 8086 register are only 16 bits wide.

* To manage memory greater than 64K, memory segmentation is used. In
this way, the address of a specific byte can be expressed in two
values:
  * the address of the chunk (segment).
  * + 16-bit offset from the beginning of the segment.

* Together, the combination of segment and offset values is called
_logical address_.
