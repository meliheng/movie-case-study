# Movieapp

Flutter study case project. You can search movies.

## Installation

1. Clone the repository:

    ```
    git clone https://github.com/meliheng/movieapp.git
    ```

2. Load the dependencies:

    ```
    flutter pub get
    ```

3. Create `.env` file at the project root:

    Add your own movie API key like:

    ```
    MOVIE_API_KEY = 'your_api_key'
    ```

4. Open an emulator and run the project:

    ```
    flutter run
    ```

## Screenshots

<img src="https://github.com/meliheng/movie-case-study/blob/main/assets/screen_shots/1.png" alt="Screenshot 1" width="200"/> <img src="https://github.com/meliheng/movie-case-study/blob/main/assets/screen_shots/2.png" alt="Screenshot 2" width="200"/> <img src="https://github.com/meliheng/movie-case-study/blob/main/assets/screen_shots/3.png" alt="Screenshot 3" width="200"/>

---

## Packages and Their Purpose

### 1. **`flutter_bloc`**
This package is used to implement the BLoC (Business Logic Component) pattern for state management. It helps separate the UI and business logic, making the app easier to maintain and test. In this project, it manages the movie list's state and handles search operations effectively.

### 2. **`get_it`**
This package is a lightweight service locator. It's used for dependency injection, allowing you to register and access dependencies (like repositories or use cases) from anywhere in the app. In this project, it simplifies managing and accessing shared resources.

### 3. **`http`**
This package is a simple HTTP client for making API requests. It enables the app to fetch movie data from a remote server using RESTful APIs. It was chosen for its ease of use and lightweight nature.

### 4. **`flutter_dotenv`**
This package allows you to manage environment variables securely. It is used to store sensitive information like the API key in a `.env` file, ensuring better security and separation of configuration from code.

### 5. **`equatable`**
This package is used to simplify equality checks. It ensures that objects are compared based on their properties instead of their memory addresses. In this project, it is particularly useful for comparing `Bloc` states and events.

---

## Architecture

The project follows the principles of **Clean Architecture**, which divides the codebase into distinct layers, each with a specific responsibility:

1. **Domain Layer**:
    - Contains the core business logic of the application.
    - Includes `Entities`, `Use Cases`, and interfaces for repositories.

2. **Data Layer**:
    - Responsible for data handling, such as API calls or local storage.
    - Implements the repository interfaces defined in the domain layer.
    - Includes `Models` and `Data Sources`.

3. **Presentation Layer**:
    - Manages the UI and user interaction.
    - Uses `Bloc` for state management and contains widgets and screens.

4. **Core Layer**:
    - Provides shared functionality and utility classes used across multiple layers.
    - Includes constants, extensions and common configurations to reduce code duplication and ensure consistency throughout the app.

By adhering to Clean Architecture, the app achieves better modularity, testability, and scalability.
