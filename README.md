# Dessert Recipe


## Overview

This project is a recipe app that utilizes the MVVM architecture along with various iOS frameworks and design patterns to provide a seamless user experience for browsing recipes. The app employs both UIKit and SwiftUI for building its user interface, offering a combination of traditional and modern approaches.



## Features

1. **MVVM Architecture**: The app follows the Model-View-ViewModel (MVVM) architectural pattern, ensuring separation of concerns and maintainability of codebase.

2. **UIKit and SwiftUI Integration**: The app leverages both UIKit and SwiftUI for UI development. It utilizes UITableViewController from UIKit for the initial recipe list screen and seamlessly transitions to a SwiftUI-based detail screen using Hosting Controller upon row selection.

3. **Image Handling**: For efficient image loading and display, the app uses Kingfisher in UIKit and AsyncImages in SwiftUI. This ensures smooth retrieval and presentation of recipe images, enhancing the overall user experience.

4. **Navigation and Interaction**: Key navigation and interaction components such as didSelectRow and navigation controller are incorporated to facilitate seamless navigation between screens and interaction with recipe details.

5. **Generics for API Data Fetching**: The app utilizes generics to fetch data from API endpoints, promoting code reusability and scalability.


## Requirments

Xcode 15 & Above


## Implementation Details

- **Services**: The app encapsulates network requests and business logic within service layers, ensuring a clean and modular codebase.
  

- **EndPointType**: EndPointType protocol is employed for defining API endpoints, enabling easy management and scalability of API interactions.


- **Data Passing**: The app employs forward data passing mechanisms to transfer relevant data between view controllers and SwiftUI views, ensuring consistent data flow throughout the app.


## Getting Started

To run the project locally, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Ensure you have all necessary dependencies installed.
4. Build and run the project on a simulator or device.

## Dependencies

- Kingfisher: (https://github.com/onevcat/Kingfisher)


