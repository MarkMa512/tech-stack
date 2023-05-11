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

