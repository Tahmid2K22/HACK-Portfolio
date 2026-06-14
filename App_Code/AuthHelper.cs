using System;
using System.Web;
using System.Web.SessionState;

namespace HACK_portfolio
{
    public static class AuthHelper
    {
        public static bool IsAuthenticated(HttpSessionState session)
        {
            return session != null && session["UserID"] != null;
        }

        public static bool IsAdmin(HttpSessionState session)
        {
            if (session == null)
            {
                return false;
            }

            if (session["Role"] != null)
            {
                if (string.Equals(session["Role"].ToString(), "Admin", StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            if (session["IsAdmin"] != null && session["IsAdmin"] is bool)
            {
                return (bool)session["IsAdmin"];
            }

            if (session["IsAdmin"] != null)
            {
                bool parsedValue;
                if (bool.TryParse(session["IsAdmin"].ToString(), out parsedValue))
                {
                    return parsedValue;
                }
            }

            return false;
        }

        public static void SetUserSession(HttpSessionState session, System.Data.DataRow user)
        {
            if (session == null || user == null) return;

            session["UserID"] = user["UserID"];
            session["Username"] = user["Username"];
            session["FirstName"] = user["FirstName"];
            session["LastName"] = user["LastName"];
            session["Email"] = user["Email"];
            session["Role"] = user["Role"]?.ToString() ?? string.Empty;
            session["IsAdmin"] = string.Equals(user["Role"]?.ToString(), "Admin", StringComparison.OrdinalIgnoreCase);
        }
    }
}
