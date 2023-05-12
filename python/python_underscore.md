# [6 ways "_" can be used in Python](https://www.youtube.com/watch?v=65tbi5iHzz8)

### 1. Python Console

`_` can be used to refer to the result of the previous option 

```py
x = 10 
y = 20 

x + y
```
Output: 
> 30 

```py
_* 10
```

Output: 
> 300

### 2. Formatting Numbers 

Underscores are ignored by the interpreter. 
```py
billion = 1_000_000_000
```

### 3. For-loop Ignoring the value

`_` as a placeholder

```py
for _ in range(3):
    print ('Hello')
```

Output:
> Hello
> Hello
> Hello

### 4. Select and Assign value from a Tuple

```py 
values = (1, 2, 3, 4, 5)

a, b, _, _, c = values

print(a, b, c)
```

Output:
> 1 2 5

```py 
values = (1, 2, 3, 4, 5)

a, *_, c = values

print(a, c)
```

Output:
> 1 5

### 5. Name Clashing 

```py
class_ = "Class_A" # class is a reserved keyword in Python
print(class_)
```

Output:
> Class_A

### 6. Private Variables

`_` at the beginning of a variable name is a convention to indicate that the variable is private. 

```py
class Person:
    def __init__(self, name, age, _id):
        self.name = name
        self.age = age
        self._id = _id # private variable, it should not be accessed outside of the class

        def print_id(self):
            print(self._id)
```
