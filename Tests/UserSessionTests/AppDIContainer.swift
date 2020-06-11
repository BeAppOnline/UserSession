//
//  AppDIContainer.swift
//  
//
//  Created by Ali Fakih on 6/11/20.
//

import Foundation
@testable import UserSession

final class AppDIContainer {
    func makeUserSessionDataStorageRepository() -> UserSessionDataStorage {
        func makeUserSessionCoder() -> UserSessionCoding {
            return UserSessionPropertyListCoder()
        }
        let coder = makeUserSessionCoder()
        return DefaultKeychainStorage(userSessionCoder: coder)
    }
}
