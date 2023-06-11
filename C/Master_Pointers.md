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
    return pHouse.SquareFeet * 100;
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

4. Pointer Arithmetic: 
    - Pointer arithmetic is the arithmetic of pointers to arrays.
    - Pointer arithmetic is not the arithmetic of the values the pointers point to.
    - Pointer arithmetic is not the arithmetic of the addresses the pointers point to.
    - Pointer arithmetic is the arithmetic of the pointers themselves.
    - Poin