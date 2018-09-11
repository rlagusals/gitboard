<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 보기</title>
</head>
<body>
<h3>게시글 목록보기</h3>
<table border="2">
  <tr>
    <td>번호</td>
    <td>제목</td>
    <td>작성자</td>
    <td>날짜</td>
    <td>이메일</td>
  </tr>
  <%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String DB_URL = "jdbc:mysql://localhost:3306/board";
	String USERNAME = "root";
	String PASSWORD = "root";
	
	Class.forName(JDBC_DRIVER);
	Connection con = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
	Statement stmt = con.createStatement();
	String sql="select * from message order by id asc";
	ResultSet rs = stmt.executeQuery(sql);
  
    if(rs != null){
      while(rs.next()){
    	  int id = Integer.parseInt(rs.getString("id"));
   %>
    <tr>
      <td><%=id %></td>
      <td><a href=display.jsp?id=<%=id%>>
      <%=rs.getString("subject")%></a></td>
      <td><%=rs.getString("name") %></td>
      <td><%=rs.getString("time") %></td>
      <td><%=rs.getString("email") %></td>
    </tr>
    <%
      }
    }
    %>
  </table>
  <a href ="write.jsp">글쓰기</a>
  <%
    if(stmt != null)
      stmt.close();
    if(con != null)
      con.close();
  %>
</body>
</html>