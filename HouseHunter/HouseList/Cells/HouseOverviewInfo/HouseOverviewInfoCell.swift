//
//  HouseOverviewInfoCell2.swift
//  HouseHunter
//
//  Created by MacBook Pro on 11/06/2022.
//

import UIKit

class HouseOverviewInfoCell: UITableViewCell {

    
  
    let houseOverviewInfo : HouseOverviewInfo = {
        let ui = HouseOverviewInfo()
        ui.translatesAutoresizingMaskIntoConstraints = false
        return ui
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        selectionStyle = .none
        contentView.addSubview(houseOverviewInfo)
        NSLayoutConstraint.activate([
            houseOverviewInfo.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            houseOverviewInfo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            houseOverviewInfo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            houseOverviewInfo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(_ data: HouseInfoItem) {
        houseOverviewInfo.bindData(data, imagePath: "img_apartment_indoor")
    }


}
