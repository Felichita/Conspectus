//
//  Discipline.swift
//  Conspectus
//
//  Created by Никита on 09.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import UIKit
import CoreData

class Disciplines {

	var list = [NSManagedObject]()
	
	func add(name: String) -> Void {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = appDelegate.managedObjectContext
		
		let discipline = NSEntityDescription.insertNewObjectForEntityForName("Discipline", inManagedObjectContext: managedObjectContext)
		discipline.setValue(name, forKey: "name")
		
		do {
			try managedObjectContext.save()
			self.list.append(discipline)
		} catch let error as NSError  {
			print("Could not save \(error), \(error.userInfo)")
		}
	}
	
	func load() -> Void {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = appDelegate.managedObjectContext
		
		let fetchRequest = NSFetchRequest(entityName: "Discipline")
		do {
			let results = try managedObjectContext.executeFetchRequest(fetchRequest)
			self.list = results as! [NSManagedObject]
		} catch let error as NSError {
			print("Could not fetch \(error), \(error.userInfo)")
		}
	}
	
//	func archive(name: String) -> Void {
//
//		let fetchRequest = NSFetchRequest(entityName: "Discipline")
//		let predicate = NSPredicate...
//		fetchRequest.predicate = predicate
//
//		do {
//			let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//			try self.managedObjectContext.save()
//		} catch let error as NSError  {
//			print("Could not save \(error), \(error.userInfo)")
//		}
//	}
	
//	func delete(row: Int) -> Void {
//        
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedObjectContext = appDelegate.managedObjectContext
//		
//		managedObjectContext.deleteObject(self.list[row])
//		do {
//			try managedObjectContext.save()
//			self.list.removeAtIndex(row)
//		} catch let error as NSError  {
//			print("Could not save \(error), \(error.userInfo)")
//		}
//	}
	
}

// cell!.textLabel!.text = person.valueForKey("name") as? String