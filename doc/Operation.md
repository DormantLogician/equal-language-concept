### 1. Operations
#### 1.1 Intersection
    'First & 'Second & 'Third

Used to pose questions about what certain structures are.

The way intersections are processed differs depending on what is being intersected -
for example, sequences are compared side by side, and order and size of sequence
affects whether intersection yields a contradiction or a solution. For collections,
each item in collection checked once against every item on other side of intersection.

Generates a single category that contains only structures all members of intersection have in common - it is defined for union, sequence, collection, and sum categories.

An unevaluated intersection may be created in cases where an intersection cannot be proven to halt. Unevaluated contexts can be narrowed by intersecting with other categories, which can make them able to be evaluated.

#### 1.2 Sum
    'A + 'B + 'C

Concatenates categories.

### 1.3 Application
    'A -> 'B

If left-hand side of application is an instance of right-hand side, evaluates to left-hand side, otherwise raises a contradiction.

Applications can only be used in test contexts - used for assertions in tests.

#### 1.4 Reference
    A
    A['B]
    (A['B], 'Write:C, 'Read:D)

Indicates that category or service with specified variable is to be expanded at position - this creates an anonymous version of that category or service in the form of:

    ('['A], 'B O 'C)

In this example, first item in category is an anonymous variable.

Service references must be called with locations for both writing and reading - these variables may be intersected with in order to make requests to service.