### 1. Structures
#### 1.1 Introduction
    Definition:
    ('A['B], 1 O 2 O, 'B, ')

    Declaration:
    ('A['B], Constraint)

    Instance (Structure - finite):
    (1 O 2)

    Instance (Structure - infinite):
    (1 O 2 O,)

Represents structures in language that may be intersected - these are called categories.

Categories may be either finitely or infinitely sized - they have
a variable, body, optional recursive call, and optional multiplier field respectively.

Categories may be either category definitions, or inline categories - category definitions have a non-anonymous variable attached to them like so:

    ('A['B], 1 O 2 O, 'B)

In this example, a category is defined with the variable 'A'.

Inline categories are defined with an anonymous variable if they
accept a capture, like so:

    ('['A][2], 'A O, 'A + 2)

In this example, category is immediately expanded with '2' as initial argument to
capture, which generates a pattern.

Categories may be sum (denoted '+'), union (denoted 'V'), sequence (denoted 'O'), or collection (denoted 'C') categories.

Any infinitely-sized category may have a multiplier that denotes expansion of category to n'th structure in pattern.

Category definitions may be overloaded, like so:

    (+'A['B], 1 O 2 O 'B)
    (+'A['B O 'C], 'B O 'C)

In this example, variable 'A' may be created with either one category, or two categories - each has a different category body.

If it is unclear which overload must be selected based on argument given to capture,
a union between all overloaded categories instantiated with argument is
created at point of reference.

Inline categories may be tagged with a variable, like so:

    ('A:(1 O 2 O) O (3 O 'A))

In this example, the same category may be referenced in a different location
in current structure. When category assigned to 'A' changes as result of
an intersection, it is changed in all other positions 'A' is used.

Categories may expand themselves recursively within same category using syntax with
caret (^) symbol - for example:

    ('A['B], 'B O ^['B] O 'D)

In this example, category 'A' expands itself in middle of own body, making this category
into a tree.

#### 1.2 Quantity
    2

Represents a positive integer.

#### 1.3 Union
    'A V 'B V 'C
    'A V,

Defines a category that represents more than one possible structure. Unions define an exclusive-or (XOR) relationship between union members.

Unions may be tagged in order to enable representation of more complex structures
by using conditions - for example:

((('T)'A V 'B) O (('U: 'T)'C V 'D))

In this example, 'C' may only be active member of its union if 'A' is active member of its union. Tags may also be anonymous in cases where they are not used, like so:

((('T)'A V 'B) O ((': 'T)'C V 'D))

Intersection and union operators may be used in a tag as 'and' and 'or' logical operators respectively - for example:

((('T)'A V 'B) O (('U: 'T)'C V ('V)'D) O (('T V 'V)'E V ('T & 'V)'F))

In this example, 'E' is only active member of its union if either 'A' or 'D' are active members of their unions. 'F' is only active member of its union if both 'A' and 'D' are active members of their unions.

#### 1.4 Sequence
    'A O 'B O 'C
    'A O,

Defines an order-sensitive sequence of structures. Used to compose categories
to form a new one.

#### 1.5 Collection
    'A C 'B C 'C
    'A C,

Defines an unordered collection of structures. Items in a collection are
rearranged to fit inside another category when intersected - generates unions
in cases where two or more possible items may fit in a specific location.

#### 1.6 Sum
    'A + 'B + 'C
    2 +,

Used to define a sum category, where each item is concatenated.