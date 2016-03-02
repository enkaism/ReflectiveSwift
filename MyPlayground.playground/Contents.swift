//: Playground - noun: a place where people can play
import Foundation
import UIKit
import SwiftyJSON
import ObjectiveC
import XCPlayground

// {
//   "count": "11",
//   "result": {
//       "species": {
//           "id": 4
//           "name": "human"
//       }
//   }
// }

let JSONString = "{" +
    "\"count\": \"11\"," +
    "\"result\": {" +
        "\"species\": {" +
                "\"id\": 4," +
                "\"name\": \"human\"" +
        "}" +
    "}" +
"}"


typealias Model = NSObject

class M: Model {
    var count: String?
    var result: Result?
}

class Result: Model {
    var species: Species = Species()
}

class Species: Model {
    var id: Int = 0
    var name: String?
}


func keys(obj: [String: JSON]?) -> [String]? {
    return obj?.map { $0.0 }
}

func ireru<T: NSObject>(tin: T, d: [String: JSON]?) {
    let k = keys(d)
    guard let dict = d else { return }
    guard let keys = k else { return }
    for n in keys {
        if let json = dict[n] {
            if json.dictionary == nil {
                if tin.respondsToSelector(Selector.init(n)) {
                    if json.string != nil {
                        tin.setValue(json.string, forKey: n)
                    }else if json.int != nil {
                        tin.setValue(json.int, forKey: n)
                    }
                }
            } else {
                guard let tintin = tin.valueForKey(n) as? Model else { continue }
                ireru(tintin, d: json.dictionary)
            }
        }
    }
}


var json = JSON.parse(JSONString)
var model = M()
ireru(model, d: json.dictionary)
model.result?.species.id
