// Decorator Pattern

// 자기 자신을 다시 자기 자신으로 감싸면서 큰 블록을 만들어나가는 패턴
// 주어진 상황, 용도에 따라 특정 객체에 책임을 덧붙이는 패턴
// 기억해야할건? 상속에 대한 문제를 Decorator pattern 을 사용하여 해결할 수 있다는 것!
// 참고로 swift 에선 POP 를 통해 기능의 수평확장을 지원하고 있는 상태.
// (https://ios-development.tistory.com/270) <- 여길 통해 관련 내용을 확인 해볼 수 있다.

import Foundation

class Uploader {
    private func setUp() {
        
    }
    
    func upload() {
        setUp()
    }
}

class DecoratedUploader: Uploader {
    var uploader: Uploader?
    
    // 이 부분이 Decorator pattern 의 핵심
    init(_ uploader: Uploader? = nil){
        self.uploader = uploader
    }
    
    override func upload() {
        super.upload()
        uploader?.upload()
    }
}

class TextUploader: DecoratedUploader {
    override func upload() {
        super.upload()
        print("uploading text")
    }
}

class ImageUploader: DecoratedUploader {
    override func upload() {
        super.upload()
        print("uploading image")
    }
}

class VideoUploader: DecoratedUploader {
    override func upload() {
        super.upload()
        print("uploading video")
    }
}

class FileUploader: DecoratedUploader {
    override func upload() {
        super.upload()
        print("uploading file")
    }
}

let textAndImageAndVideoUploader = TextUploader(ImageUploader(VideoUploader()))
let imageAndVideoUploader = ImageUploader(VideoUploader())
let everythingUploader = TextUploader(ImageUploader(VideoUploader(FileUploader())))
