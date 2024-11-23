### 1. Unlimited recursion
Language would have ability to explicitly express algorithms that are designed to stop running, but cannot be proven to, in attempt to make language turing-complete, if it isn't already.

### 2. Code reification
Adjustable settings for performance, memory usage, binary size, power efficiency, ABI stability, and other non-functional (not related to correctness) properties.

The following service statistics are tracked - if they are high for a specific service, it increases performance of that service (limited by available resources):

- Input request cost    (Measurement of how expensive it is to fulfill a request for a particular service)
- Business              (Average rate new requests are being made to a service)
- Priority percentage   (Offset that prioritizes some services receiving more resources than others - set manually)

Language is not primarily algorithm-based, so this feature may be required in order to meet specific non-functional requirements.

### 3. C/C++ compatibility
Ability to import and use C and/or C++ headers as modules, and use Equal modules as C or C++ headers.

### 4. Application binary interface fingerprinting
On compilation, all modified subsystem '.eqs' files are updated with information about
ABI - on subsequent compilations, compiler refers to current '.eqs' files, present
changes to developer's source code, and selected compiler flags in order to suggest
one or more of the following tasks:

- Patch     (changes have been made to code that do not affect ABI)
- Extend    (new parts of subsystem interface have been added)
- Retract   (developer has removed parts of subsystem interface)
- Revive    (deprecated parts of subsystem interface have been revived by developer)
- Deprecate (parts of subsystem interface have been deprecated by developer)
- Fork      (developer has modified existing parts of subsystem interface)
- Break     (developer has modified existing parts of subsystem interface - don't fork)

Supports version tagging in case of 'Retract', 'Fork' and 'Break' tasks, and/or changes to compiler/operating system/compiler flags because they affect the ABI.

This provision is designed to protect libraries against unintentional changes to ABI, and to enable ABI versioning for different compilers and operating systems.

#### 5. Automatic test file generation
If a test file doesn't exist already for a particular module, it is generated, having same file name as source and/or header files for that module - file is used to describe what services designed by developer output, and when. File is meant to be generated and checked by developer initially, then modified to add extended or reduced scope of testing by the developer, if needed. Tests are always executed against services described in module at run time, after compilation. File can be generated even if source for module is not available, but data about when particular output is produced is not available in that case.