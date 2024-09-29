### 1. Intersections
    'A and 'B                                                                                                       Intersection of categories.
    (import: 'Import)(export: 'Export)('A and 'B) and (import: 'Import2)(export: 'Export2)('C and 'D)               Intersection of services.

A program that is used to locate an object of interest - intersections are designed to stop running in all cases. Differences between all terms in intersection are removed until all terms are the same, or an incompatibility is found.

Intersections can produce either a solution, where a single term is output, or a contradiction, which indicates that no solution exists.

If a templated recursive category, and any other categories are intersected, removing differences between them may cause generation loss in subsequent recursive calls in recursive category due to terms that are reduced by intersection being passed to subsequent calls via template parameter - this eventually results in all recursive calls becoming the same, which outputs a single recursive category that repeats previous structures indefinitely, or being different, which removes the call, and outputs a non-recursive category.

Intersections create an unevaluated context in cases where language cannot discern whether they will stop running or not given all existing context - these intersections can become evaluated if they attain additional context from other intersections, or intersections they become part of.

Unevaluated contexts are created when appending an item to a recursive collection,
and intersecting with another recursive collection, since it is not known if item will be found at some point, and in cases where an intersection containing one or more negated categories cannot be evaluated as a single category.

For intersection of two or more services, all used exports and imports are preserved - intersections contained within all services are both unevaluated, and linked to form body of output service. Input readers for all intersected services are set to same location, and signature of input reader is set to a sequence of signatures of all service input readers in intersection. Intersecting a category with a service outputs a category. Two or more services may be intersected, then assigned to a service label only if it has a matching signature. Services created within a category cannot be run - only intersected.

For intersection of two or more quantity categories, all placeholders are deduced based on context, using either multiplication or addition, and intersection is reduced to an equality between two or more of same quantity.

### 2. Applications
    'A is 'B                                                                          Application of categories.
    (import: 'I1)(export: 'E1)('A and 'B) is (import: 'I2)(export: 'E2)('C and 'D)    Application of services.

If left-hand side of application is an instance of right-hand side, evaluates to left-hand side, otherwise raises a contradiction.

### 3. Sums
    'A + 'B        Sum of categories.

Concatenates two or more categories - they are combined into a single category that contains all items in all categories from left to right. For quantities and quantity categories, calculates sum.

### 4. Differences
    'A - 'B        Difference between two or more quantity categories.

Calculates difference.

### 5. Products
    'A * 'B        Product of quantity categories.
    'A(2)          Product of collection categories.

Calculates product, or generates sequence of a collection category.

### 6. Quotients
    'A / 'B        Quotient of two or more quantity categories.

Calculates quotient.

### 7. Negations
    ~A             Negated category.

Indicates that structures in this category must be removed from all terms in any intersection that includes it, making output of intersection not an instance of this category.

In an intersection, if two or more negated categories are the same, only first one is kept. Intersection of at least two different negated categories remains unevaluated until it is intersected with a non-negated category.

### 8. Destructuring/restructuring integers

    (')<(int)('A)               Destructure integer (Deduced number of bits).
    (8)<(int)('A)               Destructure integer (Truncated to specific number of bits).
    (')>('A or 'A(2))(8)        Restructure integer (Deduced number of bits).
    (8)>('A or 'A(2))(8)        Restructure integer (Truncated to specific number of bits).

Destructuring an integer converts it into a sequence of bits representing integer value. For arbitrarily-sized integers, a minimum number of bits equal to number of bits in 'intmin' type are used, and maximum number of bits is arbitrary.

Restructuring converts a sequence of bits into an integer.

