//
//  TeamsView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/9/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class TeamsView: BaseView {
    fileprivate let cellId = "cellId"
    
    public var teams: [Team]? {
        didSet { self.collectionView.reloadData() }
    }
    
    public let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "TEAMS"
        label.font = .systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.textColor = .rgb(30, 46, 52)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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
        backgroundColor = .clear
    }
    
    private func setupSubViews() {
        collectionView.register(TeamCell.self, forCellWithReuseIdentifier: cellId)

        addSubview(label)
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 15),
            label.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
}


// MARK: - CollectionView Methods
extension TeamsView:
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        
        return self.teams?.count ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath) as! TeamCell
        
        cell.team = teams![indexPath.row]
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
        return CGSize(width: 270 , height: 295)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
