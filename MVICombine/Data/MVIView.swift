//
//  IView.swift
//  MVICombine
//
//  Created by Fatih Şen on 24.06.2020.
//  Copyright © 2020 Fatih Şen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

public protocol MVIView {
	
	associatedtype ViewModel
	
	mutating func attach()
	mutating func detach()
	mutating func viewEvents() -> AnyPublisher<MVIEvent, Error>
}
