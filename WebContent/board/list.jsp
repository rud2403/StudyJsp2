<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
	<h1>WebContent/board/list.jsp</h1>
	
	<%
	// 디비에 저장된 글의 개수를 알기
	
	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	
	// 디비에 있는 글의 수를 계산하는 메소드 생성 -> 호출
	// getBoardCount();
	int cnt = bdao.getBoardCount();
	
	//////////////////////////////////////////////////////////////////////////////////
	// 게시판 페이징 처리 : DB에서 원하는 만큼만 글 가져오기
	
	// 한페이지당 보여줄 글의 개수
	int pageSize = 3;
	
	// 지금 페이지가 몇 페이지인지 확인
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	// 페이지별 시작 행 계산하기
	// 1p -> 1번 글부터, 2p -> 11번 글부터 3p -> 21번 글 부터 ... -> 일반화
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	
	// 끝 행 계산하기
	// 1p -> 10번, 2p -> 20번 ...
	int endRow = currentPage*pageSize;
	
	//////////////////////////////////////////////////////////////////////////////////

	// 디비에 저장된 모든 글 정보를 가져오기
	//ArrayList boardList = bdao.getBoardList();
	
	// 디비에 저장된 모든 글 중에서 원하는 만큼만 가져오기.(페이지 사이즈만큼)
	ArrayList boardList = bdao.getBoardList(startRow, pageSize);
	
	
	%>
	
	<h2> ITWILL 게시판 글목록 [총 : <%=cnt %>개] </h2>
	
	<h3><a href="writeForm.jsp">글쓰기</a></h3>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>IP</td>
		</tr>
		
		<%for(int i = 0;i < boardList.size(); i++){ 
			BoardBean bb = (BoardBean)boardList.get(i);
		%>
		<tr>
			<td><%=bb.getNum() %></td>
			<td>
			<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a>
			</td>
			<td><%=bb.getName() %></td>
			<td><%=bb.getDate() %></td>
			<td><%=bb.getReadcount() %></td>
			<td><%=bb.getIp() %></td>

		</tr>
		<% }%>
	</table>
	
	<hr>
	<%
		///////////////////////////////////////////////////
		// 페이징 처리 - 하단부 링크
		if(cnt != 0){
			// 글이 있을 때 표시
			// 전체 페이지 수 계산
			// ex) 50개 -> 한 페이지당 10개씩 출력, 필요한 페이지 개수 = 5개
			//     57개 -> 필요한 페이지 개수 = 6개
			
			int pageCount = cnt/pageSize+(cnt % pageSize == 0? 0:1);
			
			// 한 화면에 보여줄 페이지 번호의 개수 (페이지 블록)
			int pageBlock = 3;
			
			// 페이지 블록의 시작페이지 번호
			// ex) 1~5페이지 : 1~10 페이지 : 1, 11~20페이지 : 11
			int startPage = ((currentPage-1)/pageBlock) * pageBlock +1;
			
			// 페이지 블록의 끝 페이지 번호
			int endPage = startPage+pageBlock-1;
			
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
			// 이전
			if(startPage > pageBlock){
				%>
				<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
				<%
				
			}
			
			// 숫자 1...5
			for(int i = startPage; i <= endPage; i++){
				%>
				
				<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
				
				<%
				
			}
			
			// 다음(기존의 페이지 블럭보다 페이지의 수가 많을 때)
			if(endPage < pageCount){
				%>
				<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				<%
			}
			
		}
	
	%>
	
</body>
</html>