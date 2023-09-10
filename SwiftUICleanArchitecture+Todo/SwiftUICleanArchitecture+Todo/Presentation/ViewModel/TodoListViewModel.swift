//
//  TodoListViewModel.swift
//  SwiftUICleanArchitecture+Todo
//
//  Created by Kant on 2023/09/10.
//

import Foundation

// MARK: - Presentation: Entity 데이터를 그대로 표현(present) 하는데 필요한 계층. ViewModel, View, Coordinator 등이 여기에 속합니다.

class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    private let todoListUseCase: TodoListUseCase
    
    init(todoListUseCase: TodoListUseCase) {
        self.todoListUseCase = todoListUseCase
        self.todos = todoListUseCase.getAllTodos()
    }
    
    func addTodo(title: String) {
        todoListUseCase.addTodo(title: title)
        todos = todoListUseCase.getAllTodos()
    }
    
    func toggleTodoCompletionStatus(todo: Todo) {
        todoListUseCase.updateTodoCompletionStatus(id: todo.id, isCompleted: !todo.isCompleted)
        todos = todoListUseCase.getAllTodos()
    }
}
