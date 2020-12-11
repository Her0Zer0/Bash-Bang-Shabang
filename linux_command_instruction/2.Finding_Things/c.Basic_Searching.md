## Basic Searching

Searching tools are very useful with the terminal because of the obviously limited graphical display, and if properly used can save you lots of time versus using a gui. 

Some of the tools we are going to talk explicitly about here are

* locate ( or in some instances now, **mlocate** )
* find
* which
* grep


### _Locate_ 

 The locate command does what it sounds like, and locates files within the system. It does this by reading from one or more databases prepared by **updatedb** and writes file names matching at least one of the patterns to standard output, one per line. It can be used with regular expressions, ignore case options, exact matches, etc. 

 To start with let's look at basic usage. To begin we simply type the command with a filename we are looking for. Before we use the locate command, let us created a file to look for. 

 In your downloads directory type: 

 ```.sh
    $ echo 'Sample Text for the file' >> ~/Downloads/test_file.txt
 ```

 Now type: 
 ```.sh
    $ locate test_file
 ```

 Did you find what you was looking for?  I'm going to say probably not since we just created the file and searched for it.  This is because the database that **locate** uses hasn't been updated yet. Run the below commands. 

 ```.sh
    $ sudo updatedb
    $ locate test_file
 ```

 You was probably able to see the file that was created earlier now. As you can see this is the only downside to **locate** but this is the reason it is also a fast option. After new files are created they will not show in the database until after they are added.  Not to worry though, **updatedb** is ran regularly with a cron job so it isn't something you will have to do often. It is just a good side note in case it is ever needded. 

 Here is an example when using the ignore case option. 

 ```.sh
    $ locate -i TEXT_FILE.txt 
 ```

By using **locate** in this manner, the command actually looks at it like so: 
```.sh
    $ locate "*text_file.txt*"
```
If we truely wanted to search for the "NAME" of the file we can use the **-b** option '\NAME' or in this case '\text_file.txt'.

There are more commands in the **man** pages for locate if you would like to try more, but get comfortable with these for now before moving on. 


 










