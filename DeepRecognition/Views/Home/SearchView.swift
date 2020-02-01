//
//  SearchView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//


import UIKit
import SwiftIcons

class SearchView: BaseView {
    let cellId = "cellId"
    
    public let searchField: UITextField = {
        let field = UITextField(frame: .zero)
        field.backgroundColor = .white
        field.setLeftViewIcon(icon: .googleMaterialDesign(.search), textColor: .rgb(210, 210, 210))
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        field.attributedPlaceholder = NSAttributedString(
            string: "Search for a co-worker",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func setup() {
        super.setup()
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
        
    private func setupView() {
        backgroundColor = UIColor(white: 0.95, alpha: 0.9)
        layer.cornerRadius = 26
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setupSubViews() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(searchField)
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            searchField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15),
            searchField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15),
            searchField.heightAnchor.constraint(equalToConstant: 45)
        ])

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 15),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}

// MARK: - CollectionView Methods
extension SearchView:
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        
        return 40
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath)
        
        cell.backgroundColor = .white
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
        print("selected me \(indexPath.row)")
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width , height: 80)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }
}
