//
//  ExpensesViewController.swift
//  Debt Manager
//
//  Created by Alexander Thompson on 7/4/21.
//

import UIKit

class ExpensesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navName: UINavigationItem!
    @IBOutlet weak var totalExpenses: UILabel!
    
    static var expenseArray = [Double]()
    
    var tableViewRows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(updateExpenseLabel), name: Notification.Name(rawValue: "updateExpenseLabel"), object: nil)
            }

    @IBAction func buttonPressed(_ sender: UIButton) {
        tableViewRows += 1
        ExpensesViewController.expenseArray.append(0.0)
        tableView.reloadData()
    }
    
    @objc func updateExpenseLabel() {
        totalExpenses.text = String(format: "$%.2f", ExpensesViewController.expenseArray.reduce(0, +))
    }
   
    }


extension ExpensesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell") as? ExpensesTableViewCell else {
            return UITableViewCell()
        }
       
        cell.expenseCost.tag = indexPath.row
     
            return cell
        }
    
        }

        
    
    
    
    

