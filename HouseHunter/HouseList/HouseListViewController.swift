//
//  ViewController.swift
//  HouseHunter
//
//  Created by Thet Htun on 12/19/21.
//

import UIKit

class HouseListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        setupTableView()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "House Hunt"
    }
   
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.register(HouseOverviewInfo2Cell.self, forCellReuseIdentifier: String(describing: HouseOverviewInfo2Cell.self))
    }
    
    
}

//MARK: - UITableViewDataSource
extension HouseListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HouseOverviewInfo2Cell.self), for: indexPath) as? HouseOverviewInfo2Cell else {
            return UITableViewCell()
        }
        
        cell.bindData(.getDummyHousingInfo())
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HouseDetailViewController2()
        vc.comparingHouseInfoData = .getDummyHousingInfo()
        vc.currentHouseInfoData = .getDummyCurrentHousingInfo()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
}


