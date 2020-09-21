//
//  IIntent+toNever.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine

public extension MVIIntent {
	
	func toEmpty<T>() -> AnyPublisher<T, Error> {
		return Empty<T, Error>()
		.eraseToAnyPublisher()
	}
}
