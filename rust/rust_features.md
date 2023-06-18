# [All Rust features explained](https://www.youtube.com/watch?v=784JWR4oxOI)

### Keywords 
- Most popular features 
- Influences from other languages 
- feature integration 

## From C++: Zero-Cost Abstractions 

> What you don't use, you don't pay for.  
> What you do use, you couldn't hand code any better. 

High Level Language Abstractions should not impose any runtime overhead or performance penalties compared to code using low-level abstractions 

### High Level Language Abstractions 

1. Generics
2. Iterators 
3. Templates 
4. Collections 
5. Classes 

### Low Level Abstractions 

1. For Loops 
2. Counters 
3. If/else 
4. Raw pointers 

### Example in C++: Using manual implementation 
```cpp
#include <iostream>
#include <vector>


int main(){
    std::vector<int> numbers = {5, 2, 8, 1, 3};

    // Manual implementation to find the maximum element 
    int maxElement = numbers[0]; 
    for (size_t i = 1; i < numbers.size(); ++i){
        if (numbers[i] > maxElement){
            maxElement = numbers[i]; 
        }
    }
    std::cout << "Maximum element: " << maxElement <<std::endl; 
    
    return 0; 
}
```
In the example above, we need to do  

    - Loop initialization  
    - Condition checking  
    - Element comparison  

making it less readable and prone to errors. 

#### size_t
The datatype `size_t` is an unsigned integer type that is commonly used to represent the sizes or indices of objects in memory. It is an implementation-defined type and is typically defined as an alias for an unsigned integer type, such as `unsigned int` or `unsigned long`.

The `size_t` type is often used in C and C++ to represent the size of arrays, the length of containers, or the indices of elements within a collection. It is particularly useful when dealing with memory-related operations, such as memory allocation, indexing, and looping through containers.

Using `size_t` provides a guarantee that the type is large enough to represent the size of any object in memory. It is typically defined to have a size that matches the system's memory addressing capabilities, making it suitable for addressing the maximum possible memory range on a given platform.


### Example in C++: Using iterator abstractions 
```cpp 
#include <iostream>
#include <vector>
#include <algorithm>

int main(){
    std::vector<int> numbers = {5, 2, 8, 1, 3}; 

    // Using iterator abstraction to find the max element 
    auto maxElement = std::max_element(numbers.begin(), numbers.end()); 
    // The iterator abstraction encapsulates iteration and comparison logic 
    // making the code more concise, clear to read and less error-prone 

    // However, calling max_element() on an empty vector would lead to undefined behavior 

    std::cout << "Maximum element: " << *maxElement <<std::endl; 
    return 0; 
}
```
#### auto
In the code above, the use of `auto` as the type for maxElement is appropriate and preferable in this case. The std::max_element function returns an iterator pointing to the maximum element in the range, not the actual value itself. Therefore, using `auto` allows the type deduction to automatically determine the correct iterator type based on the container type (std::vector<int> in this case).

If you still want to explicitly specify the type, you can use the iterator type std::vector<int>::iterator for maxElement. However, it's recommended to stick with auto for flexibility and easier maintenance of the code. The auto keyword ensures that the code remains correct even if the container type changes in the future.

#### maxElement vs *maxElement 
In the first example using the manual implementation, `maxElement` is a simple `int` variable that stores the maximum element value directly. So, when printing it with `std::cout`, you can directly output the value of maxElement using the `<<` operator. The value itself is accessible directly as it is assigned from the elements of the vector.

In the second example using the `std::max_element` algorithm with iterators, `maxElement` is an iterator pointing to the maximum element in the vector. To access the value pointed to by the iterator, you need to dereference it using the `*` operator. This retrieves the value stored at that iterator position.

By dereferencing the iterator (`*maxElement`), you access the actual value of the maximum element, which can then be printed using `std::cout`.

