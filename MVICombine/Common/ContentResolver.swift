//
//  ContentResolver.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation

public protocol ContentResolver {
	
	func resolve<T>(type: T.Type) -> T
}
