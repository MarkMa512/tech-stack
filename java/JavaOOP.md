# Java OOP 

## Table of Contents


## Object-Oriented Programming (OOP)

Object-oriented programming (OOP) is a programming paradigm that uses objects and classes.

### Object
An object is an instance of a class. It has attributes and methods. All objects of a class have the same attributes and methods, but the values of the attributes may be different. 

### Class
A class is a blueprint for creating objects. It defines the attributes and methods that an object will have.

### Attribute
An attribute is a variable that belongs to an object. It defines the state of an object.

### Method
A method is a function that belongs to an object. It defines the behavior of an object.

### Constructor
A constructor is a special method that is used to initialize an object. It is called when an object is created.

### Interface
An interface is a contract that defines the methods that a class must implement. It is used to achieve abstraction and polymorphism.


## OO Concepts

### Abstraction 
Defining a class with only the essential attributes and methods while ignoring non-essential attributes and methods. 

### Encapsulation
Separate components into external and internal components. External components are the public methods and attributes that are exposed to the user. Internal components are the private methods and attributes that are hidden from the user.

### Modularity 
Breaking up a program into smaller, more manageable pieces. 

#### Functional Decomposition
Breaking up a program into smaller, more manageable pieces based on functionality.

#### Object-Oriented Decomposition
Breaking up a program into smaller, more manageable pieces based on objects. 

### Hierarchy 
Ranking objects based on their level of abstraction.

### Inheritance 
Inheriting attributes and methods from a parent class. This is achieved through interfaces and abstract classes in Java. 

### Polymorphism  
The ability to take on many forms. This is achieved through method overriding,  method overloading and interfaces in Java. 

## Class Diagram
Shows the static structure of a system. It is a collection of classes, interfaces, and collaborations between objects. 

### Relationships
Relationships are used to describe how classes are connected to each other. There are two types of relationships: structural relationships and behavioral relationships.
- Structural Relationships
    - Association
    - Composition
- Behavioral Relationships
    - Dependency

#### Navigability  
Indicates if it is possible to navigate from an associating class to target class with the association relationship. The association is assumed to be navigable in both directions unless otherwise specified with an arrow. 

- Eg: A team has multiple player, while a player belongs to a team, no arrow specified: 
```java
public class Team {
    private ArrayList<Player> players;
}

public class Player {
    private Team team;
}
```

#### Multiplicity 
Multiplicity is the number of instances of one class related to one instance of the other class. It is represented by a number or a range. 
- For every association, there are two multiplicities, one for each class. Eg, a team has multiple players, while a player belongs to one team, shown as above.
- 3 Basic Multiplicities: 
    - 1: Exactly one instance
    - 0..1: Zero or one instance
    - 0..*: Zero or many instances
- 3 Basic Multiplicity combinations: 
    - One-to-one
    - One-to-many
    - Many-to-many

#### Verb Phrases and Association Rules 
- Verb Phrase is used to describe the association between two classes. Eg: A team has multiple players.
- Association Rules are used to describe the association between two classes. Eg: A team has multiple players, while a player belongs to a team.

### Composition: "is-a-part-of" Relationship
Models a "has-a" relationship where the part cannot exist without the whole. The part is destroyed when the whole is destroyed. One object owning another object and thus being responsible for its lifetime (creation and destruction). 

- Eg: A Human has a Heart, while a Heart belongs to a Human: 
```java
public class Human {
    private Heart heart;
}

public class Heart {
    private Human human;
}
```

### Association: "has-a" Relationship
An association is a structural relationship that represents objects that are connected to each other, represented by a line connecting the two classes. Association between classes most often represent instance variables that hold references to other objects. 

- Eg: A team has multiple player: 
```java
public class Team {
    private ArrayList<Player> players;
}
```

- Eg: A player has a instrument: 
```java
public class Player {
    private Instrument instrument;
}
```

- Eg: A module has multiple prerequisites: 
```java
public class Module {
    private ArrayList<Module> prerequisites;
}
```

#### Reflexive Association
One instance of the class has association to another instance of the same class. 

### Dependency: "uses-a" Relationship
A dependency is a behavioral relationship that represents objects that are connected to each other, represented by a dashed line connecting the two classes. Dependency between classes most often represent method parameters or local variables that hold references to other objects.

A change to the definition of one class may affect the other class. 
    - One class sends a message to another class
    - One class has another as part of its data 
    - One class uses another class as a parameter in a method call

- Eg: A team has multiple players and is stored as an ArrayList: 
```java
import java.util.ArrayList;

public class Team {
    private ArrayList<Player> players;
}
```

## Inheritance and Polymorphism  

