# **Wikify**

## **Overview**

**Wikify** is a feature-rich Flutter application that enhances the user's experience in searching and exploring Wikipedia content. The app leverages the Wikipedia API while incorporating additional functionalities such as cache management, theme preferences, language preferences, and image zooming.

## **Features**

1. **Search Functionality:** Users can search for articles using the Wikipedia API.

2. **Search Results:** This app displays a list of search results, each containing an image and relevant data from the API response.

3. **Detail View:** Clicking on a search result item opens a detailed view of the respective Wikipedia page.

4. **Offline Experience:** The application caches API responses, providing users with a good offline experience. Long-press on a search result to delete its cache. A "Clear All" button is available to remove all cached data.

5. **State Management:** Proper state management solutions are implemented to ensure a smooth and efficient user interface.

6. **Theme Preferences:** Users can customize their experience with two theme modes: Dark mode and Light mode. The app saves and applies the user's selected theme preference.

7. **Language Preferences:** The application supports two language preferences. For optimal results in Hindi, users should input their search queries in Hindi using the Hindi keyboard. Similarly, English queries are supported when using the English keyboard. The app saves and applies the user's selected language preference.

8. **Image Zoom:** Tapping on an image in the search results will load the full-size image, allowing users to zoom in for a closer view.

9. **Tap to Search Experience:** Tapping on the cache provides a unique "Tap to Search" experience, allowing users to initiate a new search directly from their cached items.

## **Technologies Used**

- **Flutter:** The framework used to develop the cross-platform mobile application.

- **Dart:** The programming language used for building the app.

## **API Integration**

The application integrates with the Wikipedia API to fetch search results. Sample API requests and responses can be found in the [Wikipedia API documentation](https://www.mediawiki.org/wiki/API:Main_page).

## **UI Design**

The UI design of the application focuses on a user-friendly experience, with intuitive navigation and a clean interface. The search results list includes images and relevant data to help users quickly identify and select the desired article.

## **Acknowledgments**

Special thanks to the Wikipedia API for providing the data used in this application.

Feel free to explore, enhance, and contribute to Wikify!
