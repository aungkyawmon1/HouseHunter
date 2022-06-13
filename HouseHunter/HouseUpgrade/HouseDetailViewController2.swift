//
//  HouseDetailViewController2.swift
//  HouseHunter
//
//  Created by MacBook Pro on 11/06/2022.
//

import UIKit

class HouseDetailViewController2: UIViewController {

    lazy private var currentHouseInfo : HouseOverviewInfo = {
        let ui = HouseOverviewInfo()
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var comparingHouseInfo : HouseOverviewInfo = {
        let ui = HouseOverviewInfo()
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var scrollView : UIScrollView = {
        let ui = UIScrollView()
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var myView : UIView = {
        let ui = UIView()
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var currentPlaceLabel : UILabel = {
        let ui = UILabel()
        ui.text = "Your current place"
        ui.font = UIFont.boldSystemFont(ofSize: 16)
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var newPlaceLabel : UILabel = {
        let ui = UILabel()
        ui.text = "Your new place"
        ui.font = UIFont.boldSystemFont(ofSize: 16)
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var arrowSwap : UIImageView = {
        let ui = UIImageView()
        ui.contentMode = .scaleAspectFit
        ui.image = UIImage(systemName: "arrow.swap")
        ui.tintColor = .systemTeal
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var upgradeButton : UIButton = {
        let ui = UIButton()
        ui.setTitle("Upgrade Now", for: .normal)
        ui.backgroundColor = .systemTeal
        ui.layer.cornerRadius = 10
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var termAndConditionLabel : UILabel = {
        let ui = UILabel()
        ui.text = "Terms & condition applies"
        ui.font = UIFont.systemFont(ofSize: 10)
        ui.textColor = .opaqueSeparator
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    var currentHouseInfoData: HouseInfoItem?
    var comparingHouseInfoData: HouseInfoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationItem.title = "Upgrade House"
        self.navigationItem.largeTitleDisplayMode = .never
       
        addMyView()
        addScrollView()
        bindData()
    }
    
    private func addScrollView() {
        
        scrollView.addSubview(myView)
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            myView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            myView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            myView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func addMyView() {
        myView.addSubview(currentPlaceLabel)
        currentHouseInfo.hideFavoriteView()
        myView.addSubview(currentHouseInfo)
        myView.addSubview(arrowSwap)
        myView.addSubview(newPlaceLabel)
        myView.addSubview(comparingHouseInfo)
        myView.addSubview(upgradeButton)
        myView.addSubview(termAndConditionLabel)
        NSLayoutConstraint.activate([
            currentPlaceLabel.topAnchor.constraint(equalTo: myView.topAnchor, constant: 20),
            currentPlaceLabel.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 30),
            currentPlaceLabel.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -30),
            
            currentHouseInfo.topAnchor.constraint(equalTo: currentPlaceLabel.bottomAnchor, constant: 8),
            currentHouseInfo.leadingAnchor.constraint(equalTo: myView.leadingAnchor),
            currentHouseInfo.trailingAnchor.constraint(equalTo: myView.trailingAnchor),
            currentHouseInfo.heightAnchor.constraint(equalToConstant: 250),
            
            arrowSwap.topAnchor.constraint(equalTo: currentHouseInfo.bottomAnchor,constant: 8),
            arrowSwap.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            arrowSwap.widthAnchor.constraint(equalToConstant: 40),
            arrowSwap.heightAnchor.constraint(equalToConstant: 40),
            
            newPlaceLabel.topAnchor.constraint(equalTo: arrowSwap.bottomAnchor, constant: 8),
            newPlaceLabel.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 30),
            newPlaceLabel.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -30),
            
            comparingHouseInfo.topAnchor.constraint(equalTo: newPlaceLabel.bottomAnchor, constant: 8),
            comparingHouseInfo.leadingAnchor.constraint(equalTo: myView.leadingAnchor),
            comparingHouseInfo.trailingAnchor.constraint(equalTo: myView.trailingAnchor),
            comparingHouseInfo.heightAnchor.constraint(equalToConstant: 250),
            
            upgradeButton.topAnchor.constraint(equalTo: comparingHouseInfo.bottomAnchor, constant: 50),
            upgradeButton.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 30),
            upgradeButton.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -30),
            upgradeButton.heightAnchor.constraint(equalToConstant: 44),
            
            termAndConditionLabel.topAnchor.constraint(equalTo: upgradeButton.bottomAnchor, constant: 10),
            termAndConditionLabel.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            termAndConditionLabel.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -10)
        ])
    }
    private func bindData() {
        guard let currentData = currentHouseInfoData,let comparingData = comparingHouseInfoData else { return }
        currentHouseInfo.bindData(currentData, imagePath: "img_apartment_indoor_2")
        comparingHouseInfo.bindData(comparingData, imagePath: "img_apartment_indoor")
    }


}
