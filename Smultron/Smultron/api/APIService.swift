import Foundation
import Alamofire

class APIService {
  static var instance = APIService()
  static var BASE_URL = "http://smultron.jesperlindstrom.me"
  var userId: String?
  var roomId: String?
  var destination: String?
  var code: String?
    
  init() {
    
  }
    
  func createRoom(destination: String, callback: (NSDictionary) -> Void) {
    let url = APIService.BASE_URL + "/room"
    print("calling " + url)
    
    Alamofire.request(.POST, url, parameters: [ "destination": destination ]).responseJSON { response in
        
        if let JSON = response.result.value {
            let data = (JSON as? NSDictionary)!

            self.userId = String(data["user_id"] as! Int?)
            self.roomId = String(data["room_id"] as! Int?)
            self.code = data["code"] as! String?
            self.destination = data["destination"] as! String?
            
            callback(data)
        }
    }
  }
  
  func joinRoom(code: String, callback: (NSDictionary) -> Void) {
    let url = APIService.BASE_URL + "/room/" + code
    print("calling " + url)
    
    Alamofire.request(.POST, url).responseJSON { response in
        if let JSON = response.result.value {
            let data = (JSON as? NSDictionary)!
            
            self.userId = data["user_id"] as! String?
            self.roomId = data["room_id"] as! String?
            self.code = data["code"] as! String?
            self.destination = data["destination"] as! String?
            
            callback(data)
        }
    }
  }
  
  func registerSwipe(placeId: String, approved: Bool, callback: (NSDictionary) -> Void) {
    let url = APIService.BASE_URL + "/swipe"
    print("calling " + url)
    
    let params = [
        "user_id": self.userId!,
        "place_id": placeId,
        "state": approved ? "1" : "0"
    ]
    
    Alamofire.request(.POST, url, parameters: params).responseJSON { response in
        if let JSON = response.result.value {
            let data = (JSON as? NSDictionary)!
            
            callback(data)
        }
    }
  }
  
  func getMatches(callback: (NSDictionary) -> Void) {
    let url = APIService.BASE_URL + "/room/" + self.roomId!
    
    Alamofire.request(.GET, url).responseJSON { response in
        if let JSON = response.result.value {
            let data = (JSON as? NSDictionary)!
            
            callback(data)
        }
    }
  }
}