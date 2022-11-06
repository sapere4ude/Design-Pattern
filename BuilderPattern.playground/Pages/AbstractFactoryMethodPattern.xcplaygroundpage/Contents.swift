// Abstract Factory Method Pattern

// 추상 팩토리 패턴은 객체의 집합을 생성할 때 유리한 패턴
// 기존의 팩토리를 한번 더 추상화하여 서로 관련이 있는 제품군을 생성하게 해줍니다.

import UIKit
import Foundation

/* 생성 담당 Factory 구현 */

// 추상 팩토리
protocol UIFactoryable {
    func createButton() -> Buttonable
    func createLabel() -> Labelable
}

// 제품을 실제로 생성하는 구체 Factory
final class iPadUIFactory: UIFactoryable {
    func createButton() -> Buttonable {
        return IPadButton()
    }
    
    func createLabel() -> Labelable {
        return IPadLabel()
    }
}

final class iPhoneUIFactory: UIFactoryable {
    func createButton() -> Buttonable {
        return IPhoneButton()
    }
    
    func createLabel() -> Labelable {
        return IPhoneLabel()
    }
}

/* 생성될 Product 구현 */

protocol Buttonable {
    func touchUpInside()
}

protocol Labelable {
    var title: String { get }
}

final class IPhoneButton: Buttonable {
    func touchUpInside() {
        print("iPhone Button")
    }
}

final class IPadButton: Buttonable {
    func touchUpInside() {
        print("iPad Button")
    }
}

final class IPhoneLabel: Labelable {
    var title: String = "iPhone Label"
}

final class IPadLabel: Labelable {
    var title: String = "iPad Label"
}

class UIContent {
    var uiFactory: UIFactoryable
    var label: Labelable?
    var button: Buttonable?
    
    init(uiFactory: UIFactoryable = iPadUIFactory()) {
        self.uiFactory = uiFactory
        setupUI()
    }
    
    func setupUI() {
        label = uiFactory.createLabel()
        button = uiFactory.createButton()
    }
}

class ViewController: UIViewController {
    var iPhoneUIContent = UIContent()
    var iPadUIContent = UIContent(uiFactory: iPadUIFactory())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        touchUpButton()
        printLabelTitle()
    }
    
    func touchUpButton() {
        iPhoneUIContent.button?.touchUpInside()
        iPadUIContent.button?.touchUpInside()
    }
    
    func printLabelTitle() {
        print(iPhoneUIContent.label?.title ?? "")
        print(iPadUIContent.label?.title ?? "")
    }
}
