import Vapor
import FluentMySQL

final class Post: Codable {
    var id: Int?
    var text: String
    var link: String
    var creatorId: User.ID
    
    init(text: String, link: String, creatorId: User.ID) {
        self.text = text
        self.link = link
        self.creatorId = creatorId
    }
}

extension Post: MySQLModel {}

extension Post: Migration {}

extension Post: Content {}

extension Post {
    var creator: Parent<Post, User> {
        return parent(\.creatorId)
    }
}
