//
//  ReducerIntent+AnyPublisher.swift
//  MVICombine
//
//  Created by Fatih Sen on 25.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine

public extension ReducerIntent {
  
  func toAnyPublisher() -> AnyPublisher<Reducer<T>, Error> {
    return Future<Reducer<T>, Error> { [weak self] promise in
      if let zelf = self {
        promise(.success(zelf.invoke()))
      } else {
        promise(.failure(NSError()))
      }
    }.eraseToAnyPublisher()
  }
}
