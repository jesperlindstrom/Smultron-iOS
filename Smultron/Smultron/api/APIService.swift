import Foundation

class APIService {
  static var instance = APIService()
  private var userId: Int
    
  init() { }
    
  func createRoom() -> Room {
    self.userId = 1
    
    return Room(id: 1, code: "THE CODE")
  }
  
  func joinRoom(code: String) -> Room {
    self.userId = 1
    
    return Room(id: 1, code: code)
  }
  
  func getFirstPlace(roomId: Int) -> Place {
    // send userId with request
    
    return fakePlace()
  }
  
  func registerSwipe(placeId: Int, approved: Bool) -> (Place, matchCount: Int) {
    // send userId with request
    
    let place = fakePlace()
    
    return (place, 2)
  }
  
  private func fakePlace() -> Place {
    return Place(id: 0, title: "Eiffeltornet IGEN!", category: "Ett jävla torn IGEN!", imageUrl: "http://cdn.history.com/sites/2/2015/04/hith-eiffel-tower-iStock_000016468972Large.jpg", linkUrl: "http://google.com")
  }
  
  func getMatches(roomId: Int) -> [Place] {
    return [
      fakePlace(), fakePlace(), fakePlace()
    ]
  }
}