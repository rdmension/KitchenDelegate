import Foundation

protocol KitchenDelegate : class {
    func didCookFood(_ foodName: String)
}

class Kitchen {
    
    weak var delegate : KitchenDelegate?
    
    public func cook(_ food: String){
        
        /// Cook some delish meals
        
        /// Notify cooking done
        delegate?.didCookFood(food)
    }
}

class Waiter{
    
    private var kitchen : Kitchen
    
    init(kitchen: Kitchen){
        self.kitchen = kitchen
        kitchen.delegate = self
    }
    
    public func sendOrderToKitchen(with foodName: String){
        kitchen.cook(foodName)
    }
}

extension Waiter : KitchenDelegate {
    func didCookFood(_ foodName: String) {
        print("Waiter: \(foodName) is ready!")
    }
}

class Waitress {
    
    private var kitchen : Kitchen
    var orderNumber : Int = 0
    
    init(kitchen: Kitchen){
        self.kitchen = kitchen
        kitchen.delegate = self
        
    }
    
    public func sendOrderToKitchen(with foodName: String){
        orderNumber += 1
        kitchen.cook(foodName)
    }
}

extension Waitress : KitchenDelegate{
    func didCookFood(_ foodName: String) {
        print("Waitress: Order \(orderNumber) with \(foodName) is ready!")
    }
}

let kitchen = Kitchen()
let waiter = Waiter(kitchen: kitchen)
waiter.sendOrderToKitchen(with: "Pizza")

let waitress = Waitress(kitchen: kitchen)
waitress.sendOrderToKitchen(with: "Pomodoro pasta")
