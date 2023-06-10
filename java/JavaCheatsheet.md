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

