package com.team2.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class faqDAO {

	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//디비연결
	private void getCon() throws Exception{
		Context init = new InitialContext(); //업캐스팅
		// 고정문구"java:comp/env/다른문구context파일의 name값입력"
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/class7_230118_team2");
		con = ds.getConnection();
		System.out.println("DAO: 디비연결성공"+con);
	}//getCon닫음
	
	//자원해제 메서드 구현
	public void closeDB(){
		try{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}//closeDB닫음
	
	// 글쓰기
		public int insertFaq(faqDTO dto) {
			int result = 0;
			int faqNumber = 0;
			
			try {
				getCon();
				sql = "select max(faqNumber) from notice";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					faqNumber = rs.getInt(1)+1; // 인덱스 사용 호출
				}
				System.out.println("DAO : 글번호 " + faqNumber);
				
				// 정보 저장(글쓰기)
				sql = "insert into notice(faqNumber,faqTitle,faqContents,faqDate) values(?,?,?,now())";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, faqNumber);
				pstmt.setString(2, dto.getFaqTitle());
				pstmt.setString(3, dto.getFaqContents());
				
				// sql 실행
				result = pstmt.executeUpdate();
				System.out.println(" 글쓰기 완료! ");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return result;
		} // 글쓰기
}
