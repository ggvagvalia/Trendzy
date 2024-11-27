# Trendzy 🛍️
Shopping App 

## Overview

This is a SwiftUI-based iOS shopping app that allows users to register and log in using Firebase Authentication and manage their account information in Firestore. After logging in, users can explore shopping features organized into four main sections via a Tab Bar interface.

---

## Video Walkthrough
https://drive.google.com/file/d/1xX7hB8GxVa3TOv9K-WURbrE9T6XMgr_B/view?usp=sharing

---
 
## Screenshots

<img src="https://github.com/user-attachments/assets/54724d41-aa83-4fd4-bee3-193bd4231d35" alt="Alt Text" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/880284ca-98cc-473b-b669-cd4bffe77883" alt="Alt Text" width="200" height="400" /> 
<img src="https://github.com/user-attachments/assets/401c2a01-8c81-4a8e-86f4-5842972b0a03" alt="Alt Text" width="200" height="400" /> 
<img src="https://github.com/user-attachments/assets/fd625035-98e0-4920-9edf-3d80cfafc8c7" alt="Alt Text" width="200" height="400" />

<img src="https://github.com/user-attachments/assets/4b41c425-1e1c-483b-b670-ed544014b787" alt="Alt Text" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/46316a96-759a-4560-bf9d-772c3583e733" alt="Alt Text" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/a04d14a2-fbde-4cc1-92c0-421267402aab" alt="Alt Text" width="200" height="400" />

<img src="https://github.com/user-attachments/assets/a87c0876-85d8-4be1-9eaa-9dea6243c4f5" alt="Alt Text" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/c0403252-4597-4c06-8bcb-77f49c7289b1" alt="Alt Text" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/bdcc7551-640e-4a70-8bdc-adaa54775618" alt="Alt Text" width="200" height="400" />

## Features

### Authentication & Profile Management
- **Sign Up/Sign In**: Secure authentication using Firebase Authentication.
- **Profile Page**:  
  - View logged-in user's information (name, email).  
  - Add or edit address and phone number, saved in Firestore.

---

### Tab Bar Navigation

1. **Main Page**  
   - Browse a wide range of products.  
   - Filter products by categories: **Men**, **Women**, **Jewelry**, **Tech**.  
   - View detailed information about each product in the **Product Detail** page.

2. **Shopping Bag**  
   - See all products added to your shopping bag.  
   - Remove items from the shopping bag directly.

3. **Favorites**  
   - View your favorited (hearted) products.  
   - Remove items from your favorites list.

4. **Profile**  
   - View and update your profile information, including adding/editing your address and phone number.

---

### Data Management
- **Firebase Firestore**: Stores user profile information (address, phone number).  
- **SwiftData**: Manages local data for shopping bag and favorite items.  

---

## Tech Stack
- **SwiftUI**: Modern declarative UI framework.
- **Firebase Authentication**: User authentication.
- **Firestore**: Backend database for storing user profile information.
- **SwiftData**: Local persistence for shopping bag and favorite items.

---

## Future Enhancements
- Add payment functionality to the shopping bag.  
- Integrate push notifications for order updates.  
- Expand product categories and filters.  

