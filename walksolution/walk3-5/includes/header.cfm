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
   	 roles = ""
   },
   {
  	 label = "Content Assets",
  	 url = "assets/assets.cfm",
  	 roles = ""
   },
   {
   	 label = "Companies",
   	 url = "admin/companies.cfm",
   	 roles = "admin"
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

   <link rel="stylesheet" type="text/css" 
	     href="/ftcf2016/shared/css/Application.css" />
	</head>
	<body>
    <!-- app menu will go here -->
    <header>
    <h1>Proposal Manager</h1>
	<nav>
		<cfoutput>
		<cfloop array="#variables.nav#" index="thisLink">
			<a href="#thislink.url#">#thislink.label#</a>
		</cfloop>
		</cfoutput>
	</nav>
	</header>

	<main>
	<cfif isdefined("variables.pagetitle")>
		<cfoutput><h2>#variables.pagetitle#</h2></cfoutput>
	</cfif>

