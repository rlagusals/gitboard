<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<%
	String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";

	String USERNAME = "scott";
	String PASSWORD = "tiger";

	Connection conn = null;
	Statement stmt = null;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Member_Table</title>
<style>
.tr1 {
  background-color: LightPink;
}
</style>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
  $(document).ready(function() {
    $("tr.tr2:odd").css("background-color", "LightCyan");
    $("tr.tr2:even").css("background-color", "Ivory");
  });
</script>
</head>
<body>
  <h3>Member World</h3>
  <hr>
  <form action="">
    아이디 비밀번호 이름 폰번호
    <hr>
    <br>

    <%
    	try {
    		Class.forName(JDBC_DRIVER);
    		conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
    		stmt = conn.createStatement();
    		String sqlStr = "select * from member";
    		ResultSet rst = stmt.executeQuery(sqlStr);

    		while (rst.next()) {
    			String id = rst.getString("id");
    			String passwd = rst.getString("passwd");
    			String name = rst.getString("name");
    			String phone = rst.getString("phone");
   
    out.println("id: "+id+" , passwd: "+passwd+" , name: "+name+",  phone: "+phone); 
    %>
    <br>
    <%
    	}
    %>
  </form>
  <%
  	stmt.close();
  		rst.close();
  		conn.close();
  	} catch (Exception ex) {
  		ex.printStackTrace();
  	}
  %>
</body>
</html>