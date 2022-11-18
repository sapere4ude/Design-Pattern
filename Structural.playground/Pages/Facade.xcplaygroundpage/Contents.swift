// Facade

// 여러개의 인스턴스를 직접 소유하지 않고
// 간략화된 인터페이스를 통해 호출할 수 있는 방식을 의미한다.

import Foundation

protocol Facade {
    func work()
}

struct CPU {
    func work(with memory: Memory) { }
}

struct Memory {
    func input(from Devices: [Device]) { }
    func output(to Devices: [Device]) { }
}

class Device { }
class InputDevice: Device { }
class OutputDevice: Device { }
class Keyboard: InputDevice { }
class Monitor: OutputDevice { }
class TouchBar: Device { }

struct Computer: Facade {
    private let cpu = CPU()
    private let memory = Memory()
    private let keyboard = Keyboard()
    private let monitor = Monitor()
    private let touchBar = TouchBar()
    
    func work() {
        memory.input(from: [keyboard, touchBar])
        cpu.work(with: memory)
        memory.output(to: [monitor, touchBar])
    }
}

let computer = Computer()
computer.work()
