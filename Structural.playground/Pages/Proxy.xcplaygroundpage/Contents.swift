// Proxy

// 다른 누군가를 대신해서 역할을 수행하는 존재라고 생각하면 된다.
// (그런데 이러면 프로토콜과 비슷한거 아닌가..?)

// 1. Remote Proxy : 요청을 처리하고 서비스 객체에 이를 전달하는 역할을 담당
// 2. Virtual Proxy : 서비스 객체에 대한 정보를 캐싱하여 접근을 연기
// 3. Protection Proxy : 특정 작업을 요청한 객체가 해당 작업을 수행할 권한을 가지고 있는지 확인

// RealSubject: proxy에서 요청이 들어왔을때 요청에 대한 응답을 처리

import Foundation

enum Auth {
    case Owner
    case Employee
}

struct Client {
    var id: String?
    var auth: Auth?
}

protocol YoutubeDownloadSubject {
    func downloadYoutubeVideos() async -> [String]
}

// MARK: - 실제 일하는 객체
final class RealSubject: YoutubeDownloadSubject {
    func downloadYoutubeVideos() async -> [String] {
        // TODO: 유튜브 서버에 있는 비디오를 다운로드하는 로직
        return [""]
    }
}

final class Proxy: YoutubeDownloadSubject {
    private lazy var realSubject = RealSubject()
    private var videoCache = [String]()
    private var client: Client
    
    init(_ client: Client) {
        self.client = client
    }
    
    func downloadYoutubeVideos() async -> [String] {
        // 클라이언트 권한에 따라 제어 가능
        guard client.auth == .Owner else {
            print("비디오를 다운로드 할 권한이 없습니다.")
            return []
        }
        
        // 비디오 캐시가 비어있다면? -> 실제 realSubject 에 데이터를 요청
        if videoCache.isEmpty {
            videoCache = await realSubject.downloadYoutubeVideos()
            return videoCache
        } else {
            return videoCache
        }
    }
}

let client = Client()
let proxy = Proxy(client)

// 프로토콜 타입 전달 받기
func loadYoutubeVideo(_ service: YoutubeDownloadSubject) {
    service.downloadYoutubeVideos()
}

loadYoutubeVideo(proxy)
