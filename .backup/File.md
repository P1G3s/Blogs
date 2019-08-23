# File

```mermaid
graph LR;
	disc--> partition; partition --> filesystem;
	disc--> partition...;partition... --> filesystem...;
	filesystem --> superblock;
	filesystem --> i-node-table;
	subgraph i-node table
	i-node-table-->i-node_130;
	i-node-table-->i-node_501;
	i-node-table-->i-node_...;
	i-node_130-->datablock_1000;
	i-node_130-->datablock_1600;
	i-node_130-->datablock_3000;
	datablock_1000---|'cat'|file;
	datablock_1600---|'cat'|file;
	datablock_3000---|'cat'|file;
	end
	filesystem --> datablocks;
```
**the numbers above are all made up of course**

### Caution
 - Each i-node has a table which contains 13 blocks
 - Each **Block** indicates a **Data Block** which either stores **data** or **i-nodes**(for large file of course) 