### Example in Rust: Using iterator abstractions 
```rust 
fn main(){
    let numbers = vec![5, 2, 8, 1, 3]; 
    
    let max_element = numbers.iter().max(); 
    // 0 cost abstractions: iterator
    // 0 cost abstractions: option enum (returned by max())

    /*
    at the above, the max() method returns an option type 
    if it is being called on an empty vector, it will simply return the non-variant. 
    option type forces the developer to check whether the return type is the some variant
    or non variant which makes the code a lot more robust while preserving blazing fast performance. 
    */
    match max_element{ // 0 cost abstractions: pattern matching
        Some(&max) => println!("Maximum element: {}", max), 
        None => println!("The vector is empty." ), 
    }
}
```

#### Option Type in Rust 
In Rust, the `Option` type is an enum provided by the standard library that represents the possibility of either having a value (`Some`) or not having a value (`None`). It is used to handle situations where a value may be present or absent.

Here's a brief overview of the two variants of the `Option` enum:

- `Some(T)`: Represents the presence of a value of type `T`. It wraps the value and indicates that it is available.

- `None`: Represents the absence of a value. It does not contain any value.

By using the `Option` type, Rust enforces explicit handling of the absence of values, promoting safer and more robust code. It helps prevent null pointer dereference errors and encourages developers to handle potential absence scenarios explicitly, rather than relying on assumptions.

To access the value inside an `Option`, you need to use **pattern matching** or one of the available methods to transform or extract the value. Some commonly used methods for working with `Option` include `unwrap()`,` expect()`, and `match` expressions.


### Example in Python: Using iterator abstraction: non 0-cost 
```py
numbers:list = [5, 2, 1, 3, 8]

# Using iterator abstraction to find the max element 
max_element = max(numbers, default=None)

"""
Python required additional run-time checks to ensure the integrity of the iteration process 
because collections can change in size or structures during iteration. 

System programming languages like rust cannot afford such performance drag. 
"""

if max_element is not None: 
    print(f"Max element: {max_element}"); 
else: 
    print("The list is empty"); 
```

## Ownership 
Based on "Resources Acquisition Is Initializations" (RAII) Design Pattern in C++. 

- Allocated memory 
- File handles 
- Database connections 

Should be tied to object lifetimes. When an object is created, it acquires resources; When those object is destroyed, those resources are released. 

### Example in C++ w/o RAII Pattern 
```cpp
#include <sqlite3.h>
#include <string>

int main(){
    sqlite3* db; 
    std::string dbName = "example.db"; 

    sqlite3_open(dbName.c_str(), &db); 

    if (db != nullptr){ // check the db to ensure that it is not a null pointer 
        // perform database operations 

        // close the connection 
        sqlite3_close(db); 
    }
    return 0; 
}
```
If the database connections are not closed, this creates a resource leak. 

### Example in C++ with RAII Pattern 

```cpp 
#include <sqlite3.h>
#include <string>

class DatabaseConnection{
    private: 
        sqlites3* db;

    public: 
        DatabaseConnection(cost std::string& dbName){
            sqlite3_open(dbName.c_str(), &db); // acquire the resources at the constructor 
        }
        // destructor 
        ~DatabaseConnection(){
            if (db!=nullptr){
                sqlite3_close(db); // close the resources at the destructor 
            }
        }
        bool isConnected() cost{
            return db != nullptr; 
        }
}; 

int main(){
    DatabaseConnection connection("example.db"); 
    // connection is a stack variable so it will be de-allocated at the end of the main function. 
    // when it is de-allocated, its destructor is called and the database connection is closed. 
    // convenient and reliable resource management
    if (connection.isConnected()){
        // perform database operations here 
    }
    return 0; 
}
``` 

### Ownership Rules 

1. Each value in Rust has a variable that's called it's owner
2. There can only be 1 owner at a time
3. When the owner goes out of the scope, the value will be dropped 

