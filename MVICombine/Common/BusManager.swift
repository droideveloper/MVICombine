//
//  BusManager.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine

public class BusManager {
	
	private static var bus = {
		return PassthroughSubject<MVIEvent, Error>()
	}()
	
	public static func send<T>(_ event: T) where T: MVIEvent {
		bus.send(event)
	}
	
	public static func register(_ block: @escaping (MVIEvent) -> Void) -> AnyCancellable {
		return bus.sink(receiveCompletion: { _ in
			/** no opt */
		}, receiveValue: block)
	}
}
