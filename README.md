## 1. Aequalis Programming Language Concept
### 1.1 Important information
Aequalis is a concept for an experimental programming language, rather than a specific implementation, so features described in documentation may or may not be possible to implement, or they may only be able to be implemented to a certain degree.

### 1.2 Summary
Aequalis is a programming language where intersections between categories completely replace algorithms.

Aequalis is simple, because it does not have many features, and because intersection is the only way operations can be performed.

It is error-resistant both because we specify what something is, rather than how it works, and because the way language is designed allows all possible system behaviors to be traversed and/or tested easily.

Also, it is expressive to the point where it can be used to do what most, if not all things other languages can do - it allows posing questions about what certain structures are, given incomplete information by using deduction. Not only can we get output from input, we can also get input from output in some cases.

### 1.3 Intersection as computation method
A basic program in written in language is expressed:

    'A & 'B

In this example, intersection of 'A and 'B categories removes differences between them, producing a third category type representing only structures they have in common. Intersections enable reduction of a search space in order to find specific structures (output of intersection) within that space. If an output can be produced, intersection will output a solution if there is one - otherwise, it will yield a contradiction.

### 1.4 Example
The following example defines and uses a generic 'Rule' category to sort integers. Collection is reordered by language to fit inside 'Rule', which completes sorting process.

    ('Gte['a], 'a V ('a + (1 +,)))
    ('Rule['a['b]], ('['c], 't:'a['c] O, 't))

Program is the following:

    (2 C 3 C 1) & Rule[Gte['a]]

Output is the following:

    (1 O 2 O 3)