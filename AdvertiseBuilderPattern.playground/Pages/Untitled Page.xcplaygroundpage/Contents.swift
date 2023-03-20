import UIKit

protocol AdvertiseBuilder {
    var type: String { get }
    var title: String? { get }
    var target: String? { get }
    var creative: [Creative]? { get }
}

struct Creative {
    
}

struct ImageAdvertise: AdvertiseBuilder {
    var type: String = "Image"
    var title: String?
    var target: String?
    var creative: [Creative]?
}

struct VideoAdvertise: AdvertiseBuilder {
    var type: String = "Video"
    var title: String?
    var target: String?
    var creative: [Creative]?
}

class HomeImageAdvertise {
    var type: String
    var title: String?
    var target: String?
    var creative: [Creative]?
    
    init(builder: AdvertiseBuilder) {
        type = builder.type
        title = builder.title
        target = builder.target
        creative = builder.creative
    }
}

class HomeVideoAdvertise {
    var type: String
    var title: String?
    var target: String?
    var creative: [Creative]?
    
    init(builder: AdvertiseBuilder) {
        type = builder.type
        title = builder.title
        target = builder.target
        creative = builder.creative
    }
}

let imageAD = HomeImageAdvertise(builder: ImageAdvertise())
print(imageAD.type)

let videoAD = HomeVideoAdvertise(builder: VideoAdvertise())
print(videoAD.type)
