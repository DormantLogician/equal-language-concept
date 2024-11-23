### 1. Abstractions
#### 1.1 Introduction
Abstractions are objects that add context to an existing object in order to change the
way it is processed.

#### 1.2 Service
    Definition:
        ('Service, 'Input:A, ('['CurrentState], 'Output), 'BeginState, 'NextState)

    Declaration:
        ('Service, 'Input:A, 'OutputConstraint)

Acts as a wrapper for current state information, and how that state and input to service affect new state by using tagged unions - used to express concurrency and processing of user requests. Services accept words at a time of a particular category as arguments, and may produce effects outside program, and/or export data to location within program. Services are run for each word they are given.

Map to output is either a regular category, or a category with a capture that takes current state as argument - used to yield service output after request to service.

'NextState' must be a subset of capture of 'CurrentState', and becomes 'CurrentState' in next run of service.

Only synchronous writing to, and asynchronous reading from a service is allowed - requests to services are given by intersecting with a write variable (value given to 'Input' in service reference, in this case), which allows a service to accept a category as an input word, processing one word at a time.

Input requests and read requests are processed in order they are received. Sequences of read requests in queue are combined, and run asynchronously - write requests are processed one at a time.

A 'main' location is defined that that contains a delimited sequence of 8-bit sequences (strings) supplied by user on command line - this variable is denoted ('').

#### 1.3 Variable
    'A
    'A['B]

Used to give names to categories so they can be expanded elsewhere, or as a placeholder for a structure that is unknown, but may be deduced from the context of an intersection. Variables may be used to create category definitions.

Variables may also be anonymous - this is denoted:

    '['B]

In this example, an anonymous variable that accepts a capture is used.

Variables may be defined with a category called a capture, which makes variable accept a category as an argument - these variables can deduce to any category definition that accepts a capture matching restrictions defined by the variable. Variables with captures may be used to create category definitions.

Captures may be used to map categories to other categories, or add/remove
structure from categories - for example:

    ('['A O 'B], 'B)

In this example, capture extracts value of 'B'.

Variables are also used as placeholders for locations, which may be intersected with in order to send output outside of program and/or store categories locally, and/or read from in order to continuously or non-continuously draw categories into a service from outside of program or to enable one service to read from another service's exports.

#### 1.4 Negation
    ~A

Used to express that a category is not an instance of a specific category in an intersection - for example:

    A & ~B

In this example, output of intersection is all of category 'A' that is also not 'B'.