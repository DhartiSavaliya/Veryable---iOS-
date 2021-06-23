//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

struct Account : Codable {
    var id : Int = 0
    var account_type : String = ""
    var account_name : String = ""
    var desc : String = ""
    
    init?(dictionary : [String : Any]){
        guard let id = dictionary["id"],
                        let account_name = dictionary["account_name"],
                        let account_type = dictionary["account_type"],
                        let desc = dictionary["desc"]
                    else {
                        return nil
                    }
        
        self.id = id as! Int
        self.account_type = account_type as! String
        self.account_name = account_name as! String
        self.desc = desc as! String
    }
    
   
    
    
    
    
}
