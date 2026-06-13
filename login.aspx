<%@ Page Title="Login | HACK Portal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HACK_portfolio.Login" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/styles/auth.css" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="auth-shell auth-shell-login">
        <section class="auth-panel hero-panel login-hero">
            <p class="eyebrow">Member login</p>
            <h1>Sign in.</h1>
            <p>Access your saved registration details and view your club profile.</p>
            <div class="auth-links">
                <asp:HyperLink runat="server" NavigateUrl="~/register.aspx" Text="Need an account? Register" />
                <asp:HyperLink runat="server" NavigateUrl="~/profile.aspx" Text="View profile" />
            </div>
            <ul class="auth-points auth-points-compact">
                <li>Keep your club profile updated.</li>
                <li>Jump straight to your member dashboard.</li>
                <li>Fast access on desktop and mobile.</li>
            </ul>
        </section>

        <section class="auth-panel form-panel">
            <asp:Panel runat="server" CssClass="auth-form" DefaultButton="btnSignIn">
                <h2>Login</h2>
                <asp:Label runat="server" ID="loginStatus" CssClass="status" EnableViewState="false" />

                <div class="field-grid single-col">
                    <asp:Label runat="server" AssociatedControlID="txtEmail">
                        <span>Email</span>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="input" TextMode="Email" AutoCompleteType="Email" />

                    <asp:Label runat="server" AssociatedControlID="txtPassword">
                        <span>Password</span>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="input" TextMode="Password" AutoCompleteType="Disabled" />
                </div>

                <div class="button-row">
                    <asp:Button runat="server" ID="btnSignIn" CssClass="primary-btn" Text="Sign in" />
                    <asp:HyperLink runat="server" CssClass="secondary-btn" NavigateUrl="~/register.aspx" Text="Register" />
                </div>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
