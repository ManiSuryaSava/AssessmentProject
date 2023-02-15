//
//  CustomCell.swift
//  Veryable Sample
//
//  Created by MANI SURYA SAVA on 2/14/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
   // Parameters
    static var cellId = "cell"
    let myImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextDemiBold(14)
        label.textAlignment = .left
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextRegular(12)
        label.textAlignment = .left
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        return label
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextRegular(12)
        label.textAlignment = .left
        label.textColor = UIColor(red: 126/255, green: 126/255, blue: 126/255, alpha: 1.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup
    func setupViews() {
//        let templateImage = imageView!.image?.withRenderingMode(.alwaysTemplate)
//        imageView!.image = templateImage
//        imageView!.tintColor = UIColor.red
        addSubview(myImageView)
        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(thirdLabel)
        myImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(8)
            make.height.width.equalTo(20)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalTo(myImageView.snp.right).offset(12)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(15)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(4)
            make.left.equalTo(myImageView.snp.right).offset(12)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(15)
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(4)
            make.left.equalTo(myImageView.snp.right).offset(12)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(15)
        }
    }
}
