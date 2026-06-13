# Test Login and Registration Setup

## Step-by-Step Setup Guide

### ✅ Step 1: Verify XAMPP is Running
1. Open **XAMPP Control Panel**
2. Make sure **MySQL** is running (green background)
3. Make sure **Apache** is running (green background)

### ✅ Step 2: Import Database

#### Open phpMyAdmin
- Go to: `http://localhost/phpmyadmin`

#### Create Database (if not exists)
Run this SQL query in phpMyAdmin SQL tab:
```sql
CREATE DATABASE IF NOT EXISTS HACK_portfolio
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

#### Import Tables
1. Click on **HACK_portfolio** database in left sidebar
2. Click **Import** tab at top
3. Click **Choose File**
4. Navigate to: `C:\Users\Hi\source\repos\HACK_Portfolio\Database\CreateTables_MySQL.sql`
5. Click **Go** button at bottom
6. Wait for success message: "Import has been successfully finished"

#### Import Sample Data
1. Stay in **HACK_portfolio** database
2. Click **Import** tab again
3. Click **Choose File**
4. Navigate to: `C:\Users\Hi\source\repos\HACK_Portfolio\Database\SampleData_MySQL.sql`
5. Click **Go** button
6. Wait for success message

### ✅ Step 3: Verify Database Tables

In phpMyAdmin, you should see these 10 tables in **HACK_portfolio** database:
- ✓ ActivityLog
- ✓ Categories
- ✓ ContactMessages
- ✓ MembershipRequests
- ✓ Notifications
- ✓ ProjectImages
- ✓ ProjectMembers
- ✓ Projects
- ✓ SiteSettings
- ✓ Users

Click on **Users** table → **Browse** tab to see the sample users.

### ✅ Step 4: Install MySQL Connector in Visual Studio

Open **Package Manager Console** (Tools → NuGet Package Manager → Package Manager Console):

```powershell
Install-Package MySql.Data -Version 8.0.33
```

**OR** Right-click on project → **Manage NuGet Packages** → Browse → Search "MySql.Data" → Install

### ✅ Step 5: Build the Project

1. Open `HACK_portfolio.csproj` in Visual Studio
2. Press **Ctrl + Shift + B** to build
3. Check Output window for any errors
4. Should see: "Build succeeded"

### ✅ Step 6: Run the Project

Press **F5** or click **Start** button in Visual Studio

Project should open in browser at: `http://localhost:XXXX/Default.aspx`

---

## 🧪 Test Scenarios

### Test 1: Login with Admin Account

1. Go to: `http://localhost:XXXX/login.aspx`
2. Enter credentials:
   - **Email:** `admin@kuet.ac.bd`
   - **Password:** `Password123!`
3. Click **Sign in**
4. ✅ Should redirect to: `/admin/dashboard.aspx`
5. ✅ Should see "Welcome, Admin" at top right
6. ✅ Should see statistics cards with numbers from database

**If login fails:**
- Check MySQL is running in XAMPP
- Verify database name is `HACK_portfolio` in phpMyAdmin
- Check Users table has admin user
- Verify password is exactly `Password123!` (case-sensitive)

### Test 2: Login with Regular User

1. Go to login page
2. Enter credentials:
   - **Email:** `john.doe@kuet.ac.bd`
   - **Password:** `Password123!`
3. Click **Sign in**
4. ✅ Should redirect to: `/profile.aspx`
5. ✅ Should see user profile with:
   - Name: John Doe
   - Email: john.doe@kuet.ac.bd
   - Department: EEE

### Test 3: Register New User

1. Go to: `http://localhost:XXXX/register.aspx`
2. Fill in the form:
   - **Full name:** Your Name
   - **Email:** your.email@test.com
   - **Department:** CSE
   - **Year / Level:** 3
   - **Primary interest:** Robotics
   - **Why join:** (any text)
   - **Password:** Test123456
   - **Confirm password:** Test123456
3. Click **Create account**
4. ✅ Should see: "Registration successful! Redirecting to login..."
5. ✅ Should automatically redirect to login page after 2 seconds
6. Login with your new credentials
7. ✅ Should redirect to profile page

### Test 4: Duplicate Email Registration

1. Try to register with: `admin@kuet.ac.bd` (already exists)
2. ✅ Should see error: "Email already registered. Please login instead."

### Test 5: Password Mismatch

1. Go to register page
2. Enter different passwords in Password and Confirm Password fields
3. ✅ Should see error: "Passwords do not match."

### Test 6: View Projects from Database

1. Go to: `http://localhost:XXXX/Default.aspx`
2. ✅ Should see 8 projects loaded from database
3. ✅ Each project should show:
   - Project name
   - Category
   - Description

### Test 7: View Members from Database

1. Go to: `http://localhost:XXXX/members.aspx`
2. ✅ Should see 6 members from database
3. ✅ Each member should show:
   - Name
   - Department
   - Bio
   - Skills

