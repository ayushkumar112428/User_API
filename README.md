Project Overview: User Data API Flutter App

1. Project Name
- **User API**

2. Screens
- Splash Screen
- Login Screen
- Home Screen

3. Splash Screen
- Purpose To welcome the user and determine the next screen based on the user's login status.
- Functionality:
  - Displays a welcome message.
  - Checks if the user is already logged in by reading login data from `SharedPreferences`.
  - If the user is logged in, navigates directly to the Home Screen.
  - If the user is not logged in, navigates to the Login Screen.

4. Login Screen
- Purpose To authenticate the user.
- Functionality:
  - Contains fields for email and password input.
  - Connects to an API to authenticate the user.
  - Upon pressing the login button:
    - Shows a loading circle while processing the API call.
    - Sends a POST request with the user's email and password.
    - If authentication is successful:
      - Displays a snackbar with the title "Login" and the message "Login successfully".
      - Stores the user's login data (token) in `SharedPreferences`.
      - Navigates to the Home Screen.
    - If authentication fails:
      - Displays a snackbar with the title "Login" and the message "User not found".

5. Home Screen
- Purpose To display user-specific data retrieved from an API.
- Functionality:
  - Makes a GET request to fetch user data from the API.
  - Uses a `ListView.builder` to display the data in a list format.
  - Each item in the list is displayed using a `Container` which contains a `ListTile`.
    - The `ListTile` includes:
      - An image.
      - A title.
      - A subtitle.
  - The AppBar contains:
    - A left-aligned "Home" text.
    - A right-aligned logout icon button.
      - On clicking the logout button:
        - Clears the login data from `SharedPreferences`.
        - Navigates back to the Login Screen.

6. SharedPreferences Usage
- Purpose To store and retrieve user login data locally.
- Functionality:
  - Stores the login token after a successful login.
  - Checks for the presence of the login token on app launch to decide whether to show the Splash Screen or navigate directly to the Home Screen.
  - Clears the login data upon user logout.

#Summary
This Flutter project named "User Data API" includes three main screens: Splash, Login, and Home. The Splash Screen determines the user's login status and navigates accordingly. The Login Screen authenticates the user via an API call and provides appropriate feedback via snackbars. The Home Screen displays user data in a list format and allows the user to logout, which clears the local storage and redirects to the Login Screen. The app leverages `SharedPreferences` for storing login information to manage user sessions effectively.


# userauthapi

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
