﻿<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Kudu.Services.Web" %>
<%@ Import Namespace="Kudu.Services" %>
<%@ Import Namespace="System.Web.Hosting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Kudu Services</title>
    <style type="text/css">
        body
        {
            color: #646465;
            font-family: 'Segoe UI', "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 12px;
            margin-left: 2%;
        }
        
        a {
            color: blue;
            text-decoration: none;
        }
        
        a:visited {
            color: blue;
        }
        
        a:hover {
            text-decoration: underline;
        }
        
        h1
        {
            padding-top: 20px;
            font-size: 20px;
        }
        
        table {
            border-collapse: collapse;
            font-family: 'Segoe UI', "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 13px;
        }
        
        table td {
            padding: 4px;
        }
        
        #footer {
            text-align: center;
        }
        
        .header {
            font-size: 15px;
            font-weight: bold;
            border-bottom:1px solid #ccc; 
            width:30%; 
            margin-top:40px;
            margin-bottom:5px;
        }
        
        ul li {
           margin-top: 5px;
        }
        
        .path {
            font-family: Consolas;
        }
        
        #sha {
            font-size: 12px;
            font-weight: normal;
        }
        
        #update-link {
            font-size: 12px;
            font-weight: normal;
        }
        
    </style>
    <head>
</head>
</head>
<body>
    <div>
        <% 
            string commitFile = MapPath("~/commit");
            string sha = File.Exists(commitFile) ? File.ReadAllText(commitFile).Trim() : null;
            var version = typeof(AppSettings).Assembly.GetName().Version;
            bool devSiteEnabled = PathResolver.ResolveDevelopmentPath() != null;
        %>
        
        <h1>Kudu - Build <%= version %>
        <% if (sha != null) { %>
        (<a id="sha" href="https://github.com/projectkudu/kudu/commit/<%= sha %>"><%= sha.Substring(0, 10) %></a>)
        <% } %>
        </h1>
    </div>
    
   <div class="header">Environment</div>

    <table>
        <tr>
            <td><strong>Live Site</strong></td>
            <td class="path"><%= MapPath("_app") %></td>
        </tr>
        <% var devSitePath = PathResolver.ResolveDevelopmentPath(); %>
        <% if (!String.IsNullOrEmpty(devSitePath)) { %>
        <tr>
            <td><strong>Dev Site</strong></td>
            <td class="path"><%= devSitePath%></td>
        </tr>
        <% } %>
        <tr>
            <td><strong>Temp</strong></td>
            <td class="path"> <%= Path.GetTempPath() %></td>
        </tr>
        <tr>
            <td><strong>Diagnostics Dump</strong></td>
            <td><a href="dump">Download</a></td>
        </tr>
        <tr>
            <td><strong>Runtime Environment</strong></td>
            <td><a href="Env.aspx">View</a></td>
        </tr>
    </table>
</body>
</html>
