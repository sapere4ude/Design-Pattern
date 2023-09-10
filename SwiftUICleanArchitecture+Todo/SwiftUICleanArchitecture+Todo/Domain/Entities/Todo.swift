//
//  Todo.swift
//  SwiftUICleanArchitecture+Todo
//
//  Created by Kant on 2023/09/10.
//

import Foundation

// MARK: - Entity 에는 비즈니스가 변하지 않는 한 고정적인 것들 작성해줍니다.

struct Todo: Identifiable {
    let id: Int
    let title: String
    var isCompleted: Bool
}
