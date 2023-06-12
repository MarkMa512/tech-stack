# [Master Pointers in C: 10X Your C Coding!](https://www.youtube.com/watch?v=IrGjyfBC-u0)

## What is a pointer?

Consider an example of a house: 

```c
#include <iostream>

use namespace std;

typedef struct 
{
    int SquareFeet;
    int NumBedrooms;
    int NumBathrooms;
} House;
```
All the memory in a computer is numbered with an address. The `House` object created will be 12 bytes in size in the memory. The Compiler will allocate 12 bytes of memory for the `House` object, says, x2633. 

To tell someone that there is a party in the house, we can simply tell them the address of the house. This is the same as passing a pointer to the house. This is much easier than "creating a copy of the house "and giving it to the person to demonstrate how a house looks like (passing by value). 

A pointer is a variable that stores the address of another variable. We can use the pointer to access and use the variable it points to. 

## Declaring a pointer
Example of a pointer: In a Commodore 64, the memory is 64K. The memory is numbered from 0 to 65535. The pointer is 16 bits long. 

You can change the background color of the screen by changing the value of the memory address 53281. If the value is 0, the background is black. If the value is 1, the background is white. 

```c
#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
    byte *pBackgroundColor = (byte *) 53281; 
    // declare a pointer to the memory address 53281, (byte *) is a typecast to a byte pointer
    // pBackgroundColor is a pointyer to a byte in memory 
    *pBackgroundColor = 0; 
    // *pBackgroundColor = 0 means that the content of the memory address 53281 is changed to 0 
    // change the value of the memory address 53281 to 0, which changes the background color to black 
}
```

In C, we add a `*` to the type to declare a pointer. 

```c
#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
    int *p; // declare a pointer to an integer
    int i = 5;
    p = &i; // assign the address of i to p
    cout << *p << endl; // dereference p to get the value of i
}
```

The `*` operator must precede the variable name for the declaration of a pointer. It decorates the variable name to indicate that it is a pointer, not the type name. 


```c
void foo()
{
    int *x, y; // x is a pointer to an integer, y is an integer 
    x = &y; // assign the address of y to x 
}
```
## Pointer with Objects

```c
#include <iostream>

using namespace std;

typedef struct 
{
    int SquareFeet;
    int NumBedrooms;
    int NumBathrooms;
} House;

int main(int argc, char *argv[])
{
    House myHouse = {100, 2, 1}; // create a house object

    // print the house details using the dot operator 
    cout << "Square Feet: " << myHouse.SquareFeet << endl;
    cout << "Bedrooms: " << myHouse.NumBedrooms << endl;
    cout << "Bathrooms: " << myHouse.NumBathrooms << endl;

    // create a pointer to the house object
    House *pHouse = &myHouse;

    // print the house details using the pointer with the arrow operator 
    cout << "Square Feet: " << pHouse->SquareFeet << endl;
    cout << "Bedrooms: " << pHouse->NumBedrooms << endl;
    cout << "Bathrooms: " << pHouse->NumBathrooms << endl;

}


// Pass house by value, which creates a copy of the house object 
// This can be expensive if the house object is large
int GetHousePrice(House House)
{
    return House.SquareFeet * 100;
}

// Pass house by reference, which passes the address of the house object 
// in a 32-bit system, the address is 4 bytes, which is much smaller than the house object
int GetHousePrice(House *pHouse)
{
    return pHouse->SquareFeet * 100;
}
```

## Pointer concepts

1. Indirection: A pointer is a variable that stores the address of another variable. We can use the pointer to access and use the variable it points to.
2. Dereferencing: Dereferencing a pointer means getting the value of the variable it points to.
3. Pointers vs Arrays: 
    - An array is a pointer to a contiguous block of memory holding elements of the same type.
    - Pointer is a variable that stores the address of the first value. 
    - **An array is a pointer to the first element of the array.**
    - The name of an array is a pointer to the first element of the array.
    <!-- - The name of an array is a constant pointer.
    - The name of an array cannot be changed.
    - The name of an array cannot be assigned to another array.
    - The name of an array cannot be assigned to a pointer.
    - The name of an  array cannot be incremented or decremented.
    - The name of an array cannot be used in a sizeof() operator. -->

    ```c
    void foo()
    {
        char szText[] = "Hello"; // szText is a pointer to the first element of the array
        char *pText = szText; // pText is a pointer to the first element of the array

        std::cout << szText << std::endl; // print the string
        std::cout << pText << std::endl; // print the string
    }
    ```

4. Pointer Arithmetic: Manipulating the pointer itself, thus manipulating the memory address directly, not the value it points to.
    - Adding /Subtracting an integer to/from a pointer means moving the pointer by the number of bytes of the type it points to / moves it by a multiple of the size of the type it points to, not just by 1 byte. This is because the pointer is a pointer to a type, not a byte. 

    Cosnider the following Example: 

    ```c
    void foo()
    {
        char szText[] = "Hello"; // szText is a pointer to the first element of the array
        char *pText = szText; // pText is a pointer to the first element of the array 

        // Step pointer by a single byte
        pText ++; 
        // pText is now pointing to the second element of the array, which is 'e'
        // pText has moved by 1 byte, not 1 element of the array; char is 1 byte in size 

        int aNumbers[] = {1, 2, 3, 4}; // aNumbers is a pointer to the first element of the array
        int *pNumbers = aNumbers; // pNumbers is a pointer to the first element of the array

        // Step pointer by a single integer (4 bytes on 32-bits)
        pNumbers ++;
        // pNumbers is now pointing to the second element of the array, which is 2

        // Step pointer by 5 integers (20 bytes on 32-bits)
        pNumbers += 5; // pNumbers is now pointing to the sixth element of the array, which is 6

    } 
    ```
    If we have a pointer `pHouse` pointing to the house object mentioned in the examples above, it will increment by 12 bytes if we increment it by 1. This is because the house object is 12 bytes in size. 

