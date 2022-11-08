// Singleton

// 유일한 객체가 될 프로퍼티를 static 으로 정의한 후 자기 자신을 할당
// 초기화 메서드의 접근 제한을 설정하여 외부에서는 초기화가 불가능하도록 설정

// 일반적으로 싱글턴은 클래스로 만들어서 사용하게 됨 > 싱글턴 패턴의 목적인 유일한 객체를 사용하기 위해서
// 구조체로 생성했을때의 문제점 > https://yagom.net/courses/design-pattern-in-swift/lessons/%ec%83%9d%ec%84%b1-%ed%8c%a8%ed%84%b4/topic/singleton/

enum Milk {
    case chocolate
    case strawberry
    case banana
}

class MilkStorage {
    static let shared = MilkStorage()
    private var chocolateMilkCount = 100
    private var strawberryMilkCount = 100
    private var bananaMilkCount = 100
    
    private init() { }
    
    func release(_ milk: Milk, count: Int) {
        switch milk {
        case .chocolate:
            chocolateMilkCount -= count
        case .strawberry:
            strawberryMilkCount -= count
        case .banana:
            bananaMilkCount -= count
        }
    }
    
    func checkMilkStock() {
        print("남은 재고: 초코 우유(\(chocolateMilkCount)), 딸기 우유(\(strawberryMilkCount)), 바나나 우유(\(bananaMilkCount))")
    }
}

class OnlineStore {
    func orderMilk(_ milk: Milk, count: Int) {
        MilkStorage.shared.release(milk, count: count)
    }
}

let naverSmartStore = OnlineStore()
let coupang = OnlineStore()
let weMakePrice = OnlineStore()

naverSmartStore.orderMilk(.chocolate, count: 15)
MilkStorage.shared.checkMilkStock()

coupang.orderMilk(.banana, count: 30)
coupang.orderMilk(.chocolate, count: 10)
MilkStorage.shared.checkMilkStock()

weMakePrice.orderMilk(.chocolate, count: 50)
weMakePrice.orderMilk(.strawberry, count: 70)
MilkStorage.shared.checkMilkStock()

