//
//  SwiftUICleanArchitecture_TodoTests.swift
//  SwiftUICleanArchitecture+TodoTests
//
//  Created by Kant on 2023/09/10.
//

import XCTest
@testable import SwiftUICleanArchitecture_Todo

final class SwiftUICleanArchitecture_TodoTests: XCTestCase {
    
    var interactor: TodoListInteractor!
    
    override func setUp() {
        super.setUp()
        let repository = TodoListRepositoryImpl()
        interactor = TodoListInteractor(repository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
        interactor = nil
    }
    
    func testAddTodo() {
        // Given
        let initialCount = interactor.getAllTodos().count
        let todoTitle = "Test Todo"
        
        // When
        interactor.addTodo(title: todoTitle)
        
        // Then
        let todos = interactor.getAllTodos()
        XCTAssertEqual(todos.count, initialCount + 1)
        let addedTodo = todos.last
        XCTAssertEqual(addedTodo?.title, todoTitle)
        XCTAssertFalse(addedTodo?.isCompleted ?? true)
    }
    
    func testUpdateTodoCompletionStatus() {
        // Given
        let todoTitle = "Test Todo"
        interactor.addTodo(title: todoTitle)
        let todos = interactor.getAllTodos()
        let todoToUpdate = todos.last!
        
        // When
        interactor.updateTodoCompletionStatus(id: todoToUpdate.id, isCompleted: true)
        
        // Then
        let updatedTodos = interactor.getAllTodos()
        let updatedTodo = updatedTodos.last!
        XCTAssertTrue(updatedTodo.isCompleted)
    }
}
