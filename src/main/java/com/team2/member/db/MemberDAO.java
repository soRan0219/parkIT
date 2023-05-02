package com.team2.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.team2.member.db.MemberDTO;

// DB에 연결해서 처리하는 모든동작 수행
public class MemberDAO {
	// 공통변수 선언
	private Connection con = null;  		//디비 연결정보 저장(관리)
	private PreparedStatement pstmt = null; //SQL 작성, 실행
	private ResultSet rs = null; 			//select결과 데이터 저장
	private String sql ="";					//SQL구문 저장

	//디비 연결 메서드
	private Connection getCon() throws Exception{
		// Context 객체생성
		Context initCTX = new InitialContext();
		// 디비연결정보 불러와서 사용
		DataSource ds 
		   = (DataSource) initCTX.lookup("java:comp/env/jdbc/mvc7");
		// 디비연결
		con = ds.getConnection();
		System.out.println(" DAO : 디비연결 성공! "+con);
		
		return con;
	}
	
	// 자원해제
	public void closeDB() {
		try {
			if(rs != null)  rs.close();
			if(pstmt != null)  pstmt.close();
			if(con != null)  con.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	//----------------------------------------------------------------------------	
	// 회원가입 - memberJoin()
	public void memberJoin(MemberDTO dto) {
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. SQL작성 & pstmt 객체
			sql = "insert into itwill_member(id,pw,memName,birth,tel,email,point,regdate) "
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getMemName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getEmail());
			pstmt.setInt(7, dto.getPoint());
			pstmt.setDate(8, dto.getRegdate());
			
			// 4. SQL 실행
			pstmt.executeUpdate();
			System.out.println(" DAO : 회원가입 성공! ");			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}		
	}// 회원가입 - memberJoin()	
	
	//----------------------------------------------------------------------------	
	// 로그인 - memberLogin()
	public int memberLogin(MemberDTO dto) {
		int result = -1; // 처리결과에 따른 상태 
		                 // -1(아이디없음) 0(아이디는 있지만 비밀번호 오류) 
		                 // 1(로그인 성공)
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 작성 & pstmt 객체
			sql = "select pw from team2_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				// rs.next()는 회원이라는 뜻
				if(dto.getPw().equals(rs.getString("pw"))) {
					// 본인
					result = 1;
				} else {
					// 비밀번호 오류
					result = 0;
				}
			} else {
				// 비회원이라는 뜻
				 result = -1;
			}
		
			System.out.println(" DAO : 로그인 처리 결과" + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}// 로그인 - memberLogin()
	

	
	
	

}//DAO