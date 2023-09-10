//
//  TodoListUseCase.swift
//  SwiftUICleanArchitecture+Todo
//
//  Created by Kant on 2023/09/10.
//

// MARK: - UseCase 는 Actor(사용자)가 원하는 Entity 를 얻어낼 수 있는 로직들이 모여있습니다.

import Foundation

protocol TodoListUseCase {
    func getAllTodos() -> [Todo]
    func addTodo(title: String)
    func updateTodoCompletionStatus(id: Int, isCompleted: Bool)
}

class TodoListInteractor: TodoListUseCase {
    
    private let repository: TodoListRepository
    
    init(repository: TodoListRepository) {
        self.repository = repository
    }
    
    func getAllTodos() -> [Todo] {
        return repository.fetchTodos()
    }
    
    func addTodo(title: String) {
        guard title.count > 0 else { return }
        var todos = repository.fetchTodos()
        let newTodo = Todo(id: todos.count + 1, title: title, isCompleted: false)
        todos.append(newTodo)
        repository.saveTodos(todos)
    }
    
    func updateTodoCompletionStatus(id: Int, isCompleted: Bool) {
        var todos = repository.fetchTodos()
        if let index = todos.firstIndex(where: { $0.id == id} ) {
            todos[index].isCompleted = isCompleted
            repository.saveTodos(todos)
        }
    }
}
