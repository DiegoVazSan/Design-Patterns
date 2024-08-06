//MARK: Decorator

//1 - Define the main interface
protocol Coffee {
    func cost() -> Double
}

//2 - Implement the concrete component
class BasicCoffee: Coffee {
    private let basicCoffePrice : Double = 2.0
    
    func cost() -> Double {
        return basicCoffePrice
    }
    
}

//3 - Create de base DECORATOR
class CoffeeDecorator: Coffee {
    private let coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func cost() -> Double {
        return coffee.cost()
    }
}

//4 - Implementing concrete decorators
class MilkDecorator: CoffeeDecorator {
    private let milkPrice : Double = 0.5
    
    override func cost() -> Double {
        return super.cost() + milkPrice
    }
    
}

class SugarDecorator: CoffeeDecorator {
    private let sugarPrice : Double = 0.2
    
    override func cost() -> Double {
        return super.cost() + sugarPrice
    }
    
}

//5 - Using the decorator

let basicCoffee = BasicCoffee()
let milkCoffee = MilkDecorator(coffee: basicCoffee)
let sugarMilkCoffee = SugarDecorator(coffee: milkCoffee)

//print("Cost of basic coffee: \(basicCoffee.cost())")
//print("Cost of coffee with milk: \(milkCoffee.cost())")
//print("Cost of coffee with milk and sugar: \(sugarMilkCoffee.cost())")

protocol Vehicle {
    func speed() -> Double
}

class Car: Vehicle {
    
    func speed() -> Double {
        return 30
    }
    
}

class VehicleDecorator: Vehicle {
    private let vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    func speed() -> Double {
        return vehicle.speed()
    }
    
    
}


class NascarCar : VehicleDecorator {
    
    private let NascarCarSpeed : Double = 300.0
    
    override func speed() -> Double {
        return super.speed() + NascarCarSpeed
    }
    
}

class FormulaOneCar : VehicleDecorator {
    
    private let formulaOneCarSpeed : Double = 380.0
    
    override func speed() -> Double {
        return super.speed() + formulaOneCarSpeed
    }
    
}

let car = Car()
let nascarCar = NascarCar(vehicle: car)
let formulaOneCar = FormulaOneCar(vehicle: car)

print(car.speed())
print(nascarCar.speed())
print(formulaOneCar.speed())
