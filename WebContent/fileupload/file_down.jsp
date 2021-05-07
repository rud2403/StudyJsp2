<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
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
		// 파라미터 값 저장 (filename)
		String fileName = request.getParameter("filename");
		
		// 서버에 업로드된 파일명 생성
		
		
		// 업로드한 가상 경로
		String savePath = "upload";
		
		// 파일이 업로드된 경로
		ServletContext ctx = getServletContext();
		String sDownloadPath = ctx.getRealPath(savePath);
		
		System.out.println("upload 폴더의실제주소(서버안에 있는 실제주소)" + sDownloadPath);
		
		// 서버에 업로드된 파일명 생성
		String sFilePath = sDownloadPath + "\\" + fileName;
		
		System.out.println("다운로드 할 파일 주소 : " + sFilePath);
		
		/////////////////////////////////////////////////////////////////////////////////////////////////
		// * 자바/웹 파일을 업로드, 다운로드 시 파일의 확장자는 중요하지 않다. 
		// => 스트림으로 데이터를 주고 받기 때문이다. => 해당 파일 웹에서 표현하는 방식 MIME타입
	
		// 파일 업로드
		
		// 파일을 한번에 읽고 쓰기 하는 배열
		byte[] b = new byte[4096];
		
		// 파일 입력 스트림 객체 (서버에 저장된 파일을 불러오기)
		FileInputStream fis = new FileInputStream(sFilePath);
		
		// 다운로드 할 파일의 MIME 타입을 가져오기
		// * MIME 타입 : 클라이언트에게 전송된 문서의 다양성을 표현하기위한 메커니즘.
		String sMimeType = getServletContext().getMimeType(sFilePath);
		
		System.out.println("sMimeType =>> " + sMimeType);
		
		// MIME 타입이 없을경우 기본값으로 지정
		if(sMimeType == null){
			sMimeType = "application/octet-stream";
		}
		
		// 응답할 페이지에 MIME타입을 지정 (jsp MIME 타입 -> 다운로드파일 MIME 타입으로 변경)
		response.setContentType(sMimeType);
		
		// * 사용자의 브라우저를 확인 (IE 여부)
		// ie 다운로드시 한글파일의 이름이 깨짐, 공백문자가 "+" 처리됨
		// => 변경처리
		
		// 해더에서 사용정보를 가져오기
		String agent = request.getHeader("User-Agent");
		
		System.out.println("사용자 정보 : " + agent);
		
		// 사용자 정보안에 "MSIE", "Trident" 있을 경우
		boolean ieBrowser = (agent.indexOf("MEIE")>-1 || agent.indexOf("Trident") > -1);
		
		
		// 익스플로러는 한글처리를 위해서 인코딩을 UTF-8로 변경, +기호를 공백(%20)으로 변경
		if(ieBrowser){
			fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
		}else{
			// 모든 브라우저들 한글 깨짐 방지 (인코딩 방식 변경)
			fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
		}
		
		
		/////////////////////////////////////////////////////////////////////
		// 모든 파일이 다운로드 형태로 처리 설정
		// => 브라우저에서 해석되는 파일도 다운로드 처럼 처리하기 위한 설정
		// "content-Disposition", "attachment;"
		response.setHeader("Content-Disposition", "attachment; filename= " +fileName);
		
		// 다운로드
		// 브라우저를 사용해서 밖으로 출려갛ㄹ 수 있는 통로 생성
		ServletOutputStream out2 = response.getOutputStream();
		
		int numRead;
		
		while((numRead = fis.read(b, 0, b.length)) != -1){
			out2.write(b,0,numRead);
		}
		
		out2.flush(); // 버퍼의 빈 공백을 채워서 데이터 전달 방법.
		out2.close();
		fis.close();
		%>

</body>
</html>