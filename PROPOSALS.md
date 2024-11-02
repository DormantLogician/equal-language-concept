### 1. Unlimited recursion
Language would have ability to explicitly express algorithms that are designed to stop running, but cannot be proven to, in attempt to make language turing-complete, if it isn't already.

### 2. Code reification
Adjustable optimization for performance, memory usage, binary size, power efficiency, and/or ABI stability.

Supports optimizing specific code to prioritize one or more non-functional properties. Machine code can be generated that has the following traits:

- Fixed worst-case performance
- Data-agnostic performance        (Execution time not affected by input data - for prevention of side-channel attacks)

Language is both similar to an array programming language, and is not primarily algorithm-based, so this feature may be required in order to meet specific non-functional requirements.

### 3. C/C++ interoperability

Ability to import and use C and/or C++ headers as modules, and use Equal modules as C or C++ headers.

### 4. Application binary interface code operations
On compilation, all modified subsystem '.eqs' files are updated with information about
ABI - on subsequent compilations, compiler refers to current '.eqs' files, present
changes to developer's source code, and selected compiler flags in order to suggest
one or more of the following tasks:

- Extend    (new parts of subsystem interface have been added)
- Deprecate (parts of subsystem interface have been deprecated by developer)
- Revive    (deprecated parts of subsystem interface have been revived by developer)
- Patch     (changes have been made to code that do not affect ABI)
- Retract   (Developer has removed parts of subsystem interface)
- Break     (Developer has modified existing parts of subsystem interface - don't fork)
- Fork      (Developer has modified existing parts of subsystem interface)

Supports version tagging in case of 'Retract', 'Fork' and 'Break' tasks,
because they affect the ABI.

This provision is designed to protect libraries against unintended changes to ABI.

### 5. Functions
    ('Input, 'Stop, Step1['Input] C Step2:('Input & 'A))

Executes any number of operations any number of times, and/or other functions in a way that eventually outputs 'Stop' - functions are relatable with both operations, and other functions, and can be composed to produce a higher-level function. All functions must either net-reduce or net-expand 'Input' into 'Stop'. Shortest path to 'Stop' is used, using least number of operations to reach 'Stop' for all 'Input'.