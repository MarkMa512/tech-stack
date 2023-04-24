# [Python one-liner](https://www.youtube.com/watch?v=KBlN_J_gfyk)

## 1. Remove duplicates

Using `set()` function: a collection of unique elements
```py
mylist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
mylist = list(set(mylist))
```

## 2. Walrus operator

Walrus operator `:=` is used to assign values to variables as part of a larger expression. It was introduced in Python 3.8.
```py
print((n := 10))
```

## 3. Map Function

The `map()` function executes a specified function for each item in an iterable. The item is sent to the function as a parameter. 
map(function, iterables)
- returns an iterator that applies function to every item of iterables, yielding the results.

```py
x = [1, 2, 3, 4, 5]
y = map(lambda x: x**2, x) # y is a map object, this saves memory
print(list(y))
```