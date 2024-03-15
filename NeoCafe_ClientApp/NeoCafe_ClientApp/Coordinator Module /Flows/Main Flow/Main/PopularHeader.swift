//
//  PopularCollectionReusableView.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//

import UIKit
import SnapKit

class PopularHeader: UICollectionReusableView {
    static let identifier = "PopularHeader"
    private lazy var title = createTitle()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopularHeader {
    private func setupSubviews() {
        addSubview(title)
    }
    
    private func setupConstraints() {
        title.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }
    }
}

extension PopularHeader {
    private func createTitle() -> UILabel {
        let label = UILabel()
        label.text = "Популярное"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .gray
        return label
    }
}
