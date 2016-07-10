//
//  ViewController.swift
//  Conspectus
//
//  Created by Федор Николаев on 09.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import UIKit

func getDocumentsURL() -> NSURL {
	let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
	return documentsURL
}

func fileInDocumentsDirectory(filename: String) -> String {
	
	let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
	print(fileURL)
	return fileURL.path!
	
}

class DrawingViewController: UIViewController {

	
    @IBOutlet weak var permanentView: CanvasView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		permanentView.clearCanvas(animated: true)
		
		print("permanent loaded")
    }

    @IBAction func Clear(sender: AnyObject) {
		let myImageName = "image.png"
		let imagePath = fileInDocumentsDirectory(myImageName)
		
		if let image = permanentView.image{
			saveImage(image, path: imagePath)
		}else{
			print("some error message")
		}
		
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
