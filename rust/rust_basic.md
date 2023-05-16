# [Rust Programming Tutorial](https://www.youtube.com/watch?v=vOMJlQ5B-M0&list=PLVvjrrRCBy2JSHf9tGxGKJ-bYAN_uDCUL)

## Hello World

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

## Hello World with Cargo

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

    - .gitignore: a file that contains files and directories that git should ignore
    - Cargo.toml:  a configuration file contains metadata about the project
        - `[package]` section contains metadata about the project
        - `[dependencies]` section contains the dependencies of the project

To build and run the project, use the `cargo run` command
    
```bash 
cd hello_world
cargo run
```

## Comments 

```rust
// This is a single line comment
```

```rust
/* This is a 
    multi 
    line 
    comment */
```

## Variables
Rust is a statically typed language, so the type of all variables must be known at compile time

```rust
let x = 5; // immutable variable, the value and type cannot be changed
let mut y = 5; // mutable variable, the value can be changed, but the type cannot be changed

x = 10 // invalid
y = 10 // valid
y = "hello" // invalid
``` 

## Variable Data Types 

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
| arch    | `isize`| `usize`  | depends on the computer architecture    | depends on the computer architecture      | `int` (32-bit) or `long` (64-bit)         |

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

#### Tuple Type
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

##### Desctructuring Assignment for Tuples
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


#### Array Type
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

## If Else Statement
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


## Infinite Loop
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


## While Loop
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

## For Loop 
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

## Enum 
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

## Constants
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



## Functions
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

## Code Blocks
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

## Shadowing
Shadowing is the process of redeclaring a variable. To shadow a variable, use the `let` keyword. 

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


## References

## Structs
