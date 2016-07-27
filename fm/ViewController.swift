//
//  ViewController.swift
//  fm
//
//  Created by Cogons on 16/7/28.
//  Copyright © 2016年 Cogons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var songName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getSong()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSong(){
        var urlPath = NSURL(string: "https://www.douban.com/j/app/radio/channels")
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(urlPath!){data,response,error in
            var jsonResult:NSDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            dispatch_async(dispatch_get_main_queue()){
            self.songName.text = jsonResult["channels"]![0]["name_en"] as! String
            }

        }
        task.resume()
    }


}

