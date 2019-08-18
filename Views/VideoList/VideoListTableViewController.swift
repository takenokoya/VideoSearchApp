//
//  VideoListTableViewController.swift
//  VideoSearchApp
//
//  Created by 坂口卓也 on 2019/08/18.
//  Copyright © 2019 坂口卓也. All rights reserved.
//

import UIKit

class VideoListTableViewController: UITableViewController {
    
    /// ViewModel
    let viewModel = VideoListViewModel()
    
    /// 検索キーワード
    var searchWord: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetch(searchWord: searchWord, completion: {
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.videoList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListTableViewCell", for: indexPath) as? VideoListTableViewCell else {
            print("VideoListTableViewCell 変換失敗")
            return UITableViewCell()
        }
        print(viewModel.videoList[indexPath.row])
        cell.configure(item: viewModel.videoList[indexPath.row])
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VideoListTableViewController {
    
    static func makeInstance(searchWord: String) -> UIViewController {
        // Storyboard`Main`の情報を取得
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        // `VideoListTableViewController`のインスタンスを生成
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "VideoListTableViewController") as? VideoListTableViewController else {
            return UIViewController()
        }
        // 検索ワードに引数で受け取った内容を格納
        vc.searchWord = searchWord
        return vc
    }
}
