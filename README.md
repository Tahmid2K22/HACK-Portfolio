# HACK Portfolio - Complete Setup Guide

## 🎯 Project Overview

A complete portfolio management system for the Hardware Acceleration Club of KUET (HACK) with:
- User authentication (Login/Register)
- MySQL database integration via XAMPP
- Admin panel for management
- Project portfolio display
- Member directory

---

## 🚀 Quick Start (5 Minutes)

### 1. Start XAMPP
- Open XAMPP Control Panel
- Start **MySQL** and **Apache**

### 2. Import Database
- Open phpMyAdmin: `http://localhost/phpmyadmin`
- Import `Database/CreateTables_MySQL.sql`
- Import `Database/SampleData_MySQL.sql`

### 3. Install MySQL Connector
```powershell
Install-Package MySql.Data -Version 8.0.33
```

### 4. Build & Run
- Open project in Visual Studio
- Press **F5**

### 5. Test Login
- **Admin:** `admin@kuet.ac.bd` / `Password123!`
- **User:** `john.doe@kuet.ac.bd` / `Password123!`

**Done!** 🎉

---

## 📋 Detailed Setup Instructions

### Prerequisites
- ✅ XAMPP (with MySQL and Apache)
- ✅ Visual Studio 2017+ 
- ✅ .NET Framework 4.7.2
- ✅ Internet connection (for NuGet packages)

### Database Configuration

#### Database Name
```
HACK_portfolio
```

#### Connection String (in DatabaseHelper.cs)
```csharp
Server=localhost;Database=HACK_portfolio;Uid=root;Pwd=;
```

#### Tables Created (10 total)
1. **Users** - User accounts and profiles
2. **Categories** - Project categories  
3. **Projects** - Project portfolio
4. **ProjectMembers** - Project team assignments
5. **ProjectImages** - Project image galleries
6. **SiteSettings** - Site configuration
7. **ContactMessages** - Contact form submissions
8. **MembershipRequests** - Registration requests
9. **ActivityLog** - Activity tracking
10. **Notifications** - User notifications

#### Sample Data
- 6 Users (1 admin, 5 members)
- 6 Categories
- 8 Projects
- Site settings and test data

---

## 🔐 Authentication System

### Login Features (`login.aspx`)
- Email & password validation
- SHA256 password hashing
- Session management
- Role-based redirection:
  - Admin → `/admin/dashboard.aspx`
  - Member → `/profile.aspx`
- Last login date tracking
- Active user check

### Registration Features (`register.aspx`)
- New user signup
- Email uniqueness validation
- Password strength check (min 6 characters)
- Password confirmation
- Auto-generated username from email
- Automatic login redirect after success

### Logout (`logout.aspx`)
- Session cleanup
- Redirect to login page

---

## 👥 User Pages

### Home (`Default.aspx`)
- Display all published projects
- Load from database dynamically
- Category filtering
- Project cards with images

### Members (`members.aspx`)
- Display all active members
- Load from Users table
- Show: Name, Department, Bio, Skills
- Profile images

### Profile (`profile.aspx`)
- View logged-in user details
- Display from database:
  - Name, Email, Username
  - Department, Year
  - Bio, Skills
  - Join date
- Logout button

---

## 👨‍💼 Admin Panel

### Dashboard (`/admin/dashboard.aspx`)
**Statistics Cards:**
- Total Projects (count from Projects table)
- Total Members (count from Users)
- Active Projects (where Status = 'Active')
- Pending Requests (from MembershipRequests)

**Recent Data:**
- Recent projects table
- Recent members table

### Manage Projects (`/admin/manage-projects.aspx`)
- View all projects
- Filter by category
- Filter by status
- Project statistics
- Add new project button

### Manage Users (`/admin/manage-users.aspx`)
- View all users
- Filter by role
- User management

### Settings (`/admin/settings.aspx`)
- Site configuration
- Settings management

---

## 🗂️ Project Structure

```
HACK_Portfolio/
│
├── admin/                          # Admin panel
│   ├── dashboard.aspx              # Admin dashboard
│   ├── manage-projects.aspx        # Project management
│   ├── manage-users.aspx           # User management
│   └── settings.aspx               # Site settings
│
├── App_Code/                       # Helper classes
│   └── DatabaseHelper.cs           # MySQL database helper
│
├── Database/                       # SQL scripts
│   ├── CreateTables_MySQL.sql      # Database schema
│   ├── SampleData_MySQL.sql        # Sample data
│   ├── DatabaseSchema.md           # ER diagrams
│   └── README_MySQL.md             # MySQL setup guide
│
├── styles/                         # CSS files
│   ├── admin.css                   # Admin panel styles
│   ├── auth.css                    # Login/register styles
│   └── home.css                    # Main site styles
│
├── scripts/                        # JavaScript files
│   ├── auth.js
│   ├── projects.js
│   └── projects-data.js
│
├── img/                            # Images
│   └── hackLogo.png
│
├── Default.aspx                    # Home page
├── login.aspx                      # Login page
├── register.aspx                   # Registration page
├── profile.aspx                    # User profile
├── members.aspx                    # Members list
├── logout.aspx                     # Logout handler
├── Site.master                     # Master page template
│
├── HACK_portfolio.csproj           # Project file
├── packages.config                 # NuGet packages
├── Web.config                      # Configuration
│
├── README.md                       # This file
├── SETUP_INSTRUCTIONS.md           # Detailed setup
└── TEST_LOGIN_REGISTER.md          # Test guide
```

