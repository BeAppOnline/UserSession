//
//  UserSessionDataStorage.swift
//  
//
//  Created Ali Fakih on 6/11/20.
//

import Foundation

public protocol UserSessionDataStorage {
    
    func readUserSession(completion: @escaping CredentialsCompletion) -> OperationQueue
    func saveUserSession(userSession: UserSession, completion: @escaping CredentialsCompletion) -> OperationQueue
    func deleteUserSession(completion: @escaping CredentialsCompletion) -> OperationQueue
    func updateUserSession(userSession: UserSession, completion: @escaping CredentialsCompletion) -> OperationQueue
}
