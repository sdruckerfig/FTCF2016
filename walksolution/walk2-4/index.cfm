<html>
<head>
	<title>Walkthrough 2-1</title>
</head>
<body>

	<cfset myname = "Steve">
	
	<cfoutput>
		<h1>Hello world, my name is #variables.myname#</h1>
	</cfoutput>

	<cflog 	file="ProposalManager"
			type="information"
			text="MyName: #variables.myname#">


</body>
</html>