---

## 🔧 Configuration

### Database Connection
Edit `App_Code/DatabaseHelper.cs`:
```csharp
private static string connectionString = 
    "Server=localhost;Database=HACK_portfolio;Uid=root;Pwd=;";
```

Change `Pwd=;` to `Pwd=yourpassword;` if you set MySQL root password.

### Web.config
Located at project root. Default configuration works for local development.

---

## 🧪 Testing

See `TEST_LOGIN_REGISTER.md` for comprehensive testing guide.

### Quick Tests

**Test Admin Login:**
```
URL: /login.aspx
Email: admin@kuet.ac.bd
Password: Password123!
Expected: Redirect to /admin/dashboard.aspx
```

**Test User Login:**
```
URL: /login.aspx
Email: john.doe@kuet.ac.bd
Password: Password123!
Expected: Redirect to /profile.aspx
```

**Test Registration:**
```
URL: /register.aspx
Fill form with new email
Expected: Success message, redirect to login
```

**Test Database Connection:**
```sql
-- In phpMyAdmin
SELECT COUNT(*) FROM Users;  -- Should return 6
SELECT COUNT(*) FROM Projects;  -- Should return 8
```

---

## 📦 Dependencies

### NuGet Packages
- **MySql.Data** (v8.0.33) - MySQL connector for .NET

### References
- System
- System.Core
- System.Data
- System.Web
- System.Web.Extensions

---

## 🐛 Troubleshooting

### "Unable to connect to database"
1. ✅ Check MySQL is running in XAMPP
2. ✅ Verify database `HACK_portfolio` exists
3. ✅ Check connection string in DatabaseHelper.cs
4. ✅ Test connection in phpMyAdmin

### "Build failed - MySql.Data not found"
```powershell
Install-Package MySql.Data -Version 8.0.33
```

### "Invalid email or password"
1. ✅ Verify database has sample data
2. ✅ Check password is `Password123!` (case-sensitive)
3. ✅ Run query: `SELECT * FROM Users WHERE Email = 'admin@kuet.ac.bd'`

### "Registration doesn't work"
1. ✅ Check Users table exists
2. ✅ Try different email (not existing)
3. ✅ Check Visual Studio Output for errors

### More help
See `TEST_LOGIN_REGISTER.md` for detailed troubleshooting.

---

## 📊 Database Schema

### Users Table
```sql
UserID, Username, Email, PasswordHash, FirstName, LastName,
PhoneNumber, StudentID, Department, YearOfStudy, Bio, Skills,
Role, IsActive, IsEmailVerified, JoinDate, LastLoginDate
```

### Projects Table
```sql
ProjectID, ProjectName, Slug, ShortDescription, DetailedDescription,
CategoryID, Status, ThumbnailImageUrl, Technologies, Tags,
IsFeatured, IsPublished, CreatedByUserID, CreatedDate
```

See `Database/DatabaseSchema.md` for complete ER diagrams.

---

## 🔒 Security Features

- ✅ SHA256 password hashing
- ✅ Parameterized SQL queries (prevents SQL injection)
- ✅ Session-based authentication
- ✅ Role-based access control
- ✅ Active user validation
- ✅ Email uniqueness check
- ✅ Password strength validation

---

## 🎯 Features Implemented

### ✅ Core Features
- [x] MySQL database integration
- [x] User registration
- [x] User login
- [x] User logout
- [x] Session management
- [x] Role-based access (Admin/Member)
- [x] Profile page
- [x] Admin dashboard with statistics
- [x] Project listing from database
- [x] Member listing from database

### ✅ Admin Features
- [x] Dashboard with real-time stats
- [x] Project management interface
- [x] User management interface
- [x] Settings page

### ✅ Security
- [x] Password hashing
- [x] SQL injection prevention
- [x] Session validation
- [x] Active user check

---

## 📝 Future Enhancements

- [ ] Password reset functionality
- [ ] Email verification
- [ ] Profile editing
- [ ] Project CRUD operations
- [ ] User avatar upload
- [ ] Advanced search and filtering
- [ ] Activity logging
- [ ] Notifications system
- [ ] API endpoints

---

## 📞 Support

### Documentation Files
- `README.md` - This file (overview)
- `SETUP_INSTRUCTIONS.md` - Detailed setup guide
- `TEST_LOGIN_REGISTER.md` - Testing guide
- `Database/README_MySQL.md` - Database setup
- `Database/DatabaseSchema.md` - Database structure

### Check These First
1. XAMPP MySQL is running
2. Database `HACK_portfolio` exists and has data
3. MySql.Data package is installed
4. Project builds without errors
5. Connection string is correct

### Common Issues
See `TEST_LOGIN_REGISTER.md` → Troubleshooting section

---

## 📄 License

See `LICENSE` file in project root.

---

## 👥 Contributors

Hardware Acceleration Club of KUET (HACK)

---

## 🎉 Getting Started

1. **Follow QUICK START** section above
2. **Read TEST_LOGIN_REGISTER.md** for testing
3. **Login with sample accounts** to explore
4. **Register new account** to test registration
5. **Access admin panel** as admin

**Your portfolio system is ready to use!** 🚀
