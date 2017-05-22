<!---
File   : header.cfm
Purpose: Navigation control
By     : Steve Drucker
Created: 04/17/2015

Usage:
Invoke at the top of a CFM by using <cfinclude>

Modification Log:
Date        Action
=============================================
04/18/2015  Created
--->

<cfset nav = [
   {
     label="Logout",
     url = "login/logout.cfm",
     roles = "user,admin,superadmin"
   },
   {
     label = "Add Asset",
     url = "admin/asset.cfm",
     roles = "admin,superadmin"
   },
   {
     label = "Companies",
     url = "admin/companies.cfm",
     roles = "superadmin"
   },
   {
     label = "Home",
     url = "index.cfm",
     roles = ""
   }
   
]>

<cfif isdefined("attributes.pagetitle")>
  <cfset variables.pagetitle = attributes.pagetitle>
</cfif>

<doctype html>
<html>
  <head>
  <title>
   <!--- insert dynamic title here --->
     <cfif isdefined("variables.pagetitle")>
      <cfoutput>#variables.pagetitle#</cfoutput>
     </cfif>
   </title>
   <cfoutput>
   <link rel="stylesheet" type="text/css" 
       href="#application.cssHref#Application.css" />
  </cfoutput>
  </head>
  <body>
    <!-- app menu will go here -->
    <header>
    <h1>Proposal Manager</h1>
  <nav>
    <cfoutput>
    <cfif getAuthUser() is "">
      <a href="#application.basehref#login/index.cfm">Login</a>
    </cfif>
    <cfloop array="#variables.nav#" index="thisLink">
      <cfif thisLink.roles is "" or isUserInAnyRole(thisLink.roles)>
      <a href="#application.basehref##thislink.url#">#thislink.label#</a>
      </cfif>
    </cfloop>
    </cfoutput>
  </nav>
  </header>

  <main>
  <cfif isdefined("variables.pagetitle")>
    <cfoutput><h2>#variables.pagetitle#</h2></cfoutput>
  </cfif>

