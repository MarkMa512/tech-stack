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

#### Example in C++: Using manual implementation 
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

##### size_t
The datatype `size_t` is an unsigned integer type that is commonly used to represent the sizes or indices of objects in memory. It is an implementation-defined type and is typically defined as an alias for an unsigned integer type, such as `unsigned int` or `unsigned long`.

The `size_t` type is often used in C and C++ to represent the size of arrays, the length of containers, or the indices of elements within a collection. It is particularly useful when dealing with memory-related operations, such as memory allocation, indexing, and looping through containers.

Using `size_t` provides a guarantee that the type is large enough to represent the size of any object in memory. It is typically defined to have a size that matches the system's memory addressing capabilities, making it suitable for addressing the maximum possible memory range on a given platform.


#### Example in C++: Using iterator abstractions 
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
##### auto
In the code above, the use of `auto` as the type for maxElement is appropriate and preferable in this case. The std::max_element function returns an iterator pointing to the maximum element in the range, not the actual value itself. Therefore, using `auto` allows the type deduction to automatically determine the correct iterator type based on the container type (std::vector<int> in this case).

If you still want to explicitly specify the type, you can use the iterator type std::vector<int>::iterator for maxElement. However, it's recommended to stick with auto for flexibility and easier maintenance of the code. The auto keyword ensures that the code remains correct even if the container type changes in the future.

##### maxElement vs *maxElement 
In the first example using the manual implementation, `maxElement` is a simple `int` variable that stores the maximum element value directly. So, when printing it with `std::cout`, you can directly output the value of maxElement using the `<<` operator. The value itself is accessible directly as it is assigned from the elements of the vector.

In the second example using the `std::max_element` algorithm with iterators, `maxElement` is an iterator pointing to the maximum element in the vector. To access the value pointed to by the iterator, you need to dereference it using the `*` operator. This retrieves the value stored at that iterator position.

By dereferencing the iterator (`*maxElement`), you access the actual value of the maximum element, which can then be printed using `std::cout`.

#### Example in Rust: Using iterator abstractions 
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

##### Option Type in Rust 
In Rust, the `Option` type is an enum provided by the standard library that represents the possibility of either having a value (`Some`) or not having a value (`None`). It is used to handle situations where a value may be present or absent.

Here's a brief overview of the two variants of the `Option` enum:

- `Some(T)`: Represents the presence of a value of type `T`. It wraps the value and indicates that it is available.

- `None`: Represents the absence of a value. It does not contain any value.

By using the `Option` type, Rust enforces explicit handling of the absence of values, promoting safer and more robust code. It helps prevent null pointer dereference errors and encourages developers to handle potential absence scenarios explicitly, rather than relying on assumptions.

To access the value inside an `Option`, you need to use **pattern matching** or one of the available methods to transform or extract the value. Some commonly used methods for working with `Option` include `unwrap()`,` expect()`, and `match` expressions.


#### Example in Python: Using iterator abstraction: non 0-cost 
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
