import Vapor
import Routing

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // Basic "Hello, world!" example
    router.get("healthcheck") { req in
        return HTTPStatus.ok
    }
    
    let postsController = PostsController()
    try router.register(collection: postsController)
    
    let usersController = UsersController()
    try router.register(collection: usersController)
    
}
