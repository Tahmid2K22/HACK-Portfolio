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
                <div class="project-card" data-category="robotics">
                    <div class="project-image-wrapper">
                        <asp:Image runat="server" ImageUrl="~/img/project1.png" AlternateText="Autonomous Robot" CssClass="project-image" />
                        <div class="project-overlay">
                            <asp:HyperLink runat="server" NavigateUrl="~/project.aspx?id=1" CssClass="view-details-btn" Text="View Details" />
                        </div>
                    </div>
                    <div class="project-info">
                        <h3>Autonomous Navigation Robot</h3>
                        <p class="project-category">Robotics</p>
                        <p class="project-description">A wheeled robot with obstacle detection and autonomous pathfinding capabilities.</p>
                    </div>
                </div>

                <div class="project-card" data-category="iot">
                    <div class="project-image-wrapper">
                        <asp:Image runat="server" ImageUrl="~/img/project2.png" AlternateText="Smart Home System" CssClass="project-image" />
                        <div class="project-overlay">
                            <asp:HyperLink runat="server" NavigateUrl="~/project.aspx?id=2" CssClass="view-details-btn" Text="View Details" />
                        </div>
                    </div>
                    <div class="project-info">
                        <h3>Smart Home IoT System</h3>
                        <p class="project-category">IoT</p>
                        <p class="project-description">Connected home automation system with real-time monitoring and control.</p>
                    </div>
                </div>

                <div class="project-card" data-category="embedded">
                    <div class="project-image-wrapper">
                        <asp:Image runat="server" ImageUrl="~/img/project3.png" AlternateText="Microcontroller Project" CssClass="project-image" />
                        <div class="project-overlay">
                            <asp:HyperLink runat="server" NavigateUrl="~/project.aspx?id=3" CssClass="view-details-btn" Text="View Details" />
                        </div>
                    </div>
                    <div class="project-info">
                        <h3>STM32 Firmware Development</h3>
                        <p class="project-category">Embedded Systems</p>
                        <p class="project-description">Real-time embedded system with sensor integration and data processing.</p>
                    </div>
                </div>

                <div class="project-card" data-category="ai">
                    <div class="project-image-wrapper">
                        <asp:Image runat="server" ImageUrl="~/img/project4.png" AlternateText="Vision System" CssClass="project-image" />
                        <div class="project-overlay">
                            <asp:HyperLink runat="server" NavigateUrl="~/project.aspx?id=4" CssClass="view-details-btn" Text="View Details" />
                        </div>
                    </div>
                    <div class="project-info">
                        <h3>Computer Vision System</h3>
                        <p class="project-category">AI/ML</p>
                        <p class="project-description">ML-powered object detection and recognition for robotics applications.</p>
                    </div>
                </div>

                <div class="project-card" data-category="robotics">
                    <div class="project-image-wrapper">
                        <asp:Image runat="server" ImageUrl="~/img/project5.png" AlternateText="Drone Project" CssClass="project-image" />
                        <div class="project-overlay">
                            <asp:HyperLink runat="server" NavigateUrl="~/project.aspx?id=5" CssClass="view-details-btn" Text="View Details" />
                        </div>
                    </div>
                    <div class="project-info">
                        <h3>Quadcopter Drone</h3>
                        <p class="project-category">Robotics</p>
                        <p class="project-description">Custom-built quadcopter with flight control and stabilization systems.</p>
                    </div>
                </div>

                <div class="project-card" data-category="iot">
                    <div class="project-image-wrapper">
                        <asp:Image runat="server" ImageUrl="~/img/project6.png" AlternateText="Weather Station" CssClass="project-image" />
                        <div class="project-overlay">
                            <asp:HyperLink runat="server" NavigateUrl="~/project.aspx?id=6" CssClass="view-details-btn" Text="View Details" />
                        </div>
                    </div>
                    <div class="project-info">
                        <h3>Weather Monitoring Station</h3>
                        <p class="project-category">IoT</p>
                        <p class="project-description">IoT weather station with cloud data logging and real-time updates.</p>
                    </div>
                </div>

                <div class="project-card" data-category="software">
                    <div class="project-image-wrapper">
                        <asp:Image runat="server" ImageUrl="~/img/project7.png" AlternateText="Portfolio App" CssClass="project-image" />
                        <div class="project-overlay">
                            <asp:HyperLink runat="server" NavigateUrl="~/project.aspx?id=7" CssClass="view-details-btn" Text="View Details" />
                        </div>
                    </div>
                    <div class="project-info">
                        <h3>Club Portfolio App</h3>
                        <p class="project-category">Software</p>
                        <p class="project-description">A software portfolio to track club events and members.</p>
                    </div>
                </div>

                <div class="project-card" data-category="hardware">
                    <div class="project-image-wrapper">
                        <asp:Image runat="server" ImageUrl="~/img/project8.png" AlternateText="Custom Board" CssClass="project-image" />
                        <div class="project-overlay">
                            <asp:HyperLink runat="server" NavigateUrl="~/project.aspx?id=8" CssClass="view-details-btn" Text="View Details" />
                        </div>
                    </div>
                    <div class="project-info">
                        <h3>Custom ESP32 Board</h3>
                        <p class="project-category">Hardware</p>
                        <p class="project-description">A fully custom PCB with ESP32 and power management.</p>
                    </div>
                </div>
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

    <nav class="glass-nav">
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#home" Text="Home" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#about" Text="About" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#projects" Text="Projects" />
        <asp:HyperLink runat="server" NavigateUrl="~/members.aspx" Text="Members" />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx#contact" Text="Contact" />
    </nav>
</asp:Content>
