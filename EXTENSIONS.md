### 1. De-structuring/restructuring integers
    De-structure integer:
    <'n

    Restructure integer:
    >'n

Sometimes, it is necessary to interpret an integer as a sequence of bits or
vise-versa.

De-structuring an integer converts it into a sequence of bits representing integer value, where 'A(2) represents '0' and 'A(3) represents '1'. A minimum of 8 bits are used to
represent integer, and maximum number of bits is arbitrary.

Restructuring converts a sequence of bits into an integer.

### 2. String
    "Hello, world!"

A sequence of 8-bit characters - 'A(2) represents '0', and 'A(3) represents '1'.

### 3. Fallbacks and Header groups
#### 3.1 Fallbacks
    First implementation:
        ('Service, 'Input:A, ('Export:B->'Default,'Export2:C->'Default2), ('Import:D,
    'Import2:E), 'CurrentState, 'NextState)

    Second implementation.
        ('Service, 'Input:A, ('Export:B->'Default,'Export2:C->'Default2), ('Import:D,
    'Import2:E), 'CurrentState2, 'NextState2)

Category and service implementations can be overloaded to provide a
fallback in case certain language features are missing. In the case
where an implementation cannot compile, it tries to find one that
does, and uses that one instead.

#### 3.2 Header groups
    Header group definition:
    ('Unix: "first.eqh","second.eqh")

    Tagged declaration:
        ('Unix,'Windows):('Service, 'Input:A, ('Export:B->'Default,'Export2:C->'Default2),
    ('Import:D, 'Import2:E))

    First tag definition:
        ('Unix):('Service, 'Input:A, ('Export:B->'Default,'Export2:C->'Default2),
    ('Import:D,'Import2:E), 'CurrentState, 'NextState)

    Second tag definition.
        ('Windows):('Service, 'Input:A, ('Export:B->'Default,'Export2:C->'Default2),
    ('Import:D, 'Import2:E), 'CurrentState2, 'NextState2)

Like fallbacks, but declarations and definitions must be tagged with a group of headers that can be used to select implementations depending on platform-dependent features. If multiple header group tags on a declaration or definition are possible to select, the first one is always selected over the others. There is one tagged implementation for each header group tag attached to its declaration. Header group definitions are not exported from headers.
