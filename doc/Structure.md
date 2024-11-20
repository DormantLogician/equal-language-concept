### 1. Structures
#### 1.1 Variable
    'A
    'A['B]
    ^['B]

Used to give names to structure categories so they can be expanded elsewhere, or as a placeholder for a structure that is unknown, but may be deduced from the context of an intersection - can only be used to store structure categories. Variables may be used to create structure category definitions - they must begin with an uppercase letter.

Variables may also be anonymous - this is denoted:

    '['B]

In this example, an anonymous variable that accepts a capture is used.

Variables may be defined with a category called a capture, which makes variable accept a category as an argument - these variables can deduce to any category definition that accepts a capture matching restrictions defined by the variable. Variables with captures may be used to create structure category definitions.

Captures may be used to map categories to other categories, or add/remove
structure from categories - for example:

    ('['A O 'B], 'B)

In this example, capture extracts value of 'B'.

Variables are also used as placeholders for locations, which may be intersected with in order to send output outside of program and/or store categories locally, and/or read from in order to continuously or non-continuously draw categories into a service from outside of program or to enable one service to read from another service's exports.

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

#### 1.4 Sequence
    'A O 'B O 'C
    'A O,

Defines an order-sensitive sequence of structures. Used to compose categories
in order to form a new one.

#### 1.5 Collection
    'A C 'B C 'C
    'A C,

Defines an unordered collection of structures. Items in a collection are
rearranged to fit inside another category when intersected - generates unions
in cases where two or more possible items may fit in a specific location.

#### 1.3 Sum
    'A + 'B
    2 +,

Used to define a sum category, where each item is concatenated.

#### 1.6 Category
    Definition:
    ('A['B], 1 O 2 O, 'B, ')

    Declaration:
    ('A['B], Constraint)

    Instance (Structure - finite):
    (1 O 2)

    Instance (Structure - infinite):
    (1 O 2 O,)

Represents structures in language that may be intersected.

Categories may be either finitely or infinitely sized - they have
a variable, body, and optional recursive call field respectively.

Categories may be either category definitions, or inline categories - category definitions have a non-anonymous variable attached to them like so:

    ('A['B], 1 O 2 O, 'B)

In this example, a category is defined with the variable 'A'.

Inline categories are defined with an anonymous variable if they
accept a capture, like so:

    ('['A][2], 'A O, 'A + 2)

In this example, category is immediately expanded with '2' as initial argument to
capture, which generates a pattern.

Categories may be sum (denoted '+'), product (denoted '*'), union (denoted 'V'),
sequence (denoted 'O'), or collection (denoted 'C') categories.

Any infinitely-sized category may have a fourth item that denotes expansion of category to n'th structure in pattern.

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