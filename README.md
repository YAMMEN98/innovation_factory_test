# Inovation Factory Test App

A new Flutter project with Clean Architecture Pattern That Help The Travelers To Get Flights, Hotels
 And Car Rental.

## Getting Started

## Prerequisites

- Flutter SDK
- BloC State Management
- Android Studio or VS Code
- Dart plugin for your IDE

## Installing

- Clone the repository ```git clone https://github.com/YAMMEN98/innovation_factory_test.git```
- Open the project in Android Studio or VS Code.
- Run the app on an emulator or physical device.

## Feature

- Login Exist Account.
- Register New Account.
- Verification From Account.
- Home Page With Offers, Best Place And Best Packages.
- Search Flights.
- Show All Flights.
- Show Flight Details.
- Filter Flights.
- Apply Dark/Light theme.
- UI is a portrait and landscape mode.
- Add App Logo.
- Apply localization en/ar languages.
- Created a lane in ```.github/workflows/generate_apk.yaml``` to generate apk automatically when upload code to the main branch.

  ![Github Action](lane)

- Apply Unit Testing .

## Built With

- [Flutter](https://github.com/vedranMv/dataDashboard/releases) - The framework used).
- ```BloC``` For State Management.
- ```Dio```  as a Third-Party to get stories data from API.
- ```Shared Preference```  To Store Data In Local Storage.

## Unit Test

To run test you should follow the steps:

- run command ```flutter test```.
- You can find coverage test file in ```/coverage``` folder in root app after run this.command ```flutter test --coverage```.

There is many tools to generate text coverage,
we will use [test_cov_console](https://pub.dev/packages/test_cov_console) to generate coverage
report, follow these steps to run it:

- Run the following command to make sure all flutter library is up-to-date ```flutter pub get```,
    - Run the following command to generate lcov.info on coverage
      directory ```flutter test --coverage```,
    - Run the tool to generate report from lcov.info to the
      console ```flutter pub run test_cov_console```,
      ![Text Coverage / Console](url of test)

    - You can follow and see more of parameters
      in [test_cov_console](https://pub.dev/packages/test_cov_console).
    - You Can Output report to CSV file (-c, --csv, -o, --output)
      by ```flutter pub run test_cov_console -c --output=coverage/test_coverage.csv```
    - Open CSV file by excel and you will see like this result:

      ![Text Coverage / Excel](url of test excel)


## App on Phone

![Text Coverage / Excel](phone)

## App on Tablet

![Text Coverage / Excel](tablet)

## App on Web Browser

![Text Coverage / Excel](web)


## Note:

I had covered Api and Repository layer in Unit Test cause the time, of course I can cover all app if I have time.



## Author

Yamen Abdullrahman - Senior Flutter Developer;
