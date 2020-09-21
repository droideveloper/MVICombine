//
//  File.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation

public enum SyncState: CustomStringConvertible, Equatable {
	case idle
	case failure(Error)
	case operation(Int, Bool)
	
	public static func ==(lhs: SyncState, rhs: SyncState) -> Bool {
		
		// TODO implement this
		return false
	}
	
	public var description: String {
		get {
      switch self {
      case .idle:
        return "idle"
      case .failure(let error):
        return "error with: \(error.localizedDescription)"
      case .operation(let type, let initial):
        return "operation of \(type) with initial: \(initial)"
      }
    }
	}
}
