<cfcomponent output="false">
	
	<cfset this.name = "ProposalManager">
	<cfset this.datasource = "ProposalManager">
	<cfset this.sessionManagement = true>
	<cfset this.clientManagement = false>
	
	<cffunction name="onApplicationStart">
		
		<cfset application.basehref = "/ftcf2016/walksolution/walk5-2/">
		<cfset application.cfcpath = "ftcf2016.walksolution.walk5-2.components.">
		<cfset application.cssHref = "/ftcf2016/shared/css/">
		
		<cfset application.cfc = structnew()>
		
		<cfset application.cfc.Utils = createObject(
			"component",
			"#application.cfcpath#Base"
		)>
		
		<cfset application.cfc.Login = createObject(
			"component",
			"#application.cfcpath#Login"
		)>
		
		<cfset application.cfc.Asset = createObject(
			"component",
			"#application.cfcpath#Asset"
		)>
		
		
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetpage" required="true" type="string">
		
		<cfif isdefined("url.init")>
			<cfset onApplicationStart()>
			<cfset onSessionStart()>
		</cfif> 
		
		<cfif not isUserInRole("SuperAdmin") and
			  arguments.targetpage contains "/admin/">
			  
			  <cflocation url="#application.basehref#login/index.cfm">
			  
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="onSessionStart">
		
		<cfif not isdefined("session.username")>
			<cfset session.username = "Anonymous">
		</cfif>
		
	</cffunction>

</cfcomponent>