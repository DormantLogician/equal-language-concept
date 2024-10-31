### 1. Structures
#### 1.1 Label
    'A
    'A['B]

Used to give names to structure categories so they can be expanded elsewhere - can only be used to store structure categories. Labels may be used to create structure category definitions - they must begin with an uppercase letter. Labels may also be anonymous.

Labels may be defined with a category called a capture, which makes label accept a category as an argument - these labels can deduce to any category definition that accepts a capture matching restrictions defined by the label. Labels with captures may be used to create structure category definitions.

Captures may be used to map categories to other categories, or add/remove
structure from categories - for example:

    ('[('A,)+'B], 'B)

In this example, capture extracts possible values for 'B' from a sequence of 'A'.

Labels are also used as placeholders for locations, which may be written to in order to send output outside of program, and read from in order to continuously draw categories into a service from outside of program, or to enable one service to read from another service's exports.

#### 1.2 Variable
    'a
    'a['b]

Variable from arithmetic - can only store numbers. Variables may also be
anonymous - this is denoted as:

    '['b]

In this example, an anonymous variable that accepts a capture is used.
Variables may have captures just like labels.

Variables are used to create number category definitions - they must begin
with a lowercase letter.

#### 1.3 Integer
    2

Represents a whole number.

#### 1.4 Fraction
    2/3

A number that cannot be interpreted as an integer - these are left unevaluated
until underlying decimal is needed.

#### 1.5 Union
    (('t)'a V 'b) O (('u: 't)'c V 'd)

Needed to express structures that have very specific configurations.

Defines a category that represents more than one possible structure. Union members may be tagged with a label or variable - this label or variable may be used to restrict members of some other union.

Unions define an exclusive-or (XOR) relationship between union members.

Condition tags may be related by either intersection or union - for example:

    (('t)'a V 'b) O
    (('u)'c V 'd) O
    (('v: 't & 'u)'e V 'f)

'e' is only active member of its union if both 'a' and 'c' are active members of their unions.

Tags may be used to indicate that two union members in same category are allowed to be active at same time despite the default exclusive-or relationship - for example:

    (('t)'e V ('u: 't)f)

Both 'e' and 'f' may be active at same time.

Union tags may be anonymous in cases where tag name is unused - for example:

    (('t)'a V 'b) O
    (('u)'c V 'd) O
    ((': 't & 'u)'e V 'f)

#### 1.6 Sequence
    'a O 'b O 'c
    'a O,

Defines an order-sensitive sequence of structures.

#### 1.7 Collection
    'a C 'b C 'c
    'a C,

Defines an unordered collection of structures.

#### 1.8 Readers and writers
    Reader:
    >('Location, 'A, 'OnMemoryFull)

    Writer:
    <('Location, 'A, 'OnMemoryFull)

Read or write to an input/output location, or a service's imports/exports.
This structure acts like a category representing 'A', but category will
either be initially read into, or written to a location after end of intersection
based on whether it is a reader or writer.

Has a clause for an intersection that is executed when memory limit is reached
for locations - may be omitted using a (') as last member of reader or writer.

#### 1.8 Category
    Definition (Structure):
    ('A['a], 1 O 2 O, 'a)

    Definition (Number - stops after specific number of items):
    ('Pow['n O 'p], 'n *, 'n, 'p)

    Declaration:
    ('A['a], Constraint)

    Instance (Structure - finite):
    (1 O 2)

    Instance (Structure - infinite):
    (1 O 2 O,)

Represents numbers and/or structures in language that may be intersected.

Categories may be either finitely or infinitely sized - they have
a label, body, and optional recursive call field respectively.

Categories may be either category definitions, or inline categories - category definitions have a non-anonymous label attached to them like so:

    ('A['a], 1 O 2 O, 'a)

In this example, a category is defined with the label 'A'.

Inline categories are defined with an anonymous label, like so:

    (', 1 O 2 O)
    ('['a], 'a O, 'a + 2)[2]

In second example, category is immediately expanded with '2' as initial argument, which generates a pattern.

Categories may be sum (denoted '+'), product (denoted '*'), union (denoted 'V'),
sequence (denoted 'O'), or collection (denoted 'C') categories.

Number categories that are infinitely sized must contain only one number or number category followed by an infinite sum or product.

Any infinitely-sized category may have a fourth item that denotes stopping at nth structure/number in sequence.

Category definitions may be overloaded, like so:

    (+'A['a], 1 O 2 O 'a)
    (+'A['a O 'b], 'a O 'b)

In this example, label 'A' may be instantiated with either one number, or two numbers - each has a different category body.

If it is unclear which overload must be selected based on argument given to capture,
a union between all overloaded categories instantiated with argument is
created at point of reference.

Inline categories may be tagged with a label, like so:

    ('A:(', 1 O 2 O) O (3 O 'A))

In this example, the same category may be referenced in a different location
in current structure. When category assigned to 'A' changes as result of
an intersection, it is changed in all other positions 'A' is used.

#### 1.9 Service

    Definition:
    ('S, 'I:A, ('EA:B->'D1,'EB:C->'D2), ('IA:D, 'IB:E), ('I & 'F))

    Declaration:
    ('S, 'I:A, ('EA:B,'EB:C), ('IA:D, 'IB:E))

    Instance:
    (', 'I:A, ('EA:B->'D1,'EB:C->'D2), ('IA:D, 'IB:E), ('I & 'F))

Used to express concurrency and processing of user requests.

Has export labels for giving information to other services, and import labels for getting information from other services. Export labels must be specified with a default category
value if they are being created inline.

A service may write to a new location label within it's intersection - in this case,
location is local to service, and may be referred to in subsequent runs of the service.

Only synchronous writing, and asynchronous reading is allowed - requests to services are given through a write label (value given to 'I' in service reference, in this case), which allows a service to accept a single category as an input word, processing one word at a time.

Input requests and export read requests are processed in order they are received.

Services can be set to respond to an infinite number of words one by one, in which case application will stay open, listening for new words from either an infinitely sized category, or a read location.

To give input to a service, it's write label must be written to with a matching category.

All service's users are given a fair opportunity to have their read and write requests fulfilled - this is achieved by serving older users first, and having newer users wait until older ones are done being served. Sequences of read requests in queue are combined, and run asynchronously - write requests are processed one at a time.

A 'main' location is defined that that contains a delimited sequence of 8-bit sequences (strings) supplied by user on command line - this label is denoted ('').
