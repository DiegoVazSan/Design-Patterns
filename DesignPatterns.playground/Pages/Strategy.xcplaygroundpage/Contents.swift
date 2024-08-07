//MARK: Strategy


//MARK: 1 Define the main Strategy Interface
protocol PaymentStrategy {
    func pay(amount: Double) -> String
}

//MARK: 2 Implement concret strategies
class CreditCardStrategy: PaymentStrategy {
    func pay(amount: Double) -> String {
        return "Paid \(amount) using Credit Card."
    }
}

class PayPalStrategy: PaymentStrategy {
    func pay(amount: Double) -> String {
        return "Paid \(amount) using PayPal."
    }
}

class BitcoinStrategy: PaymentStrategy {
    func pay(amount: Double) -> String {
        return "Paid \(amount) using Bitcoin."
    }
}

//MARK: Define the context
class PaymentContext {
    private var strategy: PaymentStrategy

    init(strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func setStrategy(strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func executePayment(amount: Double) -> String {
        return strategy.pay(amount: amount)
    }
}

//MARK: USAGE OF THE STRATEGY PATTERN

let creditCardStrategy = CreditCardStrategy()
let payPalStrategy = PayPalStrategy()
let bitcoinStrategy = BitcoinStrategy()

let paymentContext = PaymentContext(strategy: creditCardStrategy)
print(paymentContext.executePayment(amount: 100.0)) // Output: Paid 100.0 using Credit Card.

paymentContext.setStrategy(strategy: payPalStrategy)
print(paymentContext.executePayment(amount: 50.0)) // Output: Paid 50.0 using PayPal.

paymentContext.setStrategy(strategy: bitcoinStrategy)
print(paymentContext.executePayment(amount: 0.5))  // Output: Paid 0.5 using Bitcoin.

//MARK: Second Example

public protocol ProfilePageStrategy {
    var title: String { get }
}

public class PremiumUserPageStrategy: ProfilePageStrategy {
    public var title = "Premium User"
}

public class ExclusiveUserPageStrategy: ProfilePageStrategy {
    public var title = "Exclusive User"
}

public class RegularUserPageStrategy: ProfilePageStrategy {
    public var title = "Regular User"
}

public class ProfilePageViewController {
    var profileTitle: String!
    
    var strategy: ProfilePageStrategy!
    
    init(strategy: ProfilePageStrategy) {
        self.strategy = strategy
        setupUI()
    }
    
    func setupUI() {
        profileTitle = strategy.title
    }
}

let premiumUserPageStrategy = PremiumUserPageStrategy()
let exclusiveUserPageStrategy = ExclusiveUserPageStrategy()
let regularUserPageStrategy = RegularUserPageStrategy()

let vc = ProfilePageViewController(strategy: premiumUserPageStrategy)
print("Page title is: \(vc.profileTitle ?? "")")

vc.strategy = exclusiveUserPageStrategy
vc.setupUI()
print("Page title is: \(vc.profileTitle ?? "")")

vc.strategy = regularUserPageStrategy
vc.setupUI()
print("Page title is: \(vc.profileTitle ?? "")")

