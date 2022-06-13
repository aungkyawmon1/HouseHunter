//
//  HouseOverviewInfo.swift
//  HouseHunter
//
//  Created by MacBook Pro on 11/06/2022.
//

import UIKit

class HouseOverviewInfo: UIView {

    private var data: HouseInfoItem?
    lazy private var startingFromTextLabel : UILabel = {
        let ui = UILabel()
        ui.font = .boldSystemFont(ofSize: 12)
        ui.textColor = UIColor.white
        ui.textAlignment = .left
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var apartmentTypeLabel : UILabel = {
        let ui = UILabel()
        ui.font = .systemFont(ofSize: 10)
        ui.textColor = UIColor.white
        ui.textAlignment = .left
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var monthlyPaymentAmountLabel : UILabel = {
        let ui = UILabel()
        ui.font = .systemFont(ofSize: 20)
        ui.textColor = UIColor.white
        ui.textAlignment = .left
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var purchasePriceAmountLabel : UILabel = {
        let ui = UILabel()
        ui.font = .systemFont(ofSize: 18)
        ui.textColor = UIColor.white
        ui.textAlignment = .left
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var houseImage : UIImageView  = {
        let ui = UIImageView()
        ui.contentMode = .scaleAspectFill
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var favoriteImageView : UIImageView = {
        let ui = UIImageView()
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var shadowView : UIView = {
        let ui = UIView()
        ui.backgroundColor = .white
        
        ui.layer.masksToBounds = false
        ui.layer.shadowOpacity = 0.2
        ui.layer.shadowOffset = CGSize(width: 2, height: 4.0)
        ui.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        ui.layer.shadowRadius = 6.0
        ui.layer.cornerRadius = 20
        
        DispatchQueue.main.async {
            // Draw shadow as Image to avoid redrawing which isn't optimal
            ui.layer.shadowPath = UIBezierPath(roundedRect: ui.bounds, cornerRadius: ui.layer.cornerRadius).cgPath
            ui.layer.shouldRasterize = true
            ui.layer.rasterizationScale = UIScreen.main.scale
        }
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var contentInfoOverlayContainerView : UIView = {
        let ui = UIView()
        // Overlay Gradient
        DispatchQueue.main.async {
            let gradientLayer: CAGradientLayer = CAGradientLayer()

            gradientLayer.colors = [
                UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
                UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
              ]
            gradientLayer.locations = [0.3, 0.6]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.frame = ui.bounds
            
            ui.backgroundColor = .clear
            ui.layer.insertSublayer(gradientLayer, at: 0)
        }
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var bedroomIcon : UIImageView = {
        let ui = UIImageView()
        ui.image = UIImage(systemName: "bed.double.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var bathroomIcon : UIImageView = {
        let ui = UIImageView()
        ui.image = UIImage(systemName: "drop.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var areaMetricIcon : UIImageView = {
        let ui = UIImageView()
        ui.image = UIImage(systemName: "h.square.on.square.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var locationLeftIcon : UIImageView = {
        let ui = UIImageView()
        ui.image = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var bedroomCountLabel : UILabel = {
        let ui = UILabel()
        ui.font = .systemFont(ofSize: 12)
        ui.textColor = .white
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var bathroomCountLabel : UILabel = {
        let ui = UILabel()
        ui.font = .systemFont(ofSize: 12)
        ui.textColor = .white
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var areaMetricValueLabel : UILabel = {
        let ui = UILabel()
        ui.font = .systemFont(ofSize: 12)
        ui.textColor = .white
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var locationLeftLabel : UILabel = {
        let ui = UILabel()
        ui.font = .systemFont(ofSize: 12)
        ui.textColor = .white
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var favoriteImageContainer : UIView = {
        let ui = UIView()
        // Favourite Image Container
        ui.backgroundColor = .white
       
        ui.layer.shadowOpacity = 0.2
        ui.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        ui.layer.shadowColor = UIColor.black.withAlphaComponent(0.9).cgColor
        ui.layer.shadowRadius = 3.0

        DispatchQueue.main.async {
            // Draw shadow as Image to avoid redrawing which isn't optimal
            ui.layer.shadowPath = UIBezierPath(ovalIn: ui.bounds).cgPath
            ui.layer.shouldRasterize = true
            ui.layer.rasterizationScale = UIScreen.main.scale
            ui.layer.cornerRadius = ui.bounds.width / 2
        }
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    lazy private var rootContentContainerView : UIView = {
        let ui = UIView()
        ui.backgroundColor = .gray
        ui.layer.cornerRadius = 20
        ui.layer.masksToBounds = true
        ui.translatesAutoresizingMaskIntoConstraints = false
        
        return ui
    }()
    
    lazy private var stackViewForVertical : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy private var stackViewForHorizontal1 : UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy private var stackViewForHorizontal2 : UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
        return stackView
    }()
    
    lazy private var mileageMeterInKm : UIView = {
        return UIView()
    }()
    
    lazy private var onwerCount : UIView = {
        return UIView()
    }()
    
    lazy private var depreciateionPerYear : UIView = {
        return UIView()
    }()
    
    lazy private var dateLeft : UIView = {
        return UIView()
    }()
    
    lazy private var dividerView : UIView = {
        let ui = UIView()
        ui.backgroundColor = .white
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildView()
    }
    
    private func buildView() {
        
        initActionListeners()
        addStackViewHorizontal1()
        addStackViewHorizontal2()
        addContentInfoOverlayContainerView()
        addFavoriteContainerView()
        
        //MARK: - root uiView
        rootContentContainerView.addSubview(houseImage)
//        rootContentContainerView.addSubview(shadowView)
        rootContentContainerView.addSubview(contentInfoOverlayContainerView)
        rootContentContainerView.addSubview(favoriteImageContainer)
        addSubview(shadowView)
        addSubview(rootContentContainerView)
        NSLayoutConstraint.activate([
            rootContentContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rootContentContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            rootContentContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            rootContentContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            houseImage.leadingAnchor.constraint(equalTo: rootContentContainerView.leadingAnchor),
            houseImage.trailingAnchor.constraint(equalTo: rootContentContainerView.trailingAnchor),
            houseImage.topAnchor.constraint(equalTo: rootContentContainerView.topAnchor),
            houseImage.bottomAnchor.constraint(equalTo: rootContentContainerView.bottomAnchor, constant: -66),

            
            shadowView.leadingAnchor.constraint(equalTo: rootContentContainerView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: rootContentContainerView.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: rootContentContainerView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: rootContentContainerView.bottomAnchor),
            
            contentInfoOverlayContainerView.leadingAnchor.constraint(equalTo: rootContentContainerView.leadingAnchor),
            contentInfoOverlayContainerView.trailingAnchor.constraint(equalTo: rootContentContainerView.trailingAnchor),
            contentInfoOverlayContainerView.topAnchor.constraint(equalTo: rootContentContainerView.topAnchor),
            contentInfoOverlayContainerView.bottomAnchor.constraint(equalTo: rootContentContainerView.bottomAnchor),
            
            favoriteImageContainer.trailingAnchor.constraint(equalTo: rootContentContainerView.trailingAnchor, constant: -10),
            favoriteImageContainer.topAnchor.constraint(equalTo: rootContentContainerView.topAnchor, constant: 10),
            favoriteImageContainer.widthAnchor.constraint(equalToConstant: 35),
            favoriteImageContainer.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    private func addStackViewHorizontal1() {
        //MARK: - elements of Stack View-1 (Horizontal)
        mileageMeterInKm.addSubview(bedroomIcon)
        mileageMeterInKm.addSubview(bedroomCountLabel)
        NSLayoutConstraint.activate([
            bedroomIcon.topAnchor.constraint(equalTo: mileageMeterInKm.topAnchor),
            bedroomIcon.bottomAnchor.constraint(equalTo: mileageMeterInKm.bottomAnchor),
            bedroomIcon.leadingAnchor.constraint(equalTo: mileageMeterInKm.leadingAnchor),
            bedroomIcon.widthAnchor.constraint(equalToConstant: 15),
            bedroomIcon.heightAnchor.constraint(equalToConstant: 15),
            
            bedroomCountLabel.leadingAnchor.constraint(equalTo: bedroomIcon.trailingAnchor,constant: 8),
            bedroomCountLabel.trailingAnchor.constraint(equalTo: mileageMeterInKm.trailingAnchor),
            bedroomCountLabel.topAnchor.constraint(equalTo: bedroomIcon.topAnchor),
            bedroomCountLabel.bottomAnchor.constraint(equalTo: bedroomIcon.bottomAnchor)
        ])
        
        onwerCount.addSubview(bathroomIcon)
        onwerCount.addSubview(bathroomCountLabel)
        NSLayoutConstraint.activate([
            bathroomIcon.topAnchor.constraint(equalTo: onwerCount.topAnchor),
            bathroomIcon.bottomAnchor.constraint(equalTo: onwerCount.bottomAnchor),
            bathroomIcon.leadingAnchor.constraint(equalTo: onwerCount.leadingAnchor),
            bathroomIcon.widthAnchor.constraint(equalToConstant: 15),
            bathroomIcon.heightAnchor.constraint(equalToConstant: 15),
            
            bathroomCountLabel.leadingAnchor.constraint(equalTo: bathroomIcon.trailingAnchor,constant: 8),
            bathroomCountLabel.trailingAnchor.constraint(equalTo: onwerCount.trailingAnchor),
            bathroomCountLabel.topAnchor.constraint(equalTo: bathroomIcon.topAnchor),
            bathroomCountLabel.bottomAnchor.constraint(equalTo: bathroomIcon.bottomAnchor)
        ])
        
        depreciateionPerYear.addSubview(areaMetricIcon)
        depreciateionPerYear.addSubview(areaMetricValueLabel)
        NSLayoutConstraint.activate([
            areaMetricIcon.topAnchor.constraint(equalTo: depreciateionPerYear.topAnchor),
            areaMetricIcon.bottomAnchor.constraint(equalTo: depreciateionPerYear.bottomAnchor),
            areaMetricIcon.leadingAnchor.constraint(equalTo: depreciateionPerYear.leadingAnchor),
            areaMetricIcon.widthAnchor.constraint(equalToConstant: 15),
            areaMetricIcon.heightAnchor.constraint(equalToConstant: 15),
            
            areaMetricValueLabel.leadingAnchor.constraint(equalTo: areaMetricIcon.trailingAnchor,constant: 8),
            areaMetricValueLabel.trailingAnchor.constraint(equalTo: depreciateionPerYear.trailingAnchor),
            areaMetricValueLabel.topAnchor.constraint(equalTo: areaMetricIcon.topAnchor),
            areaMetricValueLabel.bottomAnchor.constraint(equalTo: areaMetricIcon.bottomAnchor)
        ])
        
        stackViewForHorizontal1.addArrangedSubview(mileageMeterInKm)
        stackViewForHorizontal1.addArrangedSubview(onwerCount)
        stackViewForHorizontal1.addArrangedSubview(depreciateionPerYear)
    }
    
    private func addStackViewHorizontal2() {
        //MARK: - element of stackView-2 (horizontal)
        dateLeft.addSubview(locationLeftIcon)
        dateLeft.addSubview(locationLeftLabel)
        NSLayoutConstraint.activate([
            locationLeftIcon.topAnchor.constraint(equalTo: dateLeft.topAnchor),
            locationLeftIcon.bottomAnchor.constraint(equalTo: dateLeft.bottomAnchor),
            locationLeftIcon.leadingAnchor.constraint(equalTo: dateLeft.leadingAnchor),
            locationLeftIcon.widthAnchor.constraint(equalToConstant: 15),
            locationLeftIcon.heightAnchor.constraint(equalToConstant: 15),
            
            locationLeftLabel.leadingAnchor.constraint(equalTo: locationLeftIcon.trailingAnchor,constant: 8),
            locationLeftLabel.trailingAnchor.constraint(equalTo: dateLeft.trailingAnchor),
            locationLeftLabel.topAnchor.constraint(equalTo: locationLeftIcon.topAnchor),
            locationLeftLabel.bottomAnchor.constraint(equalTo: locationLeftIcon.bottomAnchor)
        ])
        
        stackViewForHorizontal2.addArrangedSubview(dateLeft)
    }
    
    private func addContentInfoOverlayContainerView() {

        //MARK: - stack View (vertical)
        stackViewForVertical.addArrangedSubview(stackViewForHorizontal1)
        stackViewForVertical.addArrangedSubview(stackViewForHorizontal2)
        contentInfoOverlayContainerView.addSubview(stackViewForVertical)
        contentInfoOverlayContainerView.addSubview(dividerView)
        contentInfoOverlayContainerView.addSubview(startingFromTextLabel)
        contentInfoOverlayContainerView.addSubview(monthlyPaymentAmountLabel)
        contentInfoOverlayContainerView.addSubview(purchasePriceAmountLabel)
        contentInfoOverlayContainerView.addSubview(apartmentTypeLabel)
        NSLayoutConstraint.activate([
            stackViewForVertical.leadingAnchor.constraint(equalTo: contentInfoOverlayContainerView.leadingAnchor, constant: 15),
            stackViewForVertical.trailingAnchor.constraint(equalTo: contentInfoOverlayContainerView.trailingAnchor, constant: -15),
            stackViewForVertical.bottomAnchor.constraint(equalTo: contentInfoOverlayContainerView.bottomAnchor, constant: -15),
            
            dividerView.leadingAnchor.constraint(equalTo: stackViewForVertical.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: stackViewForVertical.trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: stackViewForVertical.topAnchor,constant: -8),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            startingFromTextLabel.leadingAnchor.constraint(equalTo: stackViewForVertical.leadingAnchor),
            startingFromTextLabel.bottomAnchor.constraint(equalTo: dividerView.topAnchor, constant: -8),
            
            monthlyPaymentAmountLabel.leadingAnchor.constraint(equalTo: startingFromTextLabel.trailingAnchor,constant: 2),
            monthlyPaymentAmountLabel.centerYAnchor.constraint(equalTo: startingFromTextLabel.centerYAnchor),
            monthlyPaymentAmountLabel.bottomAnchor.constraint(equalTo: startingFromTextLabel.bottomAnchor),
            
            purchasePriceAmountLabel.trailingAnchor.constraint(equalTo: stackViewForVertical.trailingAnchor),
            purchasePriceAmountLabel.bottomAnchor.constraint(equalTo: monthlyPaymentAmountLabel.bottomAnchor),
           
            apartmentTypeLabel.leadingAnchor.constraint(equalTo: stackViewForVertical.leadingAnchor),
            apartmentTypeLabel.bottomAnchor.constraint(equalTo: startingFromTextLabel.topAnchor,constant: -8)
        ])
    }
    
    private func addFavoriteContainerView() {
        favoriteImageContainer.addSubview(favoriteImageView)
        NSLayoutConstraint.activate([
            favoriteImageView.topAnchor.constraint(equalTo: favoriteImageContainer.topAnchor, constant: 9),
            favoriteImageView.bottomAnchor.constraint(equalTo: favoriteImageContainer.bottomAnchor, constant: -9),
            favoriteImageView.leadingAnchor.constraint(equalTo: favoriteImageContainer.leadingAnchor,constant: 9),
            favoriteImageView.trailingAnchor.constraint(equalTo: favoriteImageContainer.trailingAnchor, constant: -9)
        ])
    }
    
    func bindData(_ data: HouseInfoItem, imagePath: String) {
        self.data = data

        startingFromTextLabel.text = "From".uppercased()

        apartmentTypeLabel.attributedText = NSMutableAttributedString(string: data.housingType.uppercased()).withKerning(1.5)
        monthlyPaymentAmountLabel.attributedText = data.monthlyPaymentAttributedString
        purchasePriceAmountLabel.text = data.purchasePrice

        bedroomCountLabel.text = data.bedroomCountDesc
        bathroomCountLabel.text = data.ownerCountDescription
        areaMetricValueLabel.text = data.depreciationPerYear
        locationLeftLabel.text = data.houseLocationDescription

        houseImage.image = UIImage(named: imagePath)
        handleFavoriteState(data.isFavorite)
    }
    
    func hideFavoriteView() {
        favoriteImageContainer.isHidden = true
    }
    
    //MARK: - Action Handler
    private func handleFavoriteState(_ isFavorite: Bool) {
        if isFavorite {
            favoriteImageView.image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemRed)
        } else {
            favoriteImageView.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysOriginal).withTintColor(.black.withAlphaComponent(0.9))
        }
    }


    private func initActionListeners() {
        handleFavoriteAction()
    }

    private func handleFavoriteAction() {
        favoriteImageContainer.isUserInteractionEnabled = true
        let favTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTapFavourite(_:)))
        favoriteImageContainer.addGestureRecognizer(favTapGesture)
    }

    @objc private func onTapFavourite(_ sender: Any) {
        self.data?.isFavorite.toggle()
        self.handleFavoriteState(self.data?.isFavorite ?? false)
    }
    
    
}
