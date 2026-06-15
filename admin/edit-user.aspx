<%@ Page Title="Edit User - Admin Panel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="edit-user.aspx.cs" Inherits="HACK_portfolio.admin.edit_user" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/styles/admin.css" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <aside class="admin-sidebar">
            <div class="admin-logo">
                <asp:Image runat="server" ImageUrl="~/img/hackLogo.png" AlternateText="HACK Logo" />
                <h2>Admin Panel</h2>
            </div>
            <nav class="admin-nav">
                <asp:HyperLink runat="server" NavigateUrl="~/admin/dashboard.aspx" CssClass="admin-nav-link">Dashboard</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="admin-nav-link">Manage Projects</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="admin-nav-link active">Manage Users</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/settings.aspx" CssClass="admin-nav-link">Settings</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="admin-nav-link">Back to Site</asp:HyperLink>
            </nav>
        </aside>

        <main class="admin-main">
            <header class="admin-header">
                <h1><asp:Label runat="server" ID="lblPageTitle" Text="Edit User"></asp:Label></h1>
                <div class="admin-user-info">
                    <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="btn-secondary">Back to Users</asp:HyperLink>
                </div>
            </header>

            <div class="admin-content">
                <asp:Panel runat="server" ID="pnlSuccessMessage" CssClass="alert alert-success" Visible="false">
                    User saved successfully!
                </asp:Panel>

                <div class="settings-container">
                    <section class="settings-section">
                        <h2>Account Information</h2>
                        <div class="form-group">
                            <label for="txtUsername">Username</label>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtEmail">Email</label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" />
                        </div>
                        <div class="form-group">
                            <label for="ddlRole">Role</label>
                            <asp:DropDownList runat="server" ID="ddlRole" CssClass="form-control">
                                <asp:ListItem Text="Admin" Value="Admin" />
                                <asp:ListItem Text="Member" Value="Member" />
                                <asp:ListItem Text="Guest" Value="Guest" />
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>
                                <asp:CheckBox runat="server" ID="chkIsActive" Checked="true" />
                                Active
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <asp:CheckBox runat="server" ID="chkIsEmailVerified" />
                                Email Verified
                            </label>
                        </div>
                    </section>

                    <section class="settings-section">
                        <h2>Personal Information</h2>
                        <div class="form-group">
                            <label for="txtFirstName">First Name</label>
                            <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtLastName">Last Name</label>
                            <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtPhoneNumber">Phone Number</label>
                            <asp:TextBox runat="server" ID="txtPhoneNumber" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtStudentID">Student ID</label>
                            <asp:TextBox runat="server" ID="txtStudentID" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtDepartment">Department</label>
                            <asp:TextBox runat="server" ID="txtDepartment" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtYearOfStudy">Year of Study</label>
                            <asp:TextBox runat="server" ID="txtYearOfStudy" CssClass="form-control" TextMode="Number" />
                        </div>
                    </section>

                    <section class="settings-section">
                        <h2>Profile</h2>
                        <div class="form-group">
                            <label for="txtBio">Bio</label>
                            <asp:TextBox runat="server" ID="txtBio" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        </div>
                        <div class="form-group">
                            <label for="txtSkills">Skills</label>
                            <asp:TextBox runat="server" ID="txtSkills" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtProfileImageUrl">Profile Image URL</label>
                            <asp:TextBox runat="server" ID="txtProfileImageUrl" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtLinkedInUrl">LinkedIn URL</label>
                            <asp:TextBox runat="server" ID="txtLinkedInUrl" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtGitHubUrl">GitHub URL</label>
                            <asp:TextBox runat="server" ID="txtGitHubUrl" CssClass="form-control" />
                        </div>
                    </section>

                    <div class="settings-actions">
                        <asp:Button runat="server" ID="btnSave" Text="Save User" CssClass="btn-primary" OnClick="btnSave_Click" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn-secondary" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
