# Flutter app clean architecture



## Introduction

This sample demonstrates how one can

- Apply clean architecture on Flutter app 
- Use dependency injection for layers separation
- Create unit testing.
- Make api calls using http .

<p align="center">
  <img src="https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?resize=556%2C707&ssl=1" />
</p>

#### dependencies

- [http](https://pub.dev/packages/http) : http client
- [equatable](https://pub.dev/packages/equatable) : To being able to compare objects 
- [dartz](https://pub.dev/packages/dartz) : To stablish the response type using functional programming
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) : state managment 
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) : Enviroment variables 
- [get_it](https://pub.dev/packages/get_it): dependency injection
- [mockito](https://pub.dev/packages/mockito): unit testing

# Module Structure

<p align="center">
  <img src="https://camo.githubusercontent.com/a5485a38e6af7aa1055807a47e1833fc9a35eb7b997940b26936dcffae760623/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f3737322f302a73664344456235373157442d374566502e6a7067" />
</p>

There are 3 main modules to help separate the code. They are Data, Domain, and Application.

- **Data** contains Local Storage, APIs, Data objects (Request/Response object, DB objects), and the repository implementation.

- **Domain** contains UseCases, Domain Objects/Models, and Repository Interfaces

- **Application** contains UI, View Objects, Widgets, etc. Can be split into separate modules itself if needed. For example, we could have a module called Device handling things like camera, location, etc.


# Folder structure
- using modular architecture to architect the app per feature to be easier and more readable and isolate the feature from each other

├── core                              # Files used along all features
    ├── error                         # Contains excpection and failure classes
    └── usecases                      # Contains interfaces for the usecases
├── lib                               # Main fodler of the app
    └── features                      # Contains all features of the app
       ├── shorten_link               # shorten link feature folder
          ├── data                   # Data layer
          ├── domain                 # Domain layer
          └── presentation           # Presentation layer
       ├── injection_container.dart   # Dependency injection file
       └── main.dart                  # Main file of the app
└── test                              # Unit tests

$ ./tree-md .
# Project tree

.
  [tree-md](./tree-md)
 ├── [core](./dir2)
    ├── [file21.ext](./dir2/file21.ext)
   * [file22.ext](./dir2/file22.ext)
   * [file23.ext](./dir2/file23.ext)
 * [dir1](./dir1)
   * [file11.ext](./dir1/file11.ext)
   * [file12.ext](./dir1/file12.ext)
 * [file_in_root.ext](./file_in_root.ext)
 * [README.md](./README.md)
 * [dir3](./dir3)
# Repository
- Bridge between Data layer and Domain layer
- Connects to data sources and returns mapped data
- Data sources include DB and Api

# UseCase
- Responsible for connecting to repository to retrieve necessary data. returns a Stream that will emit each update.
- This is where the business logic takes place.
- Returns data downstream.
- Single use.
- Lives in Domain (No Platform dependencies. Very testable).

# ViewModel
- Organizes data and holds View state.
- Talks to use cases.
- Does not know about the View.

# View
- Updates UI
- Knows about the ViewModel
- Observes changes to ViewModel.

## Setup

One can download the code in zip format or take checkout from the git repository.

### Note
- You need to run build_runner command for test code generation everytime when you make changes in your original file.
- You need to set your own enviroment variables
## Todo
- to add more unit tests to increase code coverage
