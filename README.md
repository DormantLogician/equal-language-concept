## 1. Equal Language Concept
### 1.1 Important information
The Equal Language is a concept for an experimental programming language, rather than a specific implementation, so features described in documentation may or may not be possible to implement, or they may only be implemented to a certain degree.

### 1.2 Introduction
The Equal Language is a strongly, statically typed programming language that
uses a computation method based on positive identification of structures - it
is defined as a language where all programs halt unless explicitly specified -
its primary purpose is the design of safe and correct programs.

### 1.3 Intersection as computation method
A basic program in written in language is expressed:

    'A  and 'B     Intersection of 'A and 'B.

In this example, intersection of 'A and 'B categories removes differences between them, producing a third category type representing only structures they have in common. Intersections enable reduction of a search space in order to find specific structures (output of intersection) within that space. This works even if both categories are recursive, producing either an infinitely-sized or finitely-sized category depending
on which structures are the same between both categories.

