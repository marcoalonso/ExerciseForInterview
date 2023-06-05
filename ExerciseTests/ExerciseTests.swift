//
//  ExerciseTests.swift
//  ExerciseTests
//
//  Created by Marco Alonso Rodriguez on 05/06/23.
//

import XCTest
@testable import Exercise

final class ExerciseTests: XCTestCase, ManagerItemProtocol {
    
    var itemsReceived : [TaskItem] = []
    var errorMessage: String?
    
    func test_ErrorReceivedCorrectly(){
        //Given
        var manager = Manager()
        manager.delegate = self
        let expectation = XCTestExpectation(description: "Se espera recibir mensaje de error")
        
        //Then
        manager.getItems(urlString: Manager.urlStringMock)
        
        //When
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertNotNil(self.errorMessage)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func test_NetworkResponse(){
        //Given
        var manager = Manager()
        manager.delegate = self
        
        let expectation = XCTestExpectation(description: "Se espera recibir datos de la API")
        
        //then
        manager.getItems(urlString: Manager.urlString)
        
        //When
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.itemsReceived.count > 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    
    // MARK: Protocol Methods
    func getItems(items: [Exercise.TaskItem]) {
        self.itemsReceived = items
        print("items", items)
    }
    
    func showError(with: Error) {
        errorMessage = "\(with)"
    }
   

}
