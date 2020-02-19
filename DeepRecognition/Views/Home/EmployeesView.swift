//
//  EmployeesView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/18/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Lottie

class EmployeesView: BaseView {
    fileprivate let cellId = "cellId"
    
    public var employees: [UserProfile]? {
        didSet { collectionView.reloadData() }
    }
    
    public let slideIndicator: UIView = {
        let inner = UIView(frame: .zero)
        inner.backgroundColor = .gray
        inner.layer.cornerRadius = 3
        inner.layer.masksToBounds = true
        inner.translatesAutoresizingMaskIntoConstraints = false
        
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inner)
        
        NSLayoutConstraint.activate([
            inner.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            inner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inner.widthAnchor.constraint(equalToConstant: 60),
            inner.heightAnchor.constraint(equalToConstant: 6)
        ])
        
        return view
    }()
    
    public let loadingView: AnimationView = {
        let view = AnimationView(frame: .zero)
        view.animation = Animation.named("loading", subdirectory: nil)
        view.animationSpeed = 1.5
        view.contentMode = .scaleAspectFit
        view.backgroundBehavior = .pauseAndRestore
        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        view.isHidden = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        view.isHidden = true
        return view
    }()
    
    override func setup() {
        super.setup()
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    public func showLoading() {
        collectionView.isHidden = true
        loadingView.isHidden = false
        
        loadingView.play(
            fromProgress: 0,
            toProgress: 1,
            loopMode: .loop,
            completion: nil)
    }
    
    public func showEmployees(_ employees: [UserProfile]) {
        loadingView.isHidden = true
//        label.isHidden = false
        collectionView.isHidden = false

        loadingView.stop()
        self.employees = employees
    }
    
    private func setupView() {
        backgroundColor = .rgb(203, 212, 215, alpha: 0.8) //.rgb(135, 179, 179, alpha: 0.8)
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setupSubviews() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(slideIndicator)
        addSubview(loadingView)
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70),
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            loadingView.widthAnchor.constraint(equalToConstant: 120),
            loadingView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            slideIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            slideIndicator.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            slideIndicator.widthAnchor.constraint(equalToConstant: 240),
            slideIndicator.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: slideIndicator.bottomAnchor, constant: 15),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}


// MARK: - CollectionView Methods
extension EmployeesView:
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        
        return employees?.count ?? 5
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath)
        
        cell.backgroundColor = .brown
//        cell.employee = employees![indexPath.row]
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
        
        return CGSize(width: frame.width - 20 , height: 100)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
}

