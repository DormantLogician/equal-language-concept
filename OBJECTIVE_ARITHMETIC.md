## Objective Arithmetic

### 1. Introduction
Objective Arithmetic is a strict superset of arithmetic, and strict subset of the Equal programming language - it aims to be more usable in mathematics.

### 2. Abstractions
#### 2.1 Equality
    a = b

An equality from arithmetic - it is the largest objective arithmetic context
available, which enables objective arithmetic operations and structures
to be used on either side.

#### 2.2 Tag
    a'b

Assigns variable to a category or quantity - used either to create an alias, or in
tagged unions.

#### 2.3 Negation
    ~Name'

Indicates that structures in category are to be removed from any intersection
they are part of.

In an intersection, if two or more negated categories are the same, only first one is kept. Intersection of at least two different negated categories remains unevaluated until it is intersected with a non-negated category.

Negated categories must be intersected with a non-recursive category - otherwise,
an unevaluated context is created, which can be narrowed by further intersections.

#### 2.4 Function
    (a -> s, (ExpansionStep(a)', ReductionStep(a)')'c)

A function that reduces, maps, or expands 'a' into 's' by using
a combination of operations and/or qualified functions.

Must use the least number of operations needed to reach 's' for all 'a'
in order to qualify as a function.

### 3. Relations
#### 3.1 Sum
    a + b
    a +,

Adds two or more quantities, quantity categories, or collections - concatenates in case of collections. May be used to define a sum category.

#### 3.2 Difference
    a - b
    a -,

Subtracts two or more quantities or quantity categories, or defines a difference category.

#### 3.3 Product
    a * b
    Collection' * 3
    a *,

Multiplies two or more quantities or quantity categories, generates sequence chain for
collection categories, or defines a product category.

#### 3.4 Quotient
    a / b
    a /,

Divides two or more quantities or quantity categories, or defines a quotient category.

#### 3.5 Union
    t'a V b
    u:t'c V d

Defines a category that represents more than one possible structure. Union members may be tagged with a placeholder - this placeholder may be used to restrict members of some other union.

Condition tags may be related by either intersection or union - for example:

    t'a V b
    u'c V d
    v:(t & u)'e V f

'e' is only active member of union if both 'a' and 'c' are active members of their unions.

#### 3.6 Sequence
    a O b
    a O,

Defines an order-sensitive sequence of structures.

#### 3.7 Combination
    a C,
    (1,2,3)'c

Defines an unordered collection of structures. Will generate links as needed in order to represent combinations. For recursive combinations, narrowing to a finite combination must be performed by using context from an intersection.

#### 3.8 Intersection
    First' & Second'

Generates a single category that contains only structures all members of
intersection have in common - is defined for all quantity, union, sequence,
and combination categories.

Unevaluated contexts may be created in cases where an intersection cannot be
proven to halt, such as sum of recursive collection category then finite category,
intersected with a recursive category, since it is not known if finite category
will be found at some point. Unevaluated contexts can be narrowed by intersecting with other categories, which can make them able to be evaluated.

### 4. Structures
#### 4.1 Variable
    a
    f(x)

Variable, or function label from arithmetic respectively - may also store
categories within an objective arithmetic context.

#### 4.2 Placeholder
    A'
    A(b)'

Used to give names to quantities, quantity categories, and collection categories -
behaves either like an arithmetic variable, or function label respectively, except
name can be more than a single character long, and must begin with a capital letter.

#### 4.3 Quantity

Any mathematical object where sum, difference, product, and quotient are defined.

#### 4.4 Category
    (1 O 2)
    (1 O 2)
    (1 O 2 O,)
    (a, 1 O 2 O, a)

Represents either a structure, or a class of quantities.
May be recursively defined and/or have a template category.
Everything inside a category is in an objective arithmetic context,
which enables the use of structures and operations that are specific
to objective arithmetic.

Categories may be sum (denoted '+'), difference (denoted '-'),
product (denoted '*'), quotient (denoted '/'), union (denoted 'V'),
sequence (denoted 'O'), or combination (denoted 'C')
categories.

Quantity categories that are recursive must contain only one quantity
or quantity category.

#### 4.5 Link
    (2)'c

Possible item to select from a combination - these may change based on
which other links in combination group are selected in an intersection,
and on which categories are at all the locations - this is done so items
are placed at all possible correct positions.

Links must be tagged with an index in cases where more than one of same item
exist - for example:

    (2,2,3)'c

In this example, links are (2)'c, (1'2)'c, and (3)'c.

### 5. Example
The following example defines and uses a generic 'Rule' category to sort integers.

In steps below, combination chain is read from left to right - for each location
in sequence part of intersection, generates links, which are used to decide
which items go in which positions. If an item that doesn't fit is encoutered,
we try inserting it in subsequent previous locations until location where all
subsequent category constraints are satisfied is found.

    Gte(a)' = (a V (a + (1 +,)))
    Rule(A(b)')' = (a, A(a)' O, A(a)')

    (2,3,1)'g = Rule(Gte(a)')'
    (2,3,1)'g = (a, b'Gte(a)' O, b)
    (2,3,1)'g = (b'Gte(a)' O c'Gte(b)' O Gte(c)')
    (2,3,1)'g = (b'(2)'g O c'Gte(b)' O Gte(c)')
    (2,3,1)'g = (b'(2)'g O c'(3)'g O Gte(c)')
    (2,3,1)'g = (b'(1)'g O c'(2)'g O (3)'g)
    (2,3,1)'g = (1 O 2 O 3)
    (1 O 2 O 3) = (1 O 2 O 3)
    (1 O 2 O 3)
