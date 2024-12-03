
//MARK: CREATIONAL
//MARK: Abstract Factory

protocol Payment {
    func pay()
}

//MARK: - CONCRETE PRODUCTS

class CardPayment : Payment {
    func pay() {
        print("Paying with Credit Card")
    }
}

class GooglePayment : Payment {
    func pay() {
        print("Paying with Google")
    }
}

//MARK: - Method

protocol PaymentMethod {
    func calculatePayment() -> Array<Double>?
}

//MARK: - CONCRETE PRODUCTS

class MonthlyMethod : PaymentMethod {
    func calculatePayment() -> Array<Double>? {
        print("Getting the Montly Payment")
        return nil
    }
}

class PaymentInAdvanceMethod : PaymentMethod {
    func calculatePayment() -> Array<Double>? {
        print("Getting the Payment in Advance Payment")
        return nil
    }
}

//MARK: - Abstract Factory

protocol AbstractFactory {
    
    func createPayment() -> Payment
    func createPaymentMethod() -> PaymentMethod
    
}


//MARK: - FACTORIES

class PaymentInAdvanceCardFactory : AbstractFactory {
    func createPayment() -> Payment {
        CardPayment()
    }
    
    func createPaymentMethod() -> PaymentMethod {
        PaymentInAdvanceMethod()
    }
}

class MonthlyGooglefactory : AbstractFactory {
    func createPayment() -> Payment {
        GooglePayment()
    }
    
    func createPaymentMethod() -> PaymentMethod {
        MonthlyMethod()
    }
}

//MARK: - CLIENT

class PaymentMethodClient {
    
    static func clientCode(factory: AbstractFactory) {
        let payment = factory.createPayment()
        let method = factory.createPaymentMethod()
        payment.pay()
        method.calculatePayment()
    }
    
}

// MARK: - TESTS


PaymentMethodClient.clientCode(factory: MonthlyGooglefactory())

PaymentMethodClient.clientCode(factory: PaymentInAdvanceCardFactory())

