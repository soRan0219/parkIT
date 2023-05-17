package com.team2.parkingdetail.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PDetailDAO {
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
		   = (DataSource) initCTX.lookup("java:comp/env/jdbc/c7d2301t2");
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
	
	//주차장 코드에 따른 전체 자리 수 불러오기
	public int getAllPositions(String parkingCode) {
		int result = 0;
		
		try {
			con = getCon();
			
			sql = "SELECT count(*) "
					+ " FROM parkingDetail "
					+ " WHERE parkingCode=? "
					+ " GROUP BY parkingCode";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, parkingCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			System.out.println("DAO: 모든 자리 조회 완료 - " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	} //getAllPositions()
	
	//주차장 코드에 따른 현재 예약 가능한 자리 수
	public int getAvailablePositions(String parkingCode, Date date, Time time) {
		int result = 0;
		
		try {
			con = getCon();
			
			sql = "SELECT count(*) "
					+ " FROM parkingDetail "
					+ " WHERE parkingCode=? "
					+ " AND parkingPosition NOT IN "
					+ " ( "
					+ " SELECT parkingPosition "
					+ " FROM reservation "
					+ " WHERE parkingCode=? "
					+ " AND resDate=? "
					+ " AND parkInTime<=? AND parkOutTime>=? "
					+ " AND resStatus=1 "
					+ " ) "
					+ " GROUP BY parkingCode";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, parkingCode);
			pstmt.setString(2, parkingCode);
			pstmt.setDate(3, date);
			pstmt.setTime(4, time);
			pstmt.setTime(5, time);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			System.out.println("DAO: 예약 가능한 자리 수 - " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	} //getAvailablePositions()
	
	
} //PDetailDAO
