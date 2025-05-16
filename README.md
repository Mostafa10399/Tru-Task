# 🧩 Modular iOS Architecture – `NetworkLayer`, `CoreKit` & `Commons`

A **clean**, **scalable**, and **modular** iOS architecture built using **Alamofire** and **Swift Concurrency**, designed around the principles of Clean Architecture and code separation through Swift Packages:

- 🔌 `NetworkLayer`: Networking logic
- 🧠 `CoreKit`: Business logic (data, domain, view models)
- 🧰 `Commons`: Reusable utilities and UI components

---

## 📦 Package Breakdown

### 1. 🚀 `NetworkLayer`

Handles all network-related functionality using **Alamofire**.

- ✅ APIClient abstraction layer  
- ✅ Configurable base URL, headers, and interceptors  
- ✅ Unified error parsing and response validation  
- ✅ Fully supports `async/await` syntax  

---

### 2. 🧠 `CoreKit`

Implements the **Clean Architecture** pattern with layered separation:

- **DataLayer** – Handles integration with `NetworkLayer` and persistence (e.g., API calls, local caching)  
- **DomainLayer** – Defines use cases, repositories, and protocols  
- **ViewModels** – Encapsulates business logic for UI and exposes observable state to SwiftUI/UIKit

---

### 3. 🧰 `Commons`

A shared utility package for consistency and reuse across the app.

- ✅ Reusable SwiftUI / UIKit components  
- ✅ Common extensions (e.g., `String+Extensions`, `Date+Extensions`, `View+Modifiers`)  
- ✅ Constants, error types, and shared helpers

---

## 🧱 Architecture Overview

```
UI Layer (SwiftUI/UIKit)
   ⬇
ViewModels (CoreKit)
   ⬇
UseCases (DomainLayer)
   ⬇
Repositories (DomainLayer)
   ⬇
RemoteDataSource/APIClient (DataLayer)
   ⬇
NetworkLayer (Alamofire abstraction)
```

---

## 📂 Folder Structure

```
Packages/
├── NetworkLayer/
│   └── APIClient.swift
│   └── Endpoint.swift
│   └── NetworkError.swift
│
├── CoreKit/
│   ├── DataLayer/
│   │   └── RemoteDataSource.swift
│   ├── DomainLayer/
│   │   └── UseCases/
│   │   └── Repositories/
│   └── ViewModels/
│       └── UserViewModel.swift
│
└── Commons/
    └── Extensions/
    └── Components/
    └── Constants.swift
```

---


## 👨‍💻 Author

**Mostafa Mahmoud**  
iOS Engineer | Clean Architecture Advocate  
[LinkedIn](https://www.linkedin.com/in/mostafa-mahmoud) • [GitHub](https://github.com/yourusername)

---
