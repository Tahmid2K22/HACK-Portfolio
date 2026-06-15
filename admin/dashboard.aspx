<%@ Page Title="Admin Dashboard - HACK Portfolio" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="HACK_portfolio.admin.dashboard" %>
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
                <asp:HyperLink runat="server" NavigateUrl="~/admin/dashboard.aspx" CssClass="admin-nav-link active">
                    Dashboard
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="admin-nav-link">
                    Manage Projects
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="admin-nav-link">
                    Manage Users
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/settings.aspx" CssClass="admin-nav-link">
                    Settings
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="admin-nav-link">
                    Back to Site
                </asp:HyperLink>
            </nav>
        </aside>

        <main class="admin-main">
            <header class="admin-header">
                <h1>Dashboard</h1>
                <div class="admin-user-info">
                    <span>Welcome, <strong><asp:Label runat="server" ID="lblAdminName" Text="Admin"></asp:Label></strong></span>
                    <asp:HyperLink runat="server" NavigateUrl="~/logout.aspx" CssClass="logout-btn">Logout</asp:HyperLink>
                </div>
            </header>

            <div class="dashboard-stats">
                <div class="stat-card">
                    <div class="stat-icon">P</div>
                    <div class="stat-info">
                        <h3><asp:Label runat="server" ID="lblTotalProjects" Text="24"></asp:Label></h3>
                        <p>Total Projects</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">M</div>
                    <div class="stat-info">
                        <h3><asp:Label runat="server" ID="lblTotalUsers" Text="156"></asp:Label></h3>
                        <p>Total Members</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">A</div>
                    <div class="stat-info">
                        <h3><asp:Label runat="server" ID="lblActiveProjects" Text="12"></asp:Label></h3>
                        <p>Active Projects</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">R</div>
                    <div class="stat-info">
                        <h3><asp:Label runat="server" ID="lblPendingRequests" Text="8"></asp:Label></h3>
                        <p>Pending Requests</p>
                    </div>
                </div>
            </div>

            <div class="dashboard-grid">
                <section class="dashboard-section">
                    <h2>Recent Projects</h2>
                    <asp:Repeater ID="rptRecentProjects" runat="server">
                        <HeaderTemplate>
                            <div class="table-container">
                                <table class="admin-table">
                                    <thead>
                                        <tr>
                                            <th>Project Name</th>
                                            <th>Category</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("ProjectName") %></td>
                                            <td><%# Eval("CategoryName") %></td>
                                            <td><span class="badge <%# GetStatusBadgeClass(Eval("Status")) %>"><%# Eval("Status") %></span></td>
                                            <td><%# Eval("CreatedDate") %></td>
                                        </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                    </tbody>
                                </table>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </section>

                <section class="dashboard-section">
                    <h2>Recent Members</h2>
                    <asp:Repeater ID="rptRecentMembers" runat="server">
                        <HeaderTemplate>
                            <div class="table-container">
                                <table class="admin-table">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("FullName") %></td>
                                            <td><%# Eval("Email") %></td>
                                            <td><span class="badge <%# GetRoleBadgeClass(Eval("Role")) %>"><%# Eval("Role") %></span></td>
                                            <td><span class="badge <%# GetStatusBadgeClass(Eval("Status")) %>"><%# Eval("Status") %></span></td>
                                        </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                    </tbody>
                                </table>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </section>
            </div>
        </main>
    </div>
</asp:Content>
