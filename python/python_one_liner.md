# Python One-Liner

## [10 Python One Liners YOU NEED TO KNOW!](https://www.youtube.com/watch?v=KBlN_J_gfyk)
### 1. Remove duplicates

Using `set()` function: a collection of unique elements
```py
mylist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
mylist = list(set(mylist))
print(mylist)
```
Output: 
> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

### 2. Walrus operator

Walrus operator `:=` is used to assign values to variables as part of a larger expression. It was introduced in Python 3.8.
```py
print((n := 10))
```

### 3. Map Function

The `map()` function executes a specified function for each item in an iterable. The item is sent to the function as a parameter. 
map(function, iterables)

Returns an iterator that applies function to every item of iterables, yielding the results.

```py
x = [1, 2, 3, 4, 5]
y = map(lambda x: x**2, x) # y is a map object, this saves memory
print(list(y))
```

Output:
> [1, 4, 9, 16, 25]

### 4. Sorted Function 
Returns a sorted list of the specified iterable object. 
Default: ascending order 

```py
unordered_list = [1, 5, 3, 2, 4]
ordered_list = sorted(unordered_list)
print(ordered_list)
```

Output:
> [1, 2, 3, 4, 5]

```py
unsorted_list = ["Harry", "Charley", "Denise", "Alice", "Bob", "Tim", "Patrick"]
print(sorted(unsorted_list, key=lambda x: len(x))) #sort the list based on the length of the string
```
Output:
> ['Bob', 'Tim', 'Harry', 'Alice', 'Denise', 'Charley', 'Patrick']

### 5. Swap 2 Variables 
```py
a = 1
b = 2
a, b = b, a
print(a, b)
```
Output:
> 2 1

### 6. Unpacking Operator
```py
string_list = ["Youtube", "Google", "Amazon", "Netflix", "Facebook"]

print(*string_list, sep="\n")
```

Output:
> Youtube
> Google
> Amazon
> Netflix
> Facebook

### 7. List Comprehension
```py
numbers = [1, 2, 3, 4, 5]

# filter out even numbers and square the odd numbers
new_list = [x**2 for x in numbers if x % 2 != 0]

print(new_list)
```

Output:
> [1, 9, 25]

### 8. Reverse a List / String
```py
x = [1, 2, 3, 4, 5]

x = [::-1]

print(x)
```

Output:
> [5, 4, 3, 2, 1]


```py
x = "Hello World"

x = [::-1]

print(x)
```

Output:
> dlroW olleH

### 9. Days This Year 
```py
import datetime
print ((datetime.date.today()-datetime.date(2023,1,1)).days)
```

Output (26/04/2023):
> 115

### 10. Ternary Operator
```py
if 5>3: 
    var = 15
else:
    var = 100 

print(var)
```

Output:
> 15

```py
var = 15 if 5>3 else 100
print(var)
```

Output:
> 15
