# Shell Script Basic

Shell scripts are a series of commands that are executed in order. They are used to automate tasks that you do frequently. They are also used to run programs that you do not want to run directly. For example, you can write a shell script to run a program that requires root privileges. You can also use shell scripts to run multiple programs at once.

[Shell Scripting Tutorial for Beginners](https://www.youtube.com/playlist?list=PLS1QulWo1RIYmaxcEqw5JhK3b-6rgdWO_) by [ProgrammingKnowledge](https://www.youtube.com/c/ProgrammingKnowledge)

## 1. [Introduction](https://www.youtube.com/watch?v=cQepf9fY6cE&list=PLS1QulWo1RIYmaxcEqw5JhK3b-6rgdWO_&index=1)

shell type supported:  
```sh
cat /etc/shells 
```

locate bash: 
```sh
which bash
```

### Hello World: 

1. Create the sh file: 
```sh
touch hello.sh
```

2. edit the sh file: 
```sh
#! /bin/bash 
# ^ let the interpreter know that this is for bash 
echo "Hellow Word"
```

3. Enable execute permission: 
```sh
chmod +x hellow.sh
```

4. Run the shell script: 
```sh
./hello.sh
```

## 2. [Comments and Variables](https://www.youtube.com/watch?v=vQv4W-JfrmQ&list=PLS1QulWo1RIYmaxcEqw5JhK3b-6rgdWO_&index=2)
### 2.1 Comment 

```sh
# single line comment 
echo "hello" # another single line comment
```

## 2.2 Variables 

### System Variables 
variable name in CAPITAL cases

```sh
echo our shell name is $BASH
```

```sh
echo shell version is $BASH_VERAION
```

```sh
echo our home directory is $HOME
```

```sh
echo the present working directory is $PWD 
```


### User Defined Variables 

 - variable name should not start with number 
 - there is no " " before and after the = sign 
 
```sh
#! /bin/bash

my_variable=value 
echo $my_variable
```

# 3. Read user input 

### single user input 
```sh
#! /bin/bash

echo "Enter Name: "
read name
echo "Entered Name: $name" 
```

### multi user input 
```sh
#! /bin/bash

echo "Enter Names: "
read name1 name2 name3
echo "Entered Names: $name1, $name2, $name3" 
# when entering the second name, do not press enter 
```

### Enter input the same line as per the prompt: 
```sh
#! /bin/bash

read -p "Enter Name :" name
echo "Entered Name : $name"
```

### Silent import: 
```sh
#! /bin/bash

read -sp "Enter the password: " password1
read -sp "Enter the password again: " password2
```

### Multiple input to be stored inside an array: 
```sh
#! /bin/bash

echo "Enter Names: "
read -a nameArray
echo "Names : ${nameArray[0]}" 
# abstract an element by index: {$arrayName[index_number]}
```

### `read` without any variable name: 
```sh
#! /bin/bash

echo "Enter Name: 
read 
echo "Name Entered: $REPLY" 
```

## 4. Passing Argument to a Bash Script: 

### Method 1: 
```sh
#! /bin/bash

echo $0 $1 $2 $3 '> $1 $2 $3'
```

```sh
./hello.sh apple banana pear 

# seperate by space 
```
output: 
> ./hello.sh apple banana pear > $1 $2 $3 
> $0 is the script's name 

### Method 2: Pass in as Array

```sh
#! /bin/bash
args = ("$@") 
echo ${args[0]} ${args[1]} ${args[2]}
```

```sh
./hello.sh apple banana pear 
```
output: 
> apple banana pear  
> when passing in as array, ${args[0]} is the first elelement 

### display the number of arguments passed into the bash script: 
```sh
echo $#
```

## 5. If statement 

### Basic Structure

```sh
if [ conditional expression ]
then 
    statement 
fi 
```

*always leave a space after [ and before ]*

### Integer Comparison Operators 

`-eq` compare if two numbers are equal  
`-ge` compare if one number is greater than or equal to a number  
`-le` compare if one number is less than or equal to a number  
`-ne` compare if two numbers are not equal  
`-gt` compare if one number is greater than another number  
`-lt` compare if one number is less than another number  

### Note the **(())**
`<`   is less than:             `(($a < $b))`  
`<=`  is less than or equal to: `(($a <= $b))`  
`>`   is more than:             `(($a > $b))`  
`>=`  is more than or equal to: `(($a >= $b))`  


Examples  
`[ n1 -eq n2 ]`  (true if n1 same as n2, else false)  
`[ n1 -ge n2 ]`  (true if n1greater then or equal to n2, else false)  
`[ n1 -le n2 ]`  (true if n1 less then or equal to n2, else false)  
`[ n1 -ne n2 ]`  (true if n1 is not same as n2, else false)  
`[ n1 -gt n2 ]`  (true if n1 greater then n2, else false)  
`[ n1 -lt n2 ]`  (true if n1 less then n2, else false)  

### Integer Comparison Example: 
hello.sh 
```sh
#! /bin/bash

count=10 

if [$count -eq 10]
then 
  echo "count is $count"
fi 
```

### String Comparison Operators: 
`=`   compare if two strings are equal  
`!=`  compare if two strings are not equal  
`-n`  evaluate if string length is greater than zero  
`-z`  evaluate if string length is equal to zero  

### Note the **[[]]**
`<`   is less than, in ASCII alphabetical order:             `[[$a < $b]]`  
`<=`  is less than or equal to, in ASCII alphabetical order: `[[$a <= $b]]`  
`>`   is more than, in ASCII alphabetical order:             `[[$a > $b]]`  
`>=`  is more than or equal to, in ASCII alphabetical order: `[[$a >= $b]]` 

Examples:  
`[ s1 = s2 ]`   (true if s1 same as s2, else false)  
`[ s1 != s2 ]`  (true if s1 not same as s2, else false)  
`[ s1 ]`        (true if s1 is not empty, else false)  
`[ -n s1 ]`     (true if s1 has a length greater then 0, else false)  
`[ -z s2 ]`     (true if s2 has a length of 0, otherwise false)  

### String Comparison Example: 

hello.sh 
```sh
#! /bin/bash

word = abc

if [$count == "abc"]
then 
  echo "count is $count"
fi 
```

hello.sh 
```sh
#! /bin/bash

word = a

if [[$count < "b"]] # note the [[]] here 
then 
  echo "count is $count"
fi 
```

### if else: 
```sh
if [conditional expression]
then 
    statement 
else
    statement 
fi 
```

### if else if else 
```sh
if [conditional expression]
then 
    statement 
elif
then
    statement 
else
    statement 
fi 
```

## 6. File Test Operator 

file_presence_check.sh 
```sh
#! /bin/bash

echo -e "Enter the name of the file: \c"
# \c used to keep the cursor on the same line after the echo
# -e enables interpresation of \c 

read file_name 

if [ -e $file_name ]
then
    echo "$file_name is present!" 
else
    echo "$file_name not found!" 
fi 
```

### Operators: 

`-e`: if the file exists  
`-f`: if the file exists, and is a regular file  
`-d`: if the directory exists  
`-b`: block special file  
`-c`: charater special file  
`-s`: if the file is empty  


### Character Special File
a file containing normal text 

### Block Special File 
binary file, like images, videos etc 

## 7. How to append text to output file 

appending_text.sh
```sh
echo -e "Enter the name of the file : \c" 
read file_name 

if [ -f $file_name ]
then
    if [ -w $file_name ]
    then
        echo "Type some text to $file_name. To quit, press CTRL+D"
        cat >> $file_name 
    else
        echo "You do not have writing permission to $file_name" 
    fi 
else
    echo "$file_name does not exists" 
fi 
```

`cat >` over-write 
`cat >>` append 
