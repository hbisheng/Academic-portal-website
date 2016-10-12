<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
</head>
<body>
	<form action="main.jsp" method="GET">
		<input type="text" name="first_param" /> + <input id="b" type="text"
			name="last_param" /> = <br /> <input type="button"
			value="Calculate" onclick="showValue()" />
		<div id="c"></div>  
		<script>
			function showValue() {
				var t1 = document.getElementsByName("first_param").item(0).value;
				var t2 = document.getElementById("b").value;
				var t3 = parseFloat(t1) + parseFloat(t2);
				var c = document.getElementById("c");

				c.innerHTML = t3;
				c.innerHTML += "<br/><input type='text' id='t2' value="+ t3 +" />";
				document.write(t3);
			}
		</script>
		<br /> <br /> <input type="submit" value="Submit" />
	</form>
</body>
</html>