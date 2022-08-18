//
//  HistoryTableViewController.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 12/08/2022.
//

import UIKit

class HistoryTableViewController: UIViewController {

    @IBOutlet weak var historyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "History"
        
        historyTableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryTableViewCell")
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        historyTableView.reloadData()
    }

}

extension HistoryTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersistanceManager().getHistory().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        let items = PersistanceManager().getHistory()
        let item = items[indexPath.row]
        cell.configure(withHistoryItem: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            print("Delete Item At:",indexPath.row)
            let items = PersistanceManager().getHistory()
            let item = items[indexPath.row]
            PersistanceManager().removeHistroyItem(item)
            self.historyTableView.reloadData()
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HistoryProductDetailVC") as! HistoryProductDetailVC
        
        let items = PersistanceManager().getHistory()
        let item = items[indexPath.row]
        vc.title = item.productName ?? "Detail"
//                    barcodeCapture.isEnabled = true
        vc.product = item
        vc.stores = PersistanceManager().getStores()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
//    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//        print("did end editing")
//        guard let indexPath = indexPath else {return}
//        historyTableView.reloadRows(at: [indexPath], with: .none)
//    }
    
}
