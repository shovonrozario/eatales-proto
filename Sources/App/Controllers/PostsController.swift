import Vapor

struct PostsController: RouteCollection {
    func boot(router: Router) throws {
        let postsRoute = router.grouped("api", "posts")
        postsRoute.get(use: getAllHandler)
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[Post]> {
        return Post.query(on: req).all()
    }
}
