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

### _Find_

The **find** command in is a command-line utility for searching through the file hierarchy.  It can be used to find and track files or directories.  It supports searching by file, folder, name, creation date, modification date, owner and permissions.

When using the find command if there is no directory specified it considers the current directory or **"."** in the command. For example:

```.sh
   $ find test_file.txt
```

Is the same as:

```.sh
   $ find . -name "test_file.txt"
```

This can be further queried into: 

```.sh
   $ find . -name "test_file.txt" -type f
```

The "-type" specifies file **(f)** or directory **(d)**.

This is a bit overkill since we have the full name of the file, but what if we was using wild cards and searching a directory with tons of files?  We wouldn't want to pull all the resources for a simple search. 

For example, let us imagine we have 4k movies and photos in one folder on our pc and we want to search for **.mp4** files.  The folder we want to search is called **Media**. The directory it lives in is our **~/Documents/Media** and we are in our home directory or **~**. Notice that we almost have our command?

```.sh
   $ find ~/Documents/Media -name "*.mp4" -type f
```

Now that looks like a better use of a query. The more specific you can be the better your results will look.  There are a lot of options to play with too. The options above don't have to be any order either, it is really what is easier to read for you. 

Here is an example of starting from the home directory and looking inside all the folders within for a specific folder name.  In this case Media. 

```.sh
   $ find ~ -type d Media
```

We can ignore case too.  Here is the example above with **-iname**. 

```.sh
   $ find ~ -type d -iname MEDIA
```

It returns the same results. 

Examples of looking for folders or files with permissions of **777**.

```.sh
   $ find . -perm 777
```

How to find files without **777**. 

```.sh
   $ find . -type f ! -perm 777
```

Here is an example of how to find empty directories. 

```.sh
   $ find . -type d -empty
```

You can also use the **-exec** command to do other operations but this should be used with caution when you are just getting comfortable with commands. Lets say for example you wanted to remove just a couple of files from a directory.  You should confirm you are getting the correct files/directories back with the command before adding the **-exec**.  Otherwise you could lose precious files and or leave your system in an undesirable state. 

Lets look at an example of modifying permissions and deleting a test file we created inside a directory we also create. 

First create the directory. 

```.sh
   $ mkdir temp_test_dir
```

Now move into this directory. 

```.sh
   $ cd temp_test_dir
```

Create a file. 

```.sh
   $ echo '' > tmp.txt
```

Find that file. 

```.sh
   $ find . -type f -name "*.txt"
```

You should have just the one file showing in the directory, but if you want to modify the command to be more specific because we are changing permissions and then later deleting it. That is a good habit to get into. 

```.sh
   $ find . -type f -name "tmp.txt" -exec chmod 777 {} \;
```

Notice the **{}**, this takes the output from the command and throws that data into the blob to manipulate it.  In this case our file. The backslash is just escape any characters just in case and the **;** terminates the command, meaning we don't want to execute anything after it. 

The file should show permissions as **-rwxrwxrwx** now if you use the ls command to view them. 

```.sh
   $ ls -la
```

Now lets remove that file. 

```.sh
   $ find . -type f -name "tmp.txt" -exec rm -f {} \;
```

If successful it probably looks like it just went to a new line but if you use the **ls** command again the file should no longer be there. 

Find is a powerful tool and is great to have available to you in your bash toolbox. 

### _Which_

The **which** command is a very simple tool and the only time you will most likely use it is to find an executable on your system. For example we want to see the executable location for our firefox browser. 

```.sh
   $ which firefox
```

Which would return the path to the executable. The only options it has is **-a**. When used it will return all the paths to the executable including symlinks. 

### _Grep_ (Global Regular Expression Print)

Grep is used to search for a string of characters in a file.  The text search pattern is called a regular expression.  When a match is found, it prints the line with the result. The **grep** command is handy when searching through large log files. 

The command can contain many options, patterns, and file names but in the most basic form we can see it as [command] [pattern] [file]. For example if we was searching a file for an error that we knew had Err: 1234 in the log it would look something like this. 

```.sh
    $ grep 'Err: 1234' log.txt
```

If **grep** found anything it would return the output to the console.

You can also search multiple files. 

```.sh
    $ grep 'Err: 1234' log.txt log_2.txt log_3.txt
```

Search all the files in a directory.

```.sh
    $ grep 'Err: 1234' *
```

Search for whole words only. 

```.sh
    $ grep -w burger menu.txt
```

When the **-w** is omitted it will return results even if it is a substring of another word. So you may see lines of information that show **cheeseburger** from the menu.txt file. 

Case can be ignored with the **-i** option

```.sh
    $ grep -i 'err: 1234' log.txt
```

It will still return information that contains **Err: 1234**. 

If you don't want to return the output of the file line information and just need the name of the file that the search was able to find your expression in use the **-l** option to list the file names. 

```.sh
    $ grep -l 'Err: 1234' *
```

The above lists all the files in the current directory that matched the search text in the file. 

You can also get a line count of the matching searches in the file with **-c**.

```.sh
    $ grep -c 'Err: 1234' *
```

There are many more options for grep to use.  This is just a small sample, and of course if needed you can always look at the man page for more information. 

```.sh
    $ man grep
```

## Summary

We spoke about basic searching options that are available to you from bash out of the box on your linux distro. These tools are great to have and will help in future lessons to come.  When you get comfortable using them, you may even prefer them over gui options that come with most distros today. Not to mention if you decide to go beyond just basic bash terminal use and decide to start scripting your own bash scripts these could be very useful. 

Previous Section:  [_Install New Applications_](./b.Install_New_Applications.md)

Next Section: [_Basic File Commands_](../3.Working_with_Files/a.Basic_File_Commands.md)