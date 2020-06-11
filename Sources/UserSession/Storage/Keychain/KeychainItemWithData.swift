//
//  KeychainItemWithData.swift
//  
//
//  Created by Ali Fakih on 6/11/20.
//

import Foundation

class KeychainItemWithData: KeychainItem {
    // MARK: - Properties
    let data: AnyObject
    let itemData = kSecValueData as String

    // MARK: - Methods
    init(data: Data) {
      self.data = data as AnyObject
    }

    override func asDictionary() -> CFDictionary {
      let item: [String: AnyObject] = [itemClass: kSecClassGenericPassword,
                                       itemService: service,
                                       itemData: data]
      return item as CFDictionary
    }

    func attributesAsDictionary() -> CFDictionary {
      let attributes: [String: AnyObject] = [itemClass: kSecClassGenericPassword,
                                             itemService: service]
      return attributes as CFDictionary
    }

    func dataAsDictionary() -> CFDictionary {
      let justData: [String: AnyObject] = [itemData: data]
      return justData as CFDictionary
    }
}
