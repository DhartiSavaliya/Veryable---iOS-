//
//  DetailViewController.swift
//  Veryable Sample
//
//  Created by Dharti Savaliya on 6/23/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var accDetail : Account?
    
//  MARK : - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "DETAILS"
        view.backgroundColor  = UIColor(named: "Background")
      
        //call functions
        setUp()
        constraints()

    }
    
    
// MARK : -  Create Imagview
    let Detail_imgView : UIImageView = {
       
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        

         return img
    }()
    
// MARK : - Create Account_name_label
    var lblName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.vryAvenirNextDemiBold(16)
        let color = UIColor(hexString: "#4A4A4A")
        lbl.textColor = color
        lbl.textAlignment = .center
 
     return lbl
     }()
    
// MARK : - Create Account_Description
    
    let lblDesc : UILabel = {
    let lbl = UILabel()
    let color = UIColor(hexString: "#7E7E7E")
    lbl.textColor = color
    lbl.font = UIFont.vryAvenirNextRegular(14)
    lbl.textAlignment = .left

    return lbl
    }()
 
// MARK : - Create Done Button
    
    let button : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(named: "PrimaryBlue")
        btn.setTitle("Done", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(AccountListViewController().self, action: #selector(doneTapped), for: .touchUpInside)
        
        return btn
    }()
    
// MARK : - Button_Action event
    @objc func doneTapped () {
       
        navigationController?.popViewController(animated: true)
    
    }
    
// MARK : - Function for setup UIview and subview
    
    func setUp() {
        
        view.addSubview(Detail_imgView)
        view.addSubview(button)
        view.addSubview(lblName)
        view.addSubview(lblDesc)
   
        
        let type = accDetail!.account_type
        let name = accDetail?.account_name
        let des = accDetail?.desc
        lblName.text = name
        lblDesc.text = des
     
        // check if card type is bank or card
        if type == "bank" {
            
            let image = UIImage(named: "bank")
            Detail_imgView.image = image
            Detail_imgView.setImageColor(color: UIColor(named: "PrimaryBlue")!)
           
           
        }else {
            Detail_imgView.image = UIImage(named: "card")
            Detail_imgView.setImageColor(color: UIColor(named: "PrimaryBlue")!)
           
        }
    }
    
// MARK : - Function for snap constraints for view
    func constraints () {
        
        Detail_imgView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.topMargin).offset(30)
            $0.width.height.equalTo(100)
                     
        }
        
        lblName.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(Detail_imgView.snp.bottom).offset(10)
           }
            
     
        lblDesc.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(lblName).offset(25)
          
            
        }
        
        button.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-30)
            $0.left.equalToSuperview().offset(30)
            $0.bottom.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
            
        }
      
    }

}
