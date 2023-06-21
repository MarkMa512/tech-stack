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
* [Exception Handling](#exception-handling)
    * [Try-Catch Control Flow](#try-catch-control-flow)
    * [Common Exceptions](#common-exceptions)
    * [Types of Exceptions](#types-of-exceptions)
    * [Exception Management](#exception-management)
    * [Custom Exceptions](#custom-exceptions)
* [Collection]
    * [Collection vs Collections](#collection-vs-collections)
    * [List](#list)
    * [Set](#set)
    * [Map](#map)
    * [Queue](#queue)
    * [Traversing Collections](#traversing-collections)
    * [Sorting Collection](#sorting-collections)
    * [Question on Collections](#question-on-collections)
* [Arrays](#arrays)
    * [Array Declaration](#array-declaration)
    * [Array Instantiation](#array-instantiation)
    * [Element Assignment and Access](#element-assignment-and-access)
    * [Array Declaration, Instantiation and Initialization](#array-declaration-instantiation-and-initialization)
    * [Convert Array to ArrayList](#convert-array-to-arraylist)
    * [Convert ArrayList to Array](#convert-arraylist-to-array)
    * [Sorting Array](#sorting-array)
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

### Variable Naming Conventions 
an unlimited-length sequence of Unicode letters and digits, beginning with a letter, the dollar sign " $ ", or the underscore character " _ ". The convention, however, is to always begin your variable names with a letter, not " $ " or " _ ".

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

### Pre and Post Increment 

#### Pre-increment 
- Increase, then assign/execute 
```java
int i = 1; 
System.out.println(++i); //2 will be printed
```

#### Post-increment 
- Assign/execute, then increase 
```java
int i = 1; 
System.out.println(i++); // 1 will be printed 
System.out.println(i); //2 will be printed 
```

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

## Object, Class and Methods

### Class 
```java
public class MyClass {
    int x = 5;

    public static void main(String[] args) {
        MyClass myObj = new MyClass(); // new is used to create an object of MyClass
        System.out.println(myObj.x); // Outputs 5
    }
}
``` 

### Object
An object is an instance of a class. An object is an instantiation of a class with the keyword `new`. 

### Instance variables
Attribute of a particular object. To be initiated by the constructor. 

### Class variables and constant
Collective information that is not specific to individual objects of the class. 
Used to define constant values used by al instances created using the class. 
Indicated by the `static` keyword. 

Consider the following example: 

```java
public class Circle {
    // Class variables
    private static final double PI = 3.14159; // Constant
    private static int numberOfInstances = 0;

    // Instance variables
    private double radius;

    // Constructor
    public Circle(double radius) {
        this.radius = radius;
        numberOfInstances++;
    }

    // Methods
    public double getArea() {
        return PI * radius * radius;
    }

    public double getCircumference() {
        return 2 * PI * radius;
    }

    public static int getNumberOfInstances() { 
        return numberOfInstances;
    }

    public static void main(String[] args) {
        Circle circle1 = new Circle(5);
        Circle circle2 = new Circle(3.5);

        System.out.println("Area of circle1: " + circle1.getArea());
        System.out.println("Circumference of circle1: " + circle1.getCircumference());

        System.out.println("Area of circle2: " + circle2.getArea());
        System.out.println("Circumference of circle2: " + circle2.getCircumference());

        System.out.println("Number of circle instances created: " + Circle.getNumberOfInstances());
    }
}

```

The `PI` variable is declared as `static final`, making it a **constant**. It represents the mathematical constant π and is a class-level variable. It **cannot be modified** and is shared among all instances of the Circle class.

The numberOfInstances variable is declared as **static**, making it a class variable. It keeps track of the number of Circle objects created. It is incremented in the constructor each time a new Circle object is instantiated. As a class variable, it is **shared** among all instances of the Circle class.

Note: Static variables can be used in any type of methods: static or non-static. Non-static variables cannot be used inside static methods.

### Methods 

#### Instance method
Operates on an object. 

#### Class method
Service provided by a class and is not associated with a particular object.  
Indicated by the `static` keyword. 

Consider the following example: 
```java
public class MathUtils {
    private int value;

    public MathUtils(int value) {
        this.value = value;
    }

    // Instance method
    public void square() {
        int result = value * value;
        System.out.println("Square of " + value + " is: " + result);
    }

    // Class method
    public static void cube(int value) {
        int result = value * value * value;
        System.out.println("Cube of " + value + " is: " + result);
    }

    public static void main(String[] args) {
        MathUtils mathObj1 = new MathUtils(5);
        mathObj1.square(); // Calling instance method

        MathUtils.cube(3); // Calling class method
    }
}

```

#### [Method Overloading](./JavaOOP.md#method-overloading)

## Abstract Class and Interface 
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

### Custom Exceptions
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

Eg. 
```java
import java.util.ArrayList;

public class ArrayListExample {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<String>();
        list.add("Hello"); // add element to the list
        list.add("World");
        list.add("Again");
        list.remove("Again"); // remove element from the list
        System.out.println(list);
    }
    int listSize = list.size(); // get the size of the list 
    String element = list.get(0); // get the element at index 0
    list.set(0, "Hi"); // set the element at index 0 to "Hi" 
}
```

#### LinkedList
- LinkedList is a doubly-linked list implementation of the List interface
- LinkedList is not thread-safe
- LinkedList is not synchronized

#### Declaring a List
It is a common practice to declare a List as an interface instead of an implementation of ArrayList or LinkedList. This is because it is easier to change the implementation of the List later on. For a function that has a parameter of type List, it can accept any implementation of List, including ArrayList and LinkedList. This makes the function more flexible. 


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

Eg. 
```java
import java.util.HashMap;

public class HashMapExample {
    public static void main(String[] args) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("Hello", 1); // add key-value pair to the map
        map.put("World", 2);
        map.put("Again", 3);
        map.remove("Again"); // remove key-value pair from the map
        System.out.println(map);
    }
    int mapSize = map.size(); // get the size of the map 
    int value = map.get("Hello"); // get the value of the key "Hello"
    map.put("Hello", 4); // update the value of the key "Hello" to 4
}
```

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

### Traversing Collections
1. Iterator 
An object that enables you to traverse through a collection and to remove elements from the collection selectively, if desired. 

Eg. 
```java
import java.util.ArrayList;

public class IteratorExample {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<String>();
        list.add("Hello");
        list.add("World");
        list.add("Again");
        Iterator<String> iterator = list.iterator();
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}
```

Remove elements from the collection selectively
```java
import java.util.ArrayList;

public class IteratorExample {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<String>();
        list.add("Hello");
        list.add("World");
        list.add("Again");
        Iterator<String> iterator = list.iterator();
        while (iterator.hasNext()) {
            String str = iterator.next(); // must be called before iterator.remove()
            if (str.equals("Again")) {
                iterator.remove();
            }
        }
        System.out.println(list);
    }
}
```

2. For-each loop
For each object in a collection, in order, do something with the object.
Cannot remove elements from the collection while traversing.

Eg. 
```java
import java.util.ArrayList;

public class ForEachExample {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<String>();
        list.add("Hello");
        list.add("World");
        list.add("Again");
        for (String str : list) { // for (Type var : collection)
            System.out.println(str);
        }
    }
}
```

3. For loop 
```java
import java.util.ArrayList;

public class ForLoopExample {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<String>();
        list.add("Hello");
        list.add("World");
        list.add("Again");
        for (int i = 0; i < list.size(); i++) { // use list.size() to get the size of the list 
            System.out.println(list.get(i));
        }
    }
}
```

#### Traversing HashMap 
It is important to note that the order of elements in a HashMap is not guaranteed, as it is based on the hash codes of the keys. 

1. Using `entrySet()`: 
    - `entrySet()`: This method provides a set of key-value pairs (Map.Entry objects) from the HashMap. We iterate over each entry and extract the key and value using getKey() and getValue() methods.
    
    - `keySet()`: This method returns a set of keys from the HashMap. We iterate over each key and retrieve the corresponding value using the get() method.
    - Using `values()`: This method returns a collection of values from the HashMap. We iterate over each value directly.

```java 
import java.util.HashMap;
import java.util.Map;

public class HashMapLoopExample {
    public static void main(String[] args) {
        Map<String, Integer> hashMap = new HashMap<>(); 
        hashMap.put("Apple", 10);
        hashMap.put("Banana", 5);
        hashMap.put("Orange", 8);

        // Using entrySet() to loop through the HashMap
        for (Map.Entry<String, Integer> entry : hashMap.entrySet()) { // entrySet() returns a Set view of the mappings contained in this map
            String key = entry.getKey(); // getKey() returns the key corresponding to this entry
            int value = entry.getValue(); // getValue() returns the value corresponding to this entry
            System.out.println("Key: " + key + ", Value: " + value);
        }

        // Using keySet() to loop through the HashMap
        for (String key : hashMap.keySet()) { // keySet() returns a Set view of the keys contained in this map
            int value = hashMap.get(key);
            System.out.println("Key: " + key + ", Value: " + value);
        }

        // Using values() to loop through the HashMap
        for (int value : hashMap.values()) { // values() returns a Collection view of the values contained in this map 
            System.out.println("Value: " + value);
        }
    }
}

```

2. Using Iterator

```java
import java.util.HashMap; 

public class IteratorHashMapExample{
    public static void main(String[] args) {
        HashMap<String, Integer> hashMap = new HashMap<>();
        hashMap.put("Apple", 10);
        hashMap.put("Banana", 5);
        hashMap.put("Orange", 8);

        // Traverse through the key:value pairs concurrently 
        Iterator<Map.Entry<String, Integer>> iterator = hashMap.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, Integer> entry = iterator.next();
            String key = entry.getKey();
            int value = entry.getValue();
            System.out.println("Key: " + key + ", Value: " + value);
        }

        Iterator<String> keyIterator = hashMap.keySet().iterator(); // create an iterator from the key set 
        while (keyIterator.hasNext()){
            System.out.println(keyIterator.next())
        }

        Iterator<Integer> valueIterator = hashMap.values().iterator(); // create an iterator from the value set
        while (valueIterator.hasNext()){
            System.out.println(valueIterator.next())
        }
    }
}
```




### Sorting Collections

Using `Collections.sort()` and `Collection.reverse()` to sort lists. 

Eg. 
```java 
import java.util.ArrayList; 
import java.util.Collections; 

public class ArrayListSortExample{
    public static void main(String[] args){
        ArrayList<Integer> numbers = new ArrayList<>(); 
        numbers.add(5); 
        numbers.add(2);
        numbers.add(9); 
        numbers.add(1); 
        numbers.add(3);

        System.out.println("Before sorting: " + numbers); 

        Collections.sort(numbers); 

        System.out.println("After sorting: " + numbers); 

        Collections.reverse(numbers); 

        System.out.println("After reversing:" + numbers)
    }
}
```

Output: 
> Before sorting: [5, 2, 9, 1, 3]  
> After sorting: [1, 2, 3, 5, 9]  
> After reversing: [9, 5, 3, 2, 1]



### Question on Collections
- Why we must use `Integer` instead of `int` in `ArrayList<Integer>`?

In Java, the `ArrayList` class is a **generic class**, which means it can hold objects of **any type**. When you specify a specific type for `ArrayList`, such as `ArrayList<Integer>`, you are creating an `ArrayList` that can only store objects of type `Integer`. 

The difference between using `Integer` and `int` in `ArrayList<Integer>` is related to the concept of *autoboxing* and the distinction between primitive types and their corresponding wrapper classes in Java.

The `int` type is a primitive type in Java, representing a 32-bit signed integer. On the other hand, `Integer` is a wrapper class that encapsulates an `int` value and provides additional methods and functionality. It allows you to treat an `int` as an object.

In the case of `ArrayList`, it can only hold objects, not primitive types. So when you use `ArrayList<Integer>`, you are telling the compiler that the `ArrayList` will store `Integer` objects. If you try to use `ArrayList<int>`, it will result in a compilation error because `int` is a primitive type and not an object.

However, thanks to autoboxing, Java automatically converts between primitive types and their corresponding wrapper classes when needed. So when you add an `int` value to an `ArrayList<Integer>`, Java automatically converts it to an `Integer` object through autoboxing.

For example:

```java
ArrayList<Integer> list = new ArrayList<>();
int value = 10;
list.add(value); // Autoboxing: int value is automatically converted to Integer object
```

By using `ArrayList<Integer>`, you can take advantage of the additional methods and functionality provided by the `Integer` class, such as `compareTo()`, `parseInt()`, and so on, which are not available for primitive types like `int`.

In summary, when you use `ArrayList<Integer>`, you are indicating that the `ArrayList` will store `Integer` objects, and Java will handle the conversion between `int` and `Integer` for you through autoboxing.

- Why various collections are not synchronized?

In Java, the various collection classes, such as `ArrayList`, `HashMap`, and `HashSet`, are not synchronized by default for performance reasons. **Synchronization** refers to the process of controlling access to shared resources or data structures to ensure that multiple threads can access them safely without causing inconsistencies or data corruption.

The decision not to make the collections synchronized by default was made to optimize performance. Synchronization introduces overhead in terms of performance and can result in reduced throughput, especially in scenarios where thread safety is not required.

Java's collections framework aims to provide a balance between flexibility and performance. By not synchronizing the collections by default, developers have the flexibility to choose between thread-safe or non-thread-safe collections based on their specific requirements. If thread safety is needed, there are synchronized counterparts available for most collection classes, such as `Vector`, `Hashtable`, and `Collections.synchronizedList()`, `Collections.synchronizedMap()`, etc.

By allowing collections to be unsynchronized by default, Java enables developers to build more efficient and scalable applications in scenarios where concurrent access is not a concern. This approach promotes performance and allows developers to explicitly handle synchronization when necessary, rather than incurring the overhead of synchronization when it's not required.

It's important to note that while the individual collection classes are not synchronized by default, it's still possible to make them thread-safe by synchronizing access to the collection externally using locks or by using the synchronized wrapper classes provided by the `Collections` utility class.

- Why Collections.sort() is not working for LinkedList?

The `Collections.sort()` method in Java is designed to work with collections that implement the `List` interface. However, the `LinkedList` class in Java implements the `List` interface differently from classes like `ArrayList`. 

`LinkedList` internally represents its elements as a doubly-linked list, where each element holds a reference to both the previous and next elements. This data structure allows for efficient insertion and removal of elements at both ends of the list. However, random access to elements in a `LinkedList` is less efficient compared to `ArrayList`, as it requires traversing the list from the beginning or end to reach a specific index.

The `Collections.sort()` method relies on random access to elements for efficient sorting, which is why it is not suitable for sorting a `LinkedList`. The algorithm used by `Collections.sort()` is based on the "quick sort" algorithm, which requires efficient random access to elements. Since `LinkedList` does not provide efficient random access, the sorting operation is not supported.

If you want to sort a `LinkedList`, you have a few options:

1. Convert the `LinkedList` to an `ArrayList` using the constructor that takes a `Collection` as a parameter, sort the `ArrayList`, and then convert it back to a `LinkedList`. Here's an example:

```java
LinkedList<Integer> linkedList = new LinkedList<>();
// Add elements to the linkedList
ArrayList<Integer> arrayList = new ArrayList<>(linkedList);
Collections.sort(arrayList);
linkedList = new LinkedList<>(arrayList);
```

2. Implement your own sorting algorithm specifically tailored for `LinkedList`. Since `LinkedList` supports efficient insertion and removal, you can use algorithms like insertion sort or merge sort that work well with linked lists.

3. Use a third-party library, such as Apache Commons Collections or Guava, which provide sorting methods specifically designed for `LinkedList` or other non-random-access collections.

Remember that sorting a `LinkedList` comes with some performance trade-offs due to its inherent data structure characteristics. If you frequently need to perform sorting operations, consider using an `ArrayList` or another data structure that provides efficient random access and sorting capabilities.

- Is `Collections.sort()` and `Collections.reverse()` methods pass by reference? 

In Java, all objects, including collections like `ArrayList`, are passed by reference. However, it's important to clarify ***the difference between passing by reference and modifying an object***.

The `Collections.sort()` and `Collections.reverse()` methods do modify the provided `ArrayList` object, but they do not change the reference itself. In other words, they modify the order of elements within the `ArrayList` but do not assign a new object to the reference. 

Here's an example to illustrate this:

```java
import java.util.ArrayList;
import java.util.Collections;

public class ArrayListExample {
    public static void main(String[] args) {
        ArrayList<Integer> numbers = new ArrayList<>();
        numbers.add(5);
        numbers.add(2);
        numbers.add(9);
        numbers.add(1);
        numbers.add(3);

        System.out.println("Before sorting: " + numbers);

        // Pass by reference, modifies the original ArrayList
        Collections.sort(numbers);
        System.out.println("After sorting: " + numbers);

        // Pass by reference, modifies the original ArrayList
        Collections.reverse(numbers);
        System.out.println("After reversing: " + numbers);
    }
}
```

Output:
```
Before sorting: [5, 2, 9, 1, 3]
After sorting: [1, 2, 3, 5, 9]
After reversing: [9, 5, 3, 2, 1]
```

As you can see in the example, the `Collections.sort()` method modifies the original `numbers` ArrayList, and the subsequent `Collections.reverse()` method also modifies the same ArrayList. The reference `numbers` remains the same throughout the program.

Therefore, although Java passes objects by reference, it's essential to understand that modifying an object does not change the reference itself.

## Arrays 
An array is a container object that holds a fixed number of values of a single type. 

### Array Declaration 
```java 
int[] intArray; // method 1 
int intArray[]; // method 2, discouraged; To accommodate C programming habit. 
```

### Array Instantiation 
```java
int[] intArray = new int[5]; //5 is the length of the array 
```
Array elements are initialized to default values. 
```java
int[] intArray = new int[2]; 
double[] doubleArray = new double[3]; 
boolean[] booleanArray = new boolean[4]; 
String[] stringArray = new String[5]; 
```

| Type | Default Value | 
| ---  | --- | 
| int | 0 |
| double | 0.0 |
| boolean | false |
| String/Object | null | 

### Element Assignment and Access 
```java
int[] intArray = new int[5]; 
intArray[0] = 1; 
intArray[2] = 3; 
intArray[3] = 5; 
System.out.println(intArray[0]); // 1 
```

### Array Declaration, Instantiation and Initialization 
```java
String[] stringList = {"Apple", "Banana", "Cherry"}; 
```

### Loop through an Array 

1. Use for loop: 
```java 
int[] intArray = {1, 3, 5}; 
for (int i = 0; i < intArray.length; i++){
    System.out.println(intArray(arr[i])); 
}
```

### Convert Array to ArrayList 

```java 
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ArrayConversionExample {
    public static void main(String[] args) {
        String[] array = {"apple", "banana", "orange"};
        
        List<String> arrayList = Arrays.asList(array);
        
        System.out.println("ArrayList: " + arrayList);
    }
}
```

`Arrays.asList()` method is used to convert the array `array` into an ArrayList `arrayList`. The resulting ArrayList will contain the same elements as the original array. Note that `Arrays.asList()` returns a fixed-size list backed by the original array, so any modifications to the ArrayList will affect the underlying array.

### Convert ArrayList to Array 
```java 
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ArrayListConversionExample {
    public static void main(String[] args) {
        List<String> arrayList = new ArrayList<>();
        arrayList.add("apple");
        arrayList.add("banana");
        arrayList.add("orange");
        
        String[] array = arrayList.toArray(new String[arrayList.size()]);
        
        System.out.println("Array: " + Arrays.toString(array));
    }
}
```

`toArray()` method is called on the `arrayList` to convert it into an array. The resulting array will have the same elements as the original ArrayList. Note that you need to provide an array of the **appropriate type** and **size** to the `toArray()` method. In this case, we pass `new String[arrayList.size()]` to create a new String array of the same size as the ArrayList.

### Sorting Array

1. Using `Arrays.sort()` method to sort arrays. 

Eg. 
```java 
import java.utilArrays; 

public class ArraySortingExample{
    public static void main(String[] args){
        int[] numbers = {5, 2, 1, 3, 9}; 

        // Sorting the array 
        Arrays.sort(numbers); 

        System.out.println("Sorted array: " + Arrays.toString(numbers)); 
    }
}
```

### Sorting Arrays of Objects 

To sort an array of objects in the array must either implement the `Comparable` interface or you can provide a custom `Comparator` implementation.

Eg. Using comparator 
```java
import java.util.Arrays; 
import java.util.Comparator; 

public class ArrayObjectSortingEg{
    public static void main(String[] args){
        String[] names = {"Apple", "Pear", "Banana"}; 

        // Sorting the array using a custom comparator 
        Arrays.sort(names, new NameComparator()); 

        // Display the sorted array 
        System.out.println("Sorted string array: " + Arrays.toSting(names)); 

    }
}

class NameComparator implements Comparator<String>{
    @Override 
    public int (compare String name1, String name2){
        return name1.compareToIgnoreCase(name2); 
    }
}
```

Eg. Using comparable 
```java 
import java.util.Arrays; 

class student implements Comparable<Student>{
    private String name; 
    private int age; 

    public student(String name, int ange){
        this.name = name; 
        this.gae = age; 
    }

    @Override
    public int compareTo(Student other){
        // Compare students based on their age 
        return Integer.compare(this.age, other.age); 
    }

    @Override 
    public String toString(){
        return ("Name: " + this.name + "Age: " + this.age); 
    }
}

public class ArrayObjSortingEg{
    public static void main(String[] args){
        Student[] students = {
            new Student("Alice", 20), 
            new Student("Tom", 20), 
            new Student("Bob", 20), 
        }; 

        Arrays.sort(students); 

        for (Student student : students){
            System.out.println(student.toString()); 
        }
    }
}
```

### Passing Arrays to Methods 

```java 
public class PassingArray{
    public static int searchMin(int[] arr){
        // the array is accessed via `arr` inside the method 
        int min = arr[0]; 
        for (int element : arr){
            if (element < min) {
                min = element; 
            }
        }
        return min; 
        // The local variable `arr` is erased, the argument still points to the same object 
    }
}

public class PassingArrayTest{
    public static void main(String[] args){
        int [] x = {3, 1, 5}; 
        // local variable `arr` does not exits before the method searchMin() is invoked
        int min = PassingArray.searchMin(x);
        // the value of the argument (ie, memory address of the container containing values 3,1 5) is copied over to the parameter `arr`
        System.out.println("Minimum value: " + min);
    }
}
```
 In Java, when an array is passed to a method, it is technically passed by value. 

When an array is passed to a method, a copy of the reference to the array is passed to the method. This means that the method receives its **own copy of the reference** to the array, **not a copy of the entire array itself**. Therefore, ***any changes made to the elements of the array inside the method will affect the original array***.

In the example above, the `searchMin()` method takes an `int[]` parameter called `arr`, which represents an *array*. When the `searchMin()` method is called from the `main` method, the **reference** to the array `x` is passed as an argument.

Inside the `searchMin()` method, the array elements are accessed and processed using the `arr` parameter. Any modifications made to the array elements inside the method **will affect the original array x** because *they refer to the same memory locations*.

```java 
public class PassByValueDemo{
    public static void zeroInt(int val){
        val = 0; 
    }
    public static void zeroArray(int[] arr){
        for (int i =0; i < list.length; i++){
            arr[i] = 0; 
        }
    }
    public static void main(String[] args){
        int i = 1; 
        int [] z = {1, 2, 3}; 

        System.out.println("int i: " + i); 
        System.out.println("array z: " + z[0] + " " + z[1] + " " + z[2] + " "); 

        zeroInt(i); 
        zeroArray(z); 

        System.out.println("int i: " + i); 
        System.out.println("array z: " + z[0] + " " + z[1] + " " + z[2] + " "); 
    }
}
```

Output: 
> int i: 1  
> array z: 1 2 3  
> int i: 1  
> array z: 0 0 0  

In the `zeroInt` method, an int parameter `val` is received. When `zeroInt(i)` is called, the value of `i`(which is 1) is passed to `val`. However, inside the `zeroInt` method, the value of `val` is set to 0. This change *does not affect the value of `i`* in the main method because **`val` is a separate variable with its own copy of the value**.

In the `zeroArray` method, an int[] parameter `arr` is received. When `zeroArray(z)` is called, the *reference* to the array `z` is passed to `arr`. Inside the zeroArray method, the *elements* of `arr` (which points to the same array as z) are **modified**, setting them to 0. This modification **affects the original array z because they refer to the same memory locations**.

## printf() 
An optional method to control, format and display text to the console window. 
printf() uses the java.util.Formatter class to format string and generate the output. 
It accept 2 arguments: 
    1. format string: a string that you would like to display to the console window 
    2. An object/variable/value 
We are able to format some value and place it at some position within the string via a format specifier, represented by a `%` sign. 

`%[flags][width][.precision]conversion-character  // [optional specifiers]`


Format Rules: 
1. Format specifiers includes flags, width, precision and conversion characters  
`%[flags][width][.precision]conversion-character  // [optional specifiers]`
2. Conversion Characters: required to determine how the argument is formatted
    - s: formats strings 
    - d: formats decimal int
    - f: formats floating-point numbers
    - t: formats date/time values
3. Optional Modifiers: 
    - [flags] defines the standard ways to modify the output; most common for formatting integers and floating-point numbers 
    - [width] specifies the field width for outputting the argument; represents the min no. of char written  to the output 
    - [.precision] specifies the number of digits of precision when outputting floating-point values. Can be used to define the length of a substring to extract from a String. 
3. Line Separator: `%n` specifier; automatically insert the host system’s native line separator 
4. Boolean Formatting: %b; if the input value is true, the output is true; false otherwise. 
    %B can be used for uppercase formatting 
5. String Formatting: `%s` 
    - ‘%S’ for uppercase formatting 
    - Specify min length: “‘%12s’”, “TestTest”
    - Left justify: “‘%-20s’”, “TestTest” 
    - Limit the number of char in output by specifying precision: “‘%2.2s’”, “TestTest” 
6. Char Formatting: %c 
7. Number Formatting: 
    - Integer: byte, short, int, long and bigInteger if we use %d 
    - “%d”, 10000L
    - Separator: , flag
        - Locale.US, “%,d %n”, 10000
        - Locale.ITALY, “%, d%n, 10000
    - Float: %f
        - Width of 5, precision of 2 dp: “‘%5.2f’”, 3.1415926
        - Scientific: “‘%5.2e’”, 3.1415926
8. Date and Time Formatting: %t
    a. Time: T: “%tT%n”, date
    - H, M, S are responsible for extracting the hours, minutes and seconds from the input Date object 
    “Hours %tH: minutes %tM: seconds %tS%n”, date, date, date 
    - L, N represent milliseconds and nanoseconds accordingly 
    - p: adds a.m p.m formatting (small letter only! )
    - Z prints out the time-zone offset 
    - Avoid multiple argument, use index reference to the input parameter: 
        “Hours %1$tH: minutes %1$tM: seconds %1$tS%n”, date
    b. Date: 
    - A: prints the full day of the week 
    - d: formats as a 2 digit day of the month 
    - B: full month name 
    - m: formats a 2-digits month 
    - Y outputs a year in 4-digits 
    - y: outputs the last 2-digits of the year 

    “%1$tA, %1$tB, %1$tY %n”, date 
    “%1$td, %1tm, %1$ty %n”, date
