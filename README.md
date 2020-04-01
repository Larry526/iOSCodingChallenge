# Coding Challenge

Coding Challenge - This is a coding challenge I've worked on to demonstrate architecture of handling remote data in Swift for iOS.

## Getting Started

The App uses Cocoa Pods for dependency management. The app fetches data from the api and display  data in a table view. The app supports offline browsing by caching the first ten items previously fetched. There will be a message shown when the user is browsing the cached data and tells them they are in offline mode.

```
This project was built with Xcode (11.3.1) and Cocoa Pod (1.8.0).
```

## Installing

Pod folder is included with the project to avoid complications with dependency management (i.e. Different version of cocoa pod). If the project still fails to compile, please run the following commands.

```
pod deintegrate
pod update
```

When testing on device, please set the bundle id to a unique one. There seems to be an issue with compiling on device for iOS13.3.1 with the Alamofire framework being used in this project. Work around has been implemented and the discussion can be found in the below link. 

https://github.com/Alamofire/Alamofire/issues/3051#issuecomment-581349150

When building to device from xcode, the device requires internet connection to compile due to the above.


## Running the tests

```
Command + U
```

By pressing Command + U, test cases will run. There are 5 cases in total which focuses on testing the mapping and the data structure of the app. XCTests runs fine on simulator, but does not run properly on device due to framework issues.
