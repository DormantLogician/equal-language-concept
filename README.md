## 1. Equal Programming Language Concept
### 1.1 Important information
Equal is a concept for an experimental programming language, rather than a specific implementation, so features described in documentation may or may not be possible to implement, or they may only be able to be implemented to a certain degree.

### 1.2 Summary
Equal is a programming language where intersections between categories completely replace algorithms.

Equal is simple, because it does not have many features, and because intersection is the only way operations can be performed.

It is error-resistant both because we specify what something is, rather than how it works, and because the way language is designed allows all possible system behaviors to be traversed and/or tested.

Also, it is expressive to the point where it can be used to do many things other languages can do - it allows posing questions about what certain structures are, given incomplete information by using deduction. Not only can we get output of an operation from its inputs, we can also deduce what an input is given an output.

The language is designed to act as a bridge between mathematics and programming - it makes use of mechanics the equal sign '=' has in mathematics that are related to deduction of unknown structures.

Equal has strong solving abilities - it allows answering questions about whether specific system states are reachable from an initial state, allowing for more rigorous testing.

### 1.3 Intersection as computation method
A basic program in written in language is expressed:

    'A & 'B

In this example, intersection of 'A and 'B categories removes differences between them, producing a third category type representing only structures they have in common. Intersections enable reduction of a search space in order to find specific structures (output of intersection) within that space. If an output can be produced, intersection will output a solution if there is one - otherwise, it will output a contradiction (signaling failure to find a solution).

### 1.4 Example
The following example defines and uses a generic 'Rule' category to sort integers (numbers that follow a specific mathematical pattern). Input collection is reordered by language to fit inside 'Rule', which places each item in each position where it can possibly go - in this case, each item is placed at a position that makes collection sorted.

Category definitions:

    ('Quantity, 1 O,)
    ('Gte['A:Quantity], 'A V ('A + Quantity))
    ('Rule['A[Quantity]:Quantity], ('['B:Quantity]['], 'T:'A['B] O, 'T))

Intersection is the following:

    (2 C 3 C 1) & Rule[Gte[Quantity]]

Output is the following:

    (1 O 2 O 3)