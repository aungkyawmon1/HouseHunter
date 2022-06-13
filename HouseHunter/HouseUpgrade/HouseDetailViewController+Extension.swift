//
//  HouseDetailViewController+Extension.swift
//  HouseHunter
//
//  Created by Thet Htun on 12/19/21.
//

import UIKit

extension HouseDetailViewController {
    func setupViewForCurrentHouseInfo() {
        currentHouseStartingFromTextLabel.font = .boldSystemFont(ofSize: 12)
        currentHouseStartingFromTextLabel.textColor = UIColor.white
        currentHouseStartingFromTextLabel.textAlignment = .left
        
        currentHouseApartmentTypeLabel.font = .systemFont(ofSize: 10)
        currentHouseApartmentTypeLabel.textColor = UIColor.white
        currentHouseApartmentTypeLabel.textAlignment = .left
                
        currentHouseMonthlyPaymentAmountLabel.font = .systemFont(ofSize: 20)
        currentHouseMonthlyPaymentAmountLabel.textColor = UIColor.white
        currentHouseMonthlyPaymentAmountLabel.textAlignment = .left
        
        currentHousePurchasePriceAmountLabel.font = .systemFont(ofSize: 18)
        currentHousePurchasePriceAmountLabel.textColor = UIColor.white
        currentHousePurchasePriceAmountLabel.textAlignment = .left
                        
        currentHouseImage.contentMode = .scaleAspectFill
        
        currentHouseRootContentContainerView.backgroundColor = .clear
        currentHouseRootContentContainerView.layer.cornerRadius = 20
        currentHouseRootContentContainerView.layer.masksToBounds = true
        
        //Shadow Backdrop
        currentHouseShadowView.backgroundColor = .white
        currentHouseShadowView.layer.cornerRadius = 20
        currentHouseShadowView.layer.masksToBounds = false
        currentHouseShadowView.layer.shadowOpacity = 0.2
        currentHouseShadowView.layer.shadowOffset = CGSize(width: 2, height: 4.0)
        currentHouseShadowView.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        currentHouseShadowView.layer.shadowRadius = 6.0

        DispatchQueue.main.async {
            // Draw shadow as Image to avoid redrawing which isn't optimal
            self.currentHouseShadowView.layer.shadowPath = UIBezierPath(roundedRect: self.currentHouseShadowView.bounds, cornerRadius: self.currentHouseShadowView.layer.cornerRadius).cgPath
            self.currentHouseShadowView.layer.shouldRasterize = true
            self.currentHouseShadowView.layer.rasterizationScale = UIScreen.main.scale
        }
        
        // Overlay Gradient
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let gradientLayer: CAGradientLayer = CAGradientLayer()

            gradientLayer.colors = [
                UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
                UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
              ]
            gradientLayer.locations = [0.3, 0.6]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.frame = self.currentHouseContentInfoOverlayContainerView.bounds
            
            self.currentHouseContentInfoOverlayContainerView.backgroundColor = .clear
            self.currentHouseContentInfoOverlayContainerView.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        
        currentHouseBedroomIcon.image = UIImage(systemName: "bed.double.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        currentHouseBathroomIcon.image = UIImage(systemName: "drop.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        currentHouseAreaMetricIcon.image = UIImage(systemName: "h.square.on.square.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        currentHouseLocationLeftIcon.image = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        
        currentHouseBedroomCountLabel.font = .systemFont(ofSize: 12)
        currentHouseBedroomCountLabel.textColor = .white
        
        currentHouseBathroomCountLabel.font = .systemFont(ofSize: 12)
        currentHouseBathroomCountLabel.textColor = .white
        
        currentHouseAreaMetricValueLabel.font = .systemFont(ofSize: 12)
        currentHouseAreaMetricValueLabel.textColor = .white
        
        currentHouseLocationLeftLabel.font = .systemFont(ofSize: 12)
        currentHouseLocationLeftLabel.textColor = .white
    }
    
    func setupViewForComparingHouseInfo() {
        comparingHouseStartingFromTextLabel.font = .boldSystemFont(ofSize: 12)
        comparingHouseStartingFromTextLabel.textColor = UIColor.white
        comparingHouseStartingFromTextLabel.textAlignment = .left
        
        comparingHouseApartmentTypeLabel.font = .systemFont(ofSize: 10)
        comparingHouseApartmentTypeLabel.textColor = UIColor.white
        comparingHouseApartmentTypeLabel.textAlignment = .left
                
        comparingHouseMonthlyPaymentAmountLabel.font = .systemFont(ofSize: 20)
        comparingHouseMonthlyPaymentAmountLabel.textColor = UIColor.white
        comparingHouseMonthlyPaymentAmountLabel.textAlignment = .left
        
        comparingHousePurchasePriceAmountLabel.font = .systemFont(ofSize: 18)
        comparingHousePurchasePriceAmountLabel.textColor = UIColor.white
        comparingHousePurchasePriceAmountLabel.textAlignment = .left
                        
        comparingHouseImage.contentMode = .scaleAspectFill
        
        comparingHouseRootContentContainerView.backgroundColor = .clear
        comparingHouseRootContentContainerView.layer.cornerRadius = 20
        comparingHouseRootContentContainerView.layer.masksToBounds = true
        
        //Shadow Backdrop
        comparingHouseShadowView.backgroundColor = .white
        comparingHouseShadowView.layer.cornerRadius = 20
        comparingHouseShadowView.layer.masksToBounds = false
        comparingHouseShadowView.layer.shadowOpacity = 0.2
        comparingHouseShadowView.layer.shadowOffset = CGSize(width: 2, height: 4.0)
        comparingHouseShadowView.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        comparingHouseShadowView.layer.shadowRadius = 6.0

        DispatchQueue.main.async {
            // Draw shadow as Image to avoid redrawing which isn't optimal
            self.comparingHouseShadowView.layer.shadowPath = UIBezierPath(roundedRect: self.comparingHouseShadowView.bounds, cornerRadius: self.comparingHouseShadowView.layer.cornerRadius).cgPath
            self.comparingHouseShadowView.layer.shouldRasterize = true
            self.comparingHouseShadowView.layer.rasterizationScale = UIScreen.main.scale
        }
        
        // Overlay Gradient
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let gradientLayer: CAGradientLayer = CAGradientLayer()

            gradientLayer.colors = [
                UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
                UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
              ]
            gradientLayer.locations = [0.3, 0.6]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.frame = self.comparingHouseContentInfoOverlayContainerView.bounds
            
            self.comparingHouseContentInfoOverlayContainerView.backgroundColor = .clear
            self.comparingHouseContentInfoOverlayContainerView.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        
        comparingHouseBedroomIcon.image = UIImage(systemName: "bed.double.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        comparingHouseBathroomIcon.image = UIImage(systemName: "drop.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        comparingHouseAreaMetricIcon.image = UIImage(systemName: "h.square.on.square.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        comparingHouseLocationLeftIcon.image = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        
        comparingHouseBedroomCountLabel.font = .systemFont(ofSize: 12)
        comparingHouseBedroomCountLabel.textColor = .white
        
        comparingHouseBathroomCountLabel.font = .systemFont(ofSize: 12)
        comparingHouseBathroomCountLabel.textColor = .white
        
        comparingHouseAreaMetricValueLabel.font = .systemFont(ofSize: 12)
        comparingHouseAreaMetricValueLabel.textColor = .white
        
        comparingHouseLocationLeftLabel.font = .systemFont(ofSize: 12)
        comparingHouseLocationLeftLabel.textColor = .white
        
        // Favourite Image Container
        comparingHouseFavoriteImageContainer.backgroundColor = .white
        comparingHouseFavoriteImageContainer.layer.cornerRadius = comparingHouseFavoriteImageContainer.bounds.width / 2
        comparingHouseFavoriteImageContainer.layer.shadowOpacity = 0.2
        comparingHouseFavoriteImageContainer.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        comparingHouseFavoriteImageContainer.layer.shadowColor = UIColor.black.withAlphaComponent(0.9).cgColor
        comparingHouseFavoriteImageContainer.layer.shadowRadius = 3.0
        
        DispatchQueue.main.async {
            // Draw shadow as Image to avoid redrawing which isn't optimal
            self.comparingHouseFavoriteImageContainer.layer.shadowPath = UIBezierPath(ovalIn: self.comparingHouseFavoriteImageContainer.bounds).cgPath

            self.comparingHouseFavoriteImageContainer.layer.shouldRasterize = true
            self.comparingHouseFavoriteImageContainer.layer.rasterizationScale = UIScreen.main.scale
        }
    }
}
