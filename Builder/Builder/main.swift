//
//  main.swift
//  Builder
//
//  Created by Kant on 1/10/24.
//

import Foundation

//protocol UserBuilder {
//    var name: String? { get set }
//    var age: Int? { get set }
//    var address: String? { get set }
//    func setName(_ name: String) -> UserBuilder
//    func setAge(_ age: Int) -> UserBuilder
//    func setAddress(_ address: String) -> UserBuilder
//    func build() -> User
//}
//
//class User {
//    var name: String?
//    var age: Int?
//    var address: String?
//    
//    init(builder: UserBuilder) {
//        self.name = builder.name
//        self.age = builder.age
//        self.address = builder.address
//    }
//}
//
//class UserBuilderImpl: UserBuilder {
//    var name: String?
//    var age: Int?
//    var address: String?
//    
//    func setName(_ name: String) -> UserBuilder {
//        self.name = name
//        return self
//    }
//    
//    func setAge(_ age: Int) -> UserBuilder {
//        self.age = age
//        return self
//    }
//    
//    func setAddress(_ address: String) -> UserBuilder {
//        self.address = address
//        return self
//    }
//    
//    func build() -> User {
//        return User(builder: self)
//    }
//}
//
//let user = UserBuilderImpl()
//    .setName("KANT")
//    .setAge(31)
//    .setAddress("123 Apple St")
//    .build()


// MARK: - 실제 사용한다면 이렇게?

protocol AdBuilder {
    func setCommonSettings() -> AdBuilder
    func setLiveSettings() -> AdBuilder
    func setVodSettings() -> AdBuilder
    func setPrerollSettings() -> AdBuilder
    func setMidrollSettings() -> AdBuilder
}

class AdBuilderImpl: AdBuilder {
    func setCommonSettings() -> AdBuilder {
        return self
    }
    
    func setLiveSettings() -> AdBuilder {
        return self
    }
    
    func setVodSettings() -> AdBuilder {
        return self
    }
    
    func setPrerollSettings() -> AdBuilder {
        return self
    }
    
    func setMidrollSettings() -> AdBuilder {
        return self
    }
}

// 사용자가 객체를 생성할 때 특정 메서드들을 선택적으로 호출할 수 있는 구조

let livePreroll = AdBuilderImpl()
    .setCommonSettings()
    .setLiveSettings()
    .setPrerollSettings()

let liveMidroll = AdBuilderImpl()
    .setCommonSettings()
    .setLiveSettings()
    .setMidrollSettings()

let vodPreroll = AdBuilderImpl()
    .setCommonSettings()
    .setVodSettings()
    .setPrerollSettings()

let vodMidroll = AdBuilderImpl()
    .setCommonSettings()
    .setVodSettings()
    .setMidrollSettings()
    
