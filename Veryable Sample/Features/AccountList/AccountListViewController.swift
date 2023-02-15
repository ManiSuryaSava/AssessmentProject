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
import Alamofire

@available(iOS 16.0, *)
class AccountListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Parameters
    let constant = Constants()
    var apiResult = [Account]()
    var cardResult = [Account]()
    var bankResult = [Account]()
    var items: [String] = []
    lazy var tbl: UITableView = {
        let v = UITableView(frame: .zero, style: .grouped)
        v.rowHeight = 80
        v.separatorStyle = .singleLine
        v.separatorInset = .zero
        return v
    }()
    
    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = constant.accountHeader
        view.backgroundColor = .white
    }
    required init?(coder: NSCoder) { nil }
    
    //MARK: Overrides
    override func loadView() {
        view = customView
        setupUI()
        AccountRepo.sharedInstance.getAccountList { [self] apiData in
            self.apiResult = apiData
            let filterCRArr =  self.apiResult.filter {$0.accountType == .card}
            if filterCRArr.count != 0 {
                self.cardResult.append(contentsOf: filterCRArr)
            }
            let filterBankArr =  self.apiResult.filter {$0.accountType == .bank}
            if filterBankArr.count != 0 {
                self.bankResult.append(contentsOf: filterBankArr)
            }
            
            DispatchQueue.main.async {
                self.tbl.reloadData()
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AvenirNext-Regular", size: 18)!]
            }
        }
    }
    
    // Setup
    func setupUI() {
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        self.view.addSubview(tbl)
        tbl.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    //MARK: Lazy Loads
    private lazy var customView: AccountListView = {
        AccountListView(delegate: self)
    }()
    
    // Table View Functions
    func cellrowUpdate(bankArr : [Account] , indexPath : IndexPath ,cell : CustomCell) {
        cell.firstLabel.text = bankArr[indexPath.row].accountName
        cell.secondLabel.text = bankArr[indexPath.row].desc
        cell.accessoryType = .disclosureIndicator
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        sectionHeader.backgroundColor = ViewColor.background.color
        let sectionText = UILabel()
        if section == 0 {
            sectionText.frame = CGRect.init(x: 15, y: 2, width: sectionHeader.frame.width-10, height: sectionHeader.frame.height-10)
            sectionText.text = constant.bankAccount
        } else {
            sectionText.frame = CGRect.init(x: 15, y: -15, width: sectionHeader.frame.width-10, height: sectionHeader.frame.height-10)
            sectionText.text = constant.cardsAccount
        }
        sectionText.font = .systemFont(ofSize: 14, weight: .bold) //  custom font
        sectionText.textColor = .black //  custom colour
        sectionHeader.addSubview(sectionText)
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 40
        } else {
            return 24
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return bankResult.count
        } else {
            return cardResult.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
        
        if indexPath.section == 0 {
            cellrowUpdate(bankArr: bankResult, indexPath: indexPath, cell: cell)
            cell.myImageView.image = UIImage(named: constant.bankTxt)
            cell.thirdLabel.text = constant.sameDayLbl
        }
        else {
            cell.myImageView.image = UIImage(named: constant.cardTxt)
            cellrowUpdate(bankArr: cardResult, indexPath: indexPath, cell: cell)
            cell.thirdLabel.text = constant.cardInstantLbl
        }
        let templateImage = cell.myImageView.image?.withRenderingMode(.alwaysTemplate)
        cell.myImageView.image = templateImage
        cell.myImageView.tintColor =  VBlue.normal.color
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = .black
        navigationItem.backBarButtonItem = backBarButtonItem
        navigationController?.navigationBar.backgroundColor = .white
        let secondScreenVC = DetailViewController()
        if indexPath.section == 0 {
            secondScreenVC.accountName = bankResult[indexPath.row].accountName
            secondScreenVC.accountDesc = bankResult[indexPath.row].desc
            secondScreenVC.accountType = bankResult[indexPath.row].accountType.rawValue
        }else {
            secondScreenVC.accountName = cardResult[indexPath.row].accountName
            secondScreenVC.accountDesc = cardResult[indexPath.row].desc
            secondScreenVC.accountType = cardResult[indexPath.row].accountType.rawValue
        }
            self.navigationController?.pushViewController(secondScreenVC, animated: true)
    }
}

@available(iOS 16.0, *)
extension AccountListViewController: AccountListDelegate {
    
}




