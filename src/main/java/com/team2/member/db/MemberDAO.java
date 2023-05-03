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
	private Connection con = null;  		
	private PreparedStatement pstmt = null; 
	private ResultSet rs = null; 		
	private String sql ="";					

	//디비 연결 메서드
	private Connection getCon() throws Exception{
		Context initCTX = new InitialContext();
		DataSource ds 
		   = (DataSource) initCTX.lookup("java:comp/env/jdbc/parkIT");
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
			sql = "insert into member(id,pw,memName,birth,tel,email,regdate) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getMemName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getEmail());
			pstmt.setDate(7, dto.getRegdate());
			
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
			sql = "select pw from member where id=?";
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


	
	

	//----------------------------------------------------------------------------	
	// 회원정보 조회 - getMember()
	public MemberDTO getMember(String id) {
		
		MemberDTO dto = null; // 5. 정보를 처리하려고 
		
		try {
			// 1+2 디비연결
			con = getCon();
			
			// 3. sql & pstmt
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
				// ???
				pstmt.setString(1, id);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setMemName(rs.getString("memName"));
				dto.setBirth(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getDate("regdate"));
			}// if
			
			System.out.println("DAO : 회원정보 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return dto;
	}// 회원정보 조회 - getMember()
	
	
	
	
	
	
	//----------------------------------------------------------------------------	
	// 회원정보 수정 - memberUpdate(dto)
	public int memberUpdate(MemberDTO dto) {
		int result = -1; // -1   0   1
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql & pstmt
			sql = "select pw from member where id=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, dto.getId()); 
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				// 회원
				if(dto.getPw().equals(rs.getString("pw"))) {
					// 3. sql 작성&pstmt 객체
					sql = "update itwill_member set memName=?,birth=?,tel=? where id=?";
					pstmt = con.prepareStatement(sql); 
					// ???
					pstmt.setString(1, dto.getMemName());
					pstmt.setString(2, dto.getBirth());
					pstmt.setString(3, dto.getTel());
					// 4. sql 실행(update)
					result = pstmt.executeUpdate(); // 내가 실행시켰을 때 실행되는 행의 수를 출력하는데 id가 PK라서 1이 나올 수 밖에 없음
					
				} else {
					// 비밀번호 오류
					result = 0;
				}
			} else { 
				// 비회원
				result = -1;
			}
			
			System.out.println(" DAO : 회원정보 수정 완료(" +result+")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}// 회원정보 수정 - memberUpdate(dto)

	
	
	
	
	//----------------------------------------------------------------------------	
	// 회원정보 탈퇴 - memberDelete(id,pw)
	public int deleteMember(String id, String pw) {
		int result = -1;
		
		try {
			// 1+2 디비연결
			con = getCon();
			
			// 3. sql 작성 & pstmt 객체
			sql = "select pw from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터처리
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))) {
					// 삭제 처리
					// 3. sql 작성 & pstmt 객체
					sql = "delete from member where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					// 4. sql 실행
					result = pstmt.executeUpdate(); // 1
					
				}else {
					result = 0;
				}
				
			}else { // 회원정보 X
				result = -1;
			}
			System.out.println("DAO : 삭제 완료 "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		return result;
	}// 회원정보 탈퇴 - memberDelete(id,pw)
		

	
	
	

}//DAO