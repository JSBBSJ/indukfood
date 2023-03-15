//
//  ViewController.swift
//  indukfood
//
//  Created by seungbeom on 2023/02/02.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
  
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            if let headerView = view as? UITableViewHeaderFooterView{
                headerView.textLabel?.textColor = .black
                headerView.textLabel?.textAlignment = .left
                headerView.textLabel?.font = UIFont(name: "Futura-Bold", size: 18)
        }
    }
    
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "한식"
        case 1:
            return "일식"
        case 2:
            return "중식"
        case 3:
            return "양식"
        case 4:
            return "분식"
        case 5:
            return "패스트푸드"
        case 6:
            return "카페"
        default :
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    
    let data = [
        ["밥은"],
    ["민들레초밥"],
    ["용궁"],
        ["하다식당"],
    ["한끼뚝딱","김가네"],
    ["노랑통닭","맘스터치"],
        ["빽다방"]
    ]


    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: MenuViewController = segue.destination as? MenuViewController else {
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        nextViewController.menutext = cell.textLabel?.text
    }
    
}


