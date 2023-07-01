# [Rust Programming Tutorial](https://www.youtube.com/watch?v=vOMJlQ5B-M0&list=PLVvjrrRCBy2JSHf9tGxGKJ-bYAN_uDCUL)

## Table of Contents

1. [Hello World](#1-hello-world)
2. [Hello World with Cargo](#2-hello-world-with-cargo)
3. [Comments](#3-comments)
4. [Variables](#4-variables)
5. [Variable Data Types](#5-variable-data-types)
    1. [Scalar Types](#scalar-types)
        1. [Integer Types](#integer-types)
        2. [Floating-Point Types](#floating-point-types)
        3. [Boolean Type](#boolean-type)
        4. [Character Type](#character-type)
    2. [Compound Types](#compound-types)
6. [If Else Statement](#6-if-else-statement)
    1. [Comparison Operators](#comparison-operators)
7. [Infinite Loop](#7-infinite-loop)
8. [While Loop](#8-while-loop)
9. [For Loop](#9-for-loop)
    1. [Looping over a Vector](#looping-over-a-vector)
        1. [Find the index while looping over a vector](#find-the-index-while-looping-over-a-vector)
10. [Enum](#10-enum)
11. [Constant](#11-constants)
12. [Tuple](#12-tuple)
    1. [Destructuring Assignment for Tuples](#destructuring-assignment-for-tuples)
13. [Functions](#13-functions)
14. [Code Blocks](#14-code-blocks)
15. [Shadowing](#15-shadowing)
16. [References](#16-references)
    1. [The Rules of References](#the-rules-of-references)
17. [Structs](#17-structs)
18. [Tuple Structs](#18-tuple-structs)
19. [Pass by Reference](#19-pass-by-reference) 
20. [Arrays](#20-arrays)
    1. [Array Types](#array-type)
21. [Impl Keyword (Implement)](#21-impl-keyword-implement)
22. [Strings](#22-strings)
    1. [Method for String](#methods-for-string)
23. [Implementing Traits](#23-implementing-traits)
24. [Vectors](#24-vectors)
25. [Read a File](#25-read-a-file)
26. [Command Line Arguments](#26-command-line-arguments)
27. [Write to a File](#27-write-to-a-file)
28. [Define Traits](#28-define-traits)
29. [Pattern Matching](#29-pattern-matching)
30. [Reading User Input](#30-reading-user-input)
31. [HashMap](#31-hashmap)
32. [Random Numbers](#32-random-numbers)
33. [String Methods](#33-string-methods)
34. [Multiple Source Files](#34-multiple-source-files)
35. [Regular Expressions](#35-regular-expressions)
36. [Modules (Mod keyword)](#36-modules-mod-keyword)
37. [Option (Enum)](#37-option-enum)
38. [HTTP GET Requests](#38-http-get-requests)
39. [Enum Methods](#39-enum-methods)
40. [Running / Executing Commands (CLI)](#40-running--executing-commands-cli)
41. [Writing and Running Tests](#41-writing-and-running-tests)
42. [Parsing JSON](#42-parsing-json2)

## 1. Hello World

Rust file extension is `.rs`. All rust programs begin with the main function. 

`main.rs`

```rust
fn main() {
    println!("Hello, world!"); // println! is a macro
}
```

To compile and run the program, use the `rustc` command

```bash
rustc main.rs
./main
```

To run the compiled program: 
```bash
./main
```

## 2. Hello World with Cargo

Cargo is the Rust package manager. It is used to build, run, and test Rust projects.

To create a new project, use the `cargo new` command

```bash
cargo new hello_world --bin # --bin flag creates a binary project, as opposed to a library project
```

This will create a new directory called `hello_world` with the following structure:

- hello_world
    - .git: a git repository
    - src: a directory that contains the source code
        - main.rs: the main source file, contains the main function
        ```rust
        fn main() {
            println!("Hello, world!");
        }
        ```

    - `.gitignore`: a file that contains files and directories that git should ignore
    - `Cargo.toml`:  a configuration file contains metadata about the project
        - `[package]` section contains metadata about the project
        - `[dependencies]` section contains the dependencies of the project

To build and run the project, use the `cargo run` command
    
```bash 
cd hello_world
cargo run
```

## 3. Comments 

```rust
// This is a single line comment
```

```rust
/* This is a 
    multi 
    line 
    comment */
```

## 4. Variables
Rust is a statically typed language, so the type of all variables must be known at compile time

```rust
let x = 5; // by default, variables are immutable, so the value and type cannot be changed 
let mut y = 5; // mutable variable, the value can be changed, but the type cannot be changed

x = 10 // invalid
y = 10 // valid
y = "hello" // invalid as the type cannot be changed
``` 

## 5. Variable Data Types 

### Scalar Types
A scalar type represents a single value. Rust has four primary scalar types: integers, floating-point numbers, Booleans, and characters.

#### Integer Types
An integer is a number without a fractional component. Rust has **signed** and **unsigned** integers. **Signed** integers can be **positive or negative**. **Unsigned** integers can only be **positive**.

| Length  | Signed | Unsigned | Range (Signed)                          | Range (Unsigned)                          | Java Equivalent                           |
| ------- | ------ | -------- | --------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| 8-bit   | `i8`   | `u8`     | 0 to 255                                | -128 to 127                               | `byte`                                    |
| 16-bit  | `i16`  | `u16`    | 0 to 65,535                             | -32,768 to 32,767                         | `short`                                   |
| 32-bit  | `i32`  | `u32`    | 0 to 4.294967295 billion                | -2.147 billion to 2.147 billion           | `int`                                     |
| 64-bit  | `i64`  | `u64`    | 0 to 18,446.74 billion                  | -9,223.37 billion to 9,223.37 billion     | `long`                                    |
| 128-bit | `i128` | `u128`   | 0 to 340,282.37 billion                 | -170,141.18 billion to 170,141.18 billion | `BigInteger`                              |

The default integer type is `i32`. The default integer type can be changed by adding a type annotation.

```rust
let x = 5; // i32
let x: u32 = 5; // u32
```

#### Floating-Point Types
Rust has two primitive floating-point types: `f32` and `f64`. The default floating-point type is `f64`.

| Length | Type  | Range                                               | Java Equivalent |
| ------ | ----- | --------------------------------------------------- | --------------- |
| 32-bit | `f32` | -3.40282347E+38 to 3.40282347E+38                   | `float`         |
| 64-bit | `f64` | -1.7976931348623157E+308 to 1.7976931348623157E+308 | `double`        |

```rust
let x = 2.0; // f64
let y: f32 = 3.0; // f32
```

#### Boolean Type
A Boolean type represents a logical value. It can either be `true` or `false`. The length of a Boolean type is 1 byte (8 bits).

```rust
let x = true;
let y: bool = false;
```

#### Character Type
A character type represents a Unicode Scalar Value. The length of a character type is 4 bytes (32 bits). Characters are specified with single quotes.

```rust
let x = 'x';
let y: char = 'y';
```

### Compound Types
Compound types can group multiple values into one type. Rust has two primitive compound types: tuples and arrays. 


## 6. If Else Statement
The `if` statement is used to execute code if a condition is true. The `else` statement is used to execute code if a condition is false. The `else if` statement is used to execute code if multiple conditions are true. The `if` statement can be used as an expression. The `if` statement can be used without an `else` statement.

```rust
fn main(){
    let x = 5;

    if x == 5 {
        println!("x is 5");
    } else {
        println!("x is not 5");
    }
}
```

Output:
> x is 5  

### Comparison Operators 

| Operator | Description |
| -------- | ----------- |
| `==`     | equal to    |
| `!=`     | not equal to|
| `>`      | greater than|
| `>=`     | greater than or equal to|
| `<`      | less than   |
| `<=`     | less than or equal to|


## 7. Infinite Loop
An infinite loop is a loop that runs forever. To create an infinite loop, use the `loop` keyword. To stop an infinite loop, use the `break` keyword. To skip the rest of the iteration and start a new one, use the `continue` keyword.

```rust
fn main(){
    let mut n = 0; // mut n: i32, by default, variables are immutable, so we need to add the mut keyword to make it mutable

    loop {
        // everything in here will be executed forever until the loop is explicitly stopped

        n+=1;

        if n == 5 {
            continue; // skip the rest of the iteration and start a new one, so "Hello, world!: 5" will not be printed
        }   

        println!("Hello, world!: {}", n); // print "Hello, world!: 1", "Hello, world!: 2", "Hello, world!: 3", ...

        if n == 10 {
            break; // stop the loop
        }
    }
}
```

Output:
> Hello, world!: 1  
> Hello, world!: 2  
> Hello, world!: 3  
> Hello, world!: 4  
> Hello, world!: 6  
> Hello, world!: 7  
> Hello, world!: 8  
> Hello, world!: 9  
> Hello, world!: 10  


## 8. While Loop
A while loop is a loop that runs while a condition is true. To create a while loop, use the `while` keyword. To stop a while loop, use the `break` keyword. To skip the rest of the iteration and start a new one, use the `continue` keyword.

```rust
fn main(){
    let mut n = 0;

    while n < 10 {
        // everything in here will be executed while n < 10

        n+=1; 

        if n == 5 {
            continue; // skip the rest of the iteration and start a new one, so "Hello, world!: 5" will not be printed
        }   

        println!("Hello, world!: {}", n);  // print "Hello, world!: 1", "Hello, world!: 2", "Hello, world!: 3", ...

        if n == 10 {
            break; // stop the loop
        }
    }
}
```

Output:
> Hello, world!: 1  
> Hello, world!: 2  
> Hello, world!: 3  
> Hello, world!: 4  
> Hello, world!: 6  
> Hello, world!: 7  
> Hello, world!: 8  
> Hello, world!: 9  
> Hello, world!: 10  

## 9. For Loop 
In rust, all for loops in rust are for-each loops, all for loops must use an iterator. An iterator is a trait that allows you to iterate over a sequence of values. To create a for loop, use the `for` keyword. To stop a for loop, use the `break` keyword. To skip the rest of the iteration and start a new one, use the `continue` keyword.

```rust
fn main(){
    for i in 1..11{ // 1..11 is an iterator that produces the values 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        if i % 3 == 0 {
            continue; // skip the rest of the iteration and start a new one, so "The number is 3" will not be printed
        }
        println!("The number is {}", i);
    }

    let numbers = 30..41; // 30..41 is an iterator that produces the values 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, ..., 40
    // number is of type Range<i32>, which is a struct that implements the Iterator trait

    for i in numbers {
        println!("The number is {}", i);
    }

}
```

Output:
> The number is 1  
> The number is 2  
> The number is 4  
> The number is 5  
> The number is 7  
> The number is 8  
> The number is 10  
> The number is 11  
> The number is 13  
> ...  
> The number is 39  
> The number is 40  

### Looping over a Vector
A vector is a growable array of type `Vec<T>`. 

```rust
fn main(){
    let animals = vec!["Rabbit", "Dog", "Cat", "Bird", "Fish"];

    for animal in animals.iter() { // iter() returns an iterator that produces the values of the vector, this will prevent the ownership of the vector from being moved into the for loop
        println!("The animal is {}", animal);
    }
}
```

Output:
> The animal is Rabbit  
> The animal is Dog  
> The animal is Cat  
> The animal is Bird  
> The animal is Fish  

A negative example of not using `iter()`:

```rust
fn main(){
    let animals = vec!["Rabbit", "Dog", "Cat", "Bird", "Fish"];

    for animal in animals{
        println!("The animal is {}", animal);
    }

    println!("{:?}", animals); // this will cause an error because the ownership of the vector has been moved into the for loop
}
```

#### Find the index while looping over a vector
```rust
fn main(){
    let animals = vec!["Rabbit", "Dog", "Cat", "Bird", "Fish"];

    for (index, animal) in animals.iter().enumerate() { // enumerate() returns an iterator that produces the values of the vector and their indices
        // (index, animal) is a tuple
        println!("The animal is {} and its index is {}", animal, index);
    }
}
```

Output:
> The animal is Rabbit and its index is 0  
> The animal is Dog and its index is 1  
> The animal is Cat and its index is 2  
> The animal is Bird and its index is 3  
> The animal is Fish and its index is 4  

## 10. Enum 
An enum is a type that can have a fixed set of values. To create an enum, use the `enum` keyword. To create a value of an enum, use the `::` operator. To use an enum, use the `match` keyword.

```rust
enum Direction {
    Up,
    Down,
    Left,
    Right
}

fn main(){
    let player_direction:Direction = Direction::Up; // player_direction is of type Direction

    match player_direction { // match is used to match the value of player_direction to the value of the enum, it is like a switch statement in other languages
        Direction::Up => println!("We are heading up!"),
        Direction::Down => println!("We are heading down!"),
        Direction::Left => println!("We are heading left!"),
        Direction::Right => println!("We are heading right!")
    }
}
```

Output:
> We are heading up!  

### Enum with values
An enum can also have values. To create an enum with values, use the `enum` keyword. The values of an enum can be of any type. All values of an enum must be of the same type. Commonly, the values of an enum are of type `u32` or `String`. ??? 

```rust
enum Direction {
    Up(u32),
    Down(u32),
    Left(u32),
    Right(u32)
}

fn main(){
    let player_direction:Direction = Direction::Up(1); // player_direction is of type Direction

    match player_direction { // match is used to match the value of player_direction to the value of the enum, it is like a switch statement in other languages
        Direction::Up(n) => println!("We are heading up by {}!", n),
        Direction::Down(n) => println!("We are heading down by {}!", n),
        Direction::Left(n) => println!("We are heading left by {}!", n),
        Direction::Right(n) => println!("We are heading right by {}!", n)
    }
}
```

## 11. Constants
A constant is a value declared at global scope that cannot be changed. To create a constant, use the `const` keyword. To use a constant, use the `::` operator.

```rust
// constant is declared at global scope
// constant variable name must be all uppercase, with _ as the word separator
const MAXIMUM_NUMBER:u8 = 5; // MAXIMUM_NUMBER is of type u8, we must specify the type of the constant

fn main(){
    println!("The maximum number is {}", MAXIMUM_NUMBER);

    for n in 1..MAXIMUM_NUMBER {
        println!("The number is {}", n);
    }
}
```

Output:
> The maximum number is 5  
> The number is 1  
> The number is 2  
> The number is 3
> The number is 4

## 12. Tuple
A tuple is a collection of values of different types. Tuples have a fixed length. Once declared, the length of a tuple cannot be changed. Tuples are specified with parentheses. The type of a tuple is `(T1, T2, ..., Tn)`, where `T1`, `T2`, ..., `Tn` are the types of the elements of the tuple. Tuple can have at most 12 elements of different types. Tuples are primarily used when you want to return multiple values from a function. 

```rust
let x = (1, "hello", true);
let y: (i32, &str, bool) = (1, "hello", true);
```

To access the elements of a tuple, use the dot notation.

```rust
let x = (1, "hello", true);
let y: (i32, &str, bool) = (1, "hello", true);

let a = x.0; // 1
let b = x.1; // "hello"
let c = x.2; // true
let d = y.0; // 1
let e = y.1; // "hello"
let f = y.2; // true
```
A tuple can have at most 12 elements. To have more than 12 elements, use nested tuples.

```rust
let x = (1, "hello", true, (2, "world", false));
let y: (i32, &str, bool, (i32, &str, bool)) = (1, "hello", true, (2, "world", false));

// to access the nested elements, use the dot notation with parentheses
let a = (y.3).0; // 2

println!("{}", a);
```

Output: 
> 2

### Destructuring Assignment for Tuples
You can use destructuring assignment to assign the elements of a tuple to variables / declare variables from the elements of a tuple.

```rust
fn main() {
    let x = (1, "hello", true);
    let (a, b, c) = x;
    println!("a = {}, b = {}, c = {}", a, b, c);
}
```

Output:
> a = 1, b = hello, c = true  



## 13. Functions
A function is a block of code that can be called. To create a function, use the `fn` keyword. To call a function, use the `()` operator. To return a value from a function, use the `return` keyword.

```rust
fn main(){
    println!("Hello World!");
    print_number_to(5);
    print_sum(5, 6);
    let sum = add_one(5);
    println!("The sum is {}", sum);
}

fn print_number_to(x:i32){ // x is of type i32
    for n in 1..x {
        println!("The number is {}", n);
    }
}

fn print_sum(x:i32, y:i32){ // x and y are of type i32
    println!("The sum is {}", x + y);
}

fn add_one(x:i32) -> i32 { // x is of type i32, the function returns a value of type i32
    return x + 1;
}

fn is_even(x:i32) -> bool { // x is of type i32, the function returns a value of type bool
    return x % 2 == 0;
}
```

Output:
> Hello World!  
> The number is 1  
> The number is 2  
> The number is 3  
> The number is 4   
> The sum is 11     
> The sum is 6  

## 14. Code Blocks
A code block is a block of code that can be called. To create a code block, use the `{}` operator. To call a code block, use the `()` operator. To return a value from a code block, use the `return` keyword.

```rust
fn main(){
    // code block can access variables declared outside of the code block, but not vice versa
    let x = 10; 
    {
        // code block is isolated 
        let y = 5;

        println!("The value of x is {}", x);
        println!("The value of y is {}", y);
    }

    println!("The value of x is {}", x);
    println!("The value of y is {}", y); // this will cause an error because y is not declared in this scope
}
```

Output:
> The value of x is 10  
> The value of y is 5  

## 15. Shadowing
Shadowing is the process of re-declaring a variable. To shadow a variable, use the `let` keyword. 

- Without `let` keyword in the code block: 
    ```rust
    fn main(){
        let mut x = 10; // x is of type i32

        {
            x = 15; 
        }

        println!("The value of x is {}", x); // the value of x is now 15

    }
    ```

    - Output:
    > The value of x is 15

- With `let` keyword and shadowing 
    ```rust
    fn main(){
        let x = 10; 

        {
            let x = 15;  // x=15 shadows x=10, and x=15 is only valid in this scope
        }

        println!("The value of x is {}", x); // the value of x is still 10
    }
    ```

    - Output:
    > The value of x is 10

- Shadowing can even change the type of the variable 
    ```rust
    fn main(){
        let x = 10; // x is of type i32

        {
            let x = "Hello World!"; // x is of type &str
        }

        println!("The value of x is {}", x); // the value of x is still 10

    }
    ```

    - Output:
    > The value of x is 10  


## 16. References
A reference is a pointer to a variable. 

- To create a reference, use the `&` operator. 
- To dereference a reference, use the `*` operator. 

It is important to note that a reference is immutable by default. 

- To make a reference mutable, use the `mut` keyword. 

It is a way to pass a variable to a function without moving the variable. 

```rust
fn main(){
    let mut x = 10; 
    let xr = &x; // xr is a reference to x, xr is of type &i32; it is a immutable reference to x
    let xr_2 = &x; // xr_2 is another reference to x, xr_2 is of type &i32 as well; it is a immutable reference to x

    println!("The value of x is {}", xr); // the value of x is 10
    println!("The value of x is {}", xr_2); // the value of x is 10

    { // this must be a code block because we cannot have two mutable references to the same variable in the same scope 
        let xr_3 = &mut x; // xr_3 is a mutable reference to x, xr_3 is of type &mut i32; it is a mutable reference to x, we can change the value of x through xr_3
        *xr_3 = 15; // we can change the value of x through xr_3
    }
    println!("The value of x is {}", xr_3); // the value of x is 15
    println!("The value of x is {}", x); // the value of x is 15, it is borrowing the value of x from xr_3???


}
```
### The Rules of References
- At any given time, you can have either one mutable reference or any number of immutable references, but not both at the same time.
- Any borrow must last for a scope no greater than that of the owner. This is because when the owner goes out of scope, the value will be dropped. 
- You can have one or the other of these two kinds of references, but not both at the same time:
    - One or more references (`&T`) to a resource.
    - Exactly one mutable reference (`&mut T`).


## 17. Structs
`Struct` is a custom data type that allows you to group named fields of different types into a single type. To create a struct, use the `struct` keyword. To access a field of a struct, use the `.` operator. To create an instance of a struct, use the `struct_name { field_name: value, ... }` syntax. 

Note: The `struct` keyword is used to create a struct, and the `struct_name { field_name: value, ... }` syntax is used to create an instance of a struct. Also, when defining or instantiating a struct, the fields must be separated by commas. 

```rust
struct Color{
    red: u8, // u8: unsigned 8-bit integer, 0 - 255 
    green: u8,
    blue: u8,
}

fn main(){
    let background = Color{red: 255, green: 70, blue: 0}; // background is an instance of Color 
    println!("The background color is RGB({}, {}, {})", background.red, background.green, background.blue); // The background color is RGB(255, 70, 0)
    // we use the . operator to access the fields of background 

    let mut foreground = Color{red: 0, green: 0, blue: 0}; // foreground is an instance of Color
    foreground.red = 255; // we can change the value of foreground.red because foreground is mutable
    println!("The foreground color is RGB({}, {}, {})", foreground.red, foreground.green, foreground.blue); // The foreground color is RGB(255, 0, 0)
}
```

## 18. Tuple Structs
Tuple structs are structs that do not have named fields. To create a tuple struct, use the `struct_name(value, ...)` syntax. To access a field of a tuple struct, use the `.` operator. 

```rust
struct Color(u8, u8, u8); // Color is a tuple struct, it has three fields of type u8, but has no names

fn main{
    let red = Color(255, 0, 0); // red is an instance of Color
    println!("The red color is RGB({}, {}, {})", red.0, red.1, red.2); // The red color is RGB(255, 0, 0)
}
``` 

Output:
> The red color is RGB(255, 0, 0)

### 19. Pass by Reference  
When passing a struct to a function, the struct is moved to the function. To keep the variable within the scope, we need to pass by reference. To pass a struct by reference, use the `&` operator. 

```rust
struct Color{
    red: u8, // u8: unsigned 8-bit integer, 0 - 255 
    green: u8,
    blue: u8,
}

fn main(){
    let blue = Color{red: 0, green: 0, blue: 255}; // blue is an instance of Color
    print_color(&blue); // we pass a reference to blue to the print_color function
}

fn print_color(color: &Color){ // color is a reference to a Color struct
    println!("The color is RGB({}, {}, {})", color.red, color.green, color.blue); // The color is RGB(0, 0, 255)
}
```

Output:
> The color is RGB(0, 0, 255) 

Pass without reference:
```rust
struct Color{
    red: u8, // u8: unsigned 8-bit integer, 0 - 255 
    green: u8,
    blue: u8,
}

fn main(){
    let blue = Color{red: 0, green: 0, blue: 255}; // blue is an instance of Color
    print_color(blue); // we pass the blue struct to the print_color function

    print_color(blue); // when we try to use blue again, we get an error because blue has been moved to the print_color function
}

fn print_color(color: Color){
    println!("The color is RGB({}, {}, {})", color.red, color.green, color.blue); // The color is RGB(0, 0, 255)
}
```

## 20. Arrays
A sequence of elements of the same type. To create an array, use the `[value, ...]` syntax. To access an element of an array, use the `[index]` syntax. 

```rust
fn main(){
    let numbers = [1, 2, 3, 4, 5]; // numbers is an array of type i32

    // access the first element of the array
    println!("The first number is {}", numbers[0]); // The first number is 1

    // loop through the array
    for n in numbers.iter(){
        println!("The number is {}", n); // The number is 1, The number is 2, The number is 3, The number is 4, The number is 5
    }

    // loop through the array with index
    for i in 0..numbers.len(){
        println!("The number is {}", numbers[i]); // The number is 1, The number is 2, The number is 3, The number is 4, The number is 5
    }

    // specify the type of the array
    let characters: [char; 5] = ['a', 'b', 'c', 'd', 'e']; // characters is an array of type char
    println!("The first character is {}", characters[0]); // The first character is a
}
```

Output:
> The first number is 1  
> The number is 1  
> The number is 2  
> The number is 3  
> The number is 4  
> The number is 5  
> The number is 1  
> The number is 2  
> The number is 3  
> The number is 4  
> The number is 5  
> The first character is a  

### Array Type
An array is a collection of values of the same type. Arrays have a fixed length. Once declared, the length of an array cannot be changed. Arrays are specified with square brackets. All elements of an array must have the same type. The default array type is `[T; N]`, where `T` is the type of the elements and `N` is the length of the array. Arrays are mutable by default. To make an array immutable, use the `const` keyword. Arrays are placed on the stack.

```rust
let x = [1, 2, 3];
let y: [i32; 3] = [1, 2, 3];
```

To access the elements of an array, use the index notation.

```rust
let x = [1, 2, 3];
let y: [i32; 3] = [1, 2, 3];

let a = x[0]; // 1
let b = x[1]; // 2
let c = x[2]; // 3
let d = y[0]; // 1
let e = y[1]; // 2
let f = y[2]; // 3
```

## 21. Impl Keyword (Implement)
The `impl` keyword is used to implement methods for a struct. This makes it possible to call methods on a struct, and more like an object. 

**note: the last expression in a function is returned by default and has no semicolon at the end**

```rust 
struct Rectangle{
    width: u32,
    height: u32,
}

impl Rectangle{ // we use the impl keyword to implement methods for the Rectangle struct
    fn area(&self) -> u32{ // we use the &self parameter to pass a reference to the struct, so that we can access the fields of the struct
        self.width * self.height // we use the . operator to access the fields of the struct
        // return self.width * self.height; // we can also use the return keyword
        // note: the last expression in a function is returned by default and has no semicolon at the end
    }

    fn describe(&self){
        println!("The rectangle has a width of {} and a height of {}", self.width, self.height);
    }

    fn is_square(&self) -> bool{
        self.width == self.height
    }
}

fn main(){
    let rect = Rectangle{width: 10, height: 20}; // rect is an instance of Rectangle
    println!("The area of the rectangle is {}", rect.area()); // The area of the rectangle is 200
    rect.describe(); // The rectangle has a width of 10 and a height of 20

    if rect.is_square(){
        println!("The rectangle is a square");
    }else{
        println!("The rectangle is not a square");
    }
}
```

Output:
> The area of the rectangle is 200  
> The rectangle has a width of 10 and a height of 20  
> The rectangle is not a square  

## 22. Strings 
Strings are a sequence of characters. There are 2 kinds of strings in Rust: `String` and `&str`. `String` is a growable, heap-allocated data structure. `&str` is a string slice, which is a reference to a string. 

### Methods for `String`
- To create a string, use the `String::from()` function.
- To access a character of a string, use the `[index]` syntax. 
- To get the length of a string, use the `.len()` method. 
- To get the capacity of a string, use the `.capacity()` method. 
- To check if a string is empty, use the `.is_empty()` method. 
- To check if a string contains a substring, use the `.contains()` method. 
- To replace a substring in a string, use the `.replace()` method. 
- To split a string into a vector, use the `.split()` method. 
- To split a string into a vector by whitespace, use the `.split_whitespace()` method. 
- To loop through the characters of a string, use the `.chars()` method. 
- To loop through the words of a string, use the `.words()` method. 
- To loop through the lines of a string, use the `.lines()` method. 
- To concatenate two strings, use the `+` operator. 

```rust
fn main(){
    let my_string = String::from("Hello World"); // my_string is a String

    // access the first character of the string
    println!("The first character is {}", my_string[0]); // The first character is H

    // get the length of the string
    println!("The length of the string is {}", my_string.len()); // The length of the string is 11

    // if the string is empty
    println!("The string is empty: {}", my_string.is_empty()); // The string is empty: false

    for token in my_string.split_whitespace(){ // split the string into a vector by whitespace, and loop through the vector
        println!("{}", token); // Hello, World
    }

    // if the string contains a substring
    println!("The string contains 'World': {}", my_string.contains("World")); // The string contains 'World': true

    // replace a substring in a string
    println!("Replace 'World' with 'There': {}", my_string.replace("World", "There")); // Replace 'World' with 'There': Hello There

    // Append to a string
    my_string.push_str("!!!"); // Hello World!!!

    println!("{}", my_string); // Hello World!!!
}
```

Output:
> The first character is H  
> The length of the string is 11  
> The string is empty: false  
> Hello  
> World  
> The string contains 'World': true  
> Replace 'World' with 'There': Hello There  
> Hello World!!!  

## 23. Implementing Traits
Similar to interfaces in other languages, traits are used to define shared behavior in an abstract way. 
- Traits are similar to structs, but they cannot have fields. 

```rust
struct Person{
    name: String, 
    age: u8
}

impl ToString for Person{ // we use the impl keyword to implement the ToString trait for the Person struct
    fn to_string(&self)->String{
        return format!("My name is {} and I am {} years old", self.name, self.age);
    }
}

fn main(){
    let person = Person{name: String::from("John"), age: 20};
    println!("{}", person.to_string()); // My name is John and I am 20 years old
}
```

### VS Impl Keyword
- The `impl` keyword is used to implement methods for a struct.
- The `impl` keyword is also used to implement traits for a struct. 

## 24. Vectors 
Vectors are growable arrays. It is possible to create a vector with a fixed size, but it is more common to use a vector with a dynamic size. It is like a list in Python, or an ArrayList in Java. 

- To access an element of a vector, use the `[index]` syntax.  
- To loop through the elements of a vector, use the `.iter()` method. 
- To add an element to the end of a vector, use the `.push()` method.   
- To remove an element from a vector, use the `.remove(index)` method.  


```rust 
fn main(){

    // create a vector with a fixed size
    let fixed_vector: Vec<i32> = Vec::with_capacity(10); // fixed_vector is a vector of i32 with a capacity of 10
    println!("{:?}", fixed_vector); // []

    // create a vector with a dynamic size, using the vec! macro, which is similar to the vec() function in Python  
    let mut my_vector = vec![1, 2, 3, 4, 5]; // my_vector is a vector of i32
    my_vector.push(6); // add 6 to the end of the vector
    my_vector.remove(0); // remove the first element of the vector
    println!("{:?}", my_vector); // [2, 3, 4, 5, 6] 

    for i in my_vector.iter(){ // loop through the vector
        println!("{}", i); // 2, 3, 4, 5, 6
    }

    for i in 0..my_vector.len(){ // loop through the vector
        println!("element {} is {}",i,  my_vector[i]); // element 0 is 2, element 1 is 3, element 2 is 4, element 3 is 5, element 4 is 6
    }
}
```

Output:
> [] 
> [2, 3, 4, 5, 6]   
> 2  
> 3  
> 4     
> 5     
> 6 
> element 0 is 2    
> element 1 is 3    
> element 2 is 4    
> element 3 is 5    
> element 4 is 6       


## 25. Read a File 

```rust
use std::fs::File; // import the File struct from the fs module 
use std::io::prelude::*; // import the prelude module from the io module, which contains the Read trait, allowing us to read from a file

fn main(){
    let mut file = File::open("info.txt").expect("Could not open file"); // open the file, and return an error if it does not exist 
    let mut contents = String::new(); // create a new empty string to store the contents of the file 

    file.read_to_string(&mut contents).expect("Could not read file"); // read the file, and return an error if it cannot be read
        // the read_to_string method takes a mutable reference to a string as an argument, and returns a Result object
        // the Result object contains either the contents of the file, or an error message
        // contents is a mutable reference to a string, so we can modify it without taking ownership of it 
    
    println!("File contents:\n\n{}", contents); // print the contents of the file
}
```

Alternatively, we can use the `fs::read_to_string()` function to read the contents of a file into a string. 

```rust
use std::fs; // import the fs module

fn main(){
    let contents = fs::read_to_string("info.txt").expect("Could not read file"); // read the contents of the file into a string, and return an error if it cannot be read
    // contents is of type String, so we take ownership of it
    println!("File contents:\n\n{}", contents); // print the contents of the file
}
```

## 26. Command Line Arguments 

```rust
use std::env; // import the env module 

fn main(){
    // create a vector of command line arguments 

    let args: Vec<String> = env::args().collect(); // args is a vector of String

    for arg in args.iter(){ // loop through the vector
        println!("{}", arg); // print each argument
    }
}
```

If no arguments are passed to the program, the first argument will be the path to the executable. 

Output:
> ./main 

## 27. Write to a File 

```rust
use std::fs::File; // import the File struct from the fs module
use std::io::prelude::*; // import the prelude module from the io module, which contains the Write trait, allowing us to write to a file

fn main(){
    let mut file = File::create("info.txt").expect("Could not create file"); // create a new file, and return an error if it cannot be created
    file.write_all(b"Welcome to Rust!").expect("Could not write to file"); // write to the file, and return an error if it cannot be written to
        // the write_all method takes a byte string as an argument, and returns a Result object
        // the Result object contains either the number of bytes written, or an error message
}
```

Alternatively, we can use the `fs::write()` function to write to a file. 

```rust
use std::fs; // import the fs module

fn main(){
    fs::write("info.txt", "Welcome to Rust!").expect("Could not write to file"); // write to the file, and return an error if it cannot be written to
}
```

## 28. Define Traits 
A set of methods that a type must implement in order to be able to use the trait. Traits are similar to interfaces in other languages. They are used to define shared behavior in an abstract way. 

```rust
struct Person{
    name: String, 
    age: u8
}

trait HasVoiceBox{ // define a trait called HasVoiceBox
    fn speak(&self); // define a method called speak, which takes a reference to self as an argument
    fn can_speak(&self)->bool; // define a method called can_speak, which takes a reference to self as an argument, and returns a boolean
}

impl HasVoiceBox for Person{ // implement the HasVoiceBox trait for the Person struct
    fn speak(&self){ // define the speak method
        println!("Hello, my name is {}", self.name); // print the name of the person
    }

    fn can_speak(&self)->bool{ // define the can_speak method
        if self.age > 0{ // if the person is older than 0
            return true; // return true
        } else { // otherwise
            return false; // return false
        }
    }
}

fn main(){
    let person = Person{name: String::from("Bob"), age: 41}; // create a new Person object
    person.speak(); // call the speak method
    println!("Can {} speak? {}", person.name, person.can_speak()); // call the can_speak method
}
```

Output:
> Hello, my name is Bob  
> Can Bob speak? true   

## 29. Pattern Matching 
- Pattern matching is a way to compare a value against a series of patterns and then execute code based on which pattern matches.
- Equivalent to the switch statement in other languages. 
- Each pattern is checked in order, and the first matching pattern is used.

```rust
fn main(){
    let number = 2; 

    match number {
        1 => println!("It is one"), // if number is 1, print "It is one" 
        2 => println!("It is two"), // if number is 2, print "It is two"
        3 => println!("It is three"), // if number is 3, print "It is three"

        // we can also match multiple patterns 
        10 | 11 => println!("It is either 10 or 11"), // if number is 10 or 11, print "It is either 10 or 11" 

        // we can also use a range of values
        12..=19 => println!("It is between 12 and 19"), // if number is between 12 and 19, print "It is between 12 and 19"
        12..20 => println!("It is between 12 and 19"), // if number is between 12 and 19, print "It is between 12 and 19" 

        _ => println!("It is some other number"), // if number is anything else, print "It is some other number", default case 
    }
}
```

## 30. [Reading User Input](https://www.youtube.com/watch?v=07pDD0uLjYc)

```rust
use std::io; 

fn main(){
    let mut input = String::new(); 
    println!("Please enter your name" ); 

    // use the 
    match io::stdin().read_line(&mut input){ // returns success or failure 
        Ok(_) => {
            println!("Success! Hello {}", input); 
        }, 
        Err(e) => {
            println!("Something went wrong: {}", e); 
        }
    }
}
```

In the line `match io::stdin().read_line(&mut input)`, we pass &`mut` input as a *mutable reference* to the `read_line` function because the function needs to modify the String variable input in order to store the user's input.

In Rust, function arguments are **passed by value by default**. When you pass a value as an argument to a function, a *copy* of that value is made, and **any modifications made to the value inside the function do not affect the original value**. This is known as "moving" the value.

However, in this case, we want the `read_line` function to modify the input variable directly rather than making a copy. By passing &mut input as a mutable reference, we allow the function to directly access and modify the original String value.

The `&mut` syntax indicates that we are passing a mutable reference. It allows the function to have *mutable access* to the data referenced by input and modify it if needed. In this case, the `read_line` function appends the user's input to the input string, changing its content.

If we were to pass input directly without the &mut reference, it would result in a compile-time error because the read_line function expects a mutable reference. By using &mut, we are explicitly indicating our intent to allow the function to modify the variable.

## 31. [HashMap]
```rust
use std::collections::HashMap; 

fn main(){
    let mut marks = HashMap::new(); 
    
    // add values 
    marks.insert("Rust", 96); 
    marks.insert("Java", 96); 
    marks.insert("C++", 90); 
    marks.insert("Fortran", 20); 

    // find the length of a HashMap 
    println!("{}", marks.len()); 

    // find the value based on a key 
    // we are using match here because there are 2 scenarios here 
    match marks.get("Java"){
        Some(mark) => println!("You got {} for Java!", mark), 
        None => println! ("You did not study Java")
    }

    // remove a value 
    marks.remove("C++"); 

    // loop through hashmap 
    for (key, value) in &marks{
        println!("For {} you got {}!", key, value)
    }

    // check if a key exist in a HashMap 

    if marks.contains_key("Rust") {
        println!("Yes, you have studied Rust before");
    } else {
        println!("Nope, you did not study Rust before");
    }
}
```

## 32. Random Numbers
`Cargo.toml`
```toml
...
[dependencies]
rand = "0.3" 
```
`main.rs`
```rust
extern crate rand; // use the random crates listed in the dependencies 
use rand::Rng; // use the thread RNG method 

fn man(){
    let random_number = rand::thread_rng().gen_range(1, 11) // (min, max+1) 
    println!("Random Number: {}", random_number); 

    // weighted boolean 
    let random_boolean = rand::thread_rng().gen_weighted_bool(2); // n, chance being true, 1 in n chance 
    println!("Random Boolean: {}", random_boolean); 
}
```

## 33. String Methods

```rust
fn main(){
    {
        /*Replace*/
        let my_string = String::from("Rust is fantastic!"); 
        println!("After replace: {}", my_string.replace("fantastic", "great")); 
        /*
        Although the String itself is not mutable by default, the replace method creates a new String instance with the modified content, leaving the original String unchanged.
        */
    }
    {
        /*Lines*/
        // Split the string into an iterator 
        let my_string = Sting::from("The weather is \n nice \n outside mate! "); 
        
        for line in my_string.lines(){
            println!("[{}]", line); 
        }
    }
    {
        /*Split*/ 
        // Split the string by a delimiter 
        let my_string = String::from("Apple+Pear+Banana"); 
        let tokens: Vec<&str> = my_string.split("+").collect(); // split() returns an iterator, we need collect() to convert it into a vector 
        println!("my_string: {}", my_string);
        println!("At index = 2: {}", tokens[2]); 
    }
    {
        /*Trim*/ 
        let my_string = String::from("    test123   \n\r "); 
        println!("Before trim: {}", my_string); 
        println!("After trim: {}", my_string.trim()); 
    }
    {
        /* Chars */ 
        // Access the char in a string by index 
        let my_string = String::from("decode on Youtube"); 

        // other language: my_string[4]; 
        match my_strings.chars().nth(4){ // get the index 4 element 
        // there are 2 options 
            Some(c) => println!("Character at index 4: {}", c), 
            None => println!("No character at index 4")
        }
    }
}
```

Output: 
> After replace: Rust is great!  
> [The weather is ]  
> [ nice ]  
> [ outside mate! ]  
> my_string: Apple+Pear+Banana  
> At index = 2: Banana  
> Before trim:     test123   
>   
> After trim: test123  
> Character at index 4: d  

## 34. Multiple Source Files 
### Directory Structure: 

- `src`: all the rust source files 
    - `decode.rs` 
    - `main.rs` 

`decode.rs` 
```rust 
pub fn print_message(){
    println!("How's it going? ")
}
```
By default, function in a module is private, aka it can only be assessed by the module itself. 

To give access permission to the `main.rs`, we need to use `pub` before `fn` to make the function public.  
`main.rs`
```rust
mod decode; 

fn main(){
    decode::print_message(); 
}
```

Output: 
> How's it going? 

## 35. Regular Expressions 
`Cargo.toml`
```toml 
...
[dependencies]
regex = "0.2" 
```
`main.rs` 
```rust 
extern crate regex; 
use regex::Regex; 

fn main(){
    let re = Regex::new(r"\w{5}").unwrap(); // a raw string that will match a 5 letter word
    let text = "decode"; 

    println!("Found match? {}", re.is_match(text)); 
}
```

Output: 
> Found match? true

### Get the matched text with Captures 
```rust 
extern crate regex; 
use regex::Regex; 

fn main(){
    let re = Regex::new(r"(\w{5})").unwrap(); // a raw string that will match a 5 letter word
    let text = "decod"; 

    match re.captures(text){ // it will return an Option 
        Some(caps) => println!("Found Match:{}", caps.get(0).unwrap().as_str()), 
        None => println!("No match was found")
    }
}
```

## 36. Modules (mod keyword) 
To define a module, use `mod` keyword

```rust
mod decode{
    pub fn print_message(){
        // by default, all fns are private in a module
        // we need pub keyword to give it public visibility 
        println!("How's it going!"); 
        private_function(); 
        // we are able to indirectly call the private function through public function of the same module 
    }
    fn private_function(){
        println!("This is a private function that cannot be called directly from other modules."); 
    }

    pub mod water{
        pub fn print_message(){
            println!("I am water!" ); 
        }
    } 
}

fn main(){
    decode::print_message(); 
    decode::water::print_message(); 
}
```

Output: 
> How's it going!  
> This is a private function that cannot be called directly from other modules.  
> I am water!  

## 37. Option (Enum)
An option represents either a value or no value at all. Many methods in rust return this type, forcing the programmers to deal with the scenarios when sometimes no values are get. 

```rust 
fn main(){
    let name = String::from("ABCDE"); 

    println!("Char at index 8: {}", match name.chars().nth(8){ // will return an option 
        Some(c) => c.to_string(), // when a char is found, the char itself as a string
        None => "No char at index 8!".to_string() // if no char are found at index 8 
    });  
}
```
### Define a function that will return an option 

```rust
fn get_occupation(name:&str)-> Option<&str>{ //Option is of type String, when some is returned 
    match name {
        "Dominic" => Some("Software Developer"), 
        "Michael" => Some("Dentist"), 
        _ => None
    }
}

fn main(){
    println!("Occupation is {}", match get_occupation("Dominic"){
        Some(occupation) => occupation, 
        None => "No occupation found"
    }); 
}
```

## 38. HTTP GET Requests

## 39. Enum Methods 

## 40. Running / Executing Commands (CLI)

## 41. Writing and Running Tests 

## 42. Parsing JSON 

