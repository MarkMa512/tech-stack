# [ALL 47 STRING METHODS IN PYTHON EXPLAINED](https://www.youtube.com/watch?v=bnSYeYFRCaA)

## 1. capitalize()
Converts the first character to upper case
```python
txt:str = "hello, and welcome to my world."
x = txt.capitalize()
print (x)
```
Output:
> Hello, and welcome to my world. 

## 2. casefold()
Converts string into lower case for caseless matching.
```python
txt:str = "Hello, And Welcome To My World!"
x:str = txt.casefold()
print(x)
```
Output:
> hello, and welcome to my world! 

## 3. center() 
Returns a centered string
```python
txt:str = "banana"
x:str = txt.center(20, ".") # 20 is the total length of the string after centering, default is space 
print(x)
```
Output:
> .........banana........

## 4. count() 
Returns the number of times a specified value occurs in a string
```python 
txt:str = "I love apples, apple are my favorite fruit"

x:int = txt.count("apple")
print(x)
``` 

Output:
> 2 

## 5. encode()
Returns an encoded version of the string 
```python
txt:str = "My name is Ståle"
x:str = txt.encode() # default is utf-8 
print(x)
```

Output:
> b'My name is St\xc3\xa5le' 

```python
txt:str = "Test Name Ståle"
x:str = txt.encode(encoding="ascii",errors="backslashreplace") # default is utf-8, errors can be "backslashreplace", "ignore", "namereplace", "strict", "replace" 
print(x)
```

Output:
> b'Test Name St\\xe5le' 

## 6. endswith()
Checks if a string ends with a specified value
```python
txt:str = "Hello, welcome to my world."
x:bool = txt.endswith(".") # default is space
print(x)
```

Output:
> True

It can take a tuple of suffixes to look for:
```python
txt:str = "Hello, welcome to my world."
x:boolean = txt.endswith(("my world.", "to")) # default is space
print(x)
```

Output:
> True

## 7. expandtabs() 
Sets the tab size of the string
```python
txt:str = "H\te\tl\tl\to"
x:str =  txt.expandtabs(2) # default is 8
print(x)
```

Output:
> H e l l o

## 8. find() 
Searches the string for a specified value and returns the position of where it was found
```python
txt:str = "Hello, welcome to my world."
x:int = txt.find("welcome") # default is space
print(x)
print(txt[x:])
```

Output:
> 7 
> welcome to my world.

## 9. format()
Formats specified values in a string
```python
txt:str = "For only {price:.2f} dollars!"
print(txt.format(price = 49))
print(txt.format(49.99)) # this works too
```

Output:
> For only 49.00 dollars!
> For only 49.99 dollars!

## 10. format_map()
Formats specified values in a string based on a template of dictionary values
```python
coord:dict = {'latitude': '37.24N', 'longitude': '-115.81W'}

text:str = 'Coordinates: {latitude}, {longitude}' 

print(text.format_map(coord))
```

Output:
> Coordinates: 37.24N, -115.81W

