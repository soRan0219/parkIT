package com.team2.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
		   = (DataSource) initCTX.lookup("java:comp/env/jdbc/park");
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
	
	// 예약리스트
	public List<ResDTO> resList() {
		
		List<ResDTO> resList = new ArrayList<ResDTO>();
		
		try {
			// 1. 2. DB연결
			con = getCon();
			// 3. sql작성 & pstmt 객체
			sql = "SELECT * FROM reservation";
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 데이터가 있는 동안 반복해서 정보를 담음
			while(rs.next()) {
				ResDTO dto = new ResDTO();
				
				dto.setResNo(rs.getInt("resNo"));
				dto.setId(rs.getString("id"));
				dto.setResDate(rs.getDate("resDate"));
				dto.setParkInTime(rs.getTime("parkInTime"));
				dto.setParkOutTime(rs.getTime("parkOutTime"));
				dto.setParkingCode(rs.getString("parkingCode"));
				dto.setResStatus(rs.getInt("resStatus"));
				
				resList.add(dto);
			}
			
			System.out.println("예약관리");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return resList;
	} // 예약리스트
	
	
	
	// 관리자 회원리스트
	public List<Object> memberList() {
		
		List<Object> memberList = new ArrayList<Object>();
		
		try {
			// 1. 2. DB연결
			con = getCon();
			// 3. sql작성 & pstmt 객체
			sql = "SELECT m.id, memName, birth, tel, email, count(resStatus), point"
					+ " FROM member m"
					+ " JOIN reservation r on r.id = m.id WHERE resStatus =1 GROUP BY m.id;"; // sql문 띄어쓰기 !!
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 데이터가 있는 동안 반복해서 정보를 담음
			while(rs.next()) {
				MemberDTO mdto = new MemberDTO();
				ResDTO dto = new ResDTO();
				
				mdto.setId(rs.getString("id"));
				mdto.setMemName(rs.getString("memName"));
				mdto.setBirth(rs.getDate("birth"));
				mdto.setTel(rs.getString("tel"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPoint(rs.getInt("point"));
//				dto.setResStatus(rs.getInt("count(resStatus)"));
//				
//				
//				List<Object> tempList = new ArrayList<Object>();
//				tempList.add(mdto);
//				tempList.add(dto);
//				memberList.add(tempList);
				
				memberList.add(mdto);
			}
			
			System.out.println("예약관리");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return memberList;
	}
	
	
	
	
	
	
	

}//DAO
