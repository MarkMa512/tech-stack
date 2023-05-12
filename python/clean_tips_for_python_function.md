# [6 CLEAN Tips To IMPROVE Your Python Functions](https://www.youtube.com/watch?v=qvSjZ6AKfXQ)


## 1. Specify the parameters and return types
This is a new feature in Python 3.5. It's not enforced, but it's a good practice to specify the return type of your function. It's a good way to document your code and it's also a good way to catch bugs. If you specify the return type and you return something else, you'll get an error.

This also provides context information for the IDE to provide better code completion.

```py
def add(x: int, y: int) -> int:
    return x + y
```

## Use *args to handle Multiple arguments

```py
def sum_numbers(*numbers:float) -> float:
    return sum(numbers) # sum is a built-in function, it takes an iterable with fixed number of arguments. 
    # number is a tuple

print(sum_numbers(1,2,3,4,5))
```

Output:
> 15

## 3. Keep your code simple 
One function should do one thing and do it well. If you have a function that does multiple things, you should consider refactoring it.

Don't write complex functions. If you have a function that's more than 10 lines, you should consider refactoring it. You can break it down into smaller functions. This will make your code more readable and easier to maintain. This also increases the chances of code reuse.

## 4. Documentations 

This helps other developers understand your code. It also helps you remember what you did when you come back to your code after a few months. The IDE can also use this information to provide better code completion.

```py
def add(x: int, y: int) -> int:
    """
    Add two numbers

    :param x: first number
    :param y: second number
    :return: sum of x and y
    """
    return x + y
```

## 5. As much as possible, do not use global variables

This introduces various side effects. Eg, everyone can access a global variable, and the function is dependent on the global variable. This makes the function less reusable.

Make sure all the data that the function needs is passed in as parameters. If you have a function that needs to access a global variable, you can pass it in as a parameter.