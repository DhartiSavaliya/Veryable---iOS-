//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AccountListViewController: UIViewController {
    
    lazy var tableView = UITableView()// intialize tableview
    var myacc1 = myacc // instance for model Account
    
//MARK : ViewDidLoad Method
    
    override func viewDidLoad() {
       // Navigation bar Irems
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.title = "ACCOUNTS"
        
        //Function Call
        AccountRepo.getAccountList()
        customTableview()
       
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
      
    }
    
//MARK : Create TableView
    func customTableview() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "myCell")
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor  = UIColor(named: "Background")
        
    }
 
}
//Mark : -  Extension for View Controller

extension AccountListViewController : UITableViewDelegate,UITableViewDataSource {
   
    
// Table View Methods:
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myacc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
      
        // get data from model
        let acc_name = myacc[indexPath.row].account_name
        let acc_Type = myacc[indexPath.row].account_type
        let des =  myacc[indexPath.row].desc
       
        // Assign data to cell
        cell.lblAccountName.text = acc_name
        cell.lblAccountType.text = acc_Type
        cell.lblAccDescription.text = des
        
        if acc_Type == "card" {
            cell.imgView.image = UIImage(named: "card")
        }else {
            cell.imgView.image = UIImage(named: "bank")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedRow = myacc[indexPath.row]
        let vc = DetailViewController()
        vc.accDetail = selectedRow
               navigationController?.pushViewController(vc, animated: true)
           }
   
}


