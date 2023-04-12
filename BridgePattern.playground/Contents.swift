// Bridge Pattern 예제

// Abstraction
protocol AdvertisementImplementor {
    var type: String { get set }
    func setUI()
}
// Implementor
class Advertisement {
    var advertisementImplementor: AdvertisementImplementor?
    
    init(implementor: AdvertisementImplementor) {
        self.advertisementImplementor = implementor
    }
    
    func setUI() {
        self.advertisementImplementor?.setUI()
    }
}
// Concrete Implementor
class LiveVideoAdvertisement: AdvertisementImplementor {
    var type: String = "Live"

    func setUI() {
        print("해당 광고는 \(type) 타입입니다.")
    }
}
// Concrete Implementor
class CatchImageAdvertisement: AdvertisementImplementor {
    var type: String = "Catch"

    func setUI() {
        print("해당 광고는 \(type) 타입입니다.")
    }
}
// Concrete Implementor
class VodShortVideoAdvertisement: AdvertisementImplementor {
    var type: String = "VodShortVideo"

    func setUI() {
        print("해당 광고는 \(type) 타입입니다.")
    }
}

// Using
let liveAdvertisement = LiveVideoAdvertisement()
let advertisement = Advertisement(implementor: liveAdvertisement)
advertisement.setUI()

let catchAdvertisement = CatchImageAdvertisement()
advertisement.advertisementImplementor = catchAdvertisement
advertisement.setUI()

let shortVideoAdvertisement = VodShortVideoAdvertisement()
advertisement.advertisementImplementor = shortVideoAdvertisement
advertisement.setUI()

// Refined Abstraction
extension Advertisement {
    func setBlurUI() {
        print("Blur 이미지를 만들어줍니다.")
    }
}

advertisement.setBlurUI()
