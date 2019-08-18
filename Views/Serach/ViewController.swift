//
//  ViewController.swift
//  VideoSearchApp
//
//  Created by 坂口卓也 on 2019/08/18.
//  Copyright © 2019 坂口卓也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 検索をタップ
    @IBAction func searchButton(_ sender: Any) {
        guard let txt = searchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !txt.isEmpty else {
            print("不正な検索ワードです。")
            return
        }
        print("検索ワード:\(txt)")
        let nc = VideoListTableViewController.makeInstance(searchWord: txt)
        self.navigationController?.pushViewController(nc, animated: true)
    }
}
