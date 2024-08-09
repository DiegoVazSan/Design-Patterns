//MARK: Singleton

/*
 This patterns restricts the instantiation of a class to one single instance. It's useful when you need a single, globally accessible instance of a class throughout your application.
 */

class Singleton {
    /// 1 Static constant to hold the single instance of the class
    static let shared = Singleton()
    
    /// 2  Private initializer to prevent external instantiation
    private init() {
        /// Initialize properties here
    }
    
    /// Dummy method
    func doSomething() {
        print("Singleton instance is doing something.")
    }
}

Singleton.shared.doSomething()
