//
//  AccountRepo.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//
var myacc = [Account]()
import Foundation
import  UIKit
class AccountRepo {
    
   //MARK : - Function for get the data from http request using URLSession
    static public func getAccountList()  {
        
                let url = URL(string : "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json")
       
        
            URLSession.shared.dataTask(with: url!) { [self] (data, response, error) in
                    do {
                        if (error == nil) {
                          
                             let json = try JSONDecoder().decode([Account].self, from: data!)
                        
                            myacc.removeAll()
                            
                            for acc in json {
                                myacc.append(acc)
                            
                                }
                               
            
                        }
                    } catch {
                        print("Error In Json Data")
                    }
                }.resume()
        
           
            }
        
        
        
        
    }

