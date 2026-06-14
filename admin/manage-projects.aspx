<%@ Page Title="Manage Projects - Admin Panel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="manage-projects.aspx.cs" Inherits="HACK_portfolio.admin.manage_projects" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/styles/admin.css" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <aside class="admin-sidebar">
            <div class="admin-logo">
                <asp:Image runat="server" ImageUrl="~/img/default-project-cover.svg" AlternateText="HACK Logo" />
                <h2>Admin Panel</h2>
            </div>
            <nav class="admin-nav">
                <asp:HyperLink runat="server" NavigateUrl="~/admin/dashboard.aspx" CssClass="admin-nav-link">
                    <span>📊</span> Dashboard
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-projects.aspx" CssClass="admin-nav-link active">
                    <span>🚀</span> Manage Projects
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/manage-users.aspx" CssClass="admin-nav-link">
                    <span>👥</span> Manage Users
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/settings.aspx" CssClass="admin-nav-link">
                    <span>⚙️</span> Settings
                </asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" CssClass="admin-nav-link">
                    <span>🏠</span> Back to Site
                </asp:HyperLink>
            </nav>
        </aside>

        <main class="admin-main">
            <header class="admin-header">
                <h1>Manage Projects</h1>
                <div class="admin-user-info">
                    <asp:Button runat="server" Text="+ Add New Project" CssClass="btn-primary" OnClick="btnAddProject_Click" />
                </div>
            </header>

            <div class="admin-content">
                <div class="filter-bar">
                    <asp:TextBox runat="server" ID="txtSearch" PlaceHolder="Search projects..." CssClass="search-input"></asp:TextBox>
                    <asp:DropDownList runat="server" ID="ddlCategory" CssClass="filter-select" AutoPostBack="true">
                        <asp:ListItem Text="All Categories" Value="all"></asp:ListItem>
                        <asp:ListItem Text="Robotics" Value="robotics"></asp:ListItem>
                        <asp:ListItem Text="IoT" Value="iot"></asp:ListItem>
                        <asp:ListItem Text="Embedded Systems" Value="embedded"></asp:ListItem>
                        <asp:ListItem Text="AI/ML" Value="ai"></asp:ListItem>
                        <asp:ListItem Text="Software" Value="software"></asp:ListItem>
                        <asp:ListItem Text="Hardware" Value="hardware"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList runat="server" ID="ddlStatus" CssClass="filter-select" AutoPostBack="true">
                        <asp:ListItem Text="All Status" Value="all"></asp:ListItem>
                        <asp:ListItem Text="Active" Value="active"></asp:ListItem>
                        <asp:ListItem Text="Pending" Value="pending"></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="completed"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="table-container">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Project Name</th>
                                <th>Category</th>
                                <th>Status</th>
                                <th>Members</th>
                                <th>Created Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#001</td>
                                <td>Autonomous Navigation Robot</td>
                                <td>Robotics</td>
                                <td><span class="badge badge-success">Active</span></td>
                                <td>5</td>
                                <td>2026-06-01</td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this project?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#002</td>
                                <td>Smart Home IoT System</td>
                                <td>IoT</td>
                                <td><span class="badge badge-success">Active</span></td>
                                <td>7</td>
                                <td>2026-05-28</td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this project?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#003</td>
                                <td>STM32 Firmware Development</td>
                                <td>Embedded Systems</td>
                                <td><span class="badge badge-success">Active</span></td>
                                <td>4</td>
                                <td>2026-05-25</td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this project?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#004</td>
                                <td>Computer Vision System</td>
                                <td>AI/ML</td>
                                <td><span class="badge badge-warning">Pending</span></td>
                                <td>3</td>
                                <td>2026-05-20</td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this project?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>#005</td>
                                <td>Quadcopter Drone</td>
                                <td>Robotics</td>
                                <td><span class="badge badge-info">Completed</span></td>
                                <td>6</td>
                                <td>2026-04-15</td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn view-btn">View</asp:HyperLink>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="action-btn edit-btn">Edit</asp:HyperLink>
                                    <asp:LinkButton runat="server" CssClass="action-btn delete-btn" OnClientClick="return confirm('Are you sure you want to delete this project?');">Delete</asp:LinkButton>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <asp:LinkButton runat="server" CssClass="page-btn">Previous</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="page-btn active">1</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="page-btn">2</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="page-btn">3</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="page-btn">Next</asp:LinkButton>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
