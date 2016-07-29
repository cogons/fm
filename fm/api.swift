import UIKit
import Alamofire

class api: NSObject {
    
    
    var delegate:HttpProtocol?

    
    func onSearch(url:String){
        Alamofire.request(.GET, url).responseJSON { (response) in
            
            if let JSON = response.result.value{
                self.delegate!.didReceiveResult(response.data!)}
        }
        
    }
  
}

protocol HttpProtocol {
    func didReceiveResult(result:AnyObject)
}