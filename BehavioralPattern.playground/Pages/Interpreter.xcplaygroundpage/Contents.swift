// Interpreter

// 어떤 입력값을 받으면 약속된 값을 돌려주는 것
//

import Foundation

protocol AbstractExpression {
    func interpret(_ context: Context)
}

final class Context {
    enum Gender {
        case male
        case female
    }

    private var persons: [String: Gender] = [:]

    func getPersons() -> [String: Gender] {
        self.persons
    }

    func lookup(name: String) -> Gender {
        return self.persons[name]!
    }

    func assign(expression: TerminalExpression, gender: Gender) {
        self.persons[expression.name] = gender
    }
}

final class TerminalExpression: AbstractExpression {
    let name: String

    init(name: String) {
        self.name = name
    }

    func interpret(_ context: Context) {
        print(context.lookup(name: self.name))
    }
}

final class NonterminalExpression: AbstractExpression {
    private var maleCount: Int = 0
    private var femaleCount: Int = 0

    func interpret(_ context: Context) {
        for person in context.getPersons() {
            if person.value == .male {
                maleCount += 1
            } else if person.value == .female {
                femaleCount += 1
            }
        }
        print("남자는 \(maleCount)명, 여자는 \(femaleCount)명입니다")
    }
}

let context = Context()
let a = TerminalExpression(name: "김연경")
let b = TerminalExpression(name: "손흥민")
let c = TerminalExpression(name: "류현진")
context.assign(expression: a, gender: .female)
context.assign(expression: b, gender: .male)
context.assign(expression: c, gender: .male)
let expression = NonterminalExpression()
expression.interpret(context)
a.interpret(context) // female
