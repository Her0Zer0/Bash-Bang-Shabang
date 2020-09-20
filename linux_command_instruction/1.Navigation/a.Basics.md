## Basics:

Like most things when you are learning for the first time, you need to get the foundational knowledge of what you are doing.  In that respect lets go over the file structure for a brief moment so we can understand what we are navigating from here on in. 

If you are on a Debian/Ubuntu based system, you most likely have ***tree*** installed already. If not, please use the following command in your terminal. 

```
sudo apt install tree
```
### Example: 
![Install tree terminal example: run command sudo apt install tree](../assets/install_tree.png)


Now using ***tree*** we are going to look at the linux file system from the root directory. 

_In your terminal:_

```
tree -L 1 /
```

### Example: 
![Root directory view example: run command tree -L 1 /](../assets/tree_root_dir_view.png)


Using ***tree*** is a pretty handy tool to spit out info about your file structure.  Be sure to keep it in your toolbox when you leave this page. Anyways,... Let us go over what we are looking at. 


#### Directories

##### ***/bin***
    _Common programs, shared by the system, the system administrator and the users_
