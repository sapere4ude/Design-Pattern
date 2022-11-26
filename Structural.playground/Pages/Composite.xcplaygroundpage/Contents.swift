// Composite

// 트리구조에서 공통적으로 수행할 수 있는 메서드를 가진 프로토콜이 있고 모든 객체들은 해당 프로토콜을 준수하고 있는 패턴
// 한번의 실행으로 재귀적으로 사용하고 싶을때 효과적으로 사용할 수 있다.
// 단순한 구조로 재귀 처리가 가능하다는 장점이 있지만 트리구조가 아니면 사용할 수 없다는 단점이 존재

import Foundation

// Component
protocol Military {
    var unitName: String { get set }
    func attack()
}

struct AirForce: Military {
    var unitName: String
    func attack() {
        print("\(unitName) 공격 🔫")
    }
}

struct Navy: Military {
    var unitName: String
    func attack() {
        print("\(unitName) 공격 🔫")
    }
}

struct Army: Military {
    var unitName: String
    func attack() {
        print("\(unitName) 공격 🔫")
    }
}

// Composite
struct MilitaryGroup: Military {
    var unitName: String
    var group: [Military]
    
    func attack() {
        print("\(unitName) 예하에 있는 부대에 공격 명령을 하달한다!")
        group.forEach { unit in
            unit.attack()
        }
    }
}

let navy123 = Navy(unitName: "해군 123대대")
let navy456 = Navy(unitName: "해군 456대대")
let army233 = Navy(unitName: "육군 233대대")
let army353 = Navy(unitName: "육군 353대대")
let airForce2331 = Navy(unitName: "공군 2331대대")
let airForce7622 = Navy(unitName: "공군 7622대대")

let navy1 = MilitaryGroup(unitName: "해군 1사단", group: [navy123, navy456])
let army1 = MilitaryGroup(unitName: "육군 1사단", group: [army233, army353])
let airForce1 = MilitaryGroup(unitName: "육군 1사단", group: [airForce2331, airForce7622])

let thirdROKArmy = MilitaryGroup(unitName: "3군 사령부", group: [navy1, army1, airForce1])

thirdROKArmy.attack()
