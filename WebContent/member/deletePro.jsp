<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 세션 제어
		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
		}

		// 한글 처리
		request.setCharacterEncoding("utf-8");

		// 전달되는 정보 저장
	%>

	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"></jsp:useBean>

	<jsp:setProperty property="*" name="mb" />

	<%
		// update 처리 로직을 참고하여 회원정보 삭제기능 구현하기

		System.out.println("전달된 수정할 정보 : " + mb);

		// DB접속 후
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";

		// 1. 드라이버 로드

		Class.forName(DRIVER);

		// 2. 디비연결
		Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);

		// 3. sql작성 & pstmt 객체생성
		String sql = "select pw from itwill_member where id = ? ";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		// ? 채우기
		pstmt.setString(1, mb.getId());

		// 4. sql 실행
		ResultSet rs = pstmt.executeQuery();

		// 5. 데이터 처리
		if (rs.next()) {
			// 아이디가 있는 경우
			if (mb.getPw().equals(rs.getString("pw"))) {
				// 비밀번호 같음

				// sql 구문 작성 & pstmt 객체
				// sql문 하나당 pstmt하나 따라와야함
				sql = "delete from itwill_member where id = ? ";
				pstmt = conn.prepareStatement(sql);

				// ? 채우기
				pstmt.setString(1, mb.getId());

				// sql 실행
				pstmt.executeUpdate();

				//남은 세션 정보 초기화 하기
				session.invalidate();
				
				//페이지 이동
				response.sendRedirect("main.jsp");
				

			} else {
				// 비밀번호 다름 => 오류 (페이지 뒤로 이동)
	%>

				<script type="text/javascript">
					alert(" 비밀번호 오류 ! ");
					history.back();
				</script>

	<%
		}

		} else {
			// 아이디가 없는 경우 => 오류 (페이지 뒤로 이동)
	%>
			<script type="text/javascript">
				alert(" 아이디 없음 ! ");
				history.back();
			</script>

	<%
		}
	%>

</body>
</html>