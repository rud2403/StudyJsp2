<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 
		로그인 처리 로직
		1) 아이디, 비밀번호 입력 -> sessionLoginPro.jsp 전달
		2) 아이디, 비밀번호가 ["itwill", "1234"]인지 판단
		2-1) 아이디 유무, 비밀번호 동일 유무
		2-2) 문제가 발생한 경우 (아이가 없음, 비밀번호 틀림) - 각각의 메세지 출력
		2-3) 문제가 없을 경우 sessionMain.jsp 페이지로 이동 + id 정보의 세션값 생성
		3) sessionMain.jsp 페이지에서 "id님 로그인 성공!" 출력
		4) 로그아웃 버튼 생성(sessionLogout.jsp)
	 -->
	 
	 <%
	 	// 한글 처리	
	 	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset-utf-8");
	 	//받은 정보(파라미터 저장) id, pw
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String dbID = "itwill";
		String dbPW = "1234";
		
		// A.equals(B) : 문자열A, 문자열B의 값이 동일한지 체크()
		//로그인 로직 처리
	 	if(id.equals(dbID)){
	 		//아이디가 동일한 경우
			
			if(pw.equals(dbPW)){
				//아이디 비밀번호 일치  -> 로그인 성공
				
				// 세션 값 생성(ID값)
				session.setAttribute("id", id);
				// 페이지 이동
				response.sendRedirect("sessionMain.jsp");
				
			}else{
				//아이디는 같은데 비밀번호는 다른 경우
				out.print("비밀번호 오류!");
			}
	 		
	 	}else{
	 		//아이디가 다른 경우
	 		out.println("아이디 정보가 없습니다.");
	 	}
	 	 
	 %>
	 

</body>
</html>