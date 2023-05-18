package com.team2.reservation1.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
import com.team2.admin.db.ParkingDTO;
import com.team2.admin.db.ResDTO;
import com.team2.parkingdetail.db.PDetailDTO;



public class ResDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private String sql = "";
	private ResultSet rs = null;
	private JsonArray jsonArray = null;
	
	public Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/c7d2301t2");
		con = ds.getConnection();
		
		System.out.println("DAO: DB 연결 성공 " + con);
		
		return con;
	} //getCon()
	
	public void closeDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	} //closeDB()

	
	
	
	
	//주차장 정보 조회
	public ParkingDTO getParking(String parkingCode) {
		ParkingDTO pDto = new ParkingDTO();
		
		try {
			con = getCon();
			
			sql = "SELECT parkingName,parkingAdr,inOutDoor,parkingTel FROM parking WHERE parkingCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, parkingCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//주차장 DB에 있음
				pDto.setParkingCode(parkingCode);
				pDto.setInOutDoor(rs.getString("inOutDoor"));
				pDto.setParkingAdr(rs.getString("parkingAdr"));
				pDto.setParkingName(rs.getString("parkingName"));
				pDto.setParkingTel(rs.getString("parkingTel"));
				
				System.out.println("DAO: 주차장 정보 저장 완료");
			} else {
				//주차장 DB에 없음
				System.out.println("DAO: 주차장 정보 DB에 없음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		} //try
		
		return pDto;
	} //getParking()
	
	//주차장 모든 자리 A1/ A2 / A3 ...
	public List<PDetailDTO> getAllParkingDetail(String ParkingCode) {
		List<PDetailDTO> allList = new ArrayList<>(); 
		
		try {
			con = getCon();
			
			sql = "SELECT * FROM parkingDetail WHERE parkingCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ParkingCode);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PDetailDTO pDto = new PDetailDTO();
				pDto.setParkingCode(ParkingCode);
				pDto.setParkingPosition(rs.getInt("parkingPosition"));
				allList.add(pDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return allList;
	} //getAllParkingDetail
	
	
	
	// 사용중인 자리 조회
	public List<ResDTO> getAvailable(String parkingCode, String parkInTime, String parkOutTime, Date resDate) {
		List<ResDTO> available = new ArrayList<>();
		
		try {
			con = getCon();
			
			// resDate를 문자열로 변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String resDateStr = sdf.format(resDate);
			
			sql = "SELECT parkingCode, parkingPosition, resStatus"
					+ " FROM reservation"
					+ "  WHERE parkingCode=? AND resDate=?"
					+ " AND ((? <= parkInTime AND parkInTime < ?)"
					+ " OR (? < parkOutTime AND parkOutTime <= ?));";
			
			parkInTime = parkInTime + ":00"; // 11:30 형태를 11:30:00 으로 변경
			parkOutTime = parkOutTime + ":00";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, parkingCode);
			pstmt.setString(2, resDateStr);
			pstmt.setTime(3, Time.valueOf(parkInTime)); // 11:30:00 을 Time 객체로 변경
	        pstmt.setTime(4, Time.valueOf(parkOutTime));
	        pstmt.setTime(5, Time.valueOf(parkInTime));
	        pstmt.setTime(6, Time.valueOf(parkOutTime));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ResDTO resdto = new ResDTO();
				
				resdto.setParkingCode(rs.getString("parkingCode"));
				resdto.setParkingPosition(rs.getInt("parkingPosition"));
				resdto.setResStatus(rs.getInt("resStatus"));
				
				available.add(resdto);
			} //while
			
			System.out.println("DAO: 예약 가능한 자리 조회 완료");
			System.out.println(available.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		} //try
		
		return available;
	} //getAvailable()

	
//	//이용시간에 따른 예상금액
//	public int getPrice(Time parkInTime, Time parkOutTime) {
//		int result = 0;
//		
//		try {
//			con = getCon();
//			
//			sql = "SELECT "
//					+ " (time_to_sec(timediff(?,?))/(30*60))*1000";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setTime(1, parkOutTime);
//			pstmt.setTime(2, parkInTime);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				result = rs.getInt(1);
//			}
//			
//			System.out.println("DAO: 예상 결제 금액 - " + result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
//		
//		return result;
//	} //getPrice()
	
	
	
	
	
	
} //resDAO

