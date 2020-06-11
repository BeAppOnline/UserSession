//
//  File.swift
//  
//
//  Created by Smart Mobile Tech on 6/11/20.
//

import Foundation

struct RepositoryTask: Cancellable {
    let operation: OperationQueue?
    
    func cancel() {
        operation?.cancelAllOperations()
    }
}
