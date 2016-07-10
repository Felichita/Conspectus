//
//  MenuViewController.swift
//  Conspectus
//
//  Created by Никита on 10.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
	
	let disciplines = Disciplines()

    override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.sectionHeaderHeight = 70
		self.tableView.backgroundColor = UIColor.menuColor()
		self.tableView.separatorColor = UIColor.separatorColor()
		self.tableView.tableFooterView = UIView(frame: CGRectZero) // This will remove extra separators from tableView
		self.disciplines.load()
	}

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disciplines.list.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath)

        // Configure the cell...
		cell.backgroundColor = UIColor.menuColor()
		cell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 18)
		cell.textLabel?.text = disciplines.list[indexPath.row].name
		cell.textLabel?.textColor = UIColor.whiteColor()
		cell.selectedBackgroundView = UIView()
		cell.selectedBackgroundView!.backgroundColor = UIColor.selectedMenuColor()

        return cell
    }
	
	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		
		let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 20))
		let label = UILabel(frame: CGRect(x: 20, y: 20, width: tableView.frame.size.width, height: 50))
		label.text = "Предметы"
		label.font = UIFont(name: "Helvetica Bold", size: 22)
		label.textColor = UIColor.whiteColor()
		view.addSubview(label)
		
		return view
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
