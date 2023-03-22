import Foundation

// Product Interface
protocol Player {
    var content: String { get set }
    init(content: String)
    func play()
    func pause()
    func changeContent(name: String)
}

// Concrete Product
class MusicPlayer: Player {
    var content: String
    required init(content: String) {
        self.content = content
    }
    
    func play() {
        print("MusicPlayer Play")
    }
    
    func pause() {
        print("MusicPlayer Pause")
    }
    
    func changeContent(name: String) {
        print("\(self.content)에서 \(name)로 음악 변경")
        self.content = name
    }
}

// Concrete Product
class VideoPlayer: Player {
    var content: String
    required init(content: String) {
        self.content = content
    }
    
    func play() {
        print("VideoPlayer Play")
    }
    
    func pause() {
        print("VideoPlayer Pause")
    }
    
    func changeContent(name: String) {
        print("\(self.content)에서 \(name)로 비디오 변경")
        self.content = name
    }
}

// Creator
protocol PlayerCreator {
    func createPlayer(content: String, contentType: ContentType) -> Player // 반환 타입이 핵심
}

enum ContentType {
    case music
    case video
}

// Factory (Concrete Creator)
class PlayerFactory: PlayerCreator {
    func createPlayer(content: String, contentType: ContentType) -> Player {
        switch contentType {
        case .music:
            return MusicPlayer(content: content)
        case .video:
            return VideoPlayer(content: content)
        }
    }
}

let factory = PlayerFactory()
let musicPlayer = factory.createPlayer(content: "classic", contentType: .music)
let videoPlayer = factory.createPlayer(content: "study video", contentType: .video)

musicPlayer.play()
musicPlayer.changeContent(name: "jazz")

videoPlayer.pause()
videoPlayer.changeContent(name: "movie")