## Char Pointers
The most common use of pointers is char pointers. It contains the address of the 1st char / byte of a string in memory. 

In C, strings are terminated at the end with a null character, or zero byte:  `\0`. You can almost think of a string as an array of characters terminated with a null character. 

The primary difference is that pointer is a variable that contains the address whereas the array is syntatic sugar for the actual address. The name of an array is a pointer to the first element of the array and it is a constant pointer which cannot be changed, while a pointer is a variable that can be changed. 

Furthermore, the size of an array is its actual size in memory, while the size of a pointer is the size of the address it points to, which is 32 bits on a 32-bit system and 64 bits on a 64-bit system. 

Consider the following example: 

```c
void foo()
{
    char szText = "Hello"; // szText is a pointer to the first element of the array
    char *pText = szText; // pText is a pointer to the first element of the array

    static_assert(sizeof(szText) == 6, "size of szText is not 6"); // size of szText is 6 bytes, which is the size of the array in memory
    static_assert(sizeof(pText) == 4, "size of pText is not 4"); // size of pText is 4 bytes, which is the size of the address it points to in memory in a 32-bit system
}
```
## Pointer to Pointer 
Pointers can point to other pointers, leading to multiple levels of indirection. It is crucial to understand this concept for dynamic data structures such as linked lists, trees, and graphs. 

Consider the following simple example: 

```c
void foo()
{
    char *pText = "Hello"; // pText is a pointer to the first element of the array
    char **ppText = &pText; // ppText is a pointer to the pointer pText, &pText is the address of pText 

    std::cout << pText << std::endl; // print the string
    std::cout << *ppText << std::endl; //print the value of the pointer pText, which is the memory address of the first element of the array 
}
```
## Null Pointer vs Uninitialized Pointer vs Void Pointer

- Null pointer is a pointer that does not point to anything. It is a pointer that has the value 0. It is a pointer that is initialized to 0.

- Uninitialized pointer is a pointer that has not been initialized. It is a pointer that has not been assigned a value. It is a pointer that has not been assigned an address. It is random and can point to anything. 

- Void pointer is a pointer that has no type. It is a pointer that can point to anything. 
    - Any data type, object, function, variable, memory address, etc. 
    - It is a pointer that can be assigned to any other pointer type without casting. However, it must be casted to the correct type before it can be dereferenced.
    - It only stores the address with no type information. 

    Why does void pointer exist? Consider the following example: 

    ```c
    void * Malloc(size_t size)
    {
       return malloc(size); // malloc returns a void pointer that points to the allocated memory 
       // we have no idea of what type of data the allocated memory is going to hold so we return a void pointer 
       // the caller of this function can cast the void pointer to the correct type 
    }

    void foo()
    {
        House * pHouse = (House *) Malloc(sizeof(House)); // cast the void pointer to a House pointer and assign it to pHouse
        // pHouse is now a House pointer that points to the allocated memory
        cout << GetHousePrice(pHouse) << endl; // dereference pHouse to get the price of the house

    }
    ```

## Function Pointers 

1. Function pointers are pointers that point to functions, instead of to a data type. This allows the programmer to dynamically decide which function to invoke at runtime.It also defines the arguments and return type of the function it points to when the function is called. 

Consider the following example: 

```c
int add (int a, int b)
{
    return a + b;
}

int (*pAdd)(int, int) = add; // pAdd is a pointer to a function that takes 2 ints and returns an int, add is the function it points to 
// the () around *pAdd is necessary because the precedence of the () operator is higher than the * operator, without the () the compiler will think that pAdd is a function that returns a pointer to an int

int sum = (*pAdd)(2, 3); // sum is 5, using the function pointer to call the function it points to 
// the () around *pAdd is necessary because the precedence of the () operator is higher than the * operator, without the () the compiler will think that pAdd is a function that returns a pointer to an int
```

2. They are used to pass functions as arguments to other functions. 

For example, the Q sort function in the C standard library takes a function pointer as an argument to allow the programmer to specify how the elements in the array should be sorted based on the function passed in. 

```c
int compare(const void* a, const void* b) //compare function takes in 2 void pointers 
{
    int int_a = * ( (int*) a ); // casting the void pointers to int pointers and dereferencing them to get the values
    int int_b = * ( (int*) b );

    if ( int_a == int_b ) return 0; 
    else if ( int_a < int_b ) return -1;
    else return 1;
}

int main (){
    int array[5] = { 1, 5, 3, 4, 2 };
    int size = sizeof(array) / sizeof(*array); // get the size of the array
    qsort(array, size, sizeof(int), compare); // pass the function pointer to the compare function
    for (int i = 0; i < 5; i++)
    {
        cout << array[i] << endl;
    }
}
```
Cautions: While function pointers are very powerful, they are also very dangerous and make the code very hard to read. They should be sparingly used with clear documentation to explain what the function pointer is doing.