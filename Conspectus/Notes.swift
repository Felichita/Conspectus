//
//  Notes.swift
//  Conspectus
//
//  Created by Никита on 09.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import Foundation

struct Note {
	var title: String
	var createdDate: NSDate
	var discipline: Discipline
}

class Notes {
	
	var list = [Note]()
	
	func add(title: String, discipline: Discipline) -> Void {
		let date = NSDate()
		let note = Note(title: title, createdDate: date, discipline: discipline)
		self.list.append(note)
	}
	
	func remove(row: Int) -> Void {
		self.list.removeAtIndex(row)
	}
	
	func load() -> Void {
		// some code
	}
	
}