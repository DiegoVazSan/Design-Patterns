//MARK: Dependency Injection Pattern
//(DI)
///“Dependency Injection” is a 25-dollar term for a 5-cent concept. — James Shore

/*
 Dependency Injection (DI) focuses on providing the dependencies of a component from the outside, rather than letting the component create its own dependencies. The primary goal is to decouple components and make the codebase more modular, scalable, and easy to test.
 */

//MARK: Protocol defining a data service
protocol DataService {
    func fetchData() -> [String]
}

//MARK: Concrete implementation of the data service
class RemoteDataService: DataService {
    func fetchData() -> [String] {
        // Fetch data from a remote source
        return ["Base64", "JSON", "XML"]
    }
}

//MARK: ViewModel for processing data
class DataViewModel {
    private let dataService: DataService

    init(dataService: DataService) {
        self.dataService = dataService
    }

    func fetchData() -> [String] {
        return dataService.fetchData()
    }
}

//MARK: DI Usage

let remoteDataService : DataService = RemoteDataService()
let dataViewModel = DataViewModel(dataService: remoteDataService)
let data = dataViewModel.fetchData()
print("Fetched Data:", data)
