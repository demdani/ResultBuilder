import UIKit

@resultBuilder
struct DictionaryBuilder<Key: Hashable, Value> {
    
    static func buildBlock(_ dictionaries: Dictionary<Key, Value>...) -> Dictionary<Key, Value> {
        dictionaries.reduce(into: [:]) {
            $0.merge($1) { _, new in new }
        }
    }
    
    static func buildOptional(_ dictionary: Dictionary<Key, Value>?) -> Dictionary<Key, Value> {
        dictionary ?? [:]
    }
}

extension Dictionary {
    
    init(@DictionaryBuilder<Key, Value> build: () -> Dictionary) {
        self = build()
    }
}

let dictionary = Dictionary<String, String> {
    [
        "id": "1",
        "name": "alex",
    ]
    
    if Bool.random() {
        ["random": "random_value"]
    }
    
    [
        "more": "values"
    ]
}

print(dictionary)

@DictionaryBuilder<String, String>
func makeMeADictionary() -> Dictionary<String, String> {
    [
        "id": "1",
        "name": "béla",
    ]
    
    if Bool.random() {
        ["hello": "hello"]
    }
}

print(makeMeADictionary())
