//MARK: Factory

/*
 This provides an interface for creating objects in a base class, but allows subclasses to alter the type of objects that are created. It is useful when the object creation process is complex or needs to be flexible.
 */

//MARK: Define a protocol that all concrete classes must implememnt

protocol Vehicle {
    func drive()
}

//MARK: Concrete Clasess that implement vehicle interface

class Car: Vehicle {
    func drive() {
        print("Driving a car")
    }
}

class Bike: Vehicle {
    func drive() {
        print("Riding a bike")
    }
}

//MARK: Factory Class provides a method for creating vehicles.

class VehicleFactory {
    /// Factory Method that return an Vehicle Object
    func createVehicle(type: String) -> Vehicle? {
        switch type {
        case "Car":
            return Car()
        case "Bike":
            return Bike()
        default:
            return nil
        }
    }
}

//MARK: Client Code
let factory = VehicleFactory()

if let myCar = factory.createVehicle(type: "Car") {
    myCar.drive()  // Output: Driving a car
}

if let myBike = factory.createVehicle(type: "Bike") {
    myBike.drive()  // Output: Riding a bike
}

