//
//  MVIViewModel.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine

open class BaseViewModel<T: MVIModel>: MVIViewModel {
	
	public typealias Model = T
	
	private lazy var intents = {
		return PassthroughSubject<MVIIntent, Error>()
	}()
	
	private lazy var storage = {
		return self.intents
			.eraseToAnyPublisher()
			.toReducer()
			.scan(self.initial(), { o, reducer in
        return reducer(o)
      })
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
	}()
	
	public lazy var cancelableBag = {
		return CompositeCancelable()
	}()
		
  public init() {
    /*no opt*/
  }
  
	open func initial() -> Model {
		return Model.empty
	}
	
	open func attach() {}
	
	open func detach() {
		cancelableBag.clear()
	}
	
	open func store() -> AnyPublisher<T, Error> {
		return storage.share()
			.eraseToAnyPublisher()
	}
	
	open func state() -> AnyPublisher<SyncState, Error> {
		return store().map { o in
			return o.state
		}.eraseToAnyPublisher()
	}
	
	open func accept(_ intent: MVIIntent) {
		intents.send(intent)
	}
}