### Example in Rust
```rust 
use rusqlite::{Connection, Error};

struct DatabaseConnection {
    connection: connection, // holds a connection object 
}

iml DatabaseConnection{
    fn new(db_name:&str)->Result<DatabaseConnection, Error>{
        let connection = Connection::open(db_name)?; // The ? operator is used to propagate any potential errors that may occur during the connection opening process.
        // when a new database connection instance is created, we acquire the connection and store it in the struct
        Okay(DatabaseConnection{connection}) 
    }
}

fn main() -> Result<(), Error> {
    let connection = DatabaseConnection::new("example.db")?; 
    // create an instance of connection struct, pass in the database name, then perform any database operation we want
    // perform database operations 
    Okay(()) //  Ok(()) is returned to indicate successful execution.
}
```
Unlike C++, there is no destructor that releases the Database connection. Instead, the connection variable will go out of scope at the end of main, and the database instance will be dropped. Any value database connection is holding will be dropped, automatically. 

### Borrowing Rules 

1. At any given time, you can either have one mutable reference, or any number of immutable reference. 
2. References must always be valid. 

By enforcing that resources either have multiple readers or a single writer, rust prevents an entire class of bugs known as `data races`. 
By enforcing that references must be valid, rust prevents the null pointer dereferencing 

```rust 
use rusqlite::{Connection, Error};

struct DatabaseConnection {
    connection: connection, // holds a connection object 
}

iml DatabaseConnection{
    fn new(db_name:&str)->Result<DatabaseConnection, Error>{
        let connection = Connection::open(db_name)?; // The ? operator is used to propagate any potential errors that may occur during the connection opening process.
        // when a new database connection instance is created, we acquire the connection and store it in the struct
        Okay(DatabaseConnection{connection}) 
    }
}

fn main() -> Result<(), Error> {
    let connection = DatabaseConnection::new("example.db")?; 

    // valid, multiple immutable reference 
    let coonn1 = &connection; 
    let coonn2 = &connection; 
    let coonn3 = &connection; 
    let coonn4 = &connection; 

    let conn4 = &mut connection; // invalid, against borrowing rules 

    Okay(())
```

## Haskell: Algebraic Data Types (ADT)

ADTs are a type system concept commonly found in functional languages. They allow us to create composite types using:  

- Sum Types: also known as variant types, that could be one of several variant. 
    ```rust
    // A shape that can either be a circle, a rectangle, or a triangle 
    enum Shape{
        Circle(f32), 
        Rectangle(f32, f32), 
        Triangle(f32, f32, f32), 
    }
    ```
- Product Types: similar to struct in C that allow us to bundle multiple types together
    ```rust 
    struct Person{
        name: String, 
        age: u32, 
        height: f32, 
    }
    ```

ADTs are useful as they allow us to model complex data structure and enforce constraints on data at the type level, which can help catch errors at compile time. 

### ADTs in Haskell

```haskell
data Employee
    = Manager {name :: String, subordinates :: [Employee]}
    | Worker {name :: String, manager :: String} 
```
This is a `sum type` consists of 2 variants, manager and worker, each variant can hold different types and amounts of data. While `manager` has a name and a list of subordinates while a worker has name and a single manager. 

### ADTs in Rust 
Same example implementation in Rust: 
```rust
enum Employee {
    Manager {name : String, subordinates : Vec<Box<Employee>>}, 
    Worker {name : String, manager : String} 
}
```
`Employee` is a sum type, so we use `enum`. 

While the concept of ADTs is similar between rust and Haskell, there are some differences. 
Rust integrates ADTs into an imperative programming style, unlike Haskell, which is purely functional. 
Rust combines ADTs with other language features, such as  

- Pattern matching  
- Lifetimes  
- The borrow checkers  

To ensure memory safety and data race prevention. 

### Pattern Matching 
Rust also took pattern matching from functional languages like Haskell. Pattern matching in rust also enforces exhaustiveness, which requires all variants of an enum must be handled, preventing potential runtime errors. 

