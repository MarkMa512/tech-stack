# Python Typing

## [Python Typing - Type Hints & Annotation](https://www.youtube.com/watch?v=QORvB-_mbZ0)

Add type hints to variables, parameters, and return values. This is not enforced by the interpreter, but can be used by external tools. This is a good way to document your code, enable static type checkers, and IDEs to provide better code completion and refactoring.

### Typing Module
Available in Python 3.5 and above. Provides a set of classes and functions that support the use of type hints.

```python
import typing
```
### Variable Annotations / Type Hints

Python is a dynamically typed language, so variables can be assigned to any type of value. Type hints can be added to variables to indicate the type of value that will be assigned to the variable. However, this is **not enforced** by the interpreter.


```python
x: int = 1
y: str = 'abc'
z: List[int] = []
```

### Static Code Analysis Tool: mypy
Install `mypy` to check for type errors in your code.
```bash
pip install mypy
```

Use `mypy` to check for type errors in your code.
```bash
mypy myscript.py
```

### Function Annotations
Type hints can be added to function parameters and return values. 
```python
def add_numbers(x: int, y: int, z:int) -> int: # this function takes 3 ints and returns an int
    return x + y + z
```

### List Type

```python
from typing import List

x: List[List[int]] = [[1, 2], [3, 4]]

def process_items(items: List[str]) -> None:
    for item in items:
        print(item)
```

### Dict Type

Without typing module: it does not work
```python
x: dict[str, int] = {'field1': 2, 'field2': 3} 
```

```python
from typing import Dict
x: Dict[str, int] = {'field1': 2, 'field2': 3} 
```

### Other Types
```python
from typing import Tuple, Set, FrozenSet, Deque, Callable, Iterable, Iterator, Union, Optional, Any
```

### Type Aliases
Simplify complex type hints by creating type aliases.
```python
from typing import List, Dict, Tuple

Vector = List[float]
Matrix = List[Vector]
Tensor = List[Matrix]

def scale(scalar: float, vector: Vector) -> Vector:
    return [scalar * num for num in vector]
```

### Optional Type
```python
from typing import Optional

def get_full_name(first_name: str, last_name: Optional[str]) -> str:
    """
    Return full name (first and last name concatenated) if last name is provided.
    Otherwise, return only first name.

    :param first_name: first name
    :param last_name: last name, optional
    :return: full name
    """
    if last_name is None:
        return first_name
    else:
        return f'{first_name} {last_name}'
```

### Any Type
```python
from typing import Any

def get_full_name(first_name: str, last_name: Any) -> str:
    """
    Return full name (first and last name concatenated) if last name is provided.
    Otherwise, return only first name.

    :param first_name: first name
    :param last_name: last name, optional
    :return: full name
    """
    if last_name is None:
        return first_name
    else:
        return f'{first_name} {last_name}'
```

### Sequence Type
For functions that take a sequence of items, use the `Sequence` type. This is a generic type, it can be used with any type of sequence, such as list, tuple, range, string, etc.

Set is not a sequence type, so it cannot be used with `Sequence`.

```python
from typing import Sequence # Sequence is a generic type, it can be used with any type of sequence, such as list, tuple, range, etc.

def get_first_item(items: Sequence[int]) -> int:
    """
    Return first item in a sequence. This sequence can be a list, tuple, range, etc.

    :param items: sequence of items
    :return: first item
    """
    return items[0]
```

### Tuple Type

We need to specify the type of each element in the tuple.

```python
from typing import Tuple
x: Tuple[int, str, float] = (3, 'yes', 7.5)

int_tuple: Tuple[int, ...] = (1, 2, 3) # tuple of ints of any length, otherwise, we need to specify the length of the tuple
```

### Callable Type
When we accept a function as a parameter, we can use the `Callable` type. This is a generic type, we need to specify the types of the parameters and return value.

```python
from typing import Callable

def apply_function(func: Callable[[int, int], int], x: int, y: int) -> int:
    """
    Apply a function to two parameters.

    :param func: function to apply. The function must take two ints and return an int indicated by Callable[[int, int], int].
    :param x: first parameter
    :param y: second parameter 
    :return: result of applying the function to the two parameters
    """
    return func(x, y)

def add_numbers(x: int, y: int) -> int:
    return x + y

print(apply_function(add_numbers, 1, 2)) 
```

Output:
> 3

### For Lambda Functions

```python
import typing

def get_add_numbers_func() -> Callable[[int, int], int]:
    func: Callable[[int, int], int] = lambda x, y: x + y
    return func
```

### Generics

Generics is a placeholder for a type. It is used when we want to write code that can be used with different types. T is a generic type, it can be used with any type. 

`item:List[T]`: List item can be of any type, however, the return value must be of the same type as the list item, and everything in the list must be of the same type.**This is enforced by the interpreter.**

```python
from typing import TypeVar, Generic

T = TypeVar('T') # T is a generic type

def get_item(items: List[T], index: int) -> T: # T is a generic type, it can be used with any type. List item can be of any type, however, the return value must be of the same type as the list item, and the index must be an int, and everything in the list must be of the same type.
    return items[index]
```

## [Union Type](https://www.youtube.com/watch?v=xhJOex81EOE)

Used to combine two or more types. The function can accept any of the types specified in the union type, but only one of the types. The return value can be any of the types specified in the union type.

```python
from typing import Union, List, Dict

variable: Union[int, str] = 1 # variable can be an int or a string, but not both

def get_first_item(items: Union[List[int], Dict[int, str]]) -> Union[int, str]:
    """
    Return first item in a list or dictionary.

    :param items: list or dictionary
    :return: first item
    """
    if is_instance(items, list):
        return items[0]
    else:
        return items[0]

def is_instance(obj: Any, cls: Union[type, Tuple[type, ...]]) -> bool:
    """
    Return True if obj is an instance of cls or any of the types in cls.

    :param obj: object
    :param cls: class or tuple of classes
    :return: True if obj is an instance of cls or any of the types in cls, False otherwise
    """
    return is_instance(obj, cls)
```

### Generator Type
```python
```