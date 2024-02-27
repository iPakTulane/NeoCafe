//
//  CommonProductCell.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//

import UIKit
import SnapKit

class CommonProductCell: UICollectionViewCell {
    
//    static let identifier = "CommonProductCell"
    
    lazy var image = createImageView()
    lazy var title = createTitleLabel()
    lazy var subtitle = createSubtitleLabel()
    lazy var details = createDetailsLabel()
    lazy var button = createPlusButton()
    
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

extension CommonProductCell {
    
    private func setupView() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 10.0
        button.layer.maskedCorners = [.layerMaxXMaxYCorner]
        //        backgroundColor = .blue
        //        layer.cornerRadius = 20
        //        layer.shadowColor = UIColor.black.cgColor
        //        layer.shadowOffset = CGSize(width: 0, height: -4.0)
        //        layer.shadowOpacity = 0.12
        //        layer.shadowRadius = 5.0
    }
    
    private func setupSubviews() {
        addSubview(image)
        addSubview(title)
        addSubview(subtitle)
        addSubview(details)
        addSubview(button)
    }
    
    private func setupConstraints() {
        
        image.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
//            make.width.height.equalTo(80)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalTo(image.snp.trailing).offset(12)
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(6)
            make.leading.equalTo(image.snp.trailing).offset(12)
        }
        
        details.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().inset(8)
            make.top.equalTo(subtitle.snp.bottom).offset(6)
            make.leading.equalTo(image.snp.trailing).offset(12)
        }
        
        button.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview()
            make.width.equalTo(56)
            make.height.equalTo(40)
        }
    }
}

extension CommonProductCell {
    
    private func createImageView() -> UIImageView {
        let image = UIImage(named: "americano")
        let imageView = UIImageView()
        imageView.image = image
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isHidden = false
        return imageView
    }
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.isHidden = false
        return label
    }
    
    private func createSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.isHidden = false
        return label
    }
    
    private func createDetailsLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.isHidden = false
        return label
    }
    
    private func createPlusButton() -> UIButton {
        let image = UIImage(named: "plusButton")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = .none
        button.backgroundColor = .none
        button.isHidden = false
        // Set the corner radius for the button
        button.layer.cornerRadius = 8.0
        button.layer.maskedCorners = [.layerMaxXMaxYCorner]
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }

}

//#if DEBUG
//import SwiftUI
//
//@available(iOS 13.0, *)
//struct MainViewController_Provider: PreviewProvider {
//    static var previews: some View {
//        MainViewController().showPreview()
//    }
//}
//#endif
