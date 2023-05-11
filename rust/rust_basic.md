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
