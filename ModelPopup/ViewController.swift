//
//  ViewController.swift
//  ModelPopup
//
//  Created by Kondiram Sonawane on 4/1/18.
//  Copyright © 2018 Kondiram Sonawane. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ModelViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func presentModel(_ sender: Any) {
        
        
        let dataArray = NSMutableArray()
        let dic1 = NSMutableDictionary()
        dic1.setValue("Hide post", forKey: "title")
        dic1.setValue("please hide your post", forKey: "subTitle")
        dic1.setValue("1", forKey: "image")
        dataArray.add(dic1)
        let dic2 = NSMutableDictionary()
        dic2.setValue("Delete post", forKey: "title")
        dic2.setValue("please delete your post", forKey: "subTitle")
        dic2.setValue("2", forKey: "image")
        dataArray.add(dic2)
        let dic3 = NSMutableDictionary()
        dic3.setValue("Share post", forKey: "title")
        dic3.setValue("please share your post", forKey: "subTitle")
        dic3.setValue("3", forKey: "image")
        dataArray.add(dic3)
        let dic4 = NSMutableDictionary()
        dic4.setValue("Fav post", forKey: "title")
        dic4.setValue("please add as fav your post", forKey: "subTitle")
        dic4.setValue("4", forKey: "image")
        dataArray.add(dic4)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModelViewController") as! ModelViewController
        vc.dataArray = dataArray
        vc.delegate = self
        vc.providesPresentationContextTransitionStyle = true;
        vc.definesPresentationContext = true;
        vc.modalPresentationStyle = .overCurrentContext
        //let nav = UINavigationController(rootViewController: vc)
        self.present(vc, animated: true, completion: nil)
        
    }
    func finishPassing(string: String) {
        print("Notified  \(string)")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OtherViewController") as! OtherViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }


}

