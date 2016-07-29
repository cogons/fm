//
//  HttpController.swift
//  fm
//
//  Created by Cogons on 16/7/29.
//  Copyright © 2016年 Cogons. All rights reserved.
//

import UIKit
import Alamofire


class HttpController:NSObject{
    
    var delegate : HttpProtocol?
    
    func onSearch(url:String){
        Alamofire.request(.GET, url).responseJSON { (response) in
            
            if let JSON = response.result.value {
                self.delegate!.didReceive(JSON)
            }
        }
    }
    
    
    func getChannelNum(url:String){
        
        Alamofire.request(.GET, url).responseJSON { (response) in
            
            if let JSON = response.result.value {
                self.delegate!.didReceive(JSON["channels"]!!.count)
            }
        
    }
    }
    
}

protocol HttpProtocol {
    func didReceive(result:AnyObject)
}