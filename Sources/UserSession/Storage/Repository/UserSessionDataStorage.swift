//
//  UserSessionDataStorage.swift
//  
//
//  Created Ali Fakih on 6/11/20.
//

import Foundation
import Cancellable

public protocol UserSessionDataStorage {
    
    func readUserSession(completion: @escaping CredentialsCompletion) -> Cancellable?
    func saveUserSession(userSession: UserSession, completion: @escaping CredentialsCompletion) -> Cancellable?
    func deleteUserSession(completion: @escaping CredentialsCompletion) -> Cancellable?
    func updateUserSession(userSession: UserSession, completion: @escaping CredentialsCompletion) -> Cancellable?
}
