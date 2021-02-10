# Digital-electronics-1

## Lecture 1

## Emphasis
_italics_ *italics2*     
__bold__ **bold2**

## Lists
1. first item
2. second item

* an item
* another item
______________
- an item 1
  - item 1.1
  - item 1.2
    - item 1.2.1
  - item 1.3
- item 2

## Links
If you don't know something, try [Google](https://www.google.com/) 

## Tables
a | b
---- | ----
0 | 1
1 | 2
2 | 3

## VHDL source code
```
entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;         -- Data input
        for_o  : out std_logic;         -- OR output function
        fand_o : out std_logic;         -- AND output function
        fxor_o : out std_logic          -- XOR output function
    );
end entity gates;
```

- [x] done
- [ ] to do
