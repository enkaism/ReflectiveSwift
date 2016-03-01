//: Playground - noun: a place where people can play

import UIKit
import SwiftyJSON
import XCPlayground

//var url = NSURL(string: "http://pokeapi.co/api/v2/pokemon/1/")

enum Type {
    case String, Int
}

let JSONObject = [
    "count": "11",
    "result": [
        "species": [
            "id": 4,
            "name": "eeeeeee",
            "tintin": [
                "anal": "sex"
            ]
        ]
    ]
]

let j = [
    "count": "11",
    "result": [
        "count": "123",
        "result": [
            "count": "1234",
            "result": []
        ]
    ]
]


JSON(    ["result": [
    "count": "123",
    "result": []
    ]]).dictionary

typealias Model = NSObject

class M: Model {
    var count: String = ""
    var result: Result = Result()
}

class Result: Model {
    var species: Species = Species()
}

class Species: Model {
    var id: Int = 0
    var name: String = ""
    var tintin: Tintin = Tintin()
}


class Tintin: Model {
    var anal = ""
}

class Mo: Model {
    var r: Result?
}

let mo = Mo()
mo.setValue(Result(), forKey: "r")
mo.r!.species

let jo = [:]
jo.isEqual([:])









extension NSObject {
    func map() -> [Any] {
        self.dynamicType
        let labels = Mirror(reflecting: self).children.map { $0.value }
        return labels
    }
}

func keys(obj: [String: JSON]?) -> [String]? {
    return obj?.map { $0.0 }
}

var json = JSON(JSONObject)
var model = M()

var i = 0

func ireru<T: NSObject>(tin: T, d: [String: JSON]?) {
    let k = keys(d)
    guard let dict = d else { return }
    guard let keys = k else { return }
    for n in keys {
        if let json = dict[n] {
            if json.dictionary == nil {
                i++
                print(i)
                let m = Mirror(reflecting: tin).children.map { $0.label! } as [String]?
                print(i)
                guard let mm = m else { continue }
                if mm.contains(n) {
                    i++
                    print("year: \(i)")
                    if json.string != nil {
                        tin.setValue(json.string, forKey: n)
                    } else if json.int != nil {
                        tin.setValue(json.int, forKey: n)
                    }
                    print("year: \(i)")
                }
            } else {
                print(n)
                let c = Mirror(reflecting: tin).children.map { ($0.label, $0.value) }
                c.forEach { a in
                    tin.valueForKey(a.0!)
                }
                tin.isMemberOfClass(Species.classForCoder())
//                tin.setValue(<#T##value: AnyObject?##AnyObject?#>, forKey: <#T##String#>)
                i++
                print(i)
                print(tin)
                guard let tintin = tin.valueForKey(n) as? Model else { continue }
                print(i)
                ireru(tintin, d: json.dictionary)
            }
        }
    }
}

ireru(model, d: json.dictionary)
model.result.species.tintin.anal

func >> (left: (String, AnyObject), right: AnyObject) -> AnyObject? {
    return nil
}

infix operator <- {}
func <- <T: Model>(inout left: T?, right: T.Type) {
    left = right.init()
}

var a: M?
a <- M.self
a!.result


//
//class a: RawRepresentable {
//    
//}

//var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler:{data, response, error in


    
    
        
        
//        for key in dict.keys {
//            print(dict[key])
//        }
//        
//        if let d = dict["species"] as? [String: AnyObject] {
//            print("ok")
//        }
//        
//        func value(obj: AnyObject, key: String) -> AnyObject {
//            obj.typeIdentifier
//            return ""
//        }
        
    
//})

//task.resume()

//XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
