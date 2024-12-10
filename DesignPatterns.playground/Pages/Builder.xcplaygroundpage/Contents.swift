//MARK: CREATIONAL
//MARK: BUILDER

// 1
/// Create the class or struct of the product we want to build

struct Burger {
    let breadType: String
    let hasCheese: Bool
    let ingredients: [String]
}

/// 2  Protocol or Class BASE to the Builder
/// The builder will build the object step by step

protocol BurgerBuilder {
    func setBreadType(_ type: String) -> Self
    func addCheese(_ hasCheese: Bool) -> Self
    func addIngredient(_ ingredient: String) -> Self
    func build() -> Burger
}

// 3
/// Concrete BurgerBuilder Implementation

class CustomBurgerBuilder: BurgerBuilder {
    private var breadType: String = "White"
    private var hasCheese: Bool = false
    private var ingredients: [String] = []
    
    func setBreadType(_ type: String) -> Self {
        self.breadType = type
        return self
    }
    
    func addCheese(_ hasCheese: Bool) -> Self {
        self.hasCheese = hasCheese
        return self
    }
    
    func addIngredient(_ ingredient: String) -> Self {
        self.ingredients.append(ingredient)
        return self
    }
    
    func build() -> Burger {
        return Burger(breadType: breadType, hasCheese: hasCheese, ingredients: ingredients)
    }
}

// 4
/// Builder Use To Create An Object

let burger = CustomBurgerBuilder()
    .setBreadType("Whole Grain")
    .addCheese(true)
    .addIngredient("Lettuce")
    .addIngredient("Tomato")
    .build()


print("Bread Type: \(burger.breadType)")
print("Has Cheese: \(burger.hasCheese)")
print("Ingredients: \(burger.ingredients.joined(separator: ", "))")








//MARK: - First Example
/*
class Card {
    
    private var cardType: String = ""
    private var number: String = ""
    private var expired: Int = 0
    
    func showCard() {
        print("Tarjeta \(cardType) - \(number) - \(expired) ")
    }
    
    class CardBuilder {
        
        private var innerCard = Card()
        
        func cardType(cardType: String) -> CardBuilder {
            innerCard.cardType = cardType
            return self
        }
        
        func number(number: String) -> CardBuilder {
            innerCard.number = number
            return self
        }
        
        func expired(expires: Int) -> CardBuilder {
            innerCard.expired = expires
            return self
        }
        
        func build() -> Card {
            return innerCard
        }
        
    }
    
}


let card = Card.CardBuilder()
    .cardType(cardType: "Visa")
    .number(number: "1234-5678-9012-3456")
    .expired(expires: 2025)
    .build()

card.showCard()
*/

