<cfcomponent output="false">
	
	<cfset this.name = "ProposalManagerSolution44Solution">
	<cfset this.datasource = "ProposalManager">
	<cfset this.sessionManagement = true>
	<cfset this.clientManagement = false>
	
	<cffunction name="onApplicationStart">
		
		<cfset application.basehref = "/ftcf2016/walksolution/walk4-4/">
		<cfset application.cfcpath = "ftcf2016.walksolution.walk4-4.components.">
		<cfset application.cssHref = "/ftcf2016/shared/css/">

		<cfset application.cfc = structnew()>
		
		<cfset application.cfc.Login = createObject(
			"component",
			"#application.cfcpath#Login"
		)>
		
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetpage" required="true" type="string">
		
		<cfif isdefined("url.init")>
			<cfset onApplicationStart()>
		</cfif> 
		
		<cfif not isUserInRole("superadmin") and
			  arguments.targetpage contains "/admin/">
			  
			  <cflocation url="#application.basehref#login/index.cfm">
			  
		</cfif>
		
	</cffunction>

</cfcomponent>