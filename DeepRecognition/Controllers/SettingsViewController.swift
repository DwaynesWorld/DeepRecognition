//
//  SettingsViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/16/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit
import SwiftIcons

class SettingsViewController: NSObject {
    var currentController: BaseViewController?

    let cellId: String = "CellID"
    let cellHeight: CGFloat = 50
    let dimmedView: UIView = UIView()
    
    let settings: [Setting] = {
        let size = CGSize(width: 25, height: 25)
        let color = UIColor.darkGray
        
        return [
            Setting(
                name: .feedback,
                image: .init(icon: .ionicons(IoniconsType.chatboxWorking), size: size, textColor: color)),
            
            Setting(
                name: .terms,
                image: .init(icon: .ionicons(IoniconsType.documentText), size: size, textColor: color)),
            
            Setting(
                name: .help,
                image: .init(icon: .ionicons(IoniconsType.help), size: size, textColor: color)),
            
            Setting(
                name: .logout,
                image: .init(icon: .ionicons(IoniconsType.logOut), size: size, textColor: color)),
            
            Setting(
                name: .cancel,
                image: .init(icon: .ionicons(IoniconsType.close), size: size, textColor: color)),
        ]
    }()
    
    lazy var collectionViewHeight: CGFloat = {
        let bottomPadding: CGFloat = 20
        return CGFloat(self.settings.count) * self.cellHeight + bottomPadding
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.isScrollEnabled = false
        view.delegate = self
        view.dataSource = self
        view.register(SettingsCell.self, forCellWithReuseIdentifier: cellId)
        return view
    }()
    
    @objc func showSettings() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        dimmedView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        dimmedView.frame = window.frame
        dimmedView.alpha = 0
        dimmedView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(handleCancelDismiss)))

        collectionView.frame = CGRect(
            x: 0,
            y: window.frame.height,
            width: window.frame.width,
            height: 200)
        
        window.addSubview(dimmedView)
        window.addSubview(collectionView)
        
        let animations = { [unowned self] in
            let frame = CGRect(
                x: 0,
                y: window.frame.height - self.collectionViewHeight,
                width: window.frame.width,
                height: self.collectionViewHeight)

            self.collectionView.frame = frame
            self.dimmedView.alpha = 1
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseOut,
            animations: animations,
            completion: nil)
    }
    
    @objc func handleCancelDismiss() {
        self.handleDismiss { [unowned self] _ in
            self.dimmedView.removeFromSuperview()
            self.collectionView.removeFromSuperview()
        }
    }
    
    func handleDismiss(completion: ((Bool) -> Void)?) {
        
        let animations = { [unowned self] in
            self.dimmedView.alpha = 0
            if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                self.collectionView.frame = CGRect(
                    x: 0,
                    y: window.frame.height,
                    width: window.frame.width,
                    height: self.collectionViewHeight)
            }
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveLinear,
            animations: animations,
            completion: completion)
    }
}


extension SettingsViewController:
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath) as! SettingsCell
        
        cell.setting = settings[indexPath.item]
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
        
        let setting = self.settings[indexPath.item]
        
        if setting.name == .cancel {
            handleDismiss { [unowned self] _ in
                self.dimmedView.removeFromSuperview()
                self.collectionView.removeFromSuperview()
            }
        } else {
            handleDismiss { [unowned self] _ in
                self.currentController!.handleSelection(forSetting: setting)
                self.dimmedView.removeFromSuperview()
                self.collectionView.removeFromSuperview()
            }
        }
    }
}
