### 1. Undecidable recursion
Language would have ability to explicitly express algorithms that are designed to stop running, but cannot be proven to, in attempt to make language Turing-complete, if it isn't already.

### 2. Code reification
Adjustable optimization for performance, memory usage, binary size, power efficiency, and/or ABI stability.

Supports optimizing specific code to prioritize one or more non-functional properties. Machine code can be generated that has the following traits:

- Fixed worst-case performance
- Data-agnostic performance        (Execution time not affected by input data - for prevention of side-channel attacks)
- Fixed maximum memory usage

Language is both similar to an array programming language, and is not primarily algorithm-based, so this feature may be required in order to meet specific non-functional requirements.

Supports representations of:

- Pointers (no matching language representation)
- Integers and floating points
- Ranges (as structures and functions)
- Categories (as structures)
- Intersections and functions (as functions)
- Services (as structures and functions)

Functions support Store, Load, New, Delete, Compare, Switch, While, Break, and Call operations.

Services are represented as if expressed within an agent-oriented programming language.

### 3. C/C++ interoperability

Ability to import and use C and/or C++ headers as modules, and use Equal modules as C or C++ headers.

### 4. Application binary interface code operations

Compilers refer to a subsystem's '.equalmodule' file, changes to developer's source code, and selected compiler flags in order to read state of current ABI, and suggest one of the following tasks:

- Extend    (new parts of subsystem interface)
- Deprecate (deprecated parts of subsystem interface)
- Revive    (deprecated parts of subsystem interface that are revived)
- Patch     (changes to code that do not affect ABI)
- Retract   (removal of parts of subsystem interface)
- Fork      (modifications to existing parts of subsystem interface)

Breaking changes may also be made by using 'Break' task when requested.

Supports version tagging in case of 'Retract', 'Fork' and 'Break' tasks,
because they affect the ABI.

### 5. Functions
    ('Input, 'Stop, Step1['Input] C Step2:('Input & 'A))

Executes any number of operations any number of times, and/or other functions in a way that eventually outputs 'Stop' - functions are relatable with both operations, and other functions, and can be composed to produce a higher-level function. All functions must either net-reduce or net-expand 'Input' into 'Stop'. Shortest path to 'Stop' is used, using least number of operations to reach 'Stop' for all 'Input'.
