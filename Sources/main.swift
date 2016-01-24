import Pantry

let string: String = "Hello"
let int: Int = 4
let float: Float = 10.2

Pantry.pack(string, key: "ourTestString")

if let str: String = Pantry.unpack("ourTestString") {
    print(str)
}

struct Basic: Storable {
    let name: String
    let age: Float
    let number: Int

    init(name: String, age: Float, number: Int) {
        self.name = name
        self.age = age
        self.number = number
    }

    init(warehouse: Warehouseable) {
        self.name = warehouse.get("name") ?? "default"
        self.age = warehouse.get("age") ?? 20.5
        self.number = warehouse.get("number") ?? 10
    }
}

let basic = Basic(name: "Nick", age: 31.5, number: 42)
Pantry.pack(basic, key: "basic")
if let unpackedBasic: Basic = Pantry.unpack("basic") {
  print("\(unpackedBasic)")
}
