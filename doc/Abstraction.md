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
    ('S, 'I:A, ('EA:B->'D1,'EB:C->'D2), ('IA:D, 'IB:E), 'I & 'F)

    Declaration:
    ('S, 'I:A, ('EA:B,'EB:C), 'IA:D, 'IB:E)

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

A 'main' location is defined that that contains a delimited sequence of 8-bit sequences (strings) supplied by user on command line - this label is denoted (''').