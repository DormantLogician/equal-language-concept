### 1. Testing
#### 1.1 Read and write locations
In test context, structures that determine when a particular write is executed or not are included in write to that location - this is so developer can test whether correct data is written to location, and under intended conditions.

Writes within unions will execute in a test context in order to provide information about what is written, and when to the developer. Test context fails if any read/write never executes.

#### 1.2 Automatic test file generation
If a test file doesn't exist already for a particular module, it is generated, having same file name as source and/or header files for that module - file is used to describe what services designed by developer output, and when. File is meant to be generated and checked by developer initially, then modified to add extended or reduced scope of testing by the developer, if needed. Tests are always executed against services described in module at run time, after compilation. File can be generated even if source for module is not available, but data about when particular output is produced is not available in that case.

#### 1.3 Services
Test context ends once all assertions are finished running - even if services are attached to continuous sources of input. All possible outputs a service can produce must be tested - placeholders can be used in cases where less verification is needed.