<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/list.jsp</h1>
	<h2> 회원 목록을 확인(관리자) </h2>
	
	<%
		// 세션제어 (관리자만 사용)
		// -> 아이디가 없거나, 관리자가 아닌경우 메인페이지/로그인페이지로 이동
		String id = (String)session.getAttribute("id");
		
		if(id == null || !id.equals("admin")){
			response.sendRedirect("loginForm.jsp");
		}
	
		//DB에서 모든 회원의 정보를 가져와서 처리(테이블에 출력)
		
		
		
		
	%>
	
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
			<td>가입일</td>
		</tr>
		
		<%
		
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
				
				//id가 admin인 것은 빼ㄱ
				String sql = "select * from itwill_member where id != 'admin'";
			
				PreparedStatement pstmt = conn.prepareStatement(sql);
				// 4 sql 객체 실행 -> rs에 저장

				ResultSet rs = pstmt.executeQuery();
				
				// 5 데이터 처리(DB의 값을 테이블에 출력)

				while(rs.next()) { 
					// rs에 저장된 정보를 꺼내서 화면에 출력
					
					// DB의 데이터를 테이블로 출력
					// 쿼리문을 통해 아이디가 'admin' 인것은 제외
					%>
					<tr>
						<td><%=rs.getString("id") %></td>
						<td><%=rs.getString("pw") %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getString("age") %></td>
						<td><%=rs.getString("gender") %></td>
						<td><%=rs.getString("email") %></td>
						<td><%=rs.getString("regdate") %></td>
					</tr>
					<%
					}
				%>
	</table>
	
</body>
</html>