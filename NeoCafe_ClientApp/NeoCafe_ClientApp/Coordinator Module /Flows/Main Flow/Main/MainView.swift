//
//  MainView.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 21/02/24.
//


import UIKit
import SnapKit

final class MainView: UIView {
    lazy var header = createHeader()
    lazy var searchBar = createSearchBar()
    lazy var collectionView = createCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupSubviews() {
        addSubview(header)
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        
        header.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(48)
            make.top.equalToSuperview().inset(116)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}

extension MainView {
    
    private func createHeader() -> CommonHeader {
        let header = CommonHeader()
        
        let view = header.view
        view.isHidden = false
        
        let title = header.title
        title.isHidden = false
        title.text = "Доброе утро!"
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.textColor = .black
        
        let rightButton = header.rightButton
        rightButton.isHidden = false
        rightButton.setImage(UIImage(named: "notificationButton"), for: .normal)
        return header
    }

    private func createSearchBar() -> CommonSearchBar {
        let searchBar = CommonSearchBar()
        searchBar.button.setImage(UIImage(named: "searchButton"), for: .normal)
        return searchBar
    }
}

// MARK: - Collection View
extension MainView {
    
    func createCollectionView() -> UICollectionView {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        collectionView.register(CategoryCell.self,
                                forCellWithReuseIdentifier: CategoryCell.identifier)
//        collectionView.register(PopularCell.self,
//                                forCellWithReuseIdentifier: PopularCell.identifier)
        collectionView.register(PopularCell2.self,
                                forCellWithReuseIdentifier: PopularCell2.identifier)
        collectionView.register(CategoryHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CategoryHeader.identifier)
        collectionView.register(PopularHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: PopularHeader.identifier)
        
        collectionView.showsVerticalScrollIndicator = false

        return collectionView
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            if sectionIndex == 0 {
                return self.createCategorySection()
            } else {
                return self.createPopularSection()
            }
        }
    }
}


// MARK: - Category Section
extension MainView {
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        
        let upperRowItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        upperRowItem.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 0)
        let upperRowGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.50)), repeatingSubitem: upperRowItem, count: 2)
        upperRowGroup.interItemSpacing = .fixed(11)
        
        let lowerRowItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1)))
    //    lowerRowItem.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)
        let lowerRowGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.45)), repeatingSubitem: lowerRowItem, count: 3)
        lowerRowGroup.interItemSpacing = .fixed(12)
        
        let containerGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0)
                                               , heightDimension: .fractionalHeight(0.4)),
            subitems: [upperRowGroup, lowerRowGroup])
        containerGroup.interItemSpacing = .fixed(13)
        let section = NSCollectionLayoutSection(group: containerGroup)
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(45)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    //    header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [header]
        return section
    }
}

// MARK: - Popular Section
extension MainView {
    
    private func createPopularSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.86)))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(86))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
    //    section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        return section
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct MainView_Preview: PreviewProvider {
//    static var previews: some View {
//        MainView().showPreview()
//    }
//}
//#endif
