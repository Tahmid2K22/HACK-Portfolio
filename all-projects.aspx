<%@ Page Title="All Projects | HACK Portfolio" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="all-projects.aspx.cs" Inherits="HACK_portfolio.AllProjects" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="projects-section" id="all-projects">
        <div class="section-inner">
            <p class="section-label">Showcase</p>
            <h2 class="section-title">All Our Innovations</h2>

            <div class="filter-container">
                <asp:Button runat="server" CssClass="filter-btn active" Text="All" data-filter="all" UseSubmitBehavior="false" />
                <asp:Button runat="server" CssClass="filter-btn" Text="Robotics" data-filter="robotics" UseSubmitBehavior="false" />
                <asp:Button runat="server" CssClass="filter-btn" Text="IoT" data-filter="iot" UseSubmitBehavior="false" />
                <asp:Button runat="server" CssClass="filter-btn" Text="Embedded Systems" data-filter="embedded" UseSubmitBehavior="false" />
                <asp:Button runat="server" CssClass="filter-btn" Text="AI/ML" data-filter="ai" UseSubmitBehavior="false" />
                <asp:Button runat="server" CssClass="filter-btn" Text="Software" data-filter="software" UseSubmitBehavior="false" />
                <asp:Button runat="server" CssClass="filter-btn" Text="Hardware" data-filter="hardware" UseSubmitBehavior="false" />
            </div>

            <div class="projects-grid all-projects-layout">
                <asp:Repeater runat="server" ID="ProjectsRepeater">
                    <ItemTemplate>
                        <div class="project-card" data-category='<%# Eval("CategoryName").ToString().ToLower() %>' data-id='<%# Eval("ProjectID") %>'>
                            <div class="project-image-wrapper">
                                <asp:Image runat="server" ImageUrl='<%# Eval("ThumbnailImageUrl") %>' AlternateText='<%# Eval("ProjectName") %>' CssClass="project-image" />
                                <div class="project-overlay">
                                    <asp:HyperLink runat="server" NavigateUrl='<%# "~/project.aspx?id=" + Eval("ProjectID") %>' CssClass="view-details-btn" Text="View Details" />
                                </div>
                            </div>
                            <div class="project-info">
                                <h3><%# Eval("ProjectName") %></h3>
                                <p class="project-category"><%# Eval("CategoryName") %></p>
                                <p class="project-description"><%# Eval("ShortDescription") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <div class="modal" id="projectModal">
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <asp:Image runat="server" ID="modalImage" AlternateText="Project" CssClass="modal-image" />
            <h2 id="modalTitle"></h2>
            <p id="modalCategory" class="modal-category"></p>
            <p id="modalDescription" class="modal-description"></p>
            <p id="modalDetails" class="modal-details"></p>
            <div class="modal-buttons">
                <a id="demoLink" href="#" target="_blank" class="modal-btn demo-btn">View Demo</a>
                <a id="githubLink" href="#" target="_blank" class="modal-btn github-btn">GitHub</a>
            </div>
        </div>
    </div>
</asp:Content>
