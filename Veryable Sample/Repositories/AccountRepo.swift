//
//  AccountRepo.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

class AccountRepo {
    
    static let sharedInstance = AccountRepo()
    
    //API
    func getAccountList(handler: @escaping( _ apiData: [Account])->(Void)) {
        let url = "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { response in
                switch response.result
                {
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode([Account].self, from: data!)
                        handler(jsonData)
                        print(jsonData)
                    }catch {
                        print(error.localizedDescription)
                    }
                case .failure (let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}





