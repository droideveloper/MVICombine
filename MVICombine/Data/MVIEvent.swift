//
//  Event.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation

open class MVIEvent {
	
	private static let empty = EmptyIntent()
	
  public init() { }
  
	open func toIntent(resolver: ContentResolver) -> MVIIntent {
		return MVIEvent.empty
	}
	
	open func payload() -> [String: Any] {
		return [:]
	}
}
