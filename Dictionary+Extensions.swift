//
//  Dictionary+Extensions.swift
//
//  Created by Vladimir Kazantsev on 23.01.15.
//  Copyright (c) 2015. All rights reserved.
//

import UIKit

extension Dictionary {

	init(_ elements: [Element]){
		self.init()
		for (k, v) in elements {
			self[k] = v
		}
	}
	
	func map<U>(transform: Value -> U) -> [Key : U] {
		return Dictionary<Key, U>(self.map({ (key, value) in (key, transform(value)) }))
	}
	
	func map<T : Hashable, U>(transform: (Key, Value) -> (T, U)) -> [T : U] {
		return Dictionary<T, U>(self.map(transform))
	}
	
	mutating func addEntriesFromDictionary<KeyType,ValueType>( dict: [KeyType: ValueType] ) {
		for ( key, value ) in dict {
			updateValue( value as! Value, forKey: key as! Key )
		}
	}
	
	subscript (key: Key, defaultValue: Value ) -> Value {
		if let value = self[ key ] {
			return value
		} else {
			return defaultValue
		}
	}
	func valueForKey<T>( key: Key, defaultValue: T ) -> T {
		if let value = self[ key ] as? T {
			return value
		} else {
			return defaultValue
		}
	}
}
