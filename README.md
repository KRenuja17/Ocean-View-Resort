# 🌊 Ocean View Resort

A full-stack Java web application for managing resort room bookings, guest services, and administrative operations at Ocean View Resort — a beachfront luxury property offering ocean-view accommodations.

---

## 📸 Screenshots

> _Screenshots below reflect the current state of the application including features from the `dev` branch._

| Landing Page | Room Listings & Booking Form |
|---|---|---|
| ![Landing](https://drive.google.com/file/d/1d-MXjJBd3fSNn_bnWIcddRCPd3az71ei/view?usp=drive_link) | ![Rooms & Booking](https://drive.google.com/file/d/1NB35ygz6RMpDD_De-iRV177aEQ60lyX3/view?usp=drive_link) |

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [Configuration](#configuration)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

Ocean View Resort is a Java EE web application built with the **MVC (Model-View-Controller)** architectural pattern using **Java Servlets** and **JSP (JavaServer Pages)**. The system allows guests to browse available rooms, make reservations, and manage their bookings, while administrators can oversee room availability, guest information, and overall resort operations.

The application is packaged as a **WAR (Web Application Archive)** and deployed on **Apache Tomcat**, with **Maven** handling dependency management and build lifecycle.

---

## ✨ Features

### Guest-Facing
- Browse available rooms with descriptions, amenities, and pricing
- Make, view, and cancel room reservations
- View booking confirmation details
- Responsive UI with custom CSS styling

### Admin-Facing
- Dashboard to manage all reservations
- Room inventory management (add/edit/remove rooms)
- Guest record management
- View occupancy and availability in real time

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Language | Java 11+ |
| Frontend | JSP, HTML5, CSS3 |
| Backend | Java Servlets (Jakarta EE / Java EE) |
| Build Tool | Apache Maven |
| Server | Apache Tomcat 9+ |
| IDE Config | IntelliJ IDEA (`.idea`), SmartTomcat plugin |

---

## 📁 Project Structure

```
Ocean-View-Resort/
├── .idea/                          # IntelliJ IDEA project config
├── .smarttomcat/                   # SmartTomcat plugin deployment config
├── src/
│   └── main/
│       ├── java/                   # Java source files
│       │   └── ...                 # Servlets, Models, DAOs
│       ├── resources/              # Config files (DB, properties)
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── web.xml         # Servlet & filter mappings
│           │   └── views/          # JSP view templates
│           ├── css/                # Custom stylesheets
│           └── index.jsp           # Application entry point
├── pom.xml                         # Maven project descriptor
└── .gitignore
```

---

## ✅ Prerequisites

Ensure the following are installed on your system before proceeding:

| Tool | Minimum Version | Download |
|---|---|---|
| Java JDK | 11 | [adoptium.net](https://adoptium.net/) |
| Apache Maven | 3.6 | [maven.apache.org](https://maven.apache.org/download.cgi) |
| Apache Tomcat | 9.0 | [tomcat.apache.org](https://tomcat.apache.org/download-90.cgi) |
| IntelliJ IDEA | Any | [jetbrains.com](https://www.jetbrains.com/idea/) _(optional but recommended)_ |

Verify your installations:

```bash
java -version
mvn -version
```

---

## ⚙️ Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/KRenuja17/Ocean-View-Resort.git
cd Ocean-View-Resort
```

### 2. Install Dependencies

Maven will automatically resolve all declared dependencies:

```bash
mvn clean install
```

### 3. Database Setup _(if applicable)_

If the project uses a database backend, create the schema and configure the connection:

```bash
# Example for MySQL
mysql -u root -p < src/main/resources/schema.sql
```

Then update the database credentials in `src/main/resources/` (see [Configuration](#configuration)).

### 4. Build the WAR File

```bash
mvn package
```

The compiled `.war` file will be generated in the `target/` directory.

---

## 🚀 Running the Application

### Option A — IntelliJ IDEA with SmartTomcat (Recommended)

This project includes `.smarttomcat/` configuration for seamless deployment directly from the IDE.

1. Open the project in **IntelliJ IDEA**
2. Ensure the **SmartTomcat** plugin is installed _(Preferences → Plugins → SmartTomcat)_
3. Select the SmartTomcat run configuration from the top toolbar
4. Click **▶ Run** — the app will deploy and open in your browser automatically

### Option B — Manual Tomcat Deployment

1. Copy the generated WAR to Tomcat's `webapps/` directory:

```bash
cp target/Ocean-View-Resort.war /path/to/tomcat/webapps/
```

2. Start Tomcat:

```bash
# Linux / macOS
/path/to/tomcat/bin/startup.sh

# Windows
/path/to/tomcat/bin/startup.bat
```

3. Access the app at:

```
http://localhost:8080/Ocean-View-Resort
```

### Option C — Maven Tomcat Plugin

```bash
mvn tomcat7:run
```

> Depending on the plugin version defined in `pom.xml`, you may use `tomcat7:run` or `tomcat:run`.

---

## 🔧 Configuration

Application-level settings are located in `src/main/resources/`. Key configurations to update before running:

| Config Key | Description | Default |
|---|---|---|
| `db.url` | JDBC connection URL | _(set as needed)_ |
| `db.username` | Database username | `root` |
| `db.password` | Database password | _(empty)_ |
| `app.port` | Tomcat port | `8080` |

Tomcat-specific deployment settings can be adjusted in `.smarttomcat/` for IDE-based deployments.

---

## 🗺️ Roadmap

The following features and improvements are planned or in progress:

### In Progress (dev branch)
- [ ] Additional UI refinements and layout improvements
- [ ] Bug fixes identified in initial testing

### Upcoming
- [ ] **Online Payment Integration** — Stripe or PayPal gateway for booking payments
- [ ] **Email Notifications** — Automated booking confirmation and reminder emails via JavaMail
- [ ] **User Authentication** — Secure login/logout with session management and role-based access (Guest / Admin)
- [ ] **Search & Filter** — Room filtering by date range, capacity, room type, and amenities
- [ ] **Room Image Gallery** — Multi-image carousel per room listing
- [ ] **Admin Analytics Dashboard** — Occupancy rates, revenue summaries, and booking trends
- [ ] **RESTful API Layer** — Expose core operations as REST endpoints for potential mobile integration
- [ ] **Unit & Integration Tests** — JUnit test coverage for Servlet and DAO layers
- [ ] **Docker Support** — Containerized deployment with a Dockerfile and `docker-compose.yml`
- [ ] **CI/CD Pipeline** — GitHub Actions workflow for automated build, test, and deploy

---

## 🤝 Contributing

Contributions are welcome! To get started:

### Workflow

1. **Fork** the repository
2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/KRenuja17/Ocean-View-Resort.git
   ```
3. **Create a feature branch** from `dev` (not `main`):
   ```bash
   git checkout dev
   git checkout -b feature/your-feature-name
   ```
4. **Make your changes** following the coding conventions below
5. **Commit** with a clear, descriptive message:
   ```bash
   git commit -m "feat: add room availability filter by date range"
   ```
6. **Push** to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
7. **Open a Pull Request** against the `dev` branch — not `main`

### Commit Message Convention

This project loosely follows [Conventional Commits](https://www.conventionalcommits.org/):

| Prefix | Purpose |
|---|---|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `refactor:` | Code restructuring |
| `style:` | Formatting / CSS changes |
| `docs:` | Documentation updates |
| `chore:` | Build, config, or tooling changes |

### Code Style

- Follow standard **Java naming conventions** (PascalCase for classes, camelCase for methods/variables)
- Keep Servlet logic lean — business logic belongs in service/DAO layers
- JSP files should remain presentation-only (no embedded business logic)
- Comment non-obvious logic inline

### Reporting Issues

If you find a bug or have a feature request, please [open an issue](https://github.com/KRenuja17/Ocean-View-Resort/issues) with:
- A clear description of the problem or request
- Steps to reproduce (for bugs)
- Expected vs. actual behaviour
- Screenshots if applicable

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<p align="center">
  Built with ☕ Java · Deployed on 🐱 Tomcat · Styled with 🎨 CSS
</p>
