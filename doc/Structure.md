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

Categories may be either finitely or infinitely sized - they have a variable, body, optional recursive call, and optional multiplier field respectively. They may also be considered quantity categories or structure categories - all categories are structure categories, and quantity categories are a type of structure category that contains only units of '1'.

Categories may be either category definitions, or inline categories - category definitions have a non-anonymous variable attached to them like so:

    ('A['B], 1 O 2 O, 'B)

In this example, a category is defined with the variable 'A'.

Inline categories are defined with an anonymous variable if they
accept a capture, like so:

    ('['A][2], 'A O, 'A + 2)

In this example, category is immediately expanded with '2' as initial argument to
capture, which generates a pattern.

Categories may be sum (denoted '+'), product (denoted '*'), union (denoted 'V'), sequence (denoted 'O'), or collection (denoted 'C') categories.

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

Defines a category that represents more than one possible structure. Unions define an exclusive-or (XOR) relationship between union members.

#### 1.4 Sequence
    'A O 'B O 'C
    'A O,

Defines an order-sensitive sequence of structures. Used to compose categories
to form a new one.

#### 1.5 Sum
    'A + 'B + 'C
    'A +,

Concatenates categories, or defines a sum category where each item in chain is concatenated with next item.

#### 1.6 Product
    'A * 'B * 'C
    'A *,

Multiplies quantities and/or quantity categories, or defines a product category.