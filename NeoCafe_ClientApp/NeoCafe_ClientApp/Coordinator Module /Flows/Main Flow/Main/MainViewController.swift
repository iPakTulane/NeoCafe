//
//  MainViewController.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 12/02/24.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController, FlowCompletion {

    var completionHandler: ((String?) -> ())?
    let mainView = MainView()
    let mainViewModel: MainViewModelType?
    var mainTabBarController: TabBarController?

    init(viewModel: MainViewModelType? = nil) {
        self.mainViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupTargets()
        mainView.collectionView.reloadData()
        
        // Initialize and setup TabBarController
        mainTabBarController = TabBarController()
        mainTabBarController?.delegate = self
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MainViewController {
    private func updateUI() {
        mainView.collectionView.reloadData()
    }
}

extension MainViewController {
    
    private func setupTargets() {
        mainView.header.rightButton.addTarget(self, action: #selector(noticeButtonTapped), for: .touchUpInside)
        mainView.searchBar.button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc private func noticeButtonTapped() {
        print("noticeButtonTapped")
    }
    
    @objc private func searchButtonTapped() {
        print("searchButtonTapped")
    }
    
}

// MARK: - Collection View Delegates
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func setupDelegates() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
                fatalError("Unable to dequeue the expected cell type.")
            }
            if let data = mainViewModel?.categories[indexPath.item] {
                categoryCell.configureCellWith(data: data)
            }
            return categoryCell
        } else {
            
//            guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.identifier, for: indexPath) as? PopularCell else {
//                fatalError("Unable to dequeue the expected cell type.")
//            }
            guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell2.identifier, for: indexPath) as? PopularCell2 else {
                fatalError("Unable to dequeue the expected cell type.")
            }
            
            if let data = mainViewModel?.populars[indexPath.item] {
                popularCell.configureCellWith(data: data)
            }
            return popularCell
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let categoryHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryHeader.identifier, for: indexPath) as! CategoryHeader
            return categoryHeader
        } else {
            let popularHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PopularHeader.identifier, for: indexPath) as! PopularHeader
            return popularHeader
        }
    }
}



extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate and return the size for each cell
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}


extension MainViewController: UITabBarControllerDelegate {
    
    private func setupTabBar() {
        guard let mainTabBarController = mainTabBarController else { return }
        
        // Customize the tab bar as needed
        mainTabBarController.tabBar.tintColor = .orange
        
        // Add view controllers to the tab bar controller
        mainTabBarController.viewControllers = TabBar.allCases.map { $0.viewController }
        
        // Add the tab bar controller as a child view controller
        addChild(mainTabBarController)
        view.addSubview(mainTabBarController.view)
        mainTabBarController.didMove(toParent: self)
    }
    
    // UITabBarControllerDelegate method (optional)
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Handle tab bar item selection if needed
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct MainViewController_Provider: PreviewProvider {
    static var previews: some View {
        MainViewController().showPreview()
    }
}
#endif
