//
//  TableViewCell.swift
//  Veryable Sample
//
//  Created by Dharti Savaliya on 6/22/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier: String = "myCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor  = UIColor(named: "Background")
        
        // calling the function
        setUp()
        constraints()
        AccountRepo.getAccountList()
    }
    
//MARK : Function Constraints
    
    func constraints () {
        cellView.snp.makeConstraints{
            
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        imgView.snp.makeConstraints{
            $0.leading.equalTo(10)
            $0.top.equalTo(20)
            $0.width.height.equalTo(20)
        }
        
        mainStackView.snp.makeConstraints {
            $0.left.equalTo(50)
            $0.top.equalTo(20)
            $0.right.equalTo(40)
            
        }
        
        button.snp.makeConstraints{
            $0.centerY.equalTo(cellView)
            $0.right.equalToSuperview().offset(-20)
            $0.width.height.equalTo(20)
            
        }
    }

    
//MARK : Created CellView
    lazy var cellView : UIView = {
        let cView = UIView(frame: .zero)
        let backgroundColor = UIColor(named: "Surface123")
        cView.backgroundColor = backgroundColor
        cView.clipsToBounds = true
        cView.layer.cornerRadius = 2
        return cView
    }()
   
    
//MARK : Create ImageView
    
    let imgView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
         return img
    }()
//MARK : Create bytton
    
    let button : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow"), for: .normal)
        btn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return btn
    }()
    
//MARK : Create Label
    var lblAccountName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.vryAvenirNextDemiBold(14)
        let color = UIColor(hexString: "#4A4A4A")
        lbl.textColor = color
        lbl.textAlignment = .left
        lbl.text = "Hello Wllsfargo"
    return lbl
     }()
    
    let lblAccountType : UILabel = {
        let lbl = UILabel()
        let color = UIColor(hexString: "#7E7E7E")
        lbl.textColor = color
        lbl.font = UIFont.vryAvenirNextRegular(12)
        lbl.textAlignment = .left
        lbl.text = "Cardjhvbhbjbjkn "
    return lbl
    }()
 

    var lblAccDescription : UILabel = {
        let lbl = UILabel()
        let color = UIColor(hexString: "#4A4A4A")
        lbl.textColor = color
        lbl.font = UIFont.vryAvenirNextRegular(12)
        lbl.textAlignment = .left
        lbl.text = "Wllsfargo123"
    return lbl
    }()
    
// MARK : Create Stack View
    lazy var mainStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lblAccountName,lblAccDescription,lblAccountType])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    
    }()
    
// MARK : Function for setup UIview and subview
    func setUp() {
        addSubview(cellView)
        cellView.addSubview(mainStackView)
        cellView.addSubview(imgView)
        cellView.addSubview(button)
    
    }
// MARK: - Button Action Event
    @objc private func didTapButton()  {
        let vc = DetailViewController()
        AccountListViewController().navigationController?.pushViewController(vc, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

