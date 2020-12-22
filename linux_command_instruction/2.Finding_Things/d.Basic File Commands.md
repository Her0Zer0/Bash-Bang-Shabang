## Basic File Commands

File commands will be probably some of the most used commands in your linux environment, because we do literally everything with files on a pc.  It is where we store the information needed to help us with our daily lives, pictures, music, videos, and code to run the OS or Distro we are using.  We have already went over a few commands that would help us with navigation and using or creating files such as "**cd**" , "**ls**", and "**touch**". In this section we are going to look at the following commands. 

#### File Handling

- **mkdir** -> Make directory by using this command and the name of the folder you wish to create.   
  
  **TIP:** Since we use the shell so much on linux it is good to make your directories and files all one solid chunk of text just for ease of administration but you can use spaces as well with quotes.  If you use spaces though, you will have to use them each time you access the directory or file. 
  
  ```.sh
  $    mkdir my_new_directory
  ```
  
  With spaces example:
  
  ```.sh
  $    mkdir "My New Direcotry"
  ```

- **rm** -> Remove files or directories with the "**rm**" command.  
  
  ```.sh
  $    rm file.txt
  ```
  
  Remove empty directories
  
  ```.sh
  $    rm -d directory_to_remove
  ```
  
  Remove directories that aren't empty
  
  ```.sh
  $    rm -R directory_with_files_inside
  ```
  
  **TIP:** If you use rm to remove a file, it might be possible to recover some of its contents, given sufficient expertise and time.  If you wish to have contents truly unrecoverable, consider using **shred**. 
  
  **Challenge:**  Use the **man** command to read about the **shred** command and learn why it is different than **rm**. 

- **cp** -> Copy files or directories from one location to another.  It does this by following the usual rule of **cp [Options] Source... Destination** layout in the command. 
  
  ```.sh
  $    cp ~/Downloads/my_pic.png ~/Pictures
  ```
  
  When you only use the directory that you wish to copy the file to, it will copy it with the same name as the name you copied from.  So the new .png file will be named my_pic.png in the Pictures folder. 
  
  You can rename the file by specifying it when you copy. 
  
  ```.sh
  $    cp ~/Downloads/my_pic.png ~/Pictures/my_new_pic.png
  ```
  
  When copying a file the new file is owned by the user running the command.  You can preserve the file mode, ownership, and timestamps by using the **-p** option. 
  
  ```.sh
  $    cp -p ~/Downloads/my_pic.png ~/Pictures/my_new_pic.png
  ```
  
  If you need to copy something to a folder that doesn't exist already you can use the **-R** option to create the directory and copy the contents inside. 
  
  ```.sh
  $    cp -R ~/Downloads/my_pic.png ~/Pictures/New_Folder/my_new_pic.png
  ```
  
  Copy only files and subdirectories with the additional **-T** option. 
  
  ```.sh
  $    cp -RT ~/Downloads/my_pic.png ~/Pictures/New_Folder/my_new_pic.png
  ```
  
  Copy multiple files to a single directory
  
  ```.sh
  $    cp file1.txt file2.txt dir1
  ```

- **mv** -> Move uses a similar layout as **cp** to work out the commands. 



#### File Reading

- cat -> 

- more -> Outputs the contents of a file

- head -> Read the first 10 lines of a file

- tail -> Read the last 10 lines of a file



#### File Security

- gpc -> File encryption

- wc -> Prints the number of bytes, words and lines in a file
