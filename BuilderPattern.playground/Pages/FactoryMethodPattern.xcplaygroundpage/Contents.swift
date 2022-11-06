// Factory Method Pattern

// 부모(상위) 클래스에 알려지지 않은 구체 클래스를 생성하는 패턴
// 자식(하위) 클래스가 어떤 객체를 생성할지를 결정하도록 하는 패턴
// 예를들어, 제품에 따라 공장의 생산 라인을 바꾸는 것이 아니라 기본이 되는 생산 라인은
// 설치해두고, 요청이 들어오면 '요청에 맞게 제품을 생산해주는 패턴' 이라 생각할것.
// 여기서 중요한 점은 '공장은 어떠한 요청이 들어올지 모른다는 점' 이다.
// 단순히 요청에 맞는 제품만 찍어 내면 되는 것
// 의존성 주입과 비슷한 개념이라 생각하면 된다.

// 장점 : 프로토콜로 기본 기능을 정의했기 때문에 기존 코드 변경없이 새로운 하위 클래스를 추가가 가능. 확장성이 높다.
// 단점 : product가 추가 될 때마다 새로운 하위 클래스를 정의해야하기 때문에 불필요하게 많은 클래스가 정의될 수 있다.

import Foundation

// Creator : Factory 의 기본 역할을 정의하는 객체
protocol AppleFactory {
    func createElectronics() -> Product
}

// Concrete Creator : Creator를 채택, product에 맞는 구체적 기능을 구현
class IPhoneFactory: AppleFactory {
    func createElectronics() -> Product {
        return IPhone()
    }
}

class IPadFactory: AppleFactory {
    func createElectronics() -> Product {
        return IPad()
    }
}

// Product : Concrete Product 가 해야할 동작들을 선언하하는 객체
protocol Product {
    func produceProduct()
}

class IPhone: Product {
    func produceProduct() {
        print("Hello, iPhone was made")
    }
}

class IPad: Product {
    func produceProduct() {
        print("Hello, iPad was made")
    }
}

class Client {
    func order(factory: AppleFactory) {
        let electronicsProduct = factory.createElectronics()
        electronicsProduct.produceProduct()
    }
}

example(of: "Factory Method Pattern") {
    var client = Client()
    
    client.order(factory: IPadFactory())    // Concrete Product
    client.order(factory: IPhoneFactory())  // Concrete Product
}
