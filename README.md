# Project Eatales (prototype)

## Description
This is a backend prototype of a SNS for food lovers. The platform is being developed with serverside framework of Swift, [Vapor](https://vapor.codes/).

## Instruction
- Create a DB in a Docker container using the following command (replace `<YOUR_DB_PASSWORD>` with the password you want to use):
```
docker run --name vapor-mysql -e MYSQL_ROOT_PASSWORD=<YOUR_DB_PASSWORD> -e MYSQL_DATABASE=dev_eatales -d -p 3306:3306 mysql:5.7
```
- Set a environment variable named `EATALES_MYSQL_PASSWORD` with the password set in the previous step.
- Go to the source code directory of the application and run:
```
vapor xcode -y
```
- Run the application from Xcode.