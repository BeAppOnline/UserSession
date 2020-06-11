//
//  File.swift
//  
//
//  Created by Smart Mobile Tech on 6/11/20.
//

import Foundation

public struct RepositoryTask: Cancellable {
    let operation: OperationQueue?
    
    public func cancel() {
        operation?.cancelAllOperations()
    }
}
