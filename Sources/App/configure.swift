import Vapor
import FluentMySQL

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register providers
    try services.register(FluentMySQLProvider())

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    
    /// Configure database
    let dbPassword = Environment.get("EATALES_MYSQL_PASSWORD")
    var databases = DatabaseConfig()
    let databaseConfig = MySQLDatabaseConfig(
        hostname: "127.0.0.1",
        port: 3306,
        username: "root",
        password: dbPassword,
        database: "dev_eatales"
    )
    let database = MySQLDatabase(config: databaseConfig)
    databases.add(database: database, as: .mysql)
    services.register(databases)
    
    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Post.self, database: .mysql)
    migrations.add(model: User.self, database: .mysql)
    services.register(migrations)
    
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
}
