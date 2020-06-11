//
//  DefaultKeychainStorage.swift
//  
//
//  Created by Ali Fakih on 6/11/20.
//

import Foundation


public protocol UserSessionCoding {
    func encode(userSession: UserSession) -> Data
    func decode(data: Data) -> UserSession
}

public final class DefaultKeychainStorage  {
    
    private enum UserSessionKeychainKeys: String {
        case userSession = "USERSESSION"
    }
    private var mockSession: UserSession {
        return UserSession(profile: Profile(name: "", email: "", mobileNumber: "", avatar: "", products: []), deeplinkUserSession: DeeplinkUserSession(deeplink: nil))
    }
    private let userSessionCoder: UserSessionCoding
    
    public init(userSessionCoder: UserSessionCoding) {
        self.userSessionCoder = userSessionCoder
    }
    
    private func readUserSessionAsync(completion: @escaping CredentialsCompletion) {
        
        DispatchQueue.global(qos: .background).async {
            let query = KeychainItemQuery()
            do {
                if let data = try KeychainWrapper.findItem(query: query) {
                    let userSession = self.userSessionCoder.decode(data: data)
                    completion(.success(userSession))
                } else {
                    self.saveUserSessionAsync(userSession: self.mockSession, completion:  completion)
                }
            } catch { print(error.localizedDescription); completion(.failure(error))}
        }
    }
    
    private func saveUserSessionAsync(userSession: UserSession, completion: @escaping CredentialsCompletion) {
        userSession.logSession()
        let data = self.userSessionCoder.encode(userSession: userSession)
        let item = KeychainItemWithData(data: data)
        do {
            if let tempData = try KeychainWrapper.findItem(query: KeychainItemQuery()) {
                _ = try PropertyListDecoder().decode(UserSession.self, from: tempData)
                print("found in save")
                try KeychainWrapper.update(item: item)
                completion(.success(userSession))
                print("updated")
            } else {
                try KeychainWrapper.save(item: item)
                completion(.success(userSession))
                print("saved")
            }
            
        } catch { print("error saving \(error.localizedDescription)"); completion(.failure(error))}
    }
    
    private func deleteUserSessionAsync(completion: @escaping CredentialsCompletion) {
        DispatchQueue.global(qos: .background).async {
            do {
                try KeychainWrapper.delete(item: KeychainItem())
                completion(.success(nil))
            } catch { completion(.failure(error))}
        }
    }
}

extension DefaultKeychainStorage: UserSessionDataStorage {
    
    public func readUserSession(completion: @escaping CredentialsCompletion) -> OperationQueue {
        let operation = OperationQueue()
        operation.addOperation { [weak self] in
            guard let self = self else { return }
            self.readUserSessionAsync(completion: completion)
        }
        operation.waitUntilAllOperationsAreFinished()
        return operation
    }
    
    public func saveUserSession(userSession: UserSession, completion: @escaping CredentialsCompletion) -> OperationQueue {
        let operation = OperationQueue()
                print("************** HOLD ON **************")
        operation.addOperation { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.saveUserSessionAsync(userSession: userSession, completion: completion)
        }
        operation.waitUntilAllOperationsAreFinished()

        print("Saving User")
        return operation
    }
    
    public func deleteUserSession(completion: @escaping CredentialsCompletion) -> OperationQueue {
        let operation = OperationQueue()
        operation.addOperation { [weak self] in
            guard let self = self else { return }
            self.deleteUserSessionAsync(completion: completion)
        }
        operation.waitUntilAllOperationsAreFinished()
        return operation
    }
    
    public func updateUserSession(userSession: UserSession, completion: @escaping CredentialsCompletion) -> OperationQueue {
        let operation = OperationQueue()
        operation.addOperation { [weak self] in
            guard let self = self else { return }
            self.saveUserSessionAsync(userSession: userSession, completion: completion)
            print("Log in block")
            userSession.logSession()
        }
        operation.waitUntilAllOperationsAreFinished()
        return operation
    }
   
}
