//
//  ModelViewController.swift
//  ModelPopup
//
//  Created by Kondiram Sonawane on 4/1/18.
//  Copyright © 2018 Kondiram Sonawane. All rights reserved.
//

import UIKit


protocol ModelViewControllerDelegate {
    func finishPassing(string: String)
}

class ModelViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var delegate: ModelViewControllerDelegate?
    var dataArray:NSMutableArray!
    @IBOutlet weak var tableBackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var modelTableView: UITableView!
    @IBOutlet weak var tableBackView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isOpaque = false
        self.modelTableView.delegate = self
        self.modelTableView.dataSource = self
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .clear
        
    }
    override func viewWillLayoutSubviews() {
        self.tableBackViewHeight.constant = self.modelTableView.contentSize.height+10
        tableBackView.roundCorners([.topLeft, .topRight], radius: 10)
    }
    @IBAction func closemodel(_ sender: Any) {
        self.delegate?.finishPassing(string: "TEST")

        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.modelTableView.dequeueReusableCell(withIdentifier: "ModelTableCell") as! ModelTableCell
        let dic = self.dataArray.object(at: indexPath.row) as! NSMutableDictionary
        
        cell.titleLbl.text =  dic.value(forKey: "title") as? String
        cell.subTitleLbl.text =  dic.value(forKey: "subTitle") as? String
        cell.imgView.image = UIImage(named: (dic.value(forKey: "image") as? String)!)
        cell.btn.tag = indexPath.row
        cell.btn.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
        return cell
    }
    @objc func buttonClicked(sender:UIButton)
    {
        self.dismiss(animated: true, completion: nil)
        let dic = self.dataArray.object(at: sender.tag) as! NSMutableDictionary
        self.delegate?.finishPassing(string: (dic.value(forKey: "title") as? String)!)
        
        
    }
    
}
extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
