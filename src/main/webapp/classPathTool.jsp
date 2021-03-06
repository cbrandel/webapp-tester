<%@ page session="false" autoFlush="true" isELIgnored="false"
	contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%><%@ page import="java.io.File"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String className = request.getParameter("class");
	if (className == null || ("").equals(className)) {
		className = "javax.servlet.http.HttpServlet";
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ClassPath Tool</title>
</head>
<body>
	[<a href="index.jsp">Home</a>]
	<h1>classPathTool</h1>
	<form method="post">
		ClassName: <input type="text" name="class" value="<%=className%>"
			size="50" /><input type="submit" name="submit" value="submit"/>
	</form>
	<%
		try {
			Class<?> myClass = Class.forName(className);
			File f = new File(myClass.getProtectionDomain().getCodeSource().getLocation().getPath());
			out.println("Source file: " + f.getAbsolutePath());
		} catch (Exception e) {
			out.println("<pre>");
			e.printStackTrace(new PrintWriter(out));
			out.println("</pre>");
		}
	%>
</body>
</html>