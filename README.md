# Excelerate Flutter App

A functional Week 2 mobile UI prototype built with Flutter and Dart for the Excelerate internship program.

## Week 2 Deliverables

- Login screen
- Home dashboard
- Program listing screen
- Program details screen
- Navigation between all four core screens
- Shared navigation drawer with logout confirmation
- Excelerate-inspired orange and pink branding
- Responsive layouts and reusable UI components

## App Flow

1. Enter through the Login screen.
2. Continue to the Home dashboard.
3. Open the Program Listing from the dashboard or navigation drawer.
4. Select a program to view its details.
5. Use the navigation drawer to return home or log out.

## Run the App

### Requirements

- Flutter SDK
- Dart SDK (included with Flutter)
- Android Studio, VS Code, or another Flutter-compatible editor
- An emulator, browser, or connected device

### Setup

```bash
flutter pub get
flutter run
```

To run the automated UI test:

```bash
flutter test
```

## App Screenshots

### Login

<img width="420" alt="Excelerate login screen" src="https://github.com/user-attachments/assets/d93f4945-dccf-43be-b6b4-99dac14c734c" />

### Home Dashboard

<img width="420" alt="Excelerate home dashboard" src="https://github.com/user-attachments/assets/dc1168f9-7b1b-44c2-baf2-8ef496d977b7" />

### Program Listing

<img width="420" alt="Excelerate program listing screen" src="https://github.com/user-attachments/assets/25dbd9a3-d6fd-48c5-9db8-ec000b67a473" />

### Program Details

<img width="420" alt="Excelerate program details screen" src="https://github.com/user-attachments/assets/44456f90-aa5d-434c-9056-70ea36e3b493" />

# Week 3 Update – API-Connected Functional App

## Overview

During Week 3, the Excelerate Flutter application was upgraded from a UI prototype into a more functional application by integrating JSON-based data, adding a program registration form, implementing form validation, and adding local data storage.

The application now allows users to browse programs using dynamically loaded data and submit registrations for programs.

---

## Features Implemented

### 1. JSON-Based Program Data

The Program Listing and Program Details screens now use structured JSON data instead of hardcoded program information.

The program data contains:

* Program ID
* Program title
* Start date
* Description
* Schedule
* Eligibility
* Trainers
* Expected outcomes

The JSON data is converted into Dart `Program` objects using the `Program` model.

### 2. Dynamic Program Listing

The Program Listing screen dynamically displays available programs.

Each program card includes:

* Program title
* Start date
* Short description
* View Details button

The programs are loaded using `ProgramService`.

### 3. Program Details Screen

A dedicated Program Details screen was implemented.

Users can select a program from the Program Listing screen and view:

* Program description
* Schedule
* Eligibility requirements
* Trainers
* Expected outcomes
* Registration option

The selected program is passed dynamically to the Program Details screen.

### 4. Program Registration Form

A registration form was added to allow users to register for a selected program.

The form collects:

* Full name
* Email address
* Phone number

Users must also confirm that the information provided is correct before submitting the registration.

### 5. Form Validation

Validation was implemented to ensure that users provide valid information.

The registration form checks that:

* Full name is not empty.
* Email address is not empty.
* Email address follows a valid email format.
* Phone number is not empty.
* Phone number follows an accepted format.
* Registration terms are accepted.

An error message is displayed when invalid information is entered.

### 6. Local JSON Storage

Submitted registrations are stored locally in JSON format using Flutter's application documents directory.

The registration data includes:

* Registration ID
* Program ID
* Program title
* Full name
* Email
* Phone number
* Submission date and time

This allows registration information to remain available when the application is reopened on the same device.

### 7. My Registrations

A **My Registrations** screen was added so that users can view the programs they have registered for.

Registrations are filtered using the logged-in user's email address.

The screen includes:

* Program name
* User name
* Email
* Phone number
* Submission date and time
* Registration status


## Week 3 Summary

Week 3 transformed the Excelerate application from a primarily static UI prototype into a functional Flutter application.

The application now integrates structured program data, provides detailed program information, allows users to submit validated registrations, stores registration data locally in JSON format, and allows users to view their submitted registrations.



