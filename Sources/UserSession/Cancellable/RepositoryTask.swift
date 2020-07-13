//
//  File.swift
//  
//
//  Created by Smart Mobile Tech on 6/11/20.
//

import Foundation
import Cancellable

public struct RepositoryTask: Cancellable {
    let operation: OperationQueue?
    
    public func cancel() {
        operation?.cancelAllOperations()
    }
}
