//
//  ViewController.swift
//  TableViewHeaderFooter
//
//  Created by Apple on 25/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView : UITableView!
    
    let data = [["apples","oranges","grapes"],["One","Two","Three"],["Last One"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        header.backgroundColor = .orange
        footer.backgroundColor = .green
        
        let label = UILabel(frame: header.bounds)
        label.text = "Hello World"
        label.textAlignment = .center
        header.addSubview(label)

        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }

 
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50.0
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .red
        return cell
    }
    
    
}
