### 1. Operations
#### 1.1 Intersection
    'First & 'Second' & 'Third

Used to pose questions about what certain structures are.

Generates a single category that contains only structures all members of
intersection have in common - it is defined for union, sequence, collection, sum, and product categories.

A structure called an unevaluated context may be created in cases where an intersection cannot be proven to halt. Unevaluated contexts can be narrowed by intersecting with other categories, which can make them able to be evaluated.

### 1.2 Application
    'A -> 'B

If left-hand side of application is an instance of right-hand side, evaluates to left-hand side, otherwise raises a contradiction.

Applications can only be used in a test context.

#### 1.3 Sum
    'a + 'b
    2 +,

Used to create custom sum chains for mathematical purposes.

Adds two or more numbers, number categories, or structure categories - concatenates in case of structure categories, but only if category is not infinitely sized. Used to define a sum category. Sum categories that are recursive must not use variables.

#### 1.4 Product
    'a * 'b
    'Structure(3)
    2 *,

Used to create custom product chains for mathematical purposes.

Multiplies two or more numbers or number categories, generates sequence chain for structure categories - defines a product category. Product categories that are infinitely sized must not use variables.

#### 1.5 Quotient
    'a / 'b

Used to create fractions.

Divides two or more numbers or number categories if output would be a whole
number - otherwise, creates a fraction.

#### 1.6 Reference
    A
    A['B]
    (A['B], 'I, ('EA,'EB), ('IA, 'IB))

Indicates that category or service with specified label is to be instantiated at position - this creates an anonymous version of that category or service in the form of:

    ('['A], 'B O 'C)

In this example, first item in category is an anonymous label.

Service references must be called with a write label - this label may be written to in order to make request to service.