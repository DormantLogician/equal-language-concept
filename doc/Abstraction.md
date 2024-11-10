### 1. Abstractions
#### 1.1 Negation
    ~'Name

Used to express that output category of an intersection is not an instance of the specified category. Some categories cannot be expressed without negation, such as
a prime number category:

('Prime, 'Gte[2] & ~'Composite)

Indicates that structures in category are to be removed from any intersection they are part of.

#### 1.2 Readers and writers
    Reader:
    >('Location, 'A, 'OnMemoryFull)

    Writer:
    <('Location, 'A, 'OnMemoryFull)

Read or write to an input/output location, or a service's imports/exports.
This structure acts like a category representing 'A', but category will
either be initially read into, or written to a location after end of intersection
based on whether it is a reader or writer respectively.

Has a clause for an intersection that is executed when memory limit is reached
for locations - may be omitted using a (') as last member of reader or writer.

#### 1.3 Service
    Definition:
    ('S, 'I:A, ('EA:B->'D1,'EB:C->'D2), ('IA:D, 'IB:E), 'CurrentState, 'NextState)

    Declaration:
    ('S, 'I:A, ('EA:B,'EB:C), 'IA:D, 'IB:E)

Acts as a wrapper for current state information, and how that state and input to service affect new state by using tagged unions - used to express concurrency and processing of user requests. Services accept words at a time of a particular category as arguments, and may produce effects outside program, and/or export data to location within program. Services are run for each word they are given.

'NextState' must be a subset of 'CurrentState', and becomes 'CurrentState' in next
run of service.

Has export labels for giving information to other services, and import labels for getting information from other services. Export labels must be specified with a default category
value if they are being created inline.

Only synchronous writing to, and asynchronous reading from a service is allowed - requests to services are given through a write label (value given to 'I' in service reference, in this case), which allows a service to accept a single category as an input word, processing one word at a time.

Input requests and export read requests are processed in order they are received.

Services can be set to respond to an infinite number of words one by one, in which case application will stay open, listening for new words from either an infinitely sized category, or a read location.

To give input to a service, it's write label must be written to with a matching category.

All service's users are given a fair opportunity to have their read and write requests fulfilled - this is achieved by serving older users first, and having newer users wait until older ones are done being served. Sequences of read requests in queue are combined, and run asynchronously - write requests are processed one at a time.

A 'main' location is defined that that contains a delimited sequence of 8-bit sequences (strings) supplied by user on command line - this label is denoted (''').