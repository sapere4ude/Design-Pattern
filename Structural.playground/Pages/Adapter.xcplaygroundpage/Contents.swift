// Adapter

// Adapter 역할을 하는 일정한 구조를 만드는 형태
// Adaptee 기능 / Adapter 동작을 비즈니스 로직과 분리할 수 있기 때문에 SRP 단일 책임 원칙을 지킬 수 있다.

import Foundation

struct Token {
    let id: String
    let password: String
}

// MARK: - Basic
let authorization = Authorization()

// 로그인 정보 제출시
authorization.login { loginResult in
    if loginResult {
        // login success
    } else {
        // login fail
    }
}
// MARK: - Import 라이브러리의 인터페이스
class AppleAuthorization {
    func presentAuth() {
        // 애플 로그인 내부 구현
    }
}

class GoogleAuthorization {
    func tryLogin() {
        // 구글 로그인 내부 구현
    }
}

// MARK: - Target Interface 구현
protocol AuthorizationService {
    func login(completion: (Bool) -> ())
}

class Authorization: AuthorizationService {
    func submitUserInfo(_ userInfo: Token, completion: (Bool) -> ()) {
        // 사용자 정보를 서버로 요청하는 동작
    }
    
    func login(completion: (Bool) -> ()) {
        // 로그인 동작
        let exampleInfo = Token(id: "사용자 아이디", password: "사용자 비밀번호")
        submitUserInfo(exampleInfo) { result in
            completion(result)
        }
    }
}

struct AppleAuthorizationAdapter: AuthorizationService {
    let adaptee = AppleAuthorization()
    
    func login(completion: (Bool) -> ()) {
        adaptee.presentAuth()
    }
}

struct GoogleAuthorizationAdapter: AuthorizationService {
    let adaptee = GoogleAuthorization()
    
    func login(completion: (Bool) -> ()) {
        adaptee.tryLogin()
    }
}

enum AuthorizationPlatform {
    case basic
    case apple
    case google
}

//MARK: - 사용자가 로그인 선택시
func presentAuthorization(_ platform: AuthorizationPlatform, completion: (Bool) -> ()) {
    switch platform {
    case .basic:
        let basicAuth = Authorization()
        basicAuth.login { result in
            // 로그인 성공/실패
        }
    case .apple:
        let appleAuth = AppleAuthorizationAdapter()
        appleAuth.login { result in
            // 로그인 성공/실패
        }
    case .google:
        let googleAuth = GoogleAuthorizationAdapter()
        googleAuth.login { result in
            // 로그인 성공/실패
        }
    }
}
