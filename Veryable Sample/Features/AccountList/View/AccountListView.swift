//
//  AccountListView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol AccountListDelegate: AnyObject {}

class AccountListView: UIView {
    
    //MARK: Public API
    
    //MARK: Inits
    init(delegate: AccountListDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }
    
    private func setup() {
        backgroundColor = ViewColor.background.color
        
        constrain()
    }
    
    private func constrain() {
        
    }
    
    //MARK: Overrides
    
    //MARK: Private members
    private weak var del: AccountListDelegate?
    
}



