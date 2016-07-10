//
//  Utils.swift
//  Conspectus
//
//  Created by Никита on 10.07.16.
//  Copyright © 2016 Fedor Nikolaev. All rights reserved.
//

import UIKit

extension UIColor {
	
	class func UIColorRGB(rgb: Int) -> UIColor {
		return UIColor(red: CGFloat((rgb >> 16) & 0xff)/255.0, green: CGFloat((rgb >> 8) & 0xff)/255.0, blue: CGFloat(rgb & 0xff)/255.0, alpha: 1.0)
	}
	
	class func UIColorRGBA(rgb: Int, a: CGFloat) -> UIColor {
		return UIColor(red: CGFloat((rgb >> 16) & 0xff)/255.0, green: CGFloat((rgb >> 8) & 0xff)/255.0, blue: CGFloat(rgb & 0xff)/255.0, alpha: a)
	}
	
	class func menuColor() -> UIColor { // #384555
		return UIColorRGB(0x384555)
	}
	class func selectedMenuColor() -> UIColor { // #222a33
		return UIColorRGB(0x222a33)
	}
	class func separatorColor() -> UIColor { // #6F7179
		return UIColorRGB(0x6F7179)
	}
	
}

extension NSDateFormatter {
	convenience init(dateStyle: NSDateFormatterStyle) {
		self.init()
		self.dateStyle = dateStyle
	}
}

extension NSDate {
	struct Formatter {
		static let shortDate = NSDateFormatter(dateStyle: .ShortStyle)
	}
	var shortDate: String {
		return Formatter.shortDate.stringFromDate(self)
	}
}