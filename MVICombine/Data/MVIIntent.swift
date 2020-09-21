//
//  Intent.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine

public protocol MVIIntent { }

open class EmptyIntent: MVIIntent {
	/* no opt */
}

open class ReducerIntent<T>: MVIIntent {
	
	public init() { /*no opt*/ }
	
	open func invoke() -> Reducer<T> {
		return { o in o }
	}
}

open class CombineIntent<T>: MVIIntent {
	
	public init() { /*no opt*/ }
	
	open func invoke() -> AnyPublisher<Reducer<T>, Error> {
		return Empty<Reducer<T>, Error>()
			.eraseToAnyPublisher()
	}
}

public typealias Reducer<T> = (T) -> T
