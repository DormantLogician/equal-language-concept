### 1. Testing
#### 1.1 Test context
Test source file is interpreted as a standalone application that imports and uses modules
from project - all code in this file (module.eqt/subsystem.eqt) is executed in a test context, which makes code run differently than under normal context, as described below.

#### 1.2 Read and write locations
In test context, structures that determine when a particular write is executed or not are included in write to that location - this is so developer can test whether correct data is written to location, and under intended conditions. Both structures that contributed to the union being selected that reader/writer was in, and value being written (if a variable to it doesn't exist somewhere else in structure) are included in this structure.

Writes within unions will execute in a test context in order to provide information about what is written, and when to developer. Test context fails if any read/write never executes, based on configuration of structure.

#### 1.3 Services
Test context ends once all assertions are finished running - even if services are attached to continuous sources of input. All possible outputs a service can produce must be tested - labels and/or variables can be used as placeholders in cases where less verification is needed.