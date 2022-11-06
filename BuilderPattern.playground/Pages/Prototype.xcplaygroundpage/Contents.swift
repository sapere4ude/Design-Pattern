// Prototype

// 프로토타입 패턴은 기존의 객체를 복제하기 위한 패턴
// 자기 자신을 복제함..!

import Foundation

protocol Prototype: AnyObject {
    func clone() -> Self
}

class T1: Prototype {
    var topLinerName: String
    
    init(topLinerName: String) {
        self.topLinerName = topLinerName
    }
    
    func clone() -> Self {
        return T1(topLinerName: self.topLinerName) as! Self
    }
}

example(of: "Prototype") {
    let t1 = T1(topLinerName: "khan")
    t1.topLinerName = "canna"
    print(t1.topLinerName)
    
    let recentT1 = t1.clone()
    recentT1.topLinerName = "zeus"
    print(recentT1.topLinerName)
}


