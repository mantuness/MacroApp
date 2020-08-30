# MacroApp - iOS architecture proposal
This project was designed taking into consideration a clean architecture and a MVVM+C pattern for the presentation layer. To accomplish the injection of dependencies we chose to use [Swinject](https://github.com/Swinject/Swinject), a lightweight [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) framework for Swift.

[Important Swinject reading](https://github.com/Swinject/Swinject/blob/master/Documentation/DIContainer.md#registration-with-arguments-to-di-container)

## Layers
- Domain Layer = Models + Use Cases + Repositories Interfaces
- Data Repositories Layer = Repositories Implementations + Mappers
- Services/Platforms (1 layer for each) = API (Network) + Persistence DB
- App (MVVM+C) = ViewModels + Views + Coordinators

### Regarding dependencies:
- Domain - depends on no one
- Data - depends on Domain and JSPlatform or any other service/platform implementation (example: Persistence DB)
- JSPlatform - depends on no one
- App - depends on every module (Domain, Data, JSPlatform)

### Additional notes:
JSPlatform module was created to abstract all JS layer (tried an approach like a network API, please check the folder API that will have all the "services" provided by JS)

In the end what will happen is:
ViewController -> ViewModel -> UseCases -> Repositories -> "Services/Platforms"

## Some useful links and inspiration:
- [CleanArchitectureRxSwift](https://github.com/sergdort/CleanArchitectureRxSwift) by sergdort
- [The Clean Code Blog](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) by Uncle Bob
