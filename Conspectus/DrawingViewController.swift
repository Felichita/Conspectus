//
//  ViewController.swift
//  Conspectus
//
//  Created by Федор Николаев on 09.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {

	
    @IBOutlet weak var permanentView: CanvasView!
	
	var lastPoint = CGPoint.zero
	var red: CGFloat = 0.0
	var green: CGFloat = 0.0
	var blue: CGFloat = 0.0
	var brushWidth: CGFloat = 10.0
	var opacity: CGFloat = 1.0
	var swiped = false
	
	let colors: [(CGFloat, CGFloat, CGFloat)] = [(0, 0, 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
		permanentView.clearCanvas(animated: true)
		
		print("permanent loaded")
    }

    @IBAction func Clear(sender: AnyObject) {
        permanentView.image = nil
    }
	

}
