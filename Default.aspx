<%@ Page Title="HACK | Hardware Acceleration Club of KUET" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HACK_portfolio._Default" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" CssClass="welcome-bg-layer" ID="home" ClientIDMode="Static">
        <div class="hero-inner">
            <asp:Image runat="server" ImageUrl="~/img/hackLogo.png" AlternateText="HACK Logo Large" CssClass="welcome-bg-logo" />
            <h2 class="welcome-bg-title">Welcome to the Hardware Acceleration Club of KUET!</h2>
            <p class="welcome-bg-text">
                Step into the world of Hardware Acceleration Club of KUET.
                We are innovators and creators pushing the boundaries of embedded systems,
                robotics, and IoT. Join us in our mission to turn visionary ideas into
                tangible engineering breakthroughs and accelerate your journey in tech!
            </p>
        </div>
    </asp:Panel>

    <section class="about-section" id="about">
        <div class="section-inner">
            <p class="section-label">About the Club</p>
            <h2 class="section-title">Engineering, research, and hands-on building.</h2>
            <p class="section-text">
                HACK brings together students interested in embedded systems, hardware design,
                robotics, IoT, and practical product development. We build together, learn together,
                and showcase projects that solve real-world problems.
            </p>
            <div class="about-grid">
                <div class="about-card">
                    <h3>Embedded Systems</h3>
                    <p>Microcontrollers, firmware, sensors, and low-level design.</p>
                </div>
                <div class="about-card">
                    <h3>Robotics & IoT</h3>
                    <p>Autonomous systems, connected devices, and smart automation.</p>
                </div>
                <div class="about-card">
                    <h3>Prototyping</h3>
                    <p>From idea to demo with PCB design, testing, and iteration.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="projects-section" id="projects">
        <h2 class="projects-title">Our Projects</h2>

        <div class="filter-container">
            <asp:Button runat="server" CssClass="filter-btn active" Text="All" data-filter="all" UseSubmitBehavior="false" />
            <asp:Button runat="server" CssClass="filter-btn" Text="Robotics" data-filter="robotics" UseSubmitBehavior="false" />
            <asp:Button runat="server" CssClass="filter-btn" Text="IoT" data-filter="iot" UseSubmitBehavior="false" />
            <asp:Button runat="server" CssClass="filter-btn" Text="Embedded Systems" data-filter="embedded" UseSubmitBehavior="false" />
            <asp:Button runat="server" CssClass="filter-btn" Text="AI/ML" data-filter="ai" UseSubmitBehavior="false" />
            <asp:Button runat="server" CssClass="filter-btn" Text="Software" data-filter="software" UseSubmitBehavior="false" />
            <asp:Button runat="server" CssClass="filter-btn" Text="Hardware" data-filter="hardware" UseSubmitBehavior="false" />
        </div>

        <div class="projects-grid">
            <asp:Repeater runat="server" ID="ProjectsRepeater">
                <ItemTemplate>
                    <div class="project-card" data-category='<%# Eval("CategoryName").ToString().ToLower() %>' data-id='<%# Eval("ProjectID") %>'>
                        <div class="project-image-wrapper">
                            <asp:Image runat="server" ImageUrl='<%# Eval("ImageUrl") != DBNull.Value ? Eval("ImageUrl") : "~/img/project1.png" %>' AlternateText='<%# Eval("Title") %>' CssClass="project-image" />
                            <div class="project-overlay">
                                <asp:HyperLink runat="server" NavigateUrl='<%# "~/project.aspx?id=" + Eval("ProjectID") %>' CssClass="view-details-btn" Text="View Details" />
                            </div>
                        </div>
                        <div class="project-info">
                            <h3><%# Eval("Title") %></h3>
                            <p class="project-category"><%# Eval("CategoryName") %></p>
                            <p class="project-description"><%# Eval("ShortDescription") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Fallback static project cards removed - now using database-driven Repeater -->

        </div>

        <div class="show-more-container">
            <asp:HyperLink runat="server" NavigateUrl="~/all-projects.aspx" CssClass="show-more-btn" Text="Show More Projects" />
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

    <section class="contacts-bg-white" id="contact">
        <h2>Contact Us</h2>
        <p>
            Have an idea or want to collaborate? Reach out to us!<br>
            Email: <asp:HyperLink runat="server" NavigateUrl="mailto:hack@kuet.ac.bd" Text="hack@kuet.ac.bd" />
            <br>
            Location: Khulna University of Engineering & Technology (KUET)<br>
            Khulna-9203, Bangladesh
        </p>
    </section>

    <asp:Button runat="server" CssClass="back-to-top" ID="backToTop" Text="↑" ToolTip="Back to Top" UseSubmitBehavior="false" />

    <nav class="glass-nav">
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#home" Text="Home" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#about" Text="About" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#projects" Text="Projects" />
        <asp:HyperLink runat="server" NavigateUrl="~/members.aspx" Text="Members" />
        <asp:HyperLink runat="server" NavigateUrl="~/register.aspx" Text="Register" />
        <asp:HyperLink runat="server" NavigateUrl="~/login.aspx" Text="Login" />
        <asp:HyperLink runat="server" NavigateUrl="~/profile.aspx" Text="Profile" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#contact" Text="Contact" />
    </nav>
</asp:Content>
