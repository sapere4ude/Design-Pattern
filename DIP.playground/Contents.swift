// DIP: 의존성 역전 원칙
// 추상화 된 것은 구체적인것에 의존하면 안되고 구체적인 것이 추상화된 것에 의존해야한다.

protocol Menu {
    func printCoffee()
    func printMeal()
}

class Eat: Menu {
    var coffee: String
    var meal: String
    
    init(coffee: String, meal: String) {
        self.coffee = coffee
        self.meal = meal
    }
    
    func printCoffee() {
        print("아메리카노")
    }
    
    func printMeal() {
        print("소금빵")
    }
}

struct Person {
    var todayEat: Menu
    
    func printCoffee() {
        todayEat.printCoffee()
    }
    
    func printMeal() {
        todayEat.printMeal()
    }
    
    mutating func changeMenu(menu: Menu) {
        self.todayEat = menu
    }
}

let menu = Eat(coffee: "아메리카노", meal: "소금빵")
let anotherMenu = Eat(coffee: "라떼", meal: "피자빵")

var jaejun = Person(todayEat: menu)

jaejun.printMeal() // 소금빵
jaejun.changeMenu(menu: anotherMenu) // Eat 객체는 Person 객체와 분리된 것을 알수있다! Eat 객체가 바뀐다고해서 Person 객체를 수정할 필요가 없고, Person 객체가 바뀐다고해서 Eat 객체를 수정할 필요가 없다. 이런것이 의존성 역전 원칙을 지켰기 때문이다.
jaejun.printMeal() // 피자빵