### Inheritance
- Organizes object in a top-down fashion from the most general to the most specific. 
- `is-a` relationship 

- Eg: A human is a mammal
    ```java
    public class Mammal {
        // ...
    }

    public class Human extends Mammal {
        // ...
    }
    ```
- Keyword: `extends` indicated that the class inherits from another class; Human is a subclass of Mammal, while Mammal is a superclass of Human. 

- Benefits of Inheritance: 
    - **Code reusability**
    - Extensibility
    - Maintainability

#### Inheritance: Constructors 
- Constructors are not inherited, but they can be invoked from the subclass.
- The keyword `super` is used to invoke the superclass constructor. The super statement must be the first statement in the subclass constructor. 
- Eg: 
```java
public class Employee {
    private String name;
    private String address;
    private int number;

    public Employee(String name, String address, int number) {
        System.out.println("Constructing an Employee");
        this.name = name;
        this.address = address;
        this.number = number;
    }
}

public class Manager extends Employee{
    private String department;

    public Manager(String name, String address, int number, String department) {
        super(name, address, number);
        this.department = department;
    }
}
``` 

- If no super statement is provided, the compiler will automatically insert a call to the no-argument constructor of the superclass. If the superclass does not have a no-argument constructor, the compiler will generate an error.
- Eg: 
```java
public class Animal {
    private String name;

    public Animal(String name) {
        this.name = name;
    }
}

public class Dog extends Animal {
    private String breed;

    public Dog(String breed) {
        // super(); // Compiler will automatically insert this statement
        this.breed = breed;
    }
}
```

### Abstract Class
- An abstract class is a class that cannot be instantiated.
- A generic base class that provides partial implementation of a class, while allowing subclasses to provide concrete implementation of some methods. 

#### Abstract Method
- An abstract method is a method that does not have a body, and must be implemented by the subclass. 

- Eg: 
```java
public abstract class Animal {
    public abstract void makeSound();
}

public class Cat extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Cat meows");
    }
}
```
- **If a class contains an abstract method, the class must be declared abstract.**

#### Create Subclass from Abstract Class 
- `Extends` the abstract class and implement all abstract methods. 

- Eg: 
```java
public abstract class Animal {
    public abstract void makeSound();
}

public class Cat extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Cat meows");
    }
}
```

### Interface
- An interface is a collection of abstract methods and constants that form a common set of base rules/specifications for those classes that implement it. 
- A subclass can implement multiple interfaces, but can only extend one class. Java only supports multiple inheritance through interfaces, not classes. This is to address the diamond problem. 
- `implements` keyword is used to indicate that a class implements an interface. 
- As compared to abstract classes, interfaces are more flexible and can be used to implement multiple inheritance. Interfaces are also used to achieve loose coupling. 

- Eg: 
```java
public interface Animal {
    public void makeSound();
}

public class Cat implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Cat meows");
    }
}
```

## Inherited Methods and Overriding
- A subclass inherits all the members (fields, methods, and nested classes) from its superclass.
- All Java classes are subclasses of the Object class. 
- The class Object specifies the behavior of all objects, and is the root of the class hierarchy.
    - `toString()` method: returns a string representation of the object.
        - Provides a meaningful string representation of the object for debugging purposes.
    - `equals()` method: compares two objects for equality and returns a boolean. 
    - `hashCode()` method: returns a hash code value for the object.
    - `getClass()` method: returns the runtime class of an object.
    - `clone()` method: creates and returns a copy of the object.
    - `finalize()` method: called by the garbage collector on an object when garbage collection determines that there are no more references to the object.

### Instanceof Operator
- The `instanceof` operator is used to test if an object is an instance of a class, subclass, or interface.  
- Eg: 
```java
public class Animal {
    // ...
}

public class Cat extends Animal {
    // ...
}

public static void main(String[] args) {
    Animal animal = new Animal();
    Cat cat = new Cat();

    System.out.println(animal instanceof Animal); // true
    System.out.println(cat instanceof Animal); // true
    System.out.println(animal instanceof Cat); // false
}
```

### equals() Method 
- By default, the `equals()` method compares two objects by comparing their memory references. 
- However, it is often necessary to compare objects based on their content, not their reference. Hence, the `equals()` method is overridden to compare the content of the object.
- It determines whether its parameter is an object that is equivalent to the invoking object.

- Eg: without overriding equals() method 
```java
public class Animal {
    private String name;

    public Animal(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}

public static void main(String[] args) {
    Animal animal1 = new Animal("Cat");
    Animal animal2 = new Animal("Cat");

    System.out.println(animal1.equals(animal2)); // false
}
```

