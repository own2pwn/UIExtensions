//
//  UIColor+Defaults.swift
//
//  Created by Vladimir Kazantsev on 24.11.14.
//  Copyright (c) 2014. All rights reserved.
//

import UIKit

extension UIColor {
	
	convenience init( intRed: Int, intGreen: Int, intBlue: Int, alpha: CGFloat ) {
		self.init( red: CGFloat( intRed ) / 255, green: CGFloat( intGreen ) / 255, blue: CGFloat( intBlue ) / 255, alpha: alpha )
	}
	
	/// Returns a UIColor by scanning the string for a hex number.
	/// Skips any leading whitespace and ignores any trailing characters.
	convenience init?( hex: String ) {

		guard hex.length == 6 else { return nil }
		let scanner = NSScanner( string: hex )
		var hexNum: UInt32 = 0
		
		guard scanner.scanHexInt( &hexNum ) else { return nil }
		self.init( int: hexNum )
	}

	/// Returns random color with supplied alpha.
	convenience init( randomWithAlpha alpha: CGFloat ) {
		let randomRed = Int( arc4random_uniform( 256 ) )
		let randomGreen = Int( arc4random_uniform( 256 ) )
		let randomBlue = Int( arc4random_uniform( 256 ) )
		self.init( intRed: randomRed, intGreen: randomGreen, intBlue: randomBlue, alpha: alpha )
	}
	
	
	private convenience init( int: UInt32 ) {
		
		let r = CGFloat(( int >> 16 ) & 0xFF )
		let g = CGFloat(( int >> 8 ) & 0xFF )
		let b = CGFloat( int & 0xFF )
		
		self.init( red: r / 255, green: g / 255, blue: b / 255, alpha: 1.0 )
	}
	
}