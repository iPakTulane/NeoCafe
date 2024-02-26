//
//  MainCategoryCollectionViewCell.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//

import UIKit
import SnapKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    private lazy var imageView = createImageView()
    private lazy var title = createTitle()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCell {
    
    private func setupView() {
        backgroundColor = .systemYellow
        layer.cornerRadius = 14
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(title)
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(8)
        }
    }
}


extension CategoryCell {
    
    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func createTitle() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }
}

extension CategoryCell {
    
    func configureCellWith(data: MockCategory) {
        imageView.image = UIImage(named: data.image)
        title.text = data.title
    }
}
    

    
    

