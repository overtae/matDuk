//
//  DetailViewController.swift
//  matDuk
//
//  Created by 소프트웨어컴퓨터 on 2022/01/18.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var tableDetail: UITableView!
    @IBOutlet weak var lblDetail: UILabel!
    
    var matName = ""
    var matIndex : IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblDetail.text = matName
        tableDetail.delegate = self
        tableDetail.dataSource = self
        
        let imgSource = list[matIndex.section].items[matIndex.row].img
        imgDetail.image = UIImage(named: imgSource)
        
        
    }
    
    func receiveName(_ name: String, at index: IndexPath) {
        matName = name
        matIndex = index
    }
    
    
    @IBAction func btnCall(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "!", message: "전화를 거시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let call = UIAlertAction(title: "네", style: UIAlertAction.Style.default) { _ in
            let num = list[self.matIndex.section].items[self.matIndex.row].phone
            let urlStr = "tel://" + num
            let numberURL = NSURL(string: urlStr)! as URL
            
            UIApplication.shared.canOpenURL(numberURL)
        }
        let cancel = UIAlertAction(title: "아니요", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(call)
        alert.addAction(cancel)
        
        present(alert, animated: false, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgMap" {
            let indexPath = self.matIndex
            let mapView = segue.destination as! MapViewController
            
            mapView.receiveIndex(indexPath)
        }
    }
    
    
}

extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[matIndex.section].items[matIndex.row].menus.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let locate = list[matIndex.section].items[matIndex.row]
        let target = locate.menus[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)

        // Configure the cell...
    
        cell.textLabel?.text = target.menu
        cell.imageView?.image = UIImage(named: target.menuImg)
        return cell
    }
    
    
}