```rust
enum Employee {
    Manager {name : String, subordinates : Vec<Box<Employee>>}, 
    Worker {name : String, manager : String} 
}
fn main(){
    let employee = Employee::Worker{name:"Bob".to_string(), manager: "Alice".to_string()}; 

    match employee {
        Employee::Manager {name, subordinates} => println!("{} is a manager with {} subordinates.", name, subordinates.len()), 
        Employee::Worker {name, manager} => println!("{} is a worker under the management of {}.", name, manager), 
    }
}
```

## OOP: Polymorphism 
Polymorphism is the ability of an object/function to take on multiple forms or behave differently based on the context in which it is used. Some languages implement polymorphism through `Inheritance`, but rust takes a different approach, through `Traits` and `Generics`. 

### Traits 
Traits define a set of functions and method that types can implement. Similar to `interface` in other languages. 

Notes: 
    1. Types can implement multiple traits. 
    2. Traits can have default implementations for functions and methods. 

```rust 
trait Shape {
    fn area(&self) -> f64; 
}

struct Rectangle {
    width: f64, 
    height: f64, 
}

// we can implement trait Shape on Rectangle and Circle structs, which calculates area differently 
impl Shape for Rectangle {
    fn area(&self) -> f64{
        self.width * self.height 
    }
}

struct Circle {
    radius: f64, 
}

impl Shape for Circle{
    fn area(&self)->f64{
        self.radius * self.radius * std::f64::consts::PI
    }
}
```

### Generics
Enables us to write code that is abstracted over types, which leads to reusable and efficient code. 

In rust, generics can be bound by traits

```rust 
trait Shape {
    fn area(&self) -> f64; 
}

struct Rectangle {
    width: f64, 
    height: f64, 
}

// we can implement trait Shape on Rectangle and Circle structs, which calculates area differently 
impl Shape for Rectangle {
    fn area(&self) -> f64{
        self.width * self.height 
    }
}

struct Circle {
    radius: f64, 
}

impl Shape for Circle{
    fn area(&self)->f64{
        self.radius * self.radius * std::f64::consts::PI
    }
}

// print_area() takes a generic argument shape 
// In rust, generics can be bound by traits, in this case, the generic T can be any type that implements the shape trait
fn print_area<T: Shape>(shape: &T){
    println!("Area: {}", shape.area()); 
}

fn main(){
    let rectangle = Rectangle {
        width: 5.0, 
        heigh: 3.0, 
    }; 

    let circle = Circle {radius:2.5}; 

    print_area(&rectangle); 
    print_area(&circle); 
    // print_area is able to to accept both rectangle and circle as they both implemented Shape trait

    // rust also supports dynamic dispatch with trait object
    let shapes: Vec<Box<dyn Shape>> = vec![Box::new(rectangle), Box::new(circle)]; 
}
```
The trait system in Rust has its roots in Haskell's Type classes, which provides shared behaviors for types. But Rust builds on top f the concept of type classes by incorporating **ownership, borrowing** and **lifetimes** into the trait system, which are central to rust's memory safety. 

### Trait Object and Dynamic Dispatch 
Rust also supports dynamic dispatch with trait object. Trait Object allows you to teat different types that implements the **same trait** as **interchangeable**. 

```rust
    // rust also supports dynamic dispatch with trait object
    let shapes: Vec<Box<dyn Shape>> = vec![Box::new(rectangle), Box::new(circle)]; 
```
Here, we have created a vector of shape trait object that stores a rectangle and cycle 

### Advantages of the trait system in Rust 

#### 1. Flexibility and Composition 
Multiple types can independently implement the same trait, enabling flexible composition, w/o relying on strict inheritance hierarchies. 

#### 2. Non-invasive and Extensive 
They allow behavior to be added to types without modifying their original implementation, or inheritance hierarchies. 

#### 3. No of Fragile Base Class Problem 
Fragile Base Class Problem: modifications to a base class can unintentionally impact the derived classes. 

#### 4. Static Dispatch and Performance 
Enables efficient code generation. 
