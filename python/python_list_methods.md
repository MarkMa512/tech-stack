# [ALL 11 LIST METHODS IN PYTHON EXPLAINED](https://www.youtube.com/watch?v=0yySumZTxJ0)

### 1. append
Add an element to the end of the list
```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.append("Luigi")
people.append(["Luigi"]) # this will add a list as an element to the list

print(people)
```
Output:
> ['Mario', 'Elon', 'Trump', 'Annabel', 'Luigi', ['Luigi']]

### 2. clear
Empty the list
```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.clear()
print(people)
```

Output:
> []


### 3. copy

Create a new list with the same elements

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people_copy: list[str] = people.copy() # this is a shallow copy, if the list contains a list, it will copy the reference of the list
# we are able to edit one-dimensional elements of the list without affecting the original list

people_copy.remove("Mario")
print(people)
print(people_copy)
```

`people` and `people_id` are 2 separate list with 2 separate memory address/ids 

Output:
> ['Mario', 'Elon', 'Trump', 'Annabel']
> ['Elon', 'Trump', 'Annabel']

Consider the following example:

```py
people: list[str] = ["Mario", ["Elon", "Bob"], "Trump", "Annabel"]
people_copy: list[str] = people.copy()

people_copy[1][1] = "Cat" # this will change the element in both lists, because it is a shallow copy

print(people)
print(people_copy)
```

Output:
> ['Mario', ['Elon', 'Cat'], 'Trump', 'Annabel']


### 4. count
Count the number of occurrences of an element in the list

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel", "Mario"]
print(people.count("Mario"))
```

Output:
> 2


### 5. extend
Add elements of a list to another list

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.extend(["Luigi", "Bob"])
print(people)
```

Output:
> ['Mario', 'Elon', 'Trump', 'Annabel', 'Luigi', 'Bob']

The following example shows the difference between `append` and `extend` methods, `append` will add the list as an element to the list, while `extend` will add the elements of the list to the list.

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.append(["Luigi", "Bob"])
print(people)
```

Output:
> ['Mario', 'Elon', 'Trump', 'Annabel', ['Luigi', 'Bob']]


### 6. index
Return the index of the first element with the specified value

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
print(people.index("Elon"))

# if the element is not in the list, it will throw an error
print(people.index("Luigi"))
```

Output:
> 1
> ValueError: 'Luigi' is not in list

### 7. insert
Add an element at the specified position

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.insert(1, "Luigi") # insert Luigi at index 1, position comes first, then the element
print(people)
```

Output:
> ['Mario', 'Luigi', 'Elon', 'Trump', 'Annabel']

Consider the following case: The method does its best to add the element to the specified position, if the position is greater than the length of the list, it will add the element to the end of the list, if the position is negative, it will add the element to the end of the list, if the position is negative and greater than the length of the list, it will add the element to the beginning of the list.
```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.insert(10, "Luigi") # if the position is greater than the length of the list, it will add the element to the end of the list
people.insert(-1, "Bob") # if the position is negative, it will add the element to the end of the list
people.insert(-10, "Cat") # if the position is negative and greater than the length of the list, it will add the element to the beginning of the list
```

Output:
> ['Mario', 'Elon', 'Trump', 'Annabel', 'Luigi', 'Bob', 'Cat']

### 8. pop
Remove the element at the specified position, and return it

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
print(people.pop()) # remove the last element, by default
print(people.pop(1)) # remove the element at index 1
print(people)
```

Output:
> Annabel 
> Elon 
> ['Mario', 'Trump', 'Annabel'] 

### 9. remove
Remove an element from the list based on the value of the element

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.remove("Elon")
people.remove("Luigi") # if the element is not in the list, it will throw an error
print(people)
```

Output:
> ['Mario', 'Trump', 'Annabel']
> ValueError: list.remove(x): x not in list

### 10. reverse
Reverse the order of the list

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.reverse()
print(people)
```

Output:
> ['Annabel', 'Trump', 'Elon', 'Mario']


### 11. sort
Sort the list

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.sort() # sort in ascending order (alphabetical order)
print(people)
```

Output:
> ['Annabel', 'Elon', 'Mario', 'Trump']

A case with both upper and lower case letters: the function will return the list with all the upper case letters first, then the lower case letters, and the order of the upper case letters and lower case letters will be in alphabetical order.

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel", "bob"]
people.sort() # sort in ascending order (alphabetical order)
print(people)
```

Output:
> ['Annabel', 'Elon', 'Mario', 'Trump', 'bob']

Sort in descending order (reverse alphabetical order)

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.sort(reverse=True) # sort in descending order (reverse alphabetical order)
print(people)
```

Output:
> ['Trump', 'Mario', 'Elon', 'Annabel']

`key` parameter: the `key` parameter takes a function that will be used to sort the list, the function will return a value that will be used to sort the list, the following example will sort the list based on the length of the elements in the list.

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel"]
people.sort(key=len) # sort in ascending order (alphabetical order)
print(people)
```

Output:
> ['Elon', 'Mario', 'Trump', 'Annabel']

Consider a case with lambda function: the following example will sort the list based on the alphabetical order, regardless of the case of the letters.

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel", "bob", "cat" ]

people.sort(key = lambda x: x.lower()) # sort in ascending order (alphabetical order)
print(people)
```

Output:
> ['Annabel', 'bob', 'cat', 'Elon', 'Mario', 'Trump']
'
Consider a case with lambda function: the following example will sort the name based on the last letter of the name.

```py
people: list[str] = ["Mario", "Elon", "Trump", "Annabel", "bob", "cat" ]
people.sort(key=lambda x: x[-1]) # sort in ascending order (alphabetical order)
print(people)
```

# [THIS Is One Of The Fastest & Cleanest Ways To Filter Lists In Python](https://www.youtube.com/watch?v=fysLCGYToFM)

## Using list comprehension and user defined filter function
```py
# User defined filter function
def contains_a(input_str: str)-> bool:
    return "a" in input_str.lower()

people = ["Darcy", "Bob", "Dana", "Annabel"]

# using list comprehension
new_people = [person for person in people if contains_a(person)] # list comprehension returns a list, more readable

print(new_people)
```

Output:
>['Darcy', 'Dana', 'Annabel']

## Using filter() function and lambda function
```py
people = ["Darcy", "Bob", "Dana", "Annabel"]
new_people = list(filter(lambda person: "a" in person.lower(), people))
print(new_people)
```

Output:
>['Darcy', 'Dana', 'Annabel']

## Using filter() function and user defined filter function

filter function takes two arguments, first one is the filter function and second one is the iterable object.

```py
# User defined filter function
def contains_a(input_str: str)-> bool:
    return "a" in input_str.lower()

people = ["Darcy", "Bob", "Dana", "Annabel"]
new_people = list(filter(contains_a, people)) # filter() function returns an iterator, so we need to convert it to list
print(new_people)
```

Output:
>['Darcy', 'Dana', 'Annabel']
