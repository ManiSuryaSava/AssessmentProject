//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id: Int
    let accountType: AccountType
    let accountName, desc: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountType = "account_type"
        case accountName = "account_name"
        case desc
    }
}

enum AccountType: String, Codable {
    case bank = "bank"
    case card = "card"
}
