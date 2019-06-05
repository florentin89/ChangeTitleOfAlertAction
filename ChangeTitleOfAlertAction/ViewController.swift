//
//  ViewController.swift
//  ChangeTitleOfAlertAction
//
//  Created by Florentin Lupascu on 05/06/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.tableFooterView = UIView()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showOptions(indexPath: indexPath)
    }
    
    func showOptions(indexPath:IndexPath){
        
        let isSelected = indexPath == selectedIndexPath

        let title = isSelected ? "Disable" : "Enable"
        
        let applyOn = UIAlertAction(title: title, style: .default, handler: { (action: UIAlertAction!) in
            self.selectedIndexPath = isSelected ? nil : indexPath
        })
        
        let actionSheet = configureActionSheet()
        actionSheet.addAction(applyOn)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func configureActionSheet() -> UIAlertController {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancel)
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad ){
            actionSheet.popoverPresentationController?.sourceView = self.view
            actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            actionSheet.popoverPresentationController?.permittedArrowDirections = []
        }
        
        return actionSheet
    }
}
