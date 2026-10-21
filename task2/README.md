# Task 2 - Static vs. Dynamic Binding in C#

This solution shows the differences between static and dynamic binding in C#. There are three classes: `CoolClass`, `CoolChild`, and `Program`. The binding differences are demonstrated in the first two. Static binding is represented by method _overloading_, and dynamic binding is represented by method _overriding_.

To run the code you can use an online environment like OnlineGDB (https://onlinegdb.com/j5wsVnB32i) or another similar resource.

## Description of the Solution

### Output

```
Static binding (overloading)

Int: 1337
Double: 133.7

Dynamic binding (overriding)

Class: CoolClass
Class: CoolChild
Class: CoolChild
```

### Static Binding

Static binding was implemented through method _overloading_. There are two methods named `PrintNum` in `CoolClass`: one for integers, the other for doubles. `main` calls both of these methods:

```csharp
CoolClass parent = new CoolClass();
parent.PrintNum(1337);
parent.PrintNum(133.7);
```

Which version of the method is called at each line is determined at compile time, i.e. a _static binding_ is performed.

### Dynamic Binding

Dynamic binding is demonstrated using method _overriding_. The parent class, `CoolClass`, has the method `PrintClassName` that prints `CoolClass`. This is a `virtual` method, which means that it can be overridden by child classes. Without this keyword, there can be no override.

This method is then overridden in the child class `CoolChild`, which changes the behavior of the method in parent by printing `CoolChild` instead.

`main` calls this method on different objects in an array:

```csharp
CoolChild child1 = new CoolChild();
CoolChild child2 = new CoolChild();

CoolClass[] arr = { parent, child1, child2 };
foreach (CoolClass item in arr) {
    item.PrintClassName();
}
```

In this code, we add one instance of `CoolClass` and two instances of `CoolChild` to an array of `CoolClass`. This works because of polymorphism. After that, when we call `PrintClassName` on each item in the array, we get the following output:

```
Class: CoolClass
Class: CoolChild
Class: CoolChild
```

Thus, despite the two child instances being cast to their parent, we still get their overridden behavior. This indicates that the call methods were resolved _dynamically_ at runtime, i.e. a _dynamic binding_ was performed.
