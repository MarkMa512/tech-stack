# Java Cheat Sheet 

## Contents
* [Java Data Types](#java-data-types)
    * [Primitive Data Types](#primitive-data-types)
    * [Non-Primitive Data Types](#non-primitive-data-types)
* [Java Operators](#java-operators)
    * [Arithmetic Operators](#arithmetic-operators)
    * [Comparison Operators](#comparison-operators)
    * [Logical Operators](#logical-operators)
    * [Bitwise Operators](#bitwise-operators)
    * [Assignment Operators](#assignment-operators)
* [Java Control Flow Statements](#java-control-flow-statements)
    * [If-Else Statement](#if-else-statement)
    * [Switch Statement](#switch-statement)
    * [While Loop](#while-loop)
    * [Do-While Loop](#do-while-loop)
    * [For Loop](#for-loop)
    * [For-Each Loop](#for-each-loop)
    * [Break Statement](#break-statement)
    * [Continue Statement](#continue-statement)
    * [Return Statement](#return-statement)
* [Java Methods](#java-methods)
* [Object, Class, and Interface](#object-class-and-interface)
    * [Class and Object](#class-and-object)
    * [Abstract Class](#abstract-class)
    * [Interface](#interface)
* [File I/O](#file-io)
    * [File Class](#file-class) 
    * [Reading Files](#reading-files) 
    * [Writing Files](#writing-files) 

## Java Data Types

### Primitive Data Types
There are in total 8 primitive data types in Java. 

| Data Type | Size | Description |
| --- | --- | --- |
| byte | 1 byte | Stores whole numbers from -128 to 127 |
| short | 2 bytes | Stores whole numbers from -32,768 to 32,767 |
| int | 4 bytes | Stores whole numbers from -2,147,483,648 to 2,147,483,647 |
| long | 8 bytes | Stores whole numbers from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 |
| float | 4 bytes | Stores fractional numbers. Sufficient for storing 6 to 7 decimal digits |
| double | 8 bytes | Stores fractional numbers. Sufficient for storing 15 decimal digits |
| boolean | 1 bit | Stores true or false values |
| char | 2 bytes | Stores a single character/letter or ASCII values |

### Non-Primitive Data Types
Non-primitive data types are called reference types because they refer to objects. 

Common reference types include: 
* String
* Array
* ArrayList
* HashMap 

```java
int[] myArray = new int[5]; // Creating an array object

System.out.println(myArray instanceof Object); // Output: true
System.out.println(myArray.getClass().getName()); // Output: [I (representing the array of int)

```

## Java Operators 

### Arithmetic Operators

| Operator | Name | Description |
| --- | --- | --- |
| + | Addition | Adds together two values |
| - | Subtraction | Subtracts one value from another |
| * | Multiplication | Multiplies two values |
| / | Division | Divides one value by another |
| % | Modulus | Returns the division remainder |
| ++ | Increment | Increases the value of a variable by 1 |
| -- | Decrement | Decreases the value of a variable by 1 |

### Comparison Operators

| Operator | Name | Example |
| --- | --- | --- |
| == | Equal to | x == y |
| != | Not equal | x != y |
| > | Greater than | x > y |
| < | Less than | x < y |
| >= | Greater than or equal to | x >= y |
| <= | Less than or equal to | x <= y |

### Logical Operators

| Operator | Name | Description |
| --- | --- | --- |
| && | Logical and | Returns true if both statements are true |
| \|\| | Logical or | Returns true if one of the statements is true |
| ! | Logical not | Reverse the result, returns false if the result is true |

### Bitwise Operators

| Operator | Name | Description |
| --- | --- | --- |
| & | Bitwise and | Compares each bit of the first operand to the corresponding bit of the second operand. If both bits are 1, the corresponding result bit is set to 1. Otherwise, the corresponding result bit is set to 0 |
| \| | Bitwise or | Compares each bit of the first operand to the corresponding bit of the second operand. If either bit is 1, the corresponding result bit is set to 1. Otherwise, the corresponding result bit is set to 0 |
| ^ | Bitwise xor | Compares each bit of the first operand to the corresponding bit of the second operand. If the bits are different, the corresponding result bit is set to 1. Otherwise, the corresponding result bit is set to 0 |
| ~ | Bitwise compliment | Inverts the bits of its operand |
| << | Left shift | Shifts a bit pattern to the left by the specified number of bits |
| >> | Right shift | Shifts a bit pattern to the right by the specified number of bits |
| >>> | Unsigned right shift | Shifts a zero into the leftmost position |

### Assignment Operators

| Operator | Example | Same As |
| --- | --- | --- |
| = | x = 5 | x = 5 |
| += | x += 3 | x = x + 3 |
| -= | x -= 3 | x = x - 3 |
| *= | x *= 3 | x = x * 3 |
| /= | x /= 3 | x = x / 3 |
| %= | x %= 3 | x = x % 3 |
| &= | x &= 3 | x = x & 3 |
| \|= | x \|= 3 | x = x \| 3 |
| ^= | x ^= 3 | x = x ^ 3 |
| >>= | x >>= 3 | x = x >> 3 |
| <<= | x <<= 3 | x = x << 3 |


## Java Control Flow Statements 

### If-Else Statement

```java
if (condition) {
    // code to be executed if condition is true
} else {
    // code to be executed if condition is false
}
```

### Switch Statement
Switch statement allows a variable to be tested for equality against a list of values. Each value is called a case, and the variable being switched on is checked for each case.



```java
switch (expression) {
    case x:
        // code block
        // case x is executed if expression matches x
        break; // break out of switch statement, if not included, the next case will be executed 
    case y:
        // code block
        break;
    default: // optional, default case if no case matches the expression
        // code block
}
```

### While Loop

```java
while (condition) {
    // code block to be executed
}
```

### Do-While Loop

```java
do {
    // code block to be executed
}   
while (condition);
```

### For Loop

```java
for (statement 1; statement 2; statement 3) {
    // code block to be executed
}
```

### For-Each Loop

```java
for (type variableName : arrayName) {
    // code block to be executed
}
```

### Break Statement

```java
for (int i = 0; i < 10; i++) {
    if (i == 4) {
        break;
    }
    System.out.println(i);
}
```

### Continue Statement

```java
for (int i = 0; i < 10; i++) {
    if (i == 4) {
        continue;
    }
    System.out.println(i);
}
``` 

### Return Statement

```java
public static void main(String[] args) {
    int result = sum(10, 20);
    System.out.println(result);
}

public static int sum(int a, int b) {
    return a + b;
}
```

## Java Methods 

### Method Declaration

```java
public static void main(String[] args) {
    myMethod();
}

static void myMethod() {
    System.out.println("Hello World!");
}
```

### Method Parameters
The method parameters are the values that are passed when the method is called. Inside the method, the parameters act as variables.

```java
public static void main(String[] args) {
    myMethod("John");
}

static void myMethod(String name) {
    System.out.println("Hello " + name);
}
```

In Java, variables are passed by value. It means that when a method is called, the parameters are the values of the variables passed into the method.

```java
public static void main(String[] args) {
    int x = 10;
    myMethod(x);
    System.out.println(x); // Outputs 10
}

static void myMethod(int x) {
    x = 25;
}
```

## Object, Class, and Interface

### Classes and Objects

```java
public class MyClass {
    int x = 5;

    public static void main(String[] args) {
        MyClass myObj = new MyClass(); // new is used to create an object of MyClass
        System.out.println(myObj.x); // Outputs 5
    }
}
```

### Abstract Class

```java
abstract class Animal {
    public abstract void animalSound();
    public void sleep() {
        System.out.println("Zzz");
    }
}

class Pig extends Animal {
    @Override
    public void animalSound() {
        System.out.println("The pig says: wee wee");
    }
}

class Main {
    public static void main(String[] args) {
        Pig myPig = new Pig();
        myPig.animalSound();
        myPig.sleep();
    }
}
```

Output:

> The pig says: wee wee
> Zzz

### Interface

```java
interface Animal {
    public void animalSound(); // interface method (does not have a body)
    public void run(); // interface method (does not have a body)
}

// Pig "implements" the Animal interface
class Pig implements Animal {
    public void animalSound() {
        // The body of animalSound() is provided here
        System.out.println("The pig says: wee wee");
    }
    public void run() {
        // The body of run() is provided here
        System.out.println("The pig is running");
    }
}

class Main {
    public static void main(String[] args) {
        Pig myPig = new Pig();  // Create a Pig object
        myPig.animalSound();
        myPig.run();
    }
}
```

Output:
> The pig says: wee wee
> The pig is running 

## File I/O

### File Class
- Provides a system-independent view of hierarchical files and directories 
- Provides methods for creating, deleting, renaming files and directories

```java
File file = new File("C:\\Users\\MyName\\filename.txt");

// Check if file exists
if (file.exists()) {
    System.out.println("File exists");
} else {
    System.out.println("File does not exist");
}
```

### Reading Files
- FileReader class is used to read data from the file
- BufferedReader class is used to read text from a character-input stream
- Scanner class is used to get user input, and it is found in the java.util package. It can also read text from a file

Using FileReader and BufferedReader class to read file line by line
```java
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class ReadFile {
    public static void main(String[] args) {
        File file = new File("filename.txt");
        // Check if file exists
        if (file.exists()) {
            System.out.println("File exists");
        BufferedReader fileLine = new BufferedReader(new FileReader(file));
        String data;
        while ((data = fileLine.readLine()) != null) { // read file line by line until there is no more line
            System.out.println(data);
        }
        } else {
            System.out.println("File does not exist");
        }
        fileLine.close(); // close the file
    }
}
```

Using Scanner class to read file line by line
```java
import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

public class ReadFile{
    public static void main(String[] args){
        try{
            File file = new File("filename.txt");
            Scanner fileLine = new Scanner(file);
            while (fileLine.hasNextLine()) { // read file line by line until there is no more line
                String data = fileLine.nextLine();
                System.out.println(data);
            }
        } catch (FileNotFoundException e) {
            System.out.println("File does not exist");
        } finally {
        fileLine.close(); // close the file
        }
    }
}
```
- Why use BufferedReader instead of Scanner?
    - BufferedReader is faster than Scanner because it does not do parsing
    - BufferedReader has a bigger buffer memory than Scanner

### Writing Files
- FileWriter class is used to write characters to a file
- BufferedWriter class is used to write text to a character-output stream
- PrintStream class is used to write data to another stream 

Using FileWriter and BufferedWriter class to write file line by line
```java
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class WriteFile{
    public static void main(String[] args){
        String filePath = "filename.txt"; 

        try (
            FileWriter fileWriter = new FileWriter(filePath);
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter)
            ) {
            bufferedWriter.write("Hello World!");
            bufferedWriter.newLine(); // write a new line character
            bufferedWriter.write("Hello World Again!");
        } catch (IOException e) {
            System.out.println("Unable to write file");
        }

    }
}
```

Output: `filename.txt`
> Hello World! 
> Hello World Again! 

Using PrintStream class to write file line by line
```java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;

public class WriteFile{
    public static void main(String[] args){
        String filePath = "filename.txt"; 

        try (
            PrintStream writer = new PrintStream(filePath, true) // true means append to the file instead of overwrite
            ) {
            writer.println("Hello World!");
            writer.println("Hello World Again!");
        } catch (FileNotFoundException e) {
            System.out.println("Unable to write file");
        }

    }
}
```

Why use BufferedWriter instead of PrintStream? 
- BufferedWriter is faster than PrintStream because it does not do parsing
- BufferedWriter has a bigger buffer memory than PrintStream

## Exception Handling 
An exception is an event that occurs during the execution of a program that disrupts the normal flow of instructions.

### Try-Catch Control Flow

```java
try {
    // Block of code to try
} catch (Exception e) {
    // Block of code to handle errors
} finally {
    // Block of code to be executed regardless of the try / catch result 
    // useful for clean up code / close resources
}
```

### Common Exceptions
1. NullPointerException
    - Thrown when an application attempts to use null in a case where an object is required
    - Example: 
    ```java
    String str = null;
    System.out.println(str.length());
    ```
2. IndexOutOfBoundsException
    - Thrown to indicate that an index of some sort (such as to an array, to a string, or to a vector) is out of range
    - Example: 
    ```java
    int[] arr = {1, 2, 3};
    System.out.println(arr[3]);
    ```
3. ArithmeticException
    - Thrown when an exceptional arithmetic condition has occurred
    - Example: 
    ```java
    int a = 10;
    int b = 0;
    System.out.println(a/b);
    ```
4. InputMismatchException
    - Thrown by a Scanner to indicate that the token retrieved does not match the pattern for the expected type
    - Example: 
    ```java
    Scanner sc = new Scanner(System.in);
    int a = sc.nextInt();
    ```

## Types of Exceptions
There are two types of exceptions:
1. Checked exceptions
    - Checked exceptions are checked at compile-time
    - Must be handled by try-catch block or throws keyword explicitly
    - Example: IOException, FileNotFoundException
2. Unchecked exceptions
    - Unchecked exceptions are checked at run-time
    - Cam be compiled without try-catch block
    - Example: NullPointerException, IndexOutOfBoundsException

`Throwable` class is the superclass of all errors and exceptions in the Java language. Only objects that are instances of this class (or one of its subclasses) are thrown by the Java Virtual Machine or can be thrown by the Java throw statement. Similarly, only this class or one of its subclasses can be the argument type in a catch clause.

Throwable 
    - Error (unchecked)
        - OutOfMemoryError
        - ... 
    - Exception
        - RuntimeException (unchecked)
            - NullPointerException
            - IndexOutOfBoundsException
            - ...
        - IOException (checked)

### Exception Management 
#### Catching Exceptions
```java
try {
    // Block of code to try
} catch (Exception e) {
    // Block of code to handle errors
}
```
#### Throwing Exceptions (Propagating Exceptions)
An exception can be propagated all the way back to the main method. 

```java
public void method() throws Exception {
    // Block of code that may throw an exception
}
```

## Custom Exceptions
Custom exceptions are user-defined exceptions.
    
```java
public class CustomException extends Exception {
    public CustomException(String message) {
        super(message); // call the constructor of the parent class Exception with the message parameter
    }
}

public class CustomExceptionExample {
    public static void main(String[] args) {
        try {
            throw new CustomException("Custom Exception"); // throw the custom exception. 
        } catch (CustomException e) {
            System.out.println(e.getMessage()); // print the message of the custom exception 
        }
    }
}

```

## Collection 

### Collection vs Collections
- Collection is an interface that represents a group of objects known as its elements, it contains methods to operate on the elements such as add, remove, etc.
- Collections is a class that contains static methods to operate on objects of type Collection, such as sort, binarySearch, etc.

### List
- List is an ordered collection of elements that allows duplicate elements
- List is an interface that implements Collection interface
- ArrayList and LinkedList are two implementations of List interface

#### ArrayList
- ArrayList is a resizable array implementation of the List interface
- ArrayList is not thread-safe
- ArrayList is not synchronized

#### LinkedList
- LinkedList is a doubly-linked list implementation of the List interface
- LinkedList is not thread-safe
- LinkedList is not synchronized

### Set
- Set is a collection of elements that does not allow duplicate elements
- Set is an interface that extends Collection interface
- HashSet, LinkedHashSet and TreeSet are three implementations of Set interface

#### HashSet
- HashSet is a hash table implementation of the Set interface
- HashSet is not thread-safe
- HashSet is not synchronized

#### LinkedHashSet
- LinkedHashSet is a hash table and linked list implementation of the Set interface
- LinkedHashSet is not thread-safe
- LinkedHashSet is not synchronized

#### TreeSet
- TreeSet is a red-black tree implementation of the Set interface
- TreeSet is not thread-safe nor synchronized

### Map
- Map is a collection of key-value pairs
- Map is an interface that **does not** extends Collection interface 
- HashMap, LinkedHashMap and TreeMap are three implementations of Map interface

#### HashMap
- HashMap is a hash table implementation of the Map interface
- HashMap is not thread-safe nor synchronized

#### LinkedHashMap
- LinkedHashMap is a hash table and linked list implementation of the Map interface
- LinkedHashMap is not thread-safe nor synchronized

#### TreeMap
- TreeMap is a red-black tree implementation of the Map interface
- TreeMap is not thread-safe nor synchronized

### Queue
- Queue is a collection of elements that follows the FIFO (First In First Out) principle
- Queue is an interface that extends Collection interface
- LinkedList and PriorityQueue are two implementations of Queue interface

#### LinkedList vs ArrayList

| Features | LinkedList | ArrayList | 
| --- | --- | --- |
| Data Structure | Doubly-linked list | Resizable array |
| Access | O(n) | O(1) |
| Search | O(n) | O(n) |
| Insertion | O(1) | O(n) |
| Deletion | O(1) | O(n) |
| Suitable for | Frequent insertion and deletion | Frequent access | 
