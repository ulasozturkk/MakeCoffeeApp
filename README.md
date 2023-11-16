# MakeCoffeeApp

MakeCoffeeApp is a coffee recipes application developed using the Swift programming language. The application is built using the VIPER design pattern and includes a generic network layer.

## Features

- Selecting coffee type (hot or cold)
- Listing recipes based on the selected coffee type

## Technologies Used

- Swift 5
- VIPER (View, Interactor, Presenter, Entity, Router) design pattern
- Generic Network Layer

## How to Run

1. Clone the project to your computer.
2. Open Xcode and select the `MakeCoffeeApp.xcodeproj` file.
3. Run the project by selecting a simulator or a device.

## Usage

After launching the application, the main screen will present you with two options: "Hot Coffee" and "Cold Coffee." After choosing your preferred coffee type, the application will display recipes specific to that coffee type.

## VIPER Design Pattern

MakeCoffeeApp is developed using the VIPER (View, Interactor, Presenter, Entity, Router) design pattern. Each module represents a specific part of the application, and interactions between these modules follow specific rules.

## Generic Network Layer

The application includes a generic network layer for handling API calls. This helps manage API calls consistently and ensures cleaner, more maintainable code.

## Additional Information

- Other libraries and dependencies used in the project are listed in the `Podfile` file.

## Contributing

If you wish to contribute to the application, please read the "CONTRIBUTING.md" file before submitting a pull request.

## License

This project is licensed under the Apache License. For more information, see the [LICENSE.md](LICENSE.md) file.
