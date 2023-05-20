package com.team2.question.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.team2.faq.db.FaqDTO;
import com.team2.question.db.QuestionDTO;


public class QuestionDAO {
	// DAO  (Data Access Object) : DB 데이터 처리 객체
	// => DB에 관한 모든 동작  수행
	
	// 공통사용 변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 디비연결에 대한 모든 처리 
	private Connection getCon() throws Exception {
		// 0 - 디비 연결정보 (context.xml)
		// 1 드라이버로드 2 디비연결
		Context initCTX = new InitialContext();
		DataSource ds 
		       = (DataSource) initCTX.lookup("java:comp/env/jdbc/c7d2301t2");
		con = ds.getConnection();
		System.out.println(" DAO : 디비 연결 성공(CP) ");
		System.out.println(" DAO : "+con);
		return con;
	}//getCon()
	
	//  디비 자원해제 
	public void closeDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	

	public void insertQuestion(QuestionDTO dto) throws Exception {

		//1.2 디비연결
		con = getCon();
		
		// 3.sql 작성 & pstmt 객체
		// quNo 계산
		String sql = "select max(quNo) from qu";
		PreparedStatement pstmt = con.prepareStatement(sql);

		// 4.sql 실행
		ResultSet rs = pstmt.executeQuery();

		// 5. 데이터 처리 (글번호 최대값 + 1)
		int quNo = 0;
		if (rs.next()) {
			// 데이터가 sql null 인경우 0을 리턴
			// 내장함수 호출시 가능한 컬럼명보단, 인덱스 접근이 유리하다.
			quNo = rs.getInt(1) + 1;
			// quNo = rs.getInt("max(quNo)")+1;
		}

		System.out.println("quNo : " + quNo);

		// 정보 저장( 글쓰기 )
		// 3. sql(insert) - pstmt
		sql = "INSERT INTO qu (quNo, quTitle, quContents, quDateTime, id, selOp) VALUES (?, ?, ?, NOW(), ?, ?)";
	    pstmt = con.prepareStatement(sql);

		pstmt.setInt(1, quNo);
		pstmt.setString(2, dto.getQuTitle());
		pstmt.setString(3, dto.getQuContents());
		pstmt.setString(4, dto.getId());
		pstmt.setString(5, dto.getSelOp());


		// 4. sql
		pstmt.executeUpdate();

		System.out.println(" 글쓰기 완료! ");
		
		closeDB();

	} // insertBoard()
	
	public void reWriteQuestion(QuestionDTO dto) throws Exception {
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        // 1. 디비 연결
	        con = getCon();

	        // 2. 글번호 계산
	        String getMaxQuNoSql = "SELECT MAX(quNo) FROM qu";
	        pstmt = con.prepareStatement(getMaxQuNoSql);
	        ResultSet rs = pstmt.executeQuery();

	        int quNo = 0;
	        if (rs.next()) {
	            quNo = rs.getInt(1) + 1;
	        }

	        System.out.println("quNo: " + quNo);

	        // 3. INSERT 문 실행
	        String insertSql = "UPDATE qu SET quContentsRe = ? WHERE quNo = ?";
	        pstmt = con.prepareStatement(insertSql);	        
	        pstmt.setString(1, dto.getQuContentsRe());
	        pstmt.setInt(2, dto.getQuNo());

	        pstmt.executeUpdate();

	        // 4. UPDATE 문 실행
	        String updateSql = "UPDATE qu SET quNoRe = ? WHERE quNo = ?";
	        pstmt = con.prepareStatement(updateSql);
	        pstmt.setInt(1, 1);
	        pstmt.setInt(2, dto.getQuNoRe());

	        pstmt.executeUpdate();

	        System.out.println("질문 재작성 및 업데이트 완료!");
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 5. 리소스 해제
	        if (pstmt != null) {
	            pstmt.close();
	        }
	        if (con != null) {
	            con.close();
	        }
	    }
	}
	// getBoardListAll()
	/**
	 * 디비에 저장된 모든 게시판 정보를 조회
	 * 
	 * @return ArrayList 형태로 리턴
	 */
	public ArrayList getQuestionListAll() throws Exception {

		//List boardList = new ArrayList();
		ArrayList quList = new ArrayList();
		
		// 디비연결정보 (상수)
		con = getCon();

		// 3. SQL 작성(select) & pstmt 객체
		String sql = "select * from qu "
				+ " where quNo > 0 "
				+ " order by quNo desc";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		
		// 4. SQL 실행
		ResultSet rs = pstmt.executeQuery();
		// 5. 데이터 처리 
		//    DB(rs) -> DTO -> ArrayList
		//    1 row -> 1 DTO -> 1 ArrayList
		while(rs.next()) {
			//rs -> dto
			QuestionDTO dto = new QuestionDTO();
			dto.setQuNo(rs.getInt("quNo"));
			dto.setSelOp(rs.getString("selOp"));
			dto.setId(rs.getString("id"));
			dto.setQuTitle(rs.getString("quTitle"));
			dto.setQuContents(rs.getString("quContents"));
			dto.setQuDateTime(rs.getTimestamp("quDateTime").toLocalDateTime());	
			// dto 1개 -> list 1칸에 저장`
			quList.add(dto);			
		}// while	
		
		System.out.println(" DAO : 게시판 글 정보 모두 저장완료! ");
		closeDB();
		
		return quList;
	}
	// getBoardListAll()
	
	
	// getBoardList()
	/**
	 * 디비에 저장된 모든 게시판 정보를 조회
	 * 커넥션풀 사용
	 * @return ArrayList 형태로 리턴
	 */
