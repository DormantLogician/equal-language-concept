### 1. Abstractions
#### 1.1 Negation
    ~'Name

Used to express that output category of an intersection is not an instance of the specified category. Some categories cannot be expressed without negation.

Indicates that structures in category are to be removed from any intersection they are part of.

#### 1.2 Readers and writers
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
