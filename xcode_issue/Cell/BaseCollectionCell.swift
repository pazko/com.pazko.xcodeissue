//
//  BaseCollectionCell.swift
//  xcode_issue
//
//  Created by 박동혁 on 3/11/25.
//

import UIKit
import Reusable
//import Kingfisher
import SnapKit
import Then

open class BaseCollectionCell: UICollectionViewCell, Reusable {
    open var didUpdateConstraint = false
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
        updateLayout()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        updateLayout()
    }
    
    open override class var requiresConstraintBasedLayout: Bool {
        true
    }
    
    open override func updateConstraints() {
        super.updateConstraints()
    }
    
    open func setupCell() {

    }
    
    open func updateLayout() {
        if !didUpdateConstraint {
//            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            didUpdateConstraint = true
        }
    }
}
