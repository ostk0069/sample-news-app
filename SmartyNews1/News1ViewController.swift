//
//  News1ViewController.swift
//  SmartyNews1
//
//  Created by Takuma Osada on 2018/07/02.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class News1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var tableView: UITableView = UITableView()
  
  var refreshControl: UIRefreshControl!
  
  var webView: UIWebView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      // code for background image
      let imageView = UIImageView()
      imageView.frame = self.view.bounds
      imageView.image = UIImage(named: "1.jpg")
      self.view.addSubview(imageView)
    
      // refresh function
      refreshControl = UIRefreshControl()
      refreshControl.tintColor = UIColor.blue
      refreshControl.attributedTitle = NSAttributedString(string: "loading...")
      refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
    
      //making table view
      tableView.delegate = self
      tableView.dataSource = self
      tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 54.0 )
      tableView.backgroundColor = UIColor.clear
      tableView.addSubview(refreshControl)
      self.view.addSubview(tableView)
      
      // making web view
      
    }
  
  @objc func refresh() {
    
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
