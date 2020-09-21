//
//  CompositeAnyCancelable.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine

public class CompositeCancelable {
	
	private var bag = Array<Cancellable>()
	
	public init() { /*no opt*/ }
	
	public func add(_ cancelable: Cancellable) {
		bag.append(cancelable)
	}
	
	public func clear() {
		bag.forEach { cancelable in
			cancelable.cancel()
		}
		bag.removeAll()
	}
	
	public static func +=(bag: CompositeCancelable, cancelable: Cancellable) {
		bag.add(cancelable)
	}
}
