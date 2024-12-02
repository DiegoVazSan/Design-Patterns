
//MARK: CREATIONAL
//MARK: Factory

/*
 This provides an interface for creating objects in a base class, but allows subclasses to alter the type of objects that are created. It is useful when the object creation process is complex or needs to be flexible.
 */

//MARK: - PROTOCOL
///All concrete classes must implememnt

protocol Payment {
    func executePayment()
}

enum TypePayment {
    case google
    case paypal
    case applePay
}

//MARK: - CONCRETE CLASSES
/// Implement Payment interface

class GooglePayment: Payment {
    func executePayment() {
        print("Execute Payment With Google")
    }
}

class PayPalPayment: Payment {
    func executePayment() {
        print("Execute Payment With PayPal")
    }
}

class ApplePayPayment: Payment {
    func executePayment() {
        print("Execute Payment With Apple Pay")
    }
}


//MARK: - FACTORY
///Class provides a method for creating vehicles.

class PaymentFactory {
    
    static func buildPayment(type: TypePayment) -> Payment {
        switch type {
        case .google:
            return GooglePayment()
            
        case .paypal:
            return PayPalPayment()
            
        case .applePay:
            return ApplePayPayment()
        }
    }
}

//MARK: - CLIENT CODE

var payment :  Payment
payment = PaymentFactory.buildPayment(type: .google)
payment.executePayment()

payment = PaymentFactory.buildPayment(type: .applePay)
payment.executePayment()
