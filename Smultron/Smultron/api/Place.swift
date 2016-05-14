import Foundation

class Place {
  let id: Int
  let title: String
  let category: String
  let imageUrl: String
  let linkUrl: String
  
  init(id: Int, title: String, category: String, imageUrl: String, linkUrl: String) {
    self.title = title
    self.category = category
    self.imageUrl = imageUrl
    self.linkUrl = linkUrl
  }
}