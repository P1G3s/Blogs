# I/O
**Input and output** is basically about **Read** and **Write**, but that's not all of it, before doing so, some condition should be met first :

1. **Open** the file  
2. A **Buffer**
3. The **Position** where IO process 
4. Proceed **READ/WRITE**
5. **Close**   

In a word :
- **Read** bytes from the **Position** into the **Buffer**  
or 
- **Write** bytes from the **Buffer**  into the **Position** 


### File Descriptor
- Indicates the file 
- **Open file descriptor table** -----> **Open file table** -----> **i-node table** (lowest level, means file itself?)	


### Read & Write
- **pread() & pwrite()** -- need to specify the offset when using these functions, and offset will be reset after being used 

- **readv() & writev()** -- involves mutiple buffers

- truncate() 


### Position
- **lseek()**  
  **Two different fds** would share the same offset if they both indicate the same item(Open file handle) in the **Open file table** 


### Atomic operation & Race condition
- **Protect process' doing from unexpected interuption**, make the operation more secure (e.g. **P90[5-3]** O_APPEND and lseek(fd,offset,SEEK_END))

### File hole
- Sort of like a **reserved area**, waited for later usage. Campared with a file stuffed with the same amount of characters instead of "holes", they seem to have the same logical size under **ls command**, but they dont share the same block size, the one with "holes" probably consumes less blocks of disk. 
