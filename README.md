A full-featured, cross-platform food delivery application built with Flutter, Firebase, and Firestore, supporting Google sign-in, real-time product browsing, cart management, and order review functionality.

Features:

Google Sign-In Authentication:
Seamless user login using Firebase Authentication and Google Sign-In integration.

Product Browsing & Cart:
Browse categorized fast food and healthy food items. Add, update, or delete items in the review cart.

Cart Review & Checkout:
View and modify selected products, with dynamic total price calculation.

Search Functionality:
Real-time search across product listings.

Product Management:
Products are fetched from Firestore collections and categorized into Junk and Fresh products.

User Profile Dashboard:
Personalized profile page with options to view orders and delivery addresses.

Tech Stack:
Frontend: Flutter, Dart
Backend: Firebase Auth, Firestore, State Management	Provider
UI/UX Design:	Material Design, Drawer Navigation
Data Handling:	Firebase Firestore Queries


Project Structure:

lib/
├── controllers/          # State management and data controllers
├── models/               # Data models (Product, Cart)
├── views/
│   ├── home/             # Home screen and product listings
│   ├── auth/             # Google Sign-In
│   ├── review_cart/      # Cart and order review
│   ├── product_overview/ # Product detail view
│   ├── my_profile/       # Profile page
│   ├── search/           # Search interface
│   └── widgets/          # Shared widgets like count, single item
└── config/               # Color themes and constants


Installation:
i) Clone the repository:
git clone https://github.com/your-username/flutter-food-app.git

ii) cd flutter-food-app
Install dependencies:
flutter pub get

iii) Run the app:
flutter run

iv) Make sure to configure Firebase project and add the google-services.json file for Android and corresponding setup for iOS.

v) Firebase Configuration
Setup Firebase project
Enable Google Sign-In under Authentication

vi) Create Firestore collections:

FreshProduct
JunkProduct
ReviewCart
usersData

