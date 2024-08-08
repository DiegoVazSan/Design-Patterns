//MARK: ADAPTER


//MARK: Old Implementation

///We need to use it with new features without making changes directly.
protocol SDKPaymentInterface {
    func processPayment(amount: Double, currency: String)
}

class SDKPaymentSystem: SDKPaymentInterface {
    func processPayment(amount: Double, currency: String) {
        print("Processing payment of \(amount) \(currency) using Legacy Payment System")
    }
}


//MARK:  Main Interface
/// Here is the logic we want to implement.
protocol NewPaymentSystem {
    func makePayment(amount: Double)
}

//MARK: Adapter
///This gets and instance of the old interface we must keep and allows to implememnt the logic we want, conforming the Main Interface.
class PaymentAdapter: NewPaymentSystem {
    private let oldPaymentSystem: SDKPaymentInterface
    private let currency: String
    
    init(oldPaymentSystem: SDKPaymentInterface, currency: String) {
        self.oldPaymentSystem = oldPaymentSystem
        self.currency = currency
    }
    
    func makePayment(amount: Double) {
        ///Here is the new logic we want to add.
        guard amount > 0 else {
            print("Amount must be positive")
            return
        }
        oldPaymentSystem.processPayment(amount: amount, currency: currency)
    }
}



//MARK: USAGE OF ADAPTER PATTERN

/// Old System
let oldSystem = SDKPaymentSystem()
///Adapter, this alows to use the old system with the new interface
let paymentAdapter = PaymentAdapter(oldPaymentSystem: oldSystem, currency: "USD")
paymentAdapter.makePayment(amount: 100.0)
