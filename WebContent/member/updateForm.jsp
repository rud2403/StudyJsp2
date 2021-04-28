<%@page import="java.nio.ReadOnlyBufferException"%>
<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/member/updateForm.jsp</h1>

	<%
		// 로그인한 사람의 정보를 DB에서 조회해서
		// jsp화면에 출력
	
		// 로그인 세션 처리
		String id = (String)session.getAttribute("id");
	
		if (id == null) {
			//로그인 x
			System.out.println("[info.jsp] : 아이디 없음 -> 로그인페이지 이동");
			response.sendRedirect("loginForm.jsp");
		}
	
		// 디비 연결 후 필요한 데이터 조회 -> 출력
		
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1 드라이버 로드
		Class.forName(DRIVER);
		// 2 디비 연결
		Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
		// 3 쿼리 작성(select) & pstmt 작성
		String sql = "select * from itwill_member where id = ?";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// 4 sql 객체 실행 -> rs에 저장
		
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		// 5 데이터 처리
		MemberBean mb = null;

		if(rs.next()) { 
			// rs에 저장된 정보를 꺼내서 화면에 출력
			mb = new MemberBean();

			mb.setId(rs.getString("id"));
			mb.setPw(rs.getString("pw"));
			mb.setName(rs.getString("name"));
			mb.setAge(rs.getInt("age"));
			mb.setGender(rs.getString("gender"));
			mb.setEmail(rs.getString("email"));
			mb.setRegdate(rs.getTimestamp("regdate"));
			
			System.out.println("sql 구문 실행 완료");
			System.out.println("저장된 회원 정보" + mb);
		}
		
	%>


	<h2> 회원정보 수정 </h2>
	
	
	<fieldset>
	<legend> 아이티윌 회원정보 수정 페이지 </legend>
	
	<%if(mb != null){ %>
	<form action="updatePro.jsp" method="post">
		아이디 : <input type="text" name="id"  value="<%=mb.getId() %>" readonly><br>
		비밀번호 : <input type="password" name="pw"  value="<%=mb.getPw() %>" placeholder="비밀번호를 입력하세요."><br>
		<hr>
		이름 : <input type="text" name="name"  value="<%=mb.getName() %>"><br>
		나이 : <input type="number" name="age"  value="<%=mb.getAge() %>"><br>
		성별 : 남 <input type="radio" name="gender" value="남" <% if("남".equals(mb.getGender())){%>checked<%}%>>
		       여 <input type="radio" name="gender" value="여" <% if("여".equals(mb.getGender())){%>checked<%}%>><br>
		이메일 : <input type="email" name="email"  value="<%=mb.getEmail() %>"><br>
		<br>
		<input type="submit" value="정보수정">
	</form>
	 <% }%>
	</fieldset>
	
</body>
</html>