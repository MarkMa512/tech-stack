# Java Cheat Sheet 

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
