# HACK Portfolio Setup Instructions

## Prerequisites
- XAMPP installed with Apache and MySQL running
- Visual Studio 2017 or later
- .NET Framework 4.7.2

## Database Setup

### 1. Start XAMPP
- Open XAMPP Control Panel
- Start **Apache** and **MySQL**

### 2. Create Database
1. Go to `http://localhost/phpmyadmin`
2. Click **Import** tab
3. Import `Database/CreateTables_MySQL.sql`
4. Import `Database/SampleData_MySQL.sql`

Your database `hack_portfolio_db` is now ready with sample data!

## Install MySQL Connector

### Option 1: Using NuGet Package Manager Console
```powershell
Install-Package MySql.Data -Version 8.0.33
```

### Option 2: Using Package Manager
1. Right-click on project → **Manage NuGet Packages**
2. Browse for **MySql.Data**
3. Install version 8.0.33

### Option 3: Restore from packages.config
The project includes `packages.config`. Visual Studio should automatically restore packages on build.

## Build and Run

1. Open `HACK_portfolio.csproj` in Visual Studio
2. Build the solution (Ctrl+Shift+B)
3. Run the project (F5)

## Test Accounts

### Admin Account
- Email: `admin@kuet.ac.bd`
- Password: `Password123!`
- Access: Admin panel at `/admin/dashboard.aspx`

### Regular User
- Email: `john.doe@kuet.ac.bd`
- Password: `Password123!`
- Access: Member profile and features

### Create New Account
- Go to `/register.aspx`
- Fill in the form
- Login with your credentials

## Features Implemented

### ✅ Database Connection
- MySQL database integration
- DatabaseHelper class for queries
- Secure password hashing (SHA256)

### ✅ Authentication
- **Login** (`/login.aspx`)
  - Email and password validation
  - Session management
  - Role-based redirection
  
- **Register** (`/register.aspx`)
  - User registration
  - Email uniqueness check
  - Password validation
  
- **Logout** (`/logout.aspx`)
  - Session cleanup

### ✅ User Pages
- **Home** (`/Default.aspx`)
  - Display published projects from database
  - Filter by category
  
- **Members** (`/members.aspx`)
  - Display all active members
  - Load from Users table
  
- **Profile** (`/profile.aspx`)
  - View logged-in user details
  - Load personal information
  - Logout option

### ✅ Admin Panel
- **Dashboard** (`/admin/dashboard.aspx`)
  - Total projects count
  - Total members count
  - Active projects count
  - Pending requests count
  
- **Manage Projects** (`/admin/manage-projects.aspx`)
  - View all projects
  - Filter by category and status
  - Project statistics
  
- **Manage Users** (`/admin/manage-users.aspx`)
  - View all users
  - Filter by role
  
- **Settings** (`/admin/settings.aspx`)
  - Site configuration

## Database Connection

The connection string is hardcoded in `App_Code/DatabaseHelper.cs`:

```csharp
private static string connectionString = "Server=localhost;Database=hack_portfolio_db;Uid=root;Pwd=;";
```

If you set a password for MySQL root user, update the `Pwd=;` part.

## Project Structure

```
HACK_Portfolio/
├── admin/                   # Admin panel pages
│   ├── dashboard.aspx
│   ├── manage-projects.aspx
│   ├── manage-users.aspx
│   └── settings.aspx
├── App_Code/
│   └── DatabaseHelper.cs   # Database helper class
├── Database/
│   ├── CreateTables_MySQL.sql
│   ├── SampleData_MySQL.sql
│   └── README_MySQL.md
├── styles/
│   ├── admin.css
│   ├── auth.css
│   └── home.css
├── Default.aspx            # Home page (projects)
├── login.aspx             # Login page
├── register.aspx          # Registration page
├── profile.aspx           # User profile
├── members.aspx           # Members listing
├── logout.aspx            # Logout handler
└── Site.master            # Master page template
```

## Troubleshooting

### MySQL Connection Error
**Error:** "Unable to connect to any of the specified MySQL hosts"

**Solution:**
1. Verify MySQL is running in XAMPP
2. Check if port 3306 is not blocked
3. Verify database `hack_portfolio_db` exists

### Build Error: Cannot find MySql.Data
**Solution:**
1. Restore NuGet packages: Right-click solution → Restore NuGet Packages
2. Or manually install: `Install-Package MySql.Data -Version 8.0.33`

### Login Not Working
**Solution:**
1. Verify database has sample data
2. Check password is `Password123!` (case-sensitive)
3. Ensure you ran `SampleData_MySQL.sql`

### Session Lost / Redirecting to Login
**Solution:**
- Sessions work only when running the project
- Use F5 to run from Visual Studio (not just viewing HTML files)

## URLs

- Home: `http://localhost:5050/Default.aspx`
- Login: `http://localhost:5050/login.aspx`
- Register: `http://localhost:5050/register.aspx`
- Profile: `http://localhost:5050/profile.aspx`
- Admin: `http://localhost:5050/admin/dashboard.aspx`
- phpMyAdmin: `http://localhost/phpmyadmin`

## Support

If you encounter any issues:
1. Check XAMPP services are running
2. Verify database exists and has data
3. Check Visual Studio build output for errors
4. Ensure MySQL connector is installed

---

**Project is ready to use!** 🎉

Login with admin account to access the admin panel, or register a new account to test the member features.
