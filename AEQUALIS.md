## Aequalis

### 1. Introduction
Aequalis is a mathemetical model of a programming language where intersections between categories completely replace algorithms.

Aequalis is simple, because it does not have complex features, and because intersection is the only way operations can be performed.

It is error-resistant both because we specify what something is, rather than how it works, and because the way language is designed allows all possible system behaviors to be traversed and/or tested easily.

Also, it is expressive to the point where it can be used to do what most, if not all things other languages can do - it allows posing questions about what certain structures are given incomplete information by using deduction. Not only can we get output from input, we can also get input from output in some cases, reversing procedures by using deduction.

### 2. Abstractions
#### 2.1 Negation
    ~'Name

Used to express that output category of an intersection is not an instance of the specified category. Some categories cannot be expressed without negation.

Indicates that structures in category are to be removed from any intersection
they are part of.

### 3. Operations
#### 3.1 Intersection
    'First & 'Second' & 'Third

Used to pose questions and get answers about what certain structures are.

Generates a single category that contains only structures all members of
intersection have in common - is defined for number, union, sequence,
collection, sum, and product categories.

Unevaluated contexts may be created in cases where an intersection cannot be
proven to halt. Unevaluated contexts can be narrowed by intersecting with other categories, which can make them able to be evaluated.

#### 3.2 Sum
    a + b
    2 +,

Used to create custom sum chains for mathematical purposes.

Adds two or more numbers, number categories, or structure categories - concatenates in case of structure categories, but only if category is not infinitely sized. Used to define a sum category. Sum categories that are recursive must not use variables.

#### 3.3 Product
    a * b
    'Structure(3)
    2 *,

Used to create custom product chains for mathematical purposes.

Multiplies two or more numbers or number categories, generates sequence chain for structure categories - defines a product category. Product categories that are infinitely sized must not use variables.

#### 3.4 Quotient
    a / b
    2 /,

Used to create fractions.

Divides two or more numbers or number categories if output would be a whole
number - otherwise, creates a fraction.

#### 3.5 Reference
    A
    A['B]
    (A['B], 'W, ('EA,'EB), ('IA, 'IB))

Indicates that category or service with specified label is to be instantiated at position - this creates an anonymous version of that category or service in the form of:

    ('['A], 'B O 'C)

In this example, first item in category is an anonymous label.

Service references must be called with a write label - this label may be intersected with an input category in order to make request to service.

### 4. Structures
#### 4.1 Variable
    a
    a[b]

Variable from arithmetic - may only store numbers.

Variables may be defined with a category called a capture, which makes variable accept a category as an argument - these variables can deduce to any category definition that accepts a capture matching restrictions defined by the variable. Variables with captures may be used to create number category definitions.

Captures may be used to map categories to other categories, or add/remove
structure from categories - for example:

('[('A,)+'B], 'B)

In this example, capture extracts possible values for 'B' from a sequence of 'A'.

Variables may also be anonymous - this is denoted as:

    '[b]

In this example, an anonymous variable that accepts a capture is used.

#### 4.2 Label
    'A
    'A['B]

Used to give names to number and structure categories so they can be expanded elsewhere - can only be used to store categories. Labels may have a capture, and be used to create structure category definitions. Labels may also be anonymous.

#### 4.3 Integer
    2

Represents a whole number.

#### 4.4 Fraction
    2/3

A number that cannot be interpreted as an integer - these are left unevaluated
until underlying decimal is needed with specific level of precision.

#### 4.5 Union
    ((t)a V b) O ((u: t)'c V d)

Needed to express structures that have very specific configurations.

Defines a category that represents more than one possible structure. Union members may be tagged with a label or variable - this label or variable may be used to restrict members of some other union.

Unions define an exclusive-or (XOR) relationship between union members.

Condition tags may be related by either intersection or union - for example:

    ((t)a V b) O
    ((u)c V d) O
    ((v: t & u)e V f)

'e' is only active member of its union if both 'a' and 'c' are active members of their unions.

Tags may be either variables, or labels.

Tags may also be used to indicate that two union members in same category are allowed to be active at same time despite the default exclusive-or relationship - for example:

    ((t)e V (t)f)

Both 'e' and 'f' may be active at same time.

Union tags may be anonymous in cases where tag name is unused - for example:

    ((t)a V b) O
    ((u)c V d) O
    ((': t & u)e V f)

#### 4.6 Sequence
    a O b O c
    a O,

Defines an order-sensitive sequence of structures.

#### 4.7 Collection
    a C b C c
    a C,

Defines an unordered collection of structures.

#### 4.8 Category
    (1 O 2)
    (1 O 2)
    (1 O 2 O,)
    ('[a], 1 O 2 O, a)

Represents numbers and/or structures in language that may be intersected.

Categories may be either finitely or infinitely sized - they have
a label, body, and optional recursive call field respectively.

Categories may be either category definitions, or inline categories - category definitions have a non-anonymous label attached to them like so:

    ('A[a], 1 O 2 O, a)

In this example, a category is defined with the label 'A'.

Inline categories are defined with an anonymous label, like so:

    (', 1 O 2 O)
    ('[a], a O, a + 2)[2]

In second example, category is immediately expanded with '2' as initial argument, which generates a pattern.

Categories may be sum (denoted '+'), product (denoted '*'), union (denoted 'V'),
sequence (denoted 'O'), or collection (denoted 'C') categories.

Number categories that are infinitely sized must contain only one number or number category.

Category definitions may be overloaded, like so:

    (+'A[a], 1 O 2 O, a)
    (+'A[a O b], 1, a)

In this example, label 'A' may be instantiated with either one number, or two numbers - each has a different category body.

Inline categories may be tagged with a label, like so:

('A:(', 1 O 2 O) O (3 O 'A))

In this example, the same category may be referenced in a different location
in current structure. When category assigned to 'A' changes as result of
an intersection, it is changed in all other positions 'A' is used.

#### 4.9 Service

    (', 'I:A, ('EA:B,'EB:C), ('IA:D, 'IB:E), ('I & 'F))

Used to express concurrency and processing of user requests.

Has export labels for giving information to other services, and import labels for getting information from other services,

Only synchronous writing, and asynchronous reading is allowed - requests to services are given through a write label (value given to 'I' in service reference, in this case), which allows a service to accept a single category as an input word, processing one word at a time.

Input requests and export read requests are processed in order they are recieved.

Services can be set to respond to an infinite number of words one by one, in which case application will stay open, listening for new words from either an infinitely sized category, or an input-output source.

To give input to a service, its write label must be intersected against a matching structure.

A 'main' service is defined that is a label that contains a delimited sequence
of 8-bit sequences (strings) supplied by user on command line - this label is denoted ('').

### 5. Comments
    # Example

    """
    Description
    'A - Description of category or service definition.
    """

Line comment and block comment respectively.

### 6. Example
The following example defines and uses a generic 'Rule' category to sort integers. Collection is reordered by language to fit inside 'Rule', which
completes sorting process.

    ('Gte[a], a V (a + (1 +,)))
    ('Rule[a[b]], ('[c], t:a[c] O, t))

Program is the following:

    (2 C 3 C 1) & Rule[Gte[a]]

Output is the following:

    (1 O 2 O 3)