public List<QuestionDTO> getQuestionList(int startRow, int pageSize) {
		
		List<QuestionDTO> quList = new ArrayList<QuestionDTO>(); // 업캐스팅
		
		try {
			con = getCon();
			sql = "select * from qu"
					+ " order by quNo DESC limit ?, ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1); // 시작위치 (1, 2, ...페이지 => 0, 10, ...)
			pstmt.setInt(2, pageSize); // 페이지당 글 개수
			
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setQuNo(rs.getInt("quNo"));
				dto.setSelOp(rs.getString("selOp"));
				dto.setId(rs.getString("id"));
				dto.setQuTitle(rs.getString("quTitle"));
				dto.setQuContents(rs.getString("quContents"));
				dto.setQuDateTime(rs.getTimestamp("quDateTime").toLocalDateTime());
				dto.setQuNoRe(rs.getInt("quNoRe"));
				dto.setQuContentsRe(rs.getString("quContentsRe"));

				
				quList.add(dto);
				
			}
			
			System.out.println("DAO : 공지 글 저장완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return quList;
	}
	// getBoardList()
	
	// getBoardCount()
	public int getquCount() {
		int result = 0;
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. SQL 작성 & pstmt 객체
			sql = "select count(*) from qu";
			pstmt = con.prepareStatement(sql);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println(" DAO : 전체 글 개수 - "+result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// getBoardCount()
	
	// getBoard(quNo)
	public QuestionDTO getqu(int quNo){
		QuestionDTO dto=null;
		//BoardDTO dto=new BoardDTO();
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql(select) & pstmt
			// sql - quNo에 해당하는 모든 글의 정보 조회
			sql = "select * from qu where quNo=?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setInt(1, quNo);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리	
			
			if(rs.next()) {
				// 데이터 저장 (rs -> DTO)
				dto = new QuestionDTO();
				
				dto.setQuNo(rs.getInt("quNo"));
				dto.setSelOp(rs.getString("selOp"));
				dto.setId(rs.getString("id"));
				dto.setQuTitle(rs.getString("quTitle"));
				dto.setQuContents(rs.getString("quContents"));
				dto.setQuDateTime(rs.getTimestamp("quDateTime").toLocalDateTime());
				dto.setQuContentsRe(rs.getString("quContentsRe"));
			
				
				System.out.println(" DAO : "+quNo+"번  글정보 저장완료!");
			}// if
			
		} catch (Exception e) {
			System.out.println(" DAO :  getqu(quNo) 메서드 실행 에러!!!!! ");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
	// getBoard(quNo)
	
	public int getMaxQuestionCount() {
		int cnt = 0;
		
		try {
			getCon();
			sql= "SELECT max(quNo) FROM qu;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			System.out.println("DAO : DB에 저장된 마지막 공지글 번호 " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return cnt;
	} 
	
	
	
	// updateReadcount(quNo)
	
	// updateBoard(dto)
	
	
	// deleteBoard(dto)
	public int deleteQuestion(int quNo) {
		int result = -1;
		System.out.println("delete시작");
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql(select) & pstmt 객체
			// dto(삭제할 글)가 실제로 있는지 체크 
			sql = "select * from qu where quNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, quNo);
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리 (정보 수정)
			if(rs.next()) {
				//글이 있다
					// 본인O - 정보 삭제
					// 3. sql & pstmt
					sql = "delete from qu where quNo=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, quNo);					
					// 4. sql 실행
					result = pstmt.executeUpdate();
					//result = 1;					
			
			System.out.println(" DAO : 글 삭제완료! ("+result+")");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// deleteBoard(dto)
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

}// DAO
