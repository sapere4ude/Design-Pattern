//
//  TodoListRepository.swift
//  SwiftUICleanArchitecture+Todo
//
//  Created by Kant on 2023/09/10.
//

// MARK: - Repository 데이터베이스나 외부 데이터 소스와의 상호작용을 추상화하고 데이터 접근을 캡슐화하는 역할을 합니다.

import Foundation

protocol TodoListRepository {
    func fetchTodos() -> [Todo]
    func saveTodos(_ todos: [Todo])
}

class TodoListRepositoryImpl: TodoListRepository {
    
    private var todos: [Todo] = []
    
    func fetchTodos() -> [Todo] {
        return todos
    }
    
    func saveTodos(_ todos: [Todo]) {
        self.todos = todos
    }
}
