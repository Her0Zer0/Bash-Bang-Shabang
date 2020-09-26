## Changing and Listing Directory Content

Moving around in the file system is the next step we are going to look at. If you are in your home directory, in the terminal you may see something like this. 

### Example: 

![Home directory](../assets/home_directory.png)

Notice the _***~***_ (tilde) character, this represents your home directory in the terminal.  If you do not see this we will start off by running the below command. 

```.sh
cd ~
```

Or in other words change directory ( ***cd*** ) to my home directory ( ***~*** ). This can be used anywhere in the file system to get you back home. 

Now let's use another command to see where we can navigate too.  In your terminal type ***ls*** (short for list). 
```.sh
ls
```
If you are in your home directory you should see something similar to the below image. 


![Home directory contents](../assets/home_directory_contents.png)

These are the standard folders that come with every user directory created within your system. So later when we create users for an example to our administration purposes you will be able to see the similar structure there. For now, lets navigate into and out of some of these directories (folders).

Type the following: 
```.sh
cd Documents
```

Notice how the prompt in the terminal changed to now include not only the ***~*** but Documents as well? 

![Home directory](../assets/documents_prompt.png)

This is the way linux is being helpful to you and letting you know where you are at in your file system.

In your ***Documents*** directory, type out the command: 
```.sh
ls
```

Did you see anything? If your Documents folder is empty, you most likely just seen the prompt return with nothing between. It should look the same as if you hit enter multiple times. Now you didn't do anything wrong if this is what you are seeing, ***ls*** is just saying there is nothing in the folder for you to see. 

You can also see how many files are in this directory with the option ***l*** (lowercase L). 
```.sh
ls -l
```

In the output you should see _**total 0**_ if you have an empty or the word **total** and the number of files in the directory after it. 

However, lets look again.  This time use the option ***-a*** (lowercase A).
```.sh
ls -a
```

You should see something like this

![Hidden directories](../assets/hidden_directories.png)

What are these dots?  These dots represent the current directory ( **.** ) (one dot) and the parent directory ( **..** ) (two dots). This means it is another method or strategy we can use to our advantage of navigation.  

For Example, lets create our first document. You can do this multiple ways but I like to use **touch** but we can also use **echo** to create and place something in a document. 

###### Touch Example: 
```.sh
touch testing_text_file.txt
```

###### Echo Example: 
```.sh
echo 'Some text to throw in a file' > testing_text_file.txt
```

The only real difference to care about at this moment in these commands is **touch** just creates the file and **echo** actually creates the file and places the text inside. 

**NOTE:** _Since we are talking about **echo**, if you ran both of the commands above in the terminal you wouldn't create another file. This is because **echo** is just wanting to insert the text provided in the string into the file named **testing_text_file.txt**.  The **echo** command doesn't care if the file has been created or not because it will just create it.  This is not a problem if this is what you intended. If you had this file filled with important stuff you didn't want to lose, **echo** will overwrite this because we used the **>** (greater than) operator. This tells **echo** to just write to whatever it is pointing to on the other side of the command. If we use double greater than operators **>>** it will append to the end of the document it is pointing to. You can take some time and play around with this so you can get an understanding of this idea, but we will touch on it again in later topics._

Now that we have a file in the directory lets run all the above **ls** commands again. 

```.sh
ls
```
```.sh
ls -l
```
```.sh
ls -a
```

You should see something similar below. 

![List commands together](../assets/ls_commands_together.png)