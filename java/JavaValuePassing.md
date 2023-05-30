# [Java value passing](https://www.bilibili.com/video/BV1nz4y1B7SC)

By default, Java passes arguments by value. This means that a copy of the value is made and passed into the method. Changes to the parameter have no effect outside of the method.

```java
public class PassByValue {
    public static void main(String[] args){
        int a = 1; 
        int b = 2;
        swap(a, b); // a and b are passed by value, ie. a copy of a and b are passed into the method, this will not change the value of a and b outside of the method
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

However, if the parameter is an object reference, the reference itself is passed by value. This means that the object reference is copied and passed into the method. Changes to the parameter have an effect outside of the method.

```java
public class PassByReferrence{
    public static void main(String[] args){
        int[] arr = {1, 2};
        swap(arr); // arr is passed by reference, ie, the address of arr is passed into the method, this will change the value of arr outside of the method
        System.out.println("arr[0] = " + arr[0] + ", arr[1] = " + arr[1]);
    }

    public static void swap(int[] arr){
        int temp = arr[0];
        arr[0] = arr[1];
        arr[1] = temp;
    }
}
```