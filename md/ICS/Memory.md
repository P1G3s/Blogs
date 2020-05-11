# Memory&Encoding
### Example (C)
int x = 0x12345678
x = (char)x		-->	when reads x, only reads 1 byte instead of 4 bytes. 

int x = 0x12345678
*((unsigned char*)&x) == 0x78 
1. compiler uses &x to locate data, and reads "sizeof(unsigned char)" from it 
2. which also means the first byte that the address(&x) indicates is the LSB of (int x).
3. unsigned char* --> read 1 byte, when printf, print 1 byte (in fact printf doesnt know the type of the pointer, derefference is done by compiler).


### Type Casting
**How compiler casts type (int x -> char x, &x -> [rbp-0xc])**

```assembly
mov    eax,DWORD PTR [rbp-0xc] 
movsx  eax,al
mov    DWORD PTR [rbp-0xc],eax
```

**Compiler remembers every value's type(how?) and use specific code for each value like above.**

