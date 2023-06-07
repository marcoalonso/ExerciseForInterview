//
//  ItemsViewControllerTests.swift
//  ExerciseTests
//
//  Created by Marco Alonso Rodriguez on 07/06/23.
//

import XCTest
@testable import Exercise

final class ItemsViewControllerTests: XCTestCase {

    //Probar que la vista tiene un arreglo de items
    func test_createPicker() throws {
        let sut = ItemsViewController()
        sut.loadViewIfNeeded()
        
        let arrayTasks = sut.tasks
        XCTAssert(arrayTasks.count == 0)
    }

}
