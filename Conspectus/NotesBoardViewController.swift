//
//  NotesBoardViewController.swift
//  Conspectus
//
//  Created by Никита on 10.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Note"

class NotesBoardViewController: UICollectionViewController {
	
    @IBOutlet weak var menuButton: UIBarButtonItem!
	
    @IBAction func goDraw(sender: UIBarButtonItem) {
		let targetStoryboard = UIStoryboard(name: "Canvas", bundle: nil)
		if let targetViewController = targetStoryboard.instantiateInitialViewController() {
			self.navigationController?.pushViewController(targetViewController, animated: true)
		}
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		// Register cell classes
		self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		
		// Do any additional setup after loading the view.
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
			self.revealViewController().rearViewRevealDisplacement = 0
			self.revealViewController().rearViewRevealOverdraw = 0
			self.revealViewController().rearViewRevealWidth = 275
			
			
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
	}
	*/
	
	// MARK: UICollectionViewDataSource
	
	override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	
	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of items
		return 6
	}
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
		
		// Configure the cell
		
		return cell
	}
	
	// MARK: UICollectionViewDelegate
	
	/*
	// Uncomment this method to specify if the specified item should be highlighted during tracking
	override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
	return true
	}
	*/
	
	/*
	// Uncomment this method to specify if the specified item should be selected
	override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
	return true
	}
	*/
	
	/*
	// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
	override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
	return false
	}
	
	override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
	return false
	}
	
	override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
	
	}
	*/

}
