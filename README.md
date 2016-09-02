# SwiftReflection
Retrieve name and type of properties for a class that inherits from NSObject. You do not need an instance of said class.

# Usage
SwiftReflection relies on the Objectice-C method `class_copyPropertyList` to fetch names and types of a class that inherits from NSObject. If you create some `Book` class
```
class Book: NSObject {
    let title: String
    let author: String?
    let numberOfPages: Int
    let released: Date
    let isPocket: Bool

    init(title: String, author: String?, numberOfPages: Int, released: Date, isPocket: Bool) {
        self.title = title
        self.author = author
        self.numberOfPages = numberOfPages
        self.released = released
        self.isPocket = isPocket
    }
}
```

Swift reflection can inspect the five properties of this class using the class method `getTypesOfProperties:inClass`. The following code that inspects properties of the class `Book` results in the commented print below:
```
guard let types = SwiftReflection.getTypesOfProperties(inClass: Book.self) else { return }
for (name, type) in types {
  print("'\(name)' has type '\(type)'")
}
// Prints:
// 'title' has type 'NSString'
// 'numberOfPages' has type 'Int'
// 'author' has type 'NSString'
// 'released' has type 'NSDate'
// 'isPocket' has type 'Bool'
```


# Support for primitive data types
It is a difference between inspecting properties which types inherits from NSObject, which then can be checked using the `==` operator and inspecting properties of primitive data type (e.g. Bool, Int). If you declare this comparison operator you can check primitive data types as well:
```
func ==(rhs: Any, lhs: Any) -> Bool {
    let rhsType: String = "\(rhs)"
    let lhsType: String = "\(lhs)"
    let same = rhsType == lhsType
    return same
}
```

Now you can inspect book by using:
```
func checkPropertiesOfBook() {
    guard let types = SwiftReflection.getTypesOfProperties(inClass: Book.self) else { return }

    for (name, type) in types {
        if let objectType = type as? NSObject.Type {
            if objectType == NSDate.self {
                print("found NSDate")
            }
        } else {
            if type == Int.self {
                print("found int")
            }
        }
    }
}
```


# LIMITATIONS
I have not yet been able to give this project support for when the `primitive data types` are optionals. If you have declared a property in you NSObject subclass like this: `var myOptionalInt: Int?` my solution will not work, because the method `class_copyPropertyList` can't find those properties. 

**Does anyone have a solution for this?**
