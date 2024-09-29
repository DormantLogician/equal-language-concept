### 1. Labels
#### 1.1 Category
    (A: 'B)                           Category label (Non-recursive).
    (A: 'B then next)                 Category label (Recursive).
    ['A](B: 'A)                       Category label (With template category, Non-recursive).
    ['A](B: 'C then next['A])         Category label (With template category, Recursive).

Description of a category - instantiates anonymous categories by expanding 'B or 'B['A].

#### 1.2 Service
    ('Word: 'T)(import: 'Import:'T)(export: 'Export:'T2)(A: 'C and 'D)        Service label.
    ['U]('Word: 'T)(import: 'Import:'T)(export: 'Export:'T2)(A: 'C and 'D)    Service label (with template category).

Description of a service - instantiates an anonymous service by expanding 'A' or 'A['U].

#### 1.3 Overloading
    +['A](B: 'A)                   First overload.
    +['A then 'B](C: 'A then 'B)   Second overload.

In cases where a label must be instantiatable with different kind or amount of
template parameters, it can be overloaded by placing a '+' before the template
argument lists in one or more label definitions - this makes it possible for
the label's template argument to instantiate different label definitions.

If it is unclear which overload must be selected based on template argument,
a union between all overloaded categories instantiatable with argument is
generated.

### 2. Fallbacks and Header groups
#### 2.1 Fallbacks
    ('Word: 'T)(import: 'Import:'U)(export: 'Export:'U2)('Service: 'A and 'B)      First implementation.
    ('Word: 'T)(import: 'Import:'U)(export: 'Export:'U2)('Service: 'C and 'D)      Second implementation.

Category and service implementations can be overloaded to provide a
fallback in case certain language features are missing. In the case
where an implementation cannot compile, it tries to find one that
does, and uses that one instead.

#### 2.2 Header groups
    ('Unix: "first.eqh","second.eqh")                                                      Header group definition.

    ('Unix,'Windows)('Word: 'T)(import: 'Import)(export: 'Export)(Service)                 Tagged declaration.

    ('Unix)('Word: 'T)(import: 'Import: 'T)(export: 'Export: 'T2)(Service: 'A and 'B)      First tag definition.

    ('Windows)('Word: 'T)(import: 'Import: 'T)(export: 'Export: 'T2)(Service: 'A and 'B)   Second tag definition.

Like fallbacks, but declarations and definitions must be tagged with a group of headers that can be used to select implementations depending on platform-dependent features. If multiple header group tags on a declaration or definition are possible to select, the first one is always selected over the others. There is one tagged implementation for each header group tag attached to its declaration. Header group definitions are not exported from headers.

### 3. Project structure
#### 3.1 Components
    module.eq       Source.
    module.eqh      Header.
    module.eqt      Test source.
    .equalmodule    Subsystem root.

#### 3.2 Modules
    (A)(B)<-".EXT/ETP9nJHVUVh20LjhmD9E/module.eqh"                  Module Import.
    (A)(B)<-".EXT/module.h" (OPTIONAL)                              Module Import (C/C++ header).
    (A)(B)                                                          Module definition or alias.
    (A)(B)'C                                                        Category label reference bound by a module alias.
    (A)(B)'C('Location)(import: 'Import)(export: 'Export)           Service label reference bound by module alias.

At top of both source and header, a module definition must be specified - this acts as an identifier for a module that is imported in other modules. Importer must define an alias for all imported modules. Aliases are only used when refering to code from a different module. Modules imported by a module are not exported.

#### 3.3 Subsystems
    .equalmodule     "ETP9nJHVUVh20LjhmD9E"     Example subsystem configuration - subsystem root, and identifier contents respectively.

Subsystems are a collection of modules - they are indicated by the configuration component '.equalmodule' at the root of subsystem - name defines a unique identifier for subsystem, and indicates that all modules from the root down, excluding modules that are parts of other subsystems, are part of this subsystem. When compiler is run, all subsystems in project are registered recursivly from the top down. Subsystems installed on system are detected, and made available to project.

Subsystems are tagged with a radomly generated identifier of 20 characters containing only letters and/or numbers - this identifier disambiguates the includes of one module from another, even if headers have the same names.

#### 3.4 Include paths
    .EXT                                                Represents modules in system PATH.
    .SUB                                                Represents modules in this project.
    ".EXT/ETP9nJHVUVh20LjhmD9E/module.eqh"              Example of path to system module.
    ".SUB/ETP9nJHVUVh20LjhmD9E/module.eqh"              Example of path to module in this project.

### 4. Comments
    # Example                                           Line comment.

    """                                                 Block comment.
    Description
    'A - Item description
    """

