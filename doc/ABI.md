### 1. Application binary interface
Language supports usage of binary code with headers - the implementation of a service and/or category not revealed in this case. The user has access to information about accepted inputs, locations imported from, data stored at exported locations, and respective restraints on import and export locations for services.

For category definitions, category body in implementation file must be a superset of category body in header, so user has access to output structure, with some information about specific category structures removed, if needed.