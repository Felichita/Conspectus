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
		// some initial code
		let notes = ["Двойные интегралы", "Простые числа", "Кривые Безье", "Криволинейный интеграл", "Ряды Фурье", "Интеграл Фурье"]
		let discipline = Discipline(name: "Матан")
		for n in notes {
			self.add(n, discipline: discipline)
		}
	}
	
}