- Eg: with overriding equals() method and comparing the content of the object
```java
public class Animal {
    private String name;

    public Animal(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Animal) { // check if obj is an instance of Animal
            Animal animal = (Animal) obj; // cast obj to Animal
            return this.name.equals(animal.getName()); // compare the content of the object
        }
        return false;
    }
}
```

#### equals() vs ==
- `equals()` method compares the content of the object, while `==` compares the reference of the object.
- `equals()` method is defined in the Object class, while `==` is defined in the primitive data types and Object class.
- `equals()` method can be overridden, while `==` cannot be overridden.

#### Guidelines for Overriding equals() Method
1. Reflexive: `x.equals(x)` must return true.
2. Symmetric: `x.equals(y)` must return true if and only if `y.equals(x)` returns true.
3. Transitive: if `x.equals(y)` returns true and `y.equals(z)` returns true, then `x.equals(z)` must return true.
4. Consistent: multiple invocations of `x.equals(y)` must return the same value, provided no information used in `equals()` is modified.
5. Physicality: for any non-null reference value `x`, `x.equals(null)` must return false.

#### Why Override equals() Method?
- To compare the content of the object, not the reference.

### hashCode() Method
- The `hashCode()` method returns a hash code value for the object.
- The hash code value is used in hashing based collections such as HashMap, HashSet, and HashTable.
- The `hashCode()` method is defined in the Object class and can be overridden.
- If two objects are equal according to the `equals()` method, then calling the `hashCode()` method on each of the two objects must produce the same integer result.
- If two objects are unequal according to the `equals()` method, it is not required that calling the `hashCode()` method on each of the two objects must produce distinct integer results. However, the programmer should be aware that producing distinct integer results for unequal objects may improve the performance of hashing based collections.


### Overriding 
- A subclass can override a method of the superclass.
- An instance method in a subclass with the same **signature** (*name* and *parameter* types) and **return type** as an instance method in the superclass overrides the superclass's method.
- The `@Override` annotation is used to indicate that a method overrides another method. If the method does not override a method in the superclass, the compiler will generate an error.

- Eg: 
```java
public class Animal {
    public void makeSound() {
        System.out.println("Animal makes sound");
    }
}

public class Cat extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Cat meows");
    }
}

public static void main(String[] args) {
    Animal animal = new Animal();
    animal.makeSound(); // Animal makes sound

    Cat cat = new Cat();
    cat.makeSound(); // Cat meows
}
```
Output: 
```
Animal makes sound
Cat meows
```


### Polymorphism 

### Class VS Abstract Class VS Interface

| Class | Abstract Class | Interface |
| --- | --- | --- |
| Can be instantiated | Cannot be instantiated | Cannot be instantiated |
| Can have instance variables | Can have instance variables | Cannot have instance variables |
| Can have constructors | Can have constructors | Cannot have constructors |
| Can have concrete methods | Can have concrete methods | Cannot have concrete methods |
| Can have abstract methods | Can have abstract methods | Can have abstract methods |
| Can have static methods | Can have static methods | Can have static methods |
| Can have static variables | Can have static variables | Can have static variables |
| Can have final methods | Can have final methods | Can have final methods |
| Can have final variables | Can have final variables | Can have final variables |
| Can have private methods | Can have private methods | Cannot have private methods |

- Note: 
1. Priority of inheritance: Class > Abstract Class > Interface
2. A class can only extend one class, but can implement multiple interfaces. 
3. An abstract class can extend one class or one abstract class, but can implement multiple interfaces. 
4. An interface can extend multiple interfaces. 

Prior to Java 8, interfaces could only have abstract methods. Java 8 introduced default and static methods in interfaces. A class in Java can implement multiple interfaces, each specifying a set of abstract methods that the class must implement. The class then provides the implementation for these methods. By using interfaces, you can achieve a level of abstraction and enforce a contract for the behavior of classes implementing those interfaces.

A default method is a method defined within an interface that includes an implementation.

```java 
public interface MyInterface {
    void abstractMethod();

    default void defaultMethod() {
        System.out.println("This is a default method.");
    }
}
```
In the above example, the MyInterface interface declares an abstract method abstractMethod() and a default method defaultMethod(). Classes implementing MyInterface can choose to override the default method or inherit the provided implementation.

A static method is a method defined within an interface that includes a method body, similar to a static method defined within a class. Static methods in interfaces are useful for providing utility methods or helper functions that are related to the interface but do not require an instance of a class. They can be accessed and used by all classes that implement the interface.

It's important to note that static methods in interfaces cannot be overridden or inherited by implementing classes. They are solely associated with the interface itself and are not part of the implementation contract for classes. 
