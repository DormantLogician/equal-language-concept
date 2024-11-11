### 1. Abstractions
#### 1.1 Negation
    ~'Name

Used to express that output category of an intersection is not an instance of the specified category. Some categories cannot be expressed without negation, such as
a prime number category:

('Prime, 'Gte[2] & ~'Composite)

Indicates that structures in category are to be removed from any intersection they are part of.

#### 1.2 Service
    Definition:
    ('Service, 'Input:A, ('Export:B->'Default,'Export2:C->'Default2), ('Import:D, 'Import2:E), 'CurrentState, 'NextState)

    Declaration:
    ('Service, 'Input:A, ('Export:B->'Default,'Export2:C->'Default2), ('Import:D, 'Import2:E))

Acts as a wrapper for current state information, and how that state and input to service affect new state by using tagged unions - used to express concurrency and processing of user requests. Services accept words at a time of a particular category as arguments, and may produce effects outside program, and/or export data to location within program. Services are run for each word they are given.

'NextState' must be a subset of 'CurrentState', and becomes 'CurrentState' in next
run of service.

Exports may reference items in 'NextState' in order to deduce what is exported.

Has export labels for giving information to other services, and import labels for getting information from other services. Export labels must be specified with a default category
value if they are being created inline.

Only synchronous writing to, and asynchronous reading from a service is allowed - requests to services are given by intersecting with a write label (value given to 'Input' in service reference, in this case), which allows a service to accept a category as an input word, processing one word at a time.

Input requests and export read requests are processed in order they are received.

All service's users are given a fair opportunity to have their read and write requests fulfilled - this is achieved by serving older users first, and having newer users wait until older ones are done being served. Sequences of read requests in queue are combined, and run asynchronously - write requests are processed one at a time.

A 'main' location is defined that that contains a delimited sequence of 8-bit sequences (strings) supplied by user on command line - this label is denoted (''').