### Test 8: Admin Dashboard Statistics

1. Login as admin
2. Go to dashboard
3. ✅ Total Projects: 8
4. ✅ Total Members: 5 (excludes admin)
5. ✅ Active Projects: should show count of active projects
6. ✅ Pending Requests: should show count from MembershipRequests table

### Test 9: Logout

1. While logged in, go to: `http://localhost:XXXX/logout.aspx`
2. ✅ Should redirect to login page
3. ✅ Try accessing `/profile.aspx` or `/admin/dashboard.aspx`
4. ✅ Should redirect to login page (session cleared)

---

## 🔧 Troubleshooting

### Issue: "Unable to connect to any of the specified MySQL hosts"

**Solution:**
1. Open XAMPP Control Panel
2. Stop MySQL
3. Click **Config** button next to MySQL → **my.ini**
4. Find line with `port=3306`
5. Make sure it's not commented out
6. Save and restart MySQL
7. In Visual Studio, rebuild project

### Issue: "Unknown database 'HACK_portfolio'"

**Solution:**
1. Open phpMyAdmin: `http://localhost/phpmyadmin`
2. Check left sidebar - do you see **HACK_portfolio**?
3. If NO: Run the CREATE DATABASE query from Step 2
4. If YES: Make sure connection string in `DatabaseHelper.cs` is correct

### Issue: "Build failed - Cannot find MySql.Data"

**Solution:**
```powershell
# In Package Manager Console:
Install-Package MySql.Data -Version 8.0.33
```

Or delete `packages` folder and rebuild (will auto-restore)

### Issue: Login says "Invalid email or password"

**Checklist:**
- [ ] Database has sample data (check Users table in phpMyAdmin)
- [ ] Password is exactly `Password123!` (capital P, exclamation at end)
- [ ] Email is `admin@kuet.ac.bd` (no spaces)
- [ ] MySQL is running in XAMPP
- [ ] Connection string in `DatabaseHelper.cs` is: `Server=localhost;Database=HACK_portfolio;Uid=root;Pwd=;`

**Verify User Exists:**
Run this query in phpMyAdmin:
```sql
SELECT * FROM Users WHERE Email = 'admin@kuet.ac.bd';
```
Should return 1 row with admin user.

### Issue: Registration doesn't work

**Check:**
1. MySQL is running
2. Users table exists in database
3. No error in Visual Studio Output window
4. Try with different email (not existing one)

**Verify Table Structure:**
```sql
DESCRIBE Users;
```
Should show columns: UserID, Username, Email, PasswordHash, FirstName, LastName, etc.

---

## 📊 Verify Database Connection

Run this test query in phpMyAdmin SQL tab:

```sql
-- Check Users
SELECT COUNT(*) as TotalUsers FROM Users;
-- Should return: 6

-- Check Projects
SELECT COUNT(*) as TotalProjects FROM Projects;
-- Should return: 8

-- Check Categories
SELECT * FROM Categories;
-- Should return: 6 categories

-- Check Admin User
SELECT UserID, Username, Email, Role FROM Users WHERE Role = 'Admin';
-- Should return: admin@kuet.ac.bd

-- Verify Password Hash
SELECT PasswordHash FROM Users WHERE Email = 'admin@kuet.ac.bd';
-- Should return: A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3
```

---

## ✅ Success Checklist

Before considering setup complete, verify:

- [ ] XAMPP MySQL is running
- [ ] Database **HACK_portfolio** exists in phpMyAdmin
- [ ] All 10 tables are created and populated
- [ ] Users table has 6 users (including admin)
- [ ] Projects table has 8 projects
- [ ] MySql.Data NuGet package is installed
- [ ] Project builds without errors
- [ ] Can login with admin@kuet.ac.bd
- [ ] Can login with john.doe@kuet.ac.bd
- [ ] Can register new user
- [ ] Admin dashboard shows statistics
- [ ] Projects page shows 8 projects
- [ ] Members page shows users
- [ ] Profile page loads user data
- [ ] Logout works correctly

---

## 🎯 Quick Test Script

Copy and paste in browser console after loading any page:

```javascript
// Test database connection
fetch('/login.aspx')
  .then(r => r.text())
  .then(html => {
    if (html.includes('Sign in')) {
      console.log('✅ Login page loaded');
    }
  });

// Test after login - should show user info
console.log('Session UserID:', document.cookie);
```

---

## 📞 Still Having Issues?

1. Check Visual Studio **Output** window for errors
2. Check XAMPP MySQL error log: `C:\xampp\mysql\data\mysql_error.log`
3. Enable detailed errors in Web.config:
```xml
<system.web>
  <customErrors mode="Off"/>
</system.web>
```

---

**All tests passing? Your login and registration system is working! 🎉**

You can now:
- Login as admin to access admin panel
- Register new users
- View database-driven content
- Manage projects and users
