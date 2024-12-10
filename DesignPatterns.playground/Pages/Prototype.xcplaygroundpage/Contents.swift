//MARK: CREATIONAL
//MARK: PROTOTYPE

protocol Prototype {
    func clone() -> Self
}


final class Car: Prototype {
    var engine: String
    var color: String

    init(engine: String, color: String) {
        self.engine = engine
        self.color = color
    }

    func clone() -> Car {
        return Car(engine: self.engine, color: self.color) as! Self
    }
}


let originalCar = Car(engine: "V8", color: "Red")
let clonedCar = originalCar.clone()

print("Original car: \(originalCar.engine), \(originalCar.color)")
print("Cloned car: \(clonedCar.engine), \(clonedCar.color)")
