<%@ Page Title="Profile | HACK Portal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="HACK_portfolio.Profile" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="auth-shell profile-shell">
        <section class="auth-panel hero-panel profile-hero">
            <p class="eyebrow">Profile view</p>
            <h1>Member profile.</h1>
            <p>Review the information saved when you registered for the club.</p>
            <div class="auth-links">
                <asp:HyperLink runat="server" NavigateUrl="~/login.aspx" Text="Back to login" />
                <asp:HyperLink runat="server" NavigateUrl="~/register.aspx" Text="Create another account" />
            </div>
        </section>

        <section class="auth-panel form-panel profile-panel">
            <div class="profile-head">
                <asp:Label runat="server" ID="profileStatus" CssClass="status" EnableViewState="false" />
                <h2 id="profileName">Tahmid Chowdhury</h2>
                <p id="profileEmail">No account loaded.</p>
            </div>

            <div class="profile-grid">
                <div>
                    <span>Department</span>
                    <strong id="profileDepartment">-</strong>
                </div>
                <div>
                    <span>Year / Level</span>
                    <strong id="profileYearLevel">-</strong>
                </div>
                <div>
                    <span>Interest</span>
                    <strong id="profileInterest">-</strong>
                </div>
                <div>
                    <span>Joined</span>
                    <strong id="profileCreated">-</strong>
                </div>
            </div>

            <div class="bio-box">
                <span>Why you joined</span>
                <p id="profileBio">-</p>
            </div>

            <div class="button-row">
                <asp:Button runat="server" ID="logoutButton" CssClass="primary-btn" Text="Logout" UseSubmitBehavior="false" />
                <asp:HyperLink runat="server" CssClass="secondary-btn" NavigateUrl="~/login.aspx" Text="Go to login" />
            </div>
        </section>
    </main>
</asp:Content>
