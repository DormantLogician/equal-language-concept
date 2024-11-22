### 1. Abstractions
#### 1.1 Service
    Definition:
        ('Service, 'Input, ('['CurrentState], 'Output), 'BeginState, 'NextState)

    Declaration:
        ('Service, 'Input, 'Output)

Acts as a wrapper for current state information, and how that state and input to service affect new state by using tagged unions - used to express concurrency and processing of user requests. Services accept words at a time of a particular category as arguments, and may produce effects outside program, and/or export data to location within program. Services are run for each word they are given.

Map to output is either a regular category, or a category with a capture that takes current state as argument - used to yield service output upon request to service.

'NextState' must be a subset of capture of 'CurrentState', and becomes 'CurrentState' in next run of service.

Only synchronous writing to, and asynchronous reading from a service is allowed - requests to services are given by intersecting with a write variable (value given to 'Input' in service reference, in this case), which allows a service to accept a category as an input word, processing one word at a time.

Input requests and export read requests are processed in order they are received. Sequences of read requests in queue are combined, and run asynchronously - write requests are processed one at a time.

A 'main' location is defined that that contains a delimited sequence of 8-bit sequences (strings) supplied by user on command line - this variable is denoted ('').

#### 1.2 Negation
    ~A

Used to express that a category is not an instance of a specific category in an intersection - for example:

    A & ~B

In this example, output of intersection is all of category 'A' that is also not 'B'.