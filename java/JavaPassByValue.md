# [Java Pass By Value](https://www.bilibili.com/video/BV1nz4y1B7SC)

By default, Java passes arguments by value. Regardless of the type of the variable, primitive or reference, the value of the variable is passed into the method. This means that a copy of the value is made and passed into the method. Changes to the parameter have no effect outside of the method.

Consider the following example:

```java
public class PassByValue {
    public static void main(String[] args){
        int a = 1; 
        int b = 2;

        swap(a, b); 
        // a and b are passed by value, ie. a copy of a and b are passed into the method, this will not change the value of a and b outside of the method

        System.out.println("a = " + a + ", b = " + b);1
    }

    public static void swap(int a, int b){
        int temp = a;
        a = b;
        b = temp;
    }
}

```

Output: 
> a = 1, b = 2  

Consider another example, when we pass in reference type of Integer: 

```java
public class PassByValue{
    public static void main(String[] args){
        Integer a = 1; // stores memory address of the object: 0x00010
        Integer b = 2;// 0x000020 

        swap(a, b);
        // a and b are still passed by value, ie. a copy of a and b are passed into the method, this will not change the value of a and b outside of the method, even though they are reference type of Integer 

        System.out.println("a = " + a + ", b = " + b);
    }
                            // 0x00010, 0x000020 
    public static void swap(Integer c, Integer d){
        Integer temp = c; 
        c = d;
        d = temp;
        // c and d are local variables, they are not the same as a and b, they are just copies of a and b, so changing c and d will not change a and b
    }
}
```

Output: 
> a = 1, b = 2  

## Pass by reference in C++

In C++, we can pass by reference, which means that we can pass in the memory address of the variable into the method. This means that the method can change the value of the variable outside of the method. 

Consider the following example: 

```cpp
include <iostream>
using namespace std;

int main()
{
    int a = 1;
    int b = 2;

    swap(a, b);

    cout << "a = " << a << ", b = " << b << endl;
}

void swap(int &c, int &d) // & means pass by reference, ie. pass in the memory address of the variable, so that the method can change the value of the variable outside of the method
{
    int temp = c; // here, c is the memory address of a, d is the memory address of b, ie, c is a, d is b 
    c = d;
    d = temp;
}
```

Output:
> a = 2, b = 1  