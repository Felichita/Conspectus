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
	
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.clearCanvas(animated:false)
    }

    @IBAction func Clear(sender: AnyObject) {
		permanentView.count = 0
		permanentView.image = nil
	
    }
	
	func saveImage(image: UIImage, path: String) -> Bool{
		let pngImageData = UIImagePNGRepresentation(image)
		let result = pngImageData!.writeToFile(path,atomically: true)
		
		return result
	}
	
	func loadImageFromPath(path: String) -> UIImage? {
		let image = UIImage(contentsOfFile: path)
		if image == nil {
			
			print ("missing image at: \(path)")
		}
		print("Loading image from path: \(path)")
		return image
	}

}
