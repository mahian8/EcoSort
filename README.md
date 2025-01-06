# EcoSort: Waste Classification and Management

## Project Overview

EcoSort is an AI-driven waste classification and management system designed to promote sustainable practices and environmental awareness. Developed as part of the CSC3600 course, this application provides users with tools to classify waste, access resources, track sorting history, and manage personal preferences through an intuitive mobile application.

## Team Members

1. **KHOO BOO JING** - 215382
2. **LIM CHUAN ZHE** - 215493
3. **TANG ZI KIAN** - 217064
4. **SAWRON MAHIAN JALIL** - 213350

## Features

The application consists of the following 9 interactive pages:

1. **Welcome Page**: Introduction to EcoSort with a button to get started.
2. **Login Page**: Allows users to sign in with email and password or register.
3. **Confirmation Page**: Displays a success message after account creation and navigates to the Home Page.
4. **Home Page**: Serves as the main navigation hub with buttons to access key features.
5. **Resources Page**: Provides educational materials and guides on waste management.
6. **Classification Page**: Enables users to upload photos for AI-powered waste classification.
7. **History Page**: Displays a history of the user's waste sorting activities.
8. **Settings Page**: Allows users to manage their account and notification preferences.
9. **Profile Page**: Displays user information and account settings.

## Installation

1. Ensure you have Flutter installed on your system. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) if necessary.
2. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
3. Navigate to the project directory:
   ```bash
   cd ecosort
   ```
4. Install the dependencies:
   ```bash
   flutter pub get
   ```
5. Run the application:
   ```bash
   flutter run
   ```

## File Structure

```
lib/
|-- main.dart                  # Entry point of the application
|-- pages/
    |-- welcome_page.dart      # Welcome Page
    |-- login_page.dart        # Login Page
    |-- confirmation_page.dart # Confirmation Page
    |-- home_page.dart         # Home Page
    |-- resources_page.dart    # Resources Page
    |-- classification_page.dart # Classification Page
    |-- history_page.dart      # History Page
    |-- profile_page.dart      # Profile Page
```

## How It Works

1. **Getting Started**: Users are welcomed with an introduction screen and can navigate to the Login Page.
2. **Authentication**: Users can log in or register to access the application features.
3. **Waste Classification**: Users upload photos to classify waste as recyclable, compostable, or non-recyclable.
4. **Resources & History**: Access guides and track waste management progress.
5. **Settings & Profile**: Customize account preferences and manage personal data.

## Proposal

The full project proposal detailing objectives, methodologies, and implementation strategies is attached as a PDF file.

## Technologies Used

- **Flutter**: Frontend framework for cross-platform development.
- **Dart**: Programming language for building the application.
- **AI Integration**: Waste classification logic (to be integrated with backend).

## Future Improvements

- Integration with backend services for storing user data and enhancing AI models.
- Adding gamification elements to encourage sustainable practices.
- Support for multiple languages to increase accessibility.

---

For any questions or issues, please contact the development team. Enjoy using EcoSort and make a positive impact on the environment!
