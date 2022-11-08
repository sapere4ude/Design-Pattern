// Bridge

// 구현부에서 추상층을 분리하여 각자 독립적으로 변형할 수 있게 하는 패턴
// 거대한 클래스 or 밀접하게 관련된 클래스들을 분리하여 서로 독립적인 수정/확장이 가능하게 하는 패턴

import Foundation

protocol RemoteControl {
    var device: Device { get set }
    func togglePower()
}

protocol Device {
    func turnOn()
    func setVolume(to: Int)
}

struct BasicRempteControl: RemoteControl {
    var device: Device
    func togglePower() {
        device.turnOn()
    }
    func mute() {
        device.setVolume(to: 0)
    }
}

struct TV: Device {
    func turnOn() {
        print("Turn on TV")
    }
    
    func setVolume(to percent: Int) {
        print("Set TV volume to \(percent)")
    }
}

struct Radion: Device {
    func turnOn() {
        print("Turn on Radio")
    }
    
    func setVolume(to percent: Int) {
        print("Set radio volume to \(percent)")
    }
}
