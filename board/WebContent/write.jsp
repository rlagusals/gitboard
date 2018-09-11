<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글쓰기</title>
</head>
<body>
<h3>게시글 입력 화면</h3>
<form action="insert.jsp" method="post">
  <table border="2">
    <tr>
      <td>제목</td>
      <td><input type="text" name="subject" size="60"></td>
     </tr>
     <tr>
      <td>작성자</td>
      <td><input type="text" name="name" size="20"></td>
      </tr>
      <tr>
      <td>내용</td>
      <td><textarea name="memo" rows="5" cols="50"></textarea></td>
      </tr>
      <tr>
      <td>작성날짜</td>
      <td><input type="text" name="time" size="60"></td>
      </tr>
      <tr>
      <td>email</td>
      <td><input type="text" name="email" size="60"></td>
      </tr>
  </table>
  <br>
  <input type="submit" value="게시글등록"><input type="reset" value="다시쓰기">
</form>
<br>
<a href="list.jsp"> 게시글 리스트 보기</a>
</body>
</html>