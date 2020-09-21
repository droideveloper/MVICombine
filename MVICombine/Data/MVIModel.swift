//
//  Model.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation

public protocol MVIModel {
  associatedtype Entity
  
  static var empty: Self { get }
  
  var state: SyncState { get set }
  var data: Entity { get set }
  
  func copy(state: SyncState?, data: Entity?) -> Self
}
