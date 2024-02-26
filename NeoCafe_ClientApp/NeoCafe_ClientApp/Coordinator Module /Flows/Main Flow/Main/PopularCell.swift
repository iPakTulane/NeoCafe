//
//  MainMenuCollectionViewCell.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//


import UIKit
import SnapKit

protocol PopularCellDelegate: AnyObject {
    func stepperValueChanged(_ value: Int)
}

class PopularCell: CommonProductCell {
    
    weak var delegate: PopularCellDelegate?
    
    static let identifier = "PopularCell"

    private lazy var cell = CommonProductCell()
    private lazy var stepper = CommonStepper()
    
    var stepperValue: Int = 0 {
        didSet {
            stepper.valueLabel.text = "\(stepperValue)"
        }
    }
    
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

extension PopularCell {
    
    private func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 8.0
        button.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        backgroundColor = .blue
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -4.0)
        layer.shadowOpacity = 0.12
        layer.shadowRadius = 5.0
    }

    private func setupSubviews() {
        contentView.addSubview(cell)
        contentView.addSubview(stepper)

        cell.button.layer.cornerRadius = 20
        cell.button.isHidden = false
        stepper.isHidden = true
    }
    
    private func setupConstraints() {
        
        cell.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(86)
            make.edges.equalToSuperview()
        }
        
        stepper.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(12)
            make.height.equalTo(32)
            make.width.equalTo(102)
        }
    }
}

extension PopularCell {
    
    func configureCellWith(data: MockPopular) {
        cell.image.image = UIImage(named: data.image)
        cell.title.text = data.title
        cell.subtitle.text = data.description
        cell.details.text = String(data.price)
    }
    
    func configureCell() {
        cell.button.addTarget(self, action: #selector(cellButtonTapped), for: .touchUpInside)
    }

    @objc func cellButtonTapped() {
        configureStepper()
    }
}

extension PopularCell {
    private func configureStepper() {
        cell.button.isHidden = true
        stepper.isHidden = false
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
    }
    
    @objc private func stepperValueChanged() {
        stepperValue = Int(stepper.valueLabel.text ?? "1") ?? 1
        delegate?.stepperValueChanged(stepperValue)
    }
}


// MARK: - PopularCellDelegate
class PopularCellViewModel: PopularCellDelegate {
    
    var cell: PopularCell?
    var productPrice: Double = 0.0

    init() {
        self.cell = PopularCell()
        self.cell?.delegate = self
    }

    func stepperValueChanged(_ value: Int) {
        let newPrice = productPrice * Double(value)
        cell?.details.text = String(newPrice)
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


import UIKit
import SnapKit

class PopularCell2: UICollectionViewCell {
    
    weak var delegate: PopularCellDelegate?
    
    static let identifier = "PopularCell2"

    lazy var container = createContainer()
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

extension PopularCell2 {
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -4.0)
        layer.shadowOpacity = 0.12
        layer.shadowRadius = 5.0
    }
    
    private func setupSubviews() {
        contentView.addSubview(container)
        
        container.addSubview(image)
        container.addSubview(title)
        container.addSubview(subtitle)
        container.addSubview(details)
        container.addSubview(button)
    }
    
    private func setupConstraints() {
        
        container.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.center.equalToSuperview()
            make.width.equalTo(343)
            make.height.equalTo(86)
        }

        image.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
            make.width.height.equalTo(80)
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

extension PopularCell2 {
    
    private func createContainer() -> UIView {
        let view = UIView()
        return view
    }
    
    private func createImageView() -> UIImageView {
        let image = UIImage()
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
        return button
    }
}


extension PopularCell2 {
    func configureCellWith(data: MockPopular) {
        self.image.image = UIImage(named: data.image)
        self.title.text = data.title
        self.subtitle.text = data.description
        self.details.text = String(data.price)
    }
    
    func configureCell() {
        self.button.addTarget(self, action: #selector(cellButtonTapped), for: .touchUpInside)
    }

    @objc func cellButtonTapped() {
//        configureStepper()
    }
}









