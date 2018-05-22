import FluentMySQL
import Vapor

final class User: Codable {
    var id: Int?
    var name: String
    var username: String
    var email: String
    var password: String
    
    init(name: String, username: String, email: String, password: String) {
        self.name = name
        self.username = username
        self.email = email
        self.password = password
    }
}

extension User: MySQLModel {}

extension User: Migration {}

extension User: Content {}

extension User {
    var posts: Children<User, Post> {
        return children(\.creatorId)
    }
}
