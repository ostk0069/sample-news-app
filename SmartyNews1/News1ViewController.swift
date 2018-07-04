//
//  News1ViewController.swift
//  SmartyNews1
//
//  Created by Takuma Osada on 2018/07/02.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit

class News1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate, XMLParserDelegate {
  
  var tableView: UITableView = UITableView()
  
  var refreshControl: UIRefreshControl!
  
  var webView: UIWebView = UIWebView()
  
  var goButton: UIButton!
  var backButton: UIButton!
  var cancelButton: UIButton!
  
  var dotsView: DotsLoader = DotsLoader()
  
  var parser = XMLParser()
  var totalBox = NSMutableArray()
  var elements = NSMutableDictionary()
  var element = String()
  var titleString = NSMutableArray()
  var linkString = NSMutableArray()

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
      webView.frame = tableView.frame
      webView.delegate = self
      webView.scalesPageToFit = true
      webView.contentMode = .scaleAspectFit
      self.view.addSubview(webView)
      webView.isHidden = true
      
      //button to acess the next page
      goButton = UIButton()
      goButton.frame = CGRect(x: self.view.frame.size.width - 50.0, y: self.view.frame.size.height - 128.0, width: self.view.frame.size.width, height: self.view.frame.size.height - 54.0 )
      goButton.setImage(UIImage(named: "go.png"), for: .normal)
      goButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
      self.view.addSubview(goButton)
      
      // button to access previous page
      backButton = UIButton()
      backButton.frame = CGRect(x: 10, y: self.view.frame.size.height - 128.0, width: 50, height: 50)
      backButton.setImage(UIImage(named: "back.png"), for: .normal)
      backButton.addTarget(self, action: #selector(backPage), for: .touchUpInside)
      self.view.addSubview(backButton)
      
      // button to access cancel
      cancelButton = UIButton()
      cancelButton.frame = CGRect(x: 10, y: 80, width: 50, height: 50)
      cancelButton.setImage(UIImage(named: "cancel.png"), for: .normal)
      cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
      self.view.addSubview(cancelButton)
      
      goButton.isHidden = true
      backButton.isHidden = true
      cancelButton.isHidden = true
      
      //dots view
      dotsView.frame = CGRect(x: 0, y: self.view.frame.size.height / 3, width: self.view.frame.size.width, height: 100)
      dotsView.dotsCount = 5
      dotsView.dotsRadius = 10
      self.view.addSubview(dotsView)
      
      dotsView.isHidden = true
      
      // search for xml
      let url: String = "http://news.yahoo.co.jp/pickup/domestic/rss.xml"
      let urlToSend:URL = URL(string:url)!
      parser = XMLParser(contentsOf: urlToSend)!
      parser.delegate = self
      parser.parse()
      
      tableView.reloadData()
    }
  
  @objc func refresh() {
    
    perform(#selector(delay), with: nil, afterDelay: 2.0)
    
  }
  
  @objc func delay() {
    
    // search for xml
    let url: String = "http://news.yahoo.co.jp/pickup/domestic/rss.xml"
    let urlToSend:URL = URL(string:url)!
    parser = XMLParser(contentsOf: urlToSend)!
    parser.delegate = self
    parser.parse()
    
    tableView.reloadData()
    refreshControl.endRefreshing()
    
  }
  
  @objc func nextPage() {
    
    
  }
  
  @objc func backPage() {
    
    
  }
  
  @objc func cancel() {
    
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 100
    
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return totalBox.count

  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    <#code#>
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
