# Fix Login Compilation Error

## The Error
```
CS1061: 'ASP.login_aspx' does not contain a definition for 'btnSignIn_Click'
```

## Solution Steps (Try in Order)

### Method 1: Clear ASP.NET Temporary Files (Recommended)

1. **Stop your web application** (Stop IIS Express or IIS)

2. **Run the clear cache script:**
   - Double-click `clear-asp-cache.bat` in the project folder
   - OR manually delete these folders:
     ```
     C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files
     C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files
     ```

3. **Clean and rebuild:**
   ```bash
   dotnet clean
   dotnet build
   ```

4. **Restart your web server** (IIS Express or IIS)

5. **Test the login page**

### Method 2: Rebuild in Visual Studio

If using Visual Studio:

1. **Close all browser windows**
2. In Visual Studio: **Build → Clean Solution**
3. **Build → Rebuild Solution**
4. **Restart IIS Express** (Stop debugging and start again)
5. **Browse to login.aspx**

### Method 3: Manual File Check

Verify these files are correct:

**login.aspx** (Line 1):
```aspx
<%@ Page Title="Login | HACK Portal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HACK_portfolio.Login" %>
```

**login.aspx** (Line 40):
```aspx
<asp:Button runat="server" ID="btnSignIn" CssClass="primary-btn" Text="Sign in" OnClick="btnSignIn_Click" />
```

**login.aspx.cs** (Should have this method):
```csharp
protected void btnSignIn_Click(object sender, EventArgs e)
{
    // Login code here
}
```

**login.aspx.designer.cs** (Should have):
```csharp
protected global::System.Web.UI.WebControls.Button btnSignIn;
```

### Method 4: Force Designer Regeneration (If using Visual Studio)

1. Open `login.aspx` in Visual Studio
2. Make a small change (add a space, then remove it)
3. Save the file (Ctrl+S)
4. This should trigger designer file regeneration
5. Build the project

### Method 5: IIS Application Pool Recycle

If running on IIS:

1. Open **IIS Manager**
2. Find your application pool
3. Click **Recycle**
4. Browse to the login page again

### Method 6: Web.config Compilation Mode

Ensure your Web.config has debug mode enabled during development:

```xml
<compilation debug="true" targetFramework="4.8">
```

After making changes:
1. Save Web.config
2. IIS will automatically restart the application
3. Try again

## Prevention

To avoid this in the future:

1. **Always build after changes** to .aspx or .aspx.cs files
2. **Clear cache periodically** during development
3. **Use the batch script** `clear-asp-cache.bat` when switching branches
4. **Restart IIS Express** after major changes

## Still Not Working?

If none of the above works:

1. **Check file permissions** - ensure the application pool user can read all files
2. **Check for file locks** - close Visual Studio, delete bin/obj, reopen
3. **Create a new test page** to verify the setup works:
   ```aspx
   <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="HACK_portfolio.test" %>
   <html>
   <body>
       <asp:Button runat="server" ID="btnTest" Text="Test" OnClick="btnTest_Click" />
   </body>
   </html>
   ```
   
   ```csharp
   // test.aspx.cs
   namespace HACK_portfolio
   {
       public partial class test : System.Web.UI.Page
       {
           protected void btnTest_Click(object sender, EventArgs e)
           {
               Response.Write("It works!");
           }
       }
   }
   ```

## Quick Fix Command

Run this in PowerShell (as Administrator) from project directory:

```powershell
# Stop IIS Express
Get-Process iisexpress -ErrorAction SilentlyContinue | Stop-Process -Force

# Clear temporary files
Remove-Item "$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "bin\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "obj\*" -Recurse -Force -ErrorAction SilentlyContinue

# Rebuild
dotnet clean
dotnet build

Write-Host "Done! Now restart your web server." -ForegroundColor Green
```

## Verification

After applying the fix, you should see:
- No compilation errors
- Login page loads successfully
- Clicking "Sign in" button triggers the login logic
- Success/error messages display properly
