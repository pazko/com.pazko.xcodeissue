//
//  EmptyCell.swift
//  xcode_issue
//
//  Created by 박동혁 on 3/11/25.
//

import UIKit
import Then
import SnapKit

final class EmptyCell: BaseCollectionCell {
    
    private let baseView = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupCell() {
        super.setupCell()
        contentView.addSubview(baseView)
    }
    
    override func updateLayout() {
        super.updateLayout()
        baseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.height.equalTo(100).priority(999) // priority 지정시 UIViewAlertForUnsatisfiableConstraints 방지
        }
    }
}
