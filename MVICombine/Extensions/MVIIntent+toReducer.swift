//
//  AnyPublisher+Intent.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine

public extension AnyPublisher where Failure == Error, Output == MVIIntent {
	
	func toReducer<T>() -> AnyPublisher<Reducer<T>, Error> {
		return self.flatMap { intent -> AnyPublisher<Reducer<T>, Error> in
			if let intent = intent as? ReducerIntent<T> {
        return intent.toAnyPublisher()
			} else if let intent = intent as? CombineIntent<T> {
				return intent.invoke()
			}
			return intent.toEmpty()
		}.eraseToAnyPublisher()
	}
}
