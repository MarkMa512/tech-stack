# [how Google writes future-proof C++](https://www.youtube.com/watch?v=6lU11IHfJgo)

> As every C++ programmer knows, the language has many powerful features, but this power brings with it complexity, which in turn can make the code more bug-prone and harder to read and maintain. 

[Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html) 

## Tabs vs Spaces
Use only spaces, and indent 2 spaces at a time. Do not use tabs for indentation. 
Rationale: Different editors interpret tabs differently. 

## Type Deduction (auto)
Use type deduction only to make the code clearer or safer, and do not use it merely to avoid the inconvenience of writing an explicit type. 

Consider the following code: 
```cpp
auto uFoo = make_unique<Foo>(); // it is clear that uFoo is a unique_ptr<Foo> 
auto uFoo = make_unique<Foo>(); // it is clear that uFoo is a unique_ptr<Foo> 
```

However, the following code is not clear: 
```cpp
auto widget = make_widget(); // what is the type of widget? 
```

## Ownership and Smart Pointers 

Consider the following code: 
```cpp
MyStruct* badAllocs(){
    // not deleted, memory leak 

    MyClass* pMC = new MyClass; 
    MyStruct* pMS = malloc(sizeof(MyStruct));
    free(pMS); // a free'd pointer is returned
    return pMS; 
}
```

The given C++ code above leads to a memory leak because it returns a pointer to a dynamically allocated object that has already been freed using the `free` function. 

In the code, `MyStruct* pMS` is allocated memory using `malloc`, which is a C function for dynamic memory allocation. Then, `pMS` is immediately freed using `free(pMS)`. After that, the function attempts to return the freed pointer `pMS`. 

Returning a freed pointer is problematic because the caller of the function will receive a pointer that is no longer valid. This leads to undefined behavior when the caller tries to access or manipulate the memory pointed to by the returned pointer.

To fix this issue, you should remove the `free(pMS)` line and return `pMS` directly without freeing it. Here's the corrected code:

```cpp
MyStruct* goodAllocs() {
    // memory allocated, not freed
    MyClass* pMC = new MyClass;
    MyStruct* pMS = (MyStruct*)malloc(sizeof(MyStruct));
    return pMS; 
}
```

By removing the `free(pMS)` line, the memory allocated for `pMS` will not be freed prematurely, and you avoid the memory leak.

### Ownership
Ownership is a key concept in C++. It is the idea that a piece of code owns a resource and is responsible for releasing it.

Ownership is a concept in secure programming that dictates what object is responsible for the management of a transient piece of memory. 


### Data Hiding 
A technique of hiding internal object details. Data hiding restricts the data access to class members. It maintains data integrity. 


### Smart Pointers
Prefer to keep ownership with the code that allocated it. If other code needs access to the object, prefer to use std::unique_ptr to make ownership transfer explicit.

<!-- std::shared_ptr, weak_ptr -->

Eg
```cpp
class FooMaker{
    public: 
        std::unique_ptr<Foo> makeFoo(){
            return std::make_unique<Foo>(); // ownership is transferred to the caller
        }
}

class FooTaker{
    public: 
        void takeFoo(std::unique_ptr<Foo> pFoo){ // ownership is transferred to the callee
            // do something with pFoo
        }
}
```

## Exceptions 
Google does not use try-catch exception handling at all. 

On their face, the benefits of using exceptions outweigh the costs, especially in new projects. However, for existing code, the introduction of exceptions has implications on all dependent code. If exceptions can be propagated beyond a new project, it also become problematic to integrate that project into existing exception-free code. 

Functions may return in places you don't expect when exceptions are used. While this can be mitigated by rules about where exceptions may be thrown, it cannot be eliminated, this comes at a cost to readability and knowledge at the code base. 

## Inheritance 
Diamond problem:

Consider the following code: 
```cpp
class Person{
    std::string name;
    int age;
    void wave(); 
}

class Mother : public Person{ // Mother inherits from Person 
    // ...
}

class Father : public Person{ // Father inherits from Person 
    // ...
}

class Child : public Mother, public Father{ // Child inherits from Mother and Father 
    // ...
}
```
The structure of the inheritance of the code above creates a diamond shape: 
```
    Person
   /      \
Mother    Father
    \      /
     Child
```

From a code maintenance perspective, it creates ambiguity of where the child inherited its methods from. When child is created, the constructor for person is called 4 times. 

Limit implementation inheritance. Prefer interface inheritance, or, use composition instead. 

### Interface Inheritance 
The use of inheritance from exclusively abstract classes, where no values or code are inherited from the parent. 

Eg. 
```cpp
class Animal{
    public: 
        virtual void speak() = 0; // pure virtual function that has no implementation 
}
```
In the case whereby interface cannot be used, use composition instead. 

### Composition
Composition is the inclusion of a class as an object inside of another class so that the composed object has access to the members of the other class.

Composition is a "has-a" relationship between objects. This means that a class can have the objects of another class as members. 
Eg. 
```cpp
class Car{
    private: 
        Engine engine; // composition
}
```

By composing a class from subclasses, we reduce the ambiguity of which method were chosen at compile time. 