//
//  SettingsViewController.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 06/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var imgViewFirst: UIImageView!
    @IBOutlet weak var imgViewSecond: UIImageView!
    @IBOutlet weak var imgViewThird: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SettingsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.register(SettingsImageCell.self, forCellReuseIdentifier: "SettingsImageCell")
        tableView.register(UINib(nibName: "SettingsImageCell", bundle: nil), forCellReuseIdentifier: "SettingsImageCell")
        
        self.tableView.rowHeight = UITableView.automaticDimension;
        self.tableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is

    }
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func backToHome(_ sender: Any) {
        viewModel?.callHome()
    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    @IBAction func cancelButton(_ sender: Any) {
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsImageCell") as? SettingsImageCell
            cell?.imgOne.imageView?.image = #imageLiteral(resourceName: "AppLogo")
            cell?.imgTwo.imageView?.image = #imageLiteral(resourceName: "Happy")
            cell?.imgThree.imageView?.image = #imageLiteral(resourceName: "First")
            return cell!
        }
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Teste"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "" : "Header"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 244.0 : UITableView.automaticDimension
    }
}
