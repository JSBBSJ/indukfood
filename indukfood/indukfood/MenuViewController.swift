//
//  MenuViewController.swift
//  indukfood
//
//  Created by seungbeom on 2023/02/05.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CustomCell
        
        let text: String = self.menu[indexPath.row]
        let text2: String = self.pay[indexPath.row]
        
        cell.menuTitle?.text = text
        cell.menuPrice?.text = text2
        cell.menuImage.image = UIImage(named: image[indexPath.row])
        
        return cell
    }
   
    
   
    @IBOutlet weak var label: UILabel!
    
   
    
    let cellIdentifier: String = "cell"
    
    var menu: [String] = []
    var pay: [String] = []
    var image: [String] = []
    
    func menuChoice() {
        switch menutext {
        case "밥은":
                    menu = ["제육덮밥", "돼지숙주덮밥", "스팸마요덮밥", "치킨마요덮밥"]
                    pay = ["6,000", "6,000", "5,000", "6,000"]
                    image = ["bab1", "bab2", "bab3", "bab4"]
                case "민들레초밥":
                    menu = ["모둠초밥(10p)","특초밥(12p)","민들레초밥(12p)"]
                    pay = ["12,000", "15,000", "19,000"]
                    image = ["min1", "min2", "min3"]
                case "용궁":
                    menu = ["짜장면", "간짜장", "중화비빔밥"]
                    pay = ["4,000", "5,000", "7,000"]
                    image = ["yo1", "yo2", "yo3"]
                case "하다식당":
                    menu = ["등심하다", "안심하다", "카레우동세트", "카레하다세트"]
                    pay = ["9,000", "10,000", "8,500", "8,500"]
                    image = ["ha1", "ha2", "ha3", "ha4"]
                case "한끼뚝딱":
                    menu = ["즉석떡볶이","치즈떡볶이","삽겹제육","김치삼겹"]
                    pay = ["9,000", "11,000", "6,000","6,000"]
                    image = ["han1","han1","han3","han3"]
                case "김가네":
                    menu = ["쫄면","김밥","김치볶음밥","볶음우동"]
                    pay = ["5,500", "3,500", "7,500", "6,500"]
                    image = ["kim1", "kim2", "kim3", "kim4"]
                case "노랑통닭":
                    menu = ["후라이드치킨", "양념치킨", "순살3종세트"]
                    pay = ["18,000", "19,000", "24,000"]
                    image = ["norang1", "norang2", "norang3"]
                case "맘스터치":
                    menu = ["싸이버거", "휠렛버거", "통새우버거", "살사리코버거", "커플떡강정세트", "커플치킨세트"]
                    pay = ["5,800", "5,600", "4,900", "6,300", "16,900", "17,300"]
                    image = ["Mom1", "Mom2", "Mom3", "Mom4", "Mom5", "Mom6"]
        case "빽다방":
            menu = ["원조커피", "연유라뗴", "초코빽스치노"]
            pay = ["3,800", "4,200", "5,500"]
            image = ["bak1", "bak2", "bak3"]
                default:
                    return
        }
    }
   
    var menutext: String?
    
    override func viewDidLoad() {
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
    
        super.viewDidLoad()
        self.myTableView.rowHeight = 200

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = self.menutext
        menuChoice()
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            guard let nextViewController: DataViewController = segue .destination as? DataViewController else {return}
            nextViewController.textToSet = menutext
        }
        
    }


