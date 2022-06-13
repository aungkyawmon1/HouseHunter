//
//  HouseDetailViewController.swift
//  HouseHunter
//
//  Created by Thet Htun on 12/19/21.
//

import UIKit

class HouseDetailViewController: UIViewController {

    //Current House Info
    @IBOutlet weak var currentHouseBedroomIcon : UIImageView!
    @IBOutlet weak var currentHouseBedroomCountLabel : UILabel!
    @IBOutlet weak var currentHouseBathroomIcon : UIImageView!
    @IBOutlet weak var currentHouseBathroomCountLabel : UILabel!
    @IBOutlet weak var currentHouseAreaMetricIcon : UIImageView!
    @IBOutlet weak var currentHouseAreaMetricValueLabel : UILabel!
    @IBOutlet weak var currentHouseLocationLeftIcon : UIImageView!
    @IBOutlet weak var currentHouseLocationLeftLabel : UILabel!
    @IBOutlet weak var currentHouseApartmentTypeLabel : UILabel!
    @IBOutlet weak var currentHouseStartingFromTextLabel : UILabel!
    @IBOutlet weak var currentHouseMonthlyPaymentAmountLabel : UILabel!
    @IBOutlet weak var currentHousePurchasePriceAmountLabel : UILabel!
    @IBOutlet weak var currentHouseImage : UIImageView!
    @IBOutlet weak var currentHouseShadowView : UIView!
    @IBOutlet weak var currentHouseDividerView : UIView!
    @IBOutlet weak var currentHouseContentInfoOverlayContainerView : UIView!
    @IBOutlet weak var currentHouseRootContentContainerView : UIView!
    
    //Comparing House Info
    @IBOutlet weak var comparingHouseBedroomIcon : UIImageView!
    @IBOutlet weak var comparingHouseBedroomCountLabel : UILabel!
    @IBOutlet weak var comparingHouseBathroomIcon : UIImageView!
    @IBOutlet weak var comparingHouseBathroomCountLabel : UILabel!
    @IBOutlet weak var comparingHouseAreaMetricIcon : UIImageView!
    @IBOutlet weak var comparingHouseAreaMetricValueLabel : UILabel!
    @IBOutlet weak var comparingHouseLocationLeftIcon : UIImageView!
    @IBOutlet weak var comparingHouseLocationLeftLabel : UILabel!
    @IBOutlet weak var comparingHouseApartmentTypeLabel : UILabel!
    @IBOutlet weak var comparingHouseStartingFromTextLabel : UILabel!
    @IBOutlet weak var comparingHouseMonthlyPaymentAmountLabel : UILabel!
    @IBOutlet weak var comparingHousePurchasePriceAmountLabel : UILabel!
    @IBOutlet weak var comparingHouseFavoriteImageView : UIImageView!
    @IBOutlet weak var comparingHouseImage : UIImageView!
    @IBOutlet weak var comparingHouseShadowView : UIView!
    @IBOutlet weak var comparingHouseFavoriteImageContainer : UIView!
    @IBOutlet weak var comparingHouseDividerView : UIView!
    @IBOutlet weak var comparingHouseContentInfoOverlayContainerView : UIView!
    @IBOutlet weak var comparingHouseRootContentContainerView : UIView!
    
    var currentHouseInfo: HouseInfoItem?
    var comparingHouseInfo: HouseInfoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Upgrade House"
        self.navigationItem.largeTitleDisplayMode = .never
        
        setupView()
        
        bindDataForCurrentHouse()
        bindDataForComparingHouse()
    }
    

    private func setupView() {
        setupViewForCurrentHouseInfo()
        setupViewForComparingHouseInfo()
    }
    
    private func bindDataForCurrentHouse() {
        guard let data = self.currentHouseInfo else { return }
        currentHouseStartingFromTextLabel.text = "From".uppercased()

        currentHouseApartmentTypeLabel.attributedText = NSMutableAttributedString(string: data.housingType.uppercased()).withKerning(1.5)
        currentHouseMonthlyPaymentAmountLabel.attributedText = data.monthlyPaymentAttributedString
        currentHousePurchasePriceAmountLabel.text = data.purchasePrice
        
        currentHouseBedroomCountLabel.text = data.bedroomCountDesc
        currentHouseBathroomCountLabel.text = data.ownerCountDescription
        currentHouseAreaMetricValueLabel.text = data.depreciationPerYear
        currentHouseLocationLeftLabel.text = data.houseLocationDescription
        
        currentHouseImage.image = UIImage(named: "img_apartment_indoor_2")
    }
    
    private func bindDataForComparingHouse() {
        guard let data = self.comparingHouseInfo else { return }
        comparingHouseStartingFromTextLabel.text = "From".uppercased()

        comparingHouseApartmentTypeLabel.attributedText = NSMutableAttributedString(string: data.housingType.uppercased()).withKerning(1.5)
        comparingHouseMonthlyPaymentAmountLabel.attributedText = data.monthlyPaymentAttributedString
        comparingHousePurchasePriceAmountLabel.text = data.purchasePrice
        
        comparingHouseBedroomCountLabel.text = data.bedroomCountDesc
        comparingHouseBathroomCountLabel.text = data.ownerCountDescription
        comparingHouseAreaMetricValueLabel.text = data.depreciationPerYear
        comparingHouseLocationLeftLabel.text = data.houseLocationDescription
        
        comparingHouseImage.image = UIImage(named: "img_apartment_indoor")
        
    }

}
