//
//  UserSessionPropertyListCoder.swift
//  
//
//  Created by Ali Fakih on 6/11/20.
//

import Foundation

public class UserSessionPropertyListCoder: UserSessionCoding {
     
    
    init() {}
    
    public func encode(userSession: UserSession) -> Data {
        return try! PropertyListEncoder().encode(userSession)
    }
    
    public func decode(data: Data) -> UserSession {

        return try! PropertyListDecoder().decode(UserSession.self, from: data)
    }
}
