<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/board/content.jsp</h1>
	<%
		// 페이지 이동 시 전달정보가 있으면 항상 먼저 저장
		// num, pageNum
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		// BoardDAO 객체 생성
		
		BoardDAO bdao = new BoardDAO();
		
		
		
		// 글 조회수 1증가 (DB 처리)
		bdao.updateReadcount(num);
		
		
		//DB에서 글 번호(null)에 해당하는 글 정보를 모두 가져와서 출력
		BoardBean bb = bdao.getBoard(num);
	
	%>
	
	<table border="1">
		<tr>
			<td>글번호</td>
			<td><%=bb.getNum() %></td>
			<td>조회수</td>
			<td><%=bb.getReadcount() %></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><%=bb.getName() %></td>
			<td>작성일</td>
			<td><%=bb.getDate() %></td>									
		</tr>
		<tr>
			<td>글제목</td>
			<td colspan="3"><%=bb.getSubject() %></td>
								
		</tr>
		<tr>
			<td>첨부파일</td>
			<td colspan="3"><%=bb.getFile() %></td>								
		</tr>
		<tr>
			<td>글내용</td>
			<td colspan="3"><%=bb.getContent() %></td>								
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="수정하기" onclick="location.href='updateForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>';">
				<input type="button" value="삭제하기" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum %>';">
				<input type="button" value="답글쓰기" onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum() %> &re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq() %>';">
				<input type="button" value="목록으로" onclick="location.href='list.jsp?pageNum=<%=pageNum %>';">
			</td>								
		</tr>
	</table>
	
	
	

</body>
</html>