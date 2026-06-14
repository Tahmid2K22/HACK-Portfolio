<%@ Page Title="Profile | HACK Portal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="HACK_portfolio.Profile" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/styles/auth.css" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="auth-shell profile-shell">
        <section class="auth-panel hero-panel profile-hero">
            <p class="eyebrow">Member Profile</p>
            <h1>Your Profile</h1>
            <p>View and manage your club membership information.</p>
            <div class="auth-links">
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" Text="Back to Home" CssClass="home-link" />
                <asp:HyperLink runat="server" NavigateUrl="~/members.aspx" Text="View Members" />
                <asp:HyperLink runat="server" NavigateUrl="~/all-projects.aspx" Text="All Projects" />
            </div>
            <ul class="auth-points auth-points-compact">
                <li>View your membership details</li>
                <li>Check your interests and bio</li>
                <li>Access admin panel (if admin)</li>
            </ul>
        </section>

        <section class="auth-panel form-panel profile-panel">
            <div class="profile-head">
                <asp:Label runat="server" ID="profileStatus" CssClass="status" EnableViewState="false" style="display:none;" />
                <div class="profile-avatar">
                    <div class="avatar-circle">
                        <asp:Image runat="server" ID="profileImage" CssClass="avatar-img" AlternateText="Avatar" Visible="false" />
                        <span id="avatarInitials" runat="server"></span>
                    </div>
                </div>
                <h2 id="profileName" runat="server">Loading...</h2>
                <p id="profileEmail" runat="server" class="profile-email">No account loaded.</p>
                <div id="profileRoleBadge" runat="server" class="role-badge">Member</div>
            </div>

            <div class="profile-divider"></div>

            <div class="profile-section">
                <h3>Basic Information</h3>
                <div class="profile-grid">
                    <div class="profile-item">
                        <span>Department</span>
                        <strong id="profileDepartment" runat="server">-</strong>
                    </div>
                    <div class="profile-item">
                        <span>Year / Level</span>
                        <strong id="profileYearLevel" runat="server">-</strong>
                    </div>
                    <div class="profile-item">
                        <span>Primary Interest</span>
                        <strong id="profileInterest" runat="server">-</strong>
                    </div>
                    <div class="profile-item">
                        <span>Member Since</span>
                        <strong id="profileCreated" runat="server">-</strong>
                    </div>
                </div>
            </div>

            <div class="profile-divider"></div>

            <div class="bio-box">
                <h3>About Me</h3>
                <p id="profileBio" runat="server" class="bio-text">No bio provided.</p>
            </div>

            <div class="profile-divider"></div>

            <div class="button-row profile-actions">
                <asp:HyperLink runat="server" CssClass="secondary-btn" NavigateUrl="~/Default.aspx" Text="Home" />
                <asp:HyperLink runat="server" CssClass="secondary-btn admin-btn" NavigateUrl="~/admin/dashboard.aspx" Text="Admin Panel" ID="adminLink" Visible="false" />
                <asp:Button runat="server" ID="logoutButton" CssClass="danger-btn" Text="Logout" UseSubmitBehavior="false" OnClick="logoutButton_Click" />
            </div>
        </section>
    </main>
</asp:Content>
