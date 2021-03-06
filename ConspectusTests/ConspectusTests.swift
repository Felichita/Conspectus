//
//  ConspectusTests.swift
//  ConspectusTests
//
//  Created by Федор Николаев on 09.07.16.
//  Copyright © 2016 Fedor Nikolaev. All rights reserved.
//

import XCTest
@testable import Conspectus

class ConspectusTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testDisciplines() {
		let disciplines = Disciplines()
		disciplines.load()
		disciplines.add("Матан")
		disciplines.remove(0)
	}
	
	func testNotes() {
		
		let disciplines = Disciplines()
		disciplines.add("Матан")
		let discipline = disciplines.list.first as Discipline!
		
		let notes = Notes()
		notes.load()
		notes.add("Простые числа", discipline: discipline)
		notes.add("Двойные интегралы", discipline: discipline)
		notes.remove(0)
	}
	
}
