package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

	// Data Access Object : DB 데이터 처리 객체
	// => DB에 관련된 모든 동작을 수행하는 객체
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 디비에 필요한 정보
	private Connection getConnection() {
		// // 1, 2단계
		//
		// // 디비 연결 지역변수
		// final String DRIVER = "com.mysql.jdbc.Driver";
		// final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		// final String DBID = "root";
		// final String DBPW = "1234";
		//
		// try {
		//
		// Class.forName(DRIVER);
		// conn = DriverManager.getConnection(DBURL,DBID, DBPW);
		//
		// } catch (ClassNotFoundException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// } catch (SQLException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		// Context 객체를 생성
		try {
			// Context 객체를 생성 ( 프로젝트 정보를 가지고 있는 객체 )
			Context initCTX = new InitialContext();

			// DB연동 정보를 불러오기(context.xml)
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");

			conn = ds.getConnection();

			System.out.println(" 드라이버로드, 디비연결 성공! ");
			System.out.println(conn);

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	} // getConnection()

	// 자원 해제 코드 - finally 구문에서 쓰인다.
	public void closeDB() {
		// 자원 해제
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 글쓰기 동작 => 메소드 insertBoard
	// public void insertBoard(BoardBean bb){
	//
	// try {
	// // 1 드라이버 로드
	// Class.forName(DRIVER);

	// // 2 디비 연결
	// conn = DriverManager.getConnection(DBURL, DBID, DBPW);

	// // 3 sql 작성 (insert) & pstmt 객체 생성
	// sql = "insert into itwill_board values(?, ?, ?, ?, ?, ?, ?, ?, ?, now(),
	// ?, ?)";
	//
	// pstmt = conn.prepareStatement(sql);
	//
	// pstmt.setInt(1, 1);
	// pstmt.setString(2, bb.getName());
	// pstmt.setString(3, bb.getPass());
	// pstmt.setString(4, bb.getSubject());
	// pstmt.setString(5, bb.getContent());
	// pstmt.setInt(6, bb.getReadcount());
	// pstmt.setInt(7, bb.getRe_ref());
	// pstmt.setInt(8, bb.getRe_lev());
	// pstmt.setInt(9, bb.getRe_seq());
	// pstmt.setString(10, bb.getIp());
	// pstmt.setString(11, bb.getFile());
	//
	// // 4 sql 실행
	//
	// pstmt.executeUpdate();
	//
	// System.out.println("sql구문 실행 완료 : 글쓰기 완료" );
	//
	//
	//
	// } catch (ClassNotFoundException e) {
	// System.out.println("드라이버 로드 실패 !!");
	// e.printStackTrace();
	// } catch (SQLException e) {
	// System.out.println("디비 연결 실패 !!");
	// e.printStackTrace();
	// }
	//
	// }

	public void insertBoard(BoardBean bb) {

		int num = 0;

		try {
			// 1 드라이버 로드
			// 2 디비 연결
			// => 한번에 처리하는 메소드로 변경
			conn = getConnection();

			// 3 sql (글 번호를 계산하는 구문)
			sql = "select max(num) from itwill_board";

			pstmt = conn.prepareStatement(sql);

			// 4 sql 실행
			rs = pstmt.executeQuery();

			// 5 데이터 처리
			// max(num) - sql 함수를 실행했을 경우 커서 이동 가능(데이터 여부 상관없음)
			// num - sql 칼럼의 경우 커서 이동 불가능
			if (rs.next()) {
				// num = rs.getInt("mxa(num)") + 1;
				num = rs.getInt(1) + 1;
			}

			System.out.println(" 글 번호 : " + num);

			// 3 sql 작성 (insert) & pstmt 객체 생성
			sql = "insert into itwill_board values(?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setInt(7, num); //re_ref에 글 번호 num 저장
			pstmt.setInt(8, bb.getRe_lev());
			pstmt.setInt(9, bb.getRe_seq());
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());

			// 4 sql 실행

			pstmt.executeUpdate();

			System.out.println("sql구문 실행 완료 : 글쓰기 완료");

		} catch (SQLException e) {
			System.out.println("디비 연결 실패 !!");
			e.printStackTrace();
		} finally {
			// 자원해제
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	} // insertBoard()

	// 디비에 들어있는 글의 개수를 계산한 후 리턴하는 동작을 수행
	public int getBoardCount() {

		int cnt = 0;

		try {
			// 1, 2 드라이버로드, 디비연결
			conn = getConnection();

			// 3 sql 작성(select) & pstmt 객체 생성
			sql = "select count(*) from itwill_board";

			pstmt = conn.prepareStatement(sql);

			// 4 sql 실행
			rs = pstmt.executeQuery();

			// 5 데이터 처리
			if (rs.next()) {
				cnt = rs.getInt(1);
			} // try

			System.out.println("SQL 구문 실행 완료!");
			System.out.println(" 글 개수 : " + cnt + "개");

		} catch (Exception e) {
			System.out.println(" 게시판 글 개수 에러 발생 !!");
			e.printStackTrace();
		} finally {

			closeDB();

		}

		return cnt;

	} // getBoardCount()

	public ArrayList getBoardList() {
		// DB데이터 1행의 정보를 BoardBean에 저장 -> ArrayList 한칸에 저장

		// 게시판의 글 정보를 모두 저장하는 가변길이 배열
		ArrayList BoardListAll = new ArrayList();

		// 게시판 글 1개의 정보를 저장하는 객체
		BoardBean bb = null;

		try {
			// 1, 2 드라이버 로드, 디비 열결
			conn = getConnection();

			// 3sql 구문 & pstmtm객체
			sql = "select * from itwill_board";

			//
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 5 데이터 처리
			while (rs.next()) {
				// 데이터 있을 때 bb 객체 생성
				bb = new BoardBean();

				// DB정보를 Bean에 저장하기
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));

				// Bean -> ArrayList 한칸에 저장
				BoardListAll.add(bb);

			} // while
			
			System.out.println(" 게시판 모든 정보 저장완료 ");
			System.out.println(" 총 " + BoardListAll.size() + " 개");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return BoardListAll;
	 } // getBoardList()
	
	public ArrayList getBoardList(int startRow, int pageSize) {
		// DB데이터 1행의 정보를 BoardBean에 저장 -> ArrayList 한칸에 저장

		// 게시판의 글 정보를 원하는 만큼 저장하는 가변길이 배열
		ArrayList BoardList = new ArrayList();

		// 게시판 글 1개의 정보를 저장하는 객체
		BoardBean bb = null;

		try {
			// 1, 2 드라이버 로드, 디비 열결
			conn = getConnection();

			// 3sql 구문 & pstmtm객체
			// 글 정보 정렬 - re_ref 값을 최신글 위쪽으로 정렬(내림차순)
			//				- re_seq 값을 사용 (오름 차순)
			//				- limit a, b (a 시작, b 개수)
			//				ex) 1번글 -> 0번 인덱스
			
			
			sql = "select * from itwill_board "
					+ "order by re_ref desc, re_seq asc"
					+ " limit ?,?";
			

			//
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();

			// 5 데이터 처리
			while (rs.next()) {
				// 데이터 있을 때 bb 객체 생성
				bb = new BoardBean();

				// DB정보를 Bean에 저장하기
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));

				// Bean -> ArrayList 한칸에 저장
				BoardList.add(bb);

			} // while
			
			System.out.println(" 게시판 모든 정보 저장완료 ");
			System.out.println(" 총 " + BoardList.size() + " 개");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return BoardList;
	} // etBoardList();
	
	public void updateReadcount(int num){
		
		try {
		// 1,2 디비 연결
		conn = getConnection();
		
		
		// 3 sql 구문 작성(update) & pstmt 객체
		sql = "update itwill_board set readcount = readcount + 1 where num=?";
		
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		
		//4 sql 실행
		
		pstmt.execute();
		
		System.out.println("글 조회수 증가 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		
		// 4 sql 실행
		
		
	} // updateReadcount(int num)
	
	public BoardBean getBoard(int num){

		BoardBean bb = null;
		
		try {
			
			// 1, 2 디비 연결
			conn = getConnection();
			
			// 3 sql 작성(select) & pstmt 객체
			sql = "select * from itwill_board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			// 4 sql 실행
			
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리
			if(rs.next()){
				
				bb = new BoardBean();
				
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
			}
			
			System.out.println(" 글 번호에 해당하는 글정보 저장 완료");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return bb;
		

	} // getBoard(int num)
	
	public int updateBoard(BoardBean bb){
		
		int check = -1;
		
		try {
			// 1, 2 디비 연결
			conn = getConnection();
			
			// 3 sql 작성(select - 본인확인) & pstmt 객체
			sql = "select pass from itwill_board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getNum());

			//4 sql 실행

			rs = pstmt.executeQuery();
			
			//5 데이터 처리
			if(rs.next()){
				// 글이 있음
				if(bb.getPass().equals(rs.getString("pass"))){
					// 글 수정 시 입력된 비밀번호 == 글 작성 시 입력된 비밀번호 (DB)
					// 본인 글이 확인 됐습니다.
					
					// 3 sql (update-글 수정) & pstmtm 객체
					sql = "update itwill_board set subject=?, content=? where num=?";
					
					pstmt = conn.prepareStatement(sql);
					
					// ? 채우기
					pstmt.setString(1, bb.getSubject());
					pstmt.setString(2, bb.getContent());
					pstmt.setInt(3, bb.getNum());
					
					// 4 sql 실행
					pstmt.executeUpdate();
					
					check = pstmt.executeUpdate();
					
					//check = 1;
					
				}else{
					// 글은 있지만 잘못된 비밀번호
					check = 0;
				}
			}else{
				// 글이 없음
				check = -1;
			}
			
			System.out.println(" 글 수정 완료 !" + check);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		

		return check;
		
	} // updateBoard(BoardBean bb)
	
	public int deleteBoard(BoardBean bb){
		int check = -1;
		
		
		try {
			// 1, 2 디비 연결
			conn = getConnection();
			// 3 sql 생성 &pstmt 객체 생성
			sql="select pass from itwill_board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getNum());
			
			pstmt.executeQuery();
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
					sql = "delete from itwill_board where num=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, bb.getNum());
					
					check = pstmt.executeUpdate();
				}else{
					check=0;
				}
			}else{
				check = -1;
			}
			
			System.out.println("글 삭제 완료" + check);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}

		
		return check;
	} // deleteBoard(BoardBean bb)
	
	
} // class BoardDAO
