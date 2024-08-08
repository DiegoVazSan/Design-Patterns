//MARK: OBSERVER

//MARK: 1 Define Observer Interface
/// this protocol will define the methods that the objects that  want to be notified must implement.
protocol WeatherObserver: AnyObject {
    func update(temp: Double, humidity: Double, pressure: Double)
}

//MARK: 2 Define the Subject
///This is the object that maintains a list of observers and notifies them all when their state changes.
class WeatherStation {
    var temperature: Double = 0.0
    var humidity: Double = 0.0
    var pressure: Double = 0.0
    var observers: [WeatherObserver] = []

    func registerObserver(_ observer: WeatherObserver) {
        observers.append(observer)
    }

    func removeObserver(_ observer: WeatherObserver) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }

    func notifyObservers() {
        for observer in observers {
            observer.update(temp: temperature, humidity: humidity, pressure: pressure)
        }
    }

    func setMeasurements(temp: Double, humidity: Double, pressure: Double) {
        self.temperature = temp
        self.humidity = humidity
        self.pressure = pressure
        notifyObservers()
    }
}


//MARK: 3 Define the objects that will be Observers

class Client_A: WeatherObserver {
    func update(temp: Double, humidity: Double, pressure: Double) {
        print("Client_A: New weather data received: temp \(temp) humidity \(humidity) pressure (pressure)")
    }
}

class Client_B: WeatherObserver {
    func update(temp: Double, humidity: Double, pressure: Double) {
        print("Client_B: New weather data received: temp \(temp) humidity \(humidity) pressure (pressure)")
    }
}

class Client_C: WeatherObserver {
    func update(temp: Double, humidity: Double, pressure: Double) {
        print("Client_C: New weather data received: temp \(temp) humidity \(humidity) pressure (pressure)")
    }
}


//MARK: OBSERVER PATTERN USAGE

let weatherStation = WeatherStation()
let clientA = Client_A()
let clientB = Client_B()
let clientC = Client_C()


///register the observers
weatherStation.registerObserver(clientA)
weatherStation.registerObserver(clientB)
weatherStation.registerObserver(clientC)

///set the measurements and notify the observers
weatherStation.setMeasurements(temp: 72.0, humidity: 65.0, pressure: 1013.25)

///remove an observer
weatherStation.removeObserver(clientB)

///set the measurements again
weatherStation.setMeasurements(temp: 75.0, humidity: 70.0, pressure: 1015.0)



