### 1. Organization
#### 1.1 Components
    Source:
    module.eq

    Header:
    module.eqm

    Test source:
    module.eqt
    subsystem.eqt

    Subsystem root:
    subsystem.eqs

#### 1.2 Modules
    Module Import:
    (A:B)<-".EXTERN/ETP9nJHVUVh20LjhmD9E/module.eqm"

    Module Import (Optional - C/C++ header):
    (A:B)<-".EXTERN/module.h"

    Module definition or alias:
    (A:B)

    Category label reference bound by module alias:
    (A:B):'C

    Service label reference bound by module alias:
    (A:B):(C['D], 'W, ('EA,'EB), ('IA, 'IB))

Used to organize code into sections.

At top of both source and header, a module definition must be specified - this acts as an identifier for a module that is imported in other modules. Importer must define an alias for all imported modules. Aliases are only used when refering to code from a different module. Modules imported by a separate module are not exported.

#### 1.3 Subsystems
Example subsystem configuration - subsystem root, and identifier contents respectively:

    subsystem.eqs
    "ETP9nJHVUVh20LjhmD9E"

Used for distribution of a module or set of modules.

Subsystems are a collection of modules - they are indicated by the configuration component '.eqs' at the root of subsystem - name defines a unique identifier for subsystem, and indicates that all modules from the root down, excluding modules that are parts of other subsystems, are part of this subsystem. When compiler is run, all subsystems in project are registered recursivly from the top down. Subsystems installed on system are detected, and made available to project.

Subsystems are tagged with a randomly generated identifier of 20 characters containing only letters and/or numbers - this identifier disambiguates the includes of one module from another, even if headers have the same names.

#### 1.4 Include paths
    Represents modules in system PATH:
    .EXTERN

    Represents modules in this project:
    .SUBSYS

    Example of path to system module:
    ".EXTERN/ETP9nJHVUVh20LjhmD9E/module.eqm"

    Example of path to module in current project:
    ".SUBSYS/ETP9nJHVUVh20LjhmD9E/module.eqm"

#### 1.5 Comments
    # Example

    """
    Description
    'A - Description of category or service definition.
    """

Line comment and block comment respectively.
