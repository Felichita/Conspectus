//
//  NotesBoardViewController.swift
//  Conspectus
//
//  Created by Никита on 10.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import UIKit

class NotesBoardViewController: UICollectionViewController {
	
	let navTitle = ""
	let notes = Notes()
	
	private let reuseIdentifier = "Note"
	private let sectionInsets = UIEdgeInsets(top: 25.0, left: 25.0, bottom: 25.0, right: 25.0)
	
    @IBOutlet weak var menuButton: UIBarButtonItem!
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationItem.title = navTitle
		self.notes.load()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		// Register cell classes
		// self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		
		// Do any additional setup after loading the view.
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
			self.revealViewController().rearViewRevealDisplacement = 0
			self.revealViewController().rearViewRevealOverdraw = 0
			self.revealViewController().rearViewRevealWidth = 325
			self.revealViewController().revealToggleAnimated(true)
		}
	}
	
	// MARK: UICollectionViewDataSource
	override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	
	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.notes.list.count + 1 // one for "add" cell
	}
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NoteCollectionViewCell
		
		// Configure the cell
		cell.backgroundColor = UIColor.darkGrayColor()
		cell.layer.masksToBounds = true
		cell.layer.cornerRadius = 6
		cell.title.textColor = UIColor.whiteColor()
		cell.createdDate.textColor = UIColor.whiteColor()
		
		if (indexPath.row != 0) {
			let els = self.notes.list.count
			let createdDate = self.notes.list[els - indexPath.row].createdDate
			cell.title.text = self.notes.list[els - indexPath.row].title
			cell.createdDate.text = createdDate.shortDate
		} else { // "add" cell
			cell.title.text = "Добавить запись"
			cell.createdDate.text = ""
		}
		return cell
	}
	
	// MARK: UICollectionLayoutDelegate
	func collectionView(collectionView: UICollectionView, layout collecvtionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		return CGSize(width: 305, height: 150)
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
		return self.sectionInsets
	}
	
	
	// MARK: - Navigation
	override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		
		let targetStoryboard = UIStoryboard(name: "Canvas", bundle: nil)
		if let targetViewController = targetStoryboard.instantiateInitialViewController() as? DrawingViewController {
//			targetViewController.note
			self.navigationController?.pushViewController(targetViewController, animated: true)
		}
	}

}
