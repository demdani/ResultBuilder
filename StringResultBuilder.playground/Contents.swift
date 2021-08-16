import UIKit

@resultBuilder
struct StringResultBuilder {
    
    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "\n")
    }
    
    static func buildEither(first component: String) -> String {
        component
    }
    
    static func buildEither(second component: String) -> String {
        component
    }
}

let joined = StringResultBuilder.buildBlock(
    "Hello",
    "Szia"
)

//print(joined)

@StringResultBuilder func makeSentence() -> String {
    "Multi"
    "line"
    "sentence"
    
    if Bool.random() {
        "?"
    } else {
        "!"
    }
}

print(makeSentence())
