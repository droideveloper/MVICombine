//
//  IViewModel.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine

public protocol MVIViewModel {
	
	associatedtype Model
	
	func attach()
	func detach()
	
	func state() -> AnyPublisher<SyncState, Error>
	func store() -> AnyPublisher<Model, Error>
	func accept(_ intent: MVIIntent)
}
