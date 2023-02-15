//
//  DetailViewController.swift
//  Veryable Sample
//
//  Created by MANI SURYA SAVA on 2/14/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

@available(iOS 16.0, *)
class DetailViewController: UIViewController {
    
    // Parameters
    let constant = Constants()
    var accountName: String?
    var accountDesc: String?
    var accountType: String?
    var image = UIImageView()
    let label1: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextDemiBold(16)
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextRegular(14)
        label.textAlignment = .left
        label.textColor = UIColor(red: 126/255, green: 126/255, blue: 126/255, alpha: 1.0)
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("DONE", for: .normal)
        button.backgroundColor = VBlue.normal.color
        return button
    }()
//viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = ""
        self.title = constant.detailHeader
        self.view.backgroundColor =  ViewColor.background.color
        self.view.tintColor = ViewColor.surface.color
        setupUI()
    }
//setUp
    func setupUI() {
        image.image = UIImage(named: accountType!)
        label1.text = accountName
        label2.text = accountDesc
        self.view.addSubview(image)
        self.view.addSubview(label1)
        self.view.addSubview(label2)
        self.view.addSubview(doneButton)
        imageColorSetUp()
        image.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(100)
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(20)
            make.centerX.equalTo(image)
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(5)
            make.centerX.equalTo(image)
        }
        doneButton.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.centerX.equalTo(image)
            make.height.equalTo(55)
            make.bottom.equalTo(self.view).offset(-100)
        }
        doneButton.addTarget(self, action: #selector(dismissSecondViewController), for: .touchUpInside)
    }
    //Image Color Change
    func imageColorSetUp() {
        let templateImage = image.image?.withRenderingMode(.alwaysTemplate)
        image.image = templateImage
        image.tintColor = VBlue.normal.color
    }
    
// Dismiss Function
    @objc func dismissSecondViewController() {
        navigationController!.popViewController(animated: true)
    }
}
