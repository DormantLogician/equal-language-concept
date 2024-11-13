### 1. Unlimited recursion
Language would have ability to explicitly express algorithms that are designed to stop running, but cannot be proven to, in attempt to make language turing-complete, if it isn't already.

### 2. Code reification
Adjustable optimization for performance, memory usage, binary size, power efficiency, and/or ABI stability.

Supports optimizing specific code to prioritize one or more non-functional (not related to correctness of output) properties. Machine code can be generated that has the following traits:

- Data-agnostic performance     (Execution time not affected by input data - for prevention of side-channel attacks)

The following service statistics are tracked - if they are high for a specific service, it increases performance of that service (limited by available resources):

- Input request cost    (Measurement of how expensive it is to fulfill a request for a particular service)
- Business              (Average rate new requests are being made to a service)
- Priority percentage   (Offset that prioritizes some services receiving more resources than others - set manually)

Language is not primarily algorithm-based, so this feature may be required in order to meet specific non-functional requirements.

### 3. C/C++ compatibility
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

#### 5. Automatic test file generation
If a test file doesn't exist already for a particular module, it is generated, having same file name as source and/or header files for that module - file is used to describe what services designed by developer output, and when. File is meant to be generated and checked by developer initially, then modified to add extended or reduced scope of testing by the developer, if needed. Tests are always executed against services described in module at run time, after compilation. File can be generated even if source for module is not available, but data about when particular output is produced is not available in that case.