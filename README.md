# EventCheck 📱

EventCheck is a SwiftUI-based iOS demo app that simulates a **staff check-in experience for events**.  
It was built to demonstrate clean iOS architecture, authentication flow, and state-driven navigation — with a focus on clarity, polish, and recruiter readability.

This project currently uses **demo authentication logic** and mock data to showcase the end-to-end user experience before backend integration.

---

## ✨ Features

- **Demo Login Flow**
  - Valid demo credentials required to sign in
  - Session-based authentication state
  - Secure logout with automatic return to login

- **Root Tab Navigation**
  - Events
  - Activity
  - Profile

- **Profile Screen**
  - Displays authenticated user information
  - Includes logout action

- **SwiftUI Architecture**
  - State-driven navigation (no imperative routing)
  - Centralized session management
  - Clean separation of concerns

---

## 🔐 Demo Credentials

Use the following credentials to log in:

Email: staff@eventcheck.com
Password: demo


These credentials are intentionally hard-coded for demo purposes and will be replaced with real authentication in a future iteration.

---

## 🧱 Architecture Overview

- **SwiftUI**
- **ObservableObject + @Published**
- **EnvironmentObject for global session state**
- **AppRouter** controls auth → app navigation
- **RootTabView** serves as the authenticated shell

The UI reacts entirely to changes in authentication state — no manual navigation or view pushing is used.

---

## 🛠️ Tech Stack

- Swift
- SwiftUI
- Combine
- iOS 17+

---

## 🚧 Roadmap (Planned)

- Real authentication (Supabase)
- Sign-up flow with persisted user profile
- Event list with mock or live data
- Activity logs
- Role-based access (staff vs admin)

---

## 🎯 Purpose

This project was built as a **portfolio demo** to showcase:
- iOS engineering fundamentals
- Authentication and session handling
- Declarative UI patterns
- Clean, readable code suitable for team environments

---

## Screenshots

### Login
<img width="314" height="596" alt="loginScreen" src="https://github.com/user-attachments/assets/41dfb4ce-aaaf-4454-82db-8aba994fbfbb" />

### Events
<img width="308" height="602" alt="eventsScreen" src="https://github.com/user-attachments/assets/7dcf3a3c-4cf0-4444-b87e-9822e12780a2" />

### Activity
<img width="414" height="816" alt="activity" src="https://github.com/user-attachments/assets/40e9845d-5803-49b1-9989-af63c4bad6c7" />

### Profile
<img width="312" height="610" alt="profile" src="https://github.com/user-attachments/assets/22ccca6a-ec91-48ad-ae6c-25a7b8638425" />


## 📄 License

MIT
