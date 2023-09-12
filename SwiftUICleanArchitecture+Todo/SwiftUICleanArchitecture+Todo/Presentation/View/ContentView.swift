//
//  ContentView.swift
//  SwiftUICleanArchitecture+Todo
//
//  Created by Kant on 2023/09/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: TodoListViewModel // 사용자 인터페이스와 비즈니스 로직 간의 중개자 역할을 하며, ToDo 목록의 상태를 관리하고 업데이트합니다.
    
    // Interactor 하나가 여러개의 뷰를 담당할 수 있다. (여기에 존재하는 데이터는 공용데이터)
    // Presentor는 특정 View에 가공된 데이터를 전달하는 역할
    // Business Logic, Model을 담당하는 것을 Entity 라고 부름.
    
    init() {
        let repository = TodoListRepositoryImpl() // repository를 구체화 한 프로퍼티
        let interactor = TodoListInteractor(repository: repository) //  비즈니스 로직을 처리하며, 리포지토리에서 데이터를 검색하고 업데이트하고, 이러한 데이터를 ViewModel에 전달
        _viewModel = StateObject(wrappedValue: TodoListViewModel(todoListUseCase: interactor))
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                Text(todo.title)
                    .foregroundColor(todo.isCompleted ? .green : .black)
                    .onTapGesture {
                        viewModel.toggleTodoCompletionStatus(todo: todo)
                    }
            }
            .navigationBarTitle("Todo List")
            .navigationBarItems(trailing:
                Button("Add") {
                    addTodo()
                }
            )
        }
    }
    
    func addTodo() {
        let alert = UIAlertController(title: "New Todo", message: "Enter the title for your new todo:", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Todo Title"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
            if let title = alert.textFields?.first?.text, !title.isEmpty {
                viewModel.addTodo(title: title)
            }
        }))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
}
