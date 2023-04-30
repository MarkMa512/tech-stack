# [ALL 11 LIST METHODS IN PYTHON EXPLAINED](https://www.youtube.com/watch?v=0yySumZTxJ0)

### 1. append

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

### 4. count

### 5. extend

### 6. index

### 7. insert

### 8. pop

### 9. remove

### 10. reverse

### 11. sort



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
