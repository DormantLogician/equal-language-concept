### 1. Categories
    ('A then 'B)                       Category (Non-recursive).
    ('A then next)                     Category (Recursive).
    ['T]('A then 'B)                   Category (With template category, Non-recursive).
    ['T]('A then next['A])             Category (With template category, Recursive).

Categories are structures that can be operated on by intersections - new categories can be made from two or more existing ones this way, which lets developers pose questions about what a particular object is without knowing its exact configuration.

Categories can be union (denoted 'or'), composition (denoted 'then'), combination (denoted 'with'), sum (denoted '+'), difference (denoted '-'), product (denoted '*'), or quotient (denoted '/') categories, which affect how category is interpreted by an intersection.

Categories may be either quantity categories or collection categories depending on
whether they are an arithmetic relation between quantities or quantity categories or not.

Recursive categories self-instantiate at position of keyword 'next' at end of category -
call to next may take template category as argument if category is a template.

Quantity categories that are recursive must have only a single quantity or quantity
category followed by 'next', related by an arithmetic operator.

Template categories may be created inline - for example:

    ['T]['U]('A then 'B)

This template category is immediately invoked with 'T.

### 2. Grammars, syllables, and letters
    "a"                                                 Letter.
    (FirstSyllable: "b" then "c")                       Syllable.
    ["1.2.3"](GrammarName:
         (FirstSyllable or SecondSyllable) then next)   Grammar.

Grammars are categories that are used to describe data that must be of a specific format -
they are used to enable safe manipulation of text data according to rules of a specific
data language.

Grammars are made up of only syllables - they can be overloaded with different versions of a specific grammar. Grammar versions follow a semantic versioning system. Intersection of a grammar with another category, grammar, or syllable tries to use latest versions of grammars that solve intersection.

Categories are considered syllables or grammars when they contain only letters
such as "a". A letter is only equal to itself, and can be used to build syllables.

Letters can only be used outside of syllables and grammars if they are within an inline category that is intersected with a grammar.

Syllables are either one letter, or a sequence of letters that represents a word in a grammar.

### 3. Strings
    "Hello, world!"     String.

Strings are sequences of letters - they must be assigned at least one grammar where they are used. For example:

    PlaintextGrammar and "Hello, world"

If string can be represented as a plaintext, it is expanded into specific instance of the plaintext grammar.

### 4. Services
    (import: 'Import)(export: 'Export)('A and 'B)            Service.
    ['T](import: 'Import)(export: 'Export)('A and 'B)        Service (with template category).

#### 4.1 Inputs
Users of a service must write an input word to a service's input location to make a request - service runs its intersection, using the input, any data from imports, and private locations in order to determine what is exported. Services can take input continuously or non-continuously, and only react to inputs of a fixed word size at a time, with words of only non-recursive categories, and running its intersection for each word, however many there are. If a service's input reader is declared as non-halting, the writer used to make request to service must also be declared as non-halting, for making intention to not halt explicit.

Services will wait until all services are initialized before accepting requests.

A recursive category may be written to input reader of a service - this causes service to process each word indefinitely, but only if both writer is declared non-halting, and service is capable of accepting non-halting inputs.

Services can send a 'busy' signal to a reader/writer if queue is full, making caller responsible for retrying request.

#### 4.2 Imports, exports, and states
Services must declare imports in order to read from an external location, and exports in order to write to an external location. Locations may be created inside body of service, and are private to service they are inside of - they can store information meant to be used in future requests to service. All locations on interface of service must have a placeholder constraint. Services cannot import their own input location in order to prevent unintended infinite recursion.

#### 4.3 Communication
While a service is fulfilling a request, it cannot fulfill any other requests, or be read from by any other service. When a service's exports are being read from by at least one user, service cannot fulfill any requests.

#### 4.4 Time-sharing
All service's users are given a fair opportunity to have their read and write requests fulfilled - this is achieved by serving older users first, and having newer users wait until older ones are done being served. Sequences of read requests in queue are combined, and run asynchronously - write requests are processed one at a time.

If queue reaches memory limit, user services must retry requests manually, and service doesn't add to the queue until more memory becomes available.

### 5. Quantities
    intmin(2)
    intless(2)
    int(2)
    intmore(2)
    intmax(2)
    intany(2)                           Integer '2'.

    dec(1.5)
    decmax(1.5)
    decany(1.5)                         Decimal '1.5'

    (int(2))(int(2))                    Multiply Integer by Integer
    (dec(1.5))(dec(1.5))                Multiply Decimal by Decimal
    (int(2))(dec(1.5))                  Multiply Integer by Decimal

Integers represent a number of the unit '1' - both integers and decimals may only be added and/or multiplied. Both bounded, and arbitrary-sized decimals and integers are defined - exact sizes of bounded decimals and integers depend on specific platform and implementation.

Decimals represent a quantity that can either be a whole number, or a fraction.

Both number type and/or quantity can be deduced from context of an intersection.

Both negative numbers, and a representation of number '0' are supported.

### 6. Functions
    ('Input to 'Stop with 'Step1['Input] with 'Step2: ('Input and 'U))  Function.

Executes any number of operations any number of times, and/or other functions in a way that eventually outputs 'Stop' - functions are relatable with both operations, and other functions, and can be composed to produce a higher-level function. All functions must either net-reduce or net-expand 'Input' into 'Stop' - this is verified at compile time. Shortest path to 'Stop' is used, using least number of operations to reach 'Stop' for all 'Input'.

### 7. Placeholders
    a                                                 Variable
    'A                                                Category placeholder (Compile-time generic).
    *A                                                Category placeholder (Runtime generic).
    'A['B]                                            Category placeholder (Templated, Compile-time generic).
    *A['B]                                            Category placeholder (Templated, Runtime generic).
    (import: 'Import)(export: 'Export)('Service)      Service placeholder (Compile-time generic).
    (import: 'Import)(export: 'Export)(*Service)      Service placeholder (Runtime generic).
    ['A](import: 'Import)(export: 'Export)('Service)  Service placeholder (Templated, Compile-time generic).
    ['A](import: 'Import)(export: 'Export)('Service)  Service placeholder (Templated, Runtime generic).

    int('B)                    Quantity placeholder.

Placeholders represent an unknown structure that may be deduced from the context of an intersection - placeholders can be used to pose questions about what a particular structure can be, and can be extracted from a template.

Placeholder names must begin with a capital letter to distinguish from variables. Variables must have a name that is a single lowercase letter - they have same behavior as a non-templated category placeholder, and are scoped to category they are inside of just like category placeholders.

Placeholders make it possible to reverse some algorithms, enabling ability to attain the original input. Placeholders exist for categories, quantities, and services.

Placeholders may be added or subtracted (for quantity categories only), multiplied, or divided (for quantity categories only). For example, the following placeholder represents a category containing three structures related though sequence composition:

    'A(3)

Templated category placeholders can only be intersected with another templated placeholder that matches specified template signature.

Also, category placeholders can be constrained and/or used to give a name to a specific category so it can be placed in multiple locations - for example:

    ['A: 'B]('A)

Template given as argument to 'A' must always be an instance of 'B'

### 8. Compositions
    ('A then 'B)          Composition category.
    ('A then next)        Composition category (Recursive).

Categories that relate their members through composition are intersected in order from left to right - infinite compositions are supported.

### 9. Combinations
    ('A with 'B)          Combination category.
    ('A with next)        Combination category (Recursive).

Categories that relate their members through combination are not sensitive to order. Infinite combinations are supported.

Intersection of combination categories may output tagged unions that describe which structures can be where, and when.

### 10. Unions
    ('A or 'B)          Union category.

Categories that relate their members by union are intersected in such a way that each member of union is intersected with other terms in intersection. If multiple union categories are intersected, each term in each union is intersected with all all other terms.

Unions may be tagged so a member of one union can only be active if one or more members of another union are active - in the example:

    ((('T of 'A) or 'B) then (('C if 'T) or 'D))

'C' can only be active in second union if 'A' is active in first union.

Conditions may use intersection and/or union relations - for example:

    ((('T of 'A) or 'B) then (('U of 'C) or 'D) then (('E if 'T or 'U) or 'F))

'E' is only active member of last union if 'A' and 'C' are active members of
their unions.

Recursive unions are not supported.

### 11. Equalities
    ('A = 'B)

Two categories that are compared in an arbitrary way. Operations may be performed on
equalities as if they were a single category, and allow operations to be performed
on either side, or both sides - for example:

    ('A = 'B) + (2, ')

This generates a new equality where 'A' is increased by '2', and 'B is the same.

