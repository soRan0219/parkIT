package com.team2.notice.db;

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
public class NoticeDAO {
	private Connection con = null;
	private String sql = "";
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	
	//디비연결
	private Connection getCon() throws Exception{
		Context initCTX = new InitialContext(); //업캐스팅
		// 고정문구"java:comp/env/다른문구context파일의 name값입력"
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/c7d2301t2");
		
		con = ds.getConnection();
		
		System.out.println("DAO: 디비연결성공"+con);
		
		return con;
	}//getCon
	
	
	
	//자원해제 메서드 구현
	public void closeDB(){
		try{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}//closeDB
	
	
	
	// 공지 글쓰기
	public void insertNotice(NoticeDTO dto) throws Exception{

		con = getCon();
		
		sql = "select max(noticeNo) from notice";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		int noticeNo = 0;
		
		if(rs.next()) {
			noticeNo = rs.getInt(1)+1; // 인덱스 사용 호출
		}
		
		System.out.println("noticeNo : " + noticeNo);
		
		// 정보 저장(글쓰기)
		sql = "insert into notice(noticeNo,noticeTitle,noticeContents,noticeDate,noticeRc,noticeFile) values(?,?,?,now(),?,?)";
		pstmt = con.prepareStatement(sql);
		
		
		// noticeNo,noticeTitle,noticeContents,noticeRc,noticeFile
		pstmt.setInt(1, noticeNo);
		pstmt.setString(2, dto.getNoticeTitle());
		pstmt.setString(3, dto.getNoticeContents());
		pstmt.setInt(4, 0); // 조회수는 0으로 초기화
		pstmt.setString(5, dto.getNoticeFile());
	
		
		// sql 실행
		pstmt.executeUpdate();
		System.out.println(noticeNo +"번 글쓰기 완료! ");
		
		closeDB();
		
	} // 글쓰기
	
	
	// 글 마지막 번호 받아오기
	public int getMaxNoticeCount() {
		int cnt = 0;
		
		try {
			getCon();
			sql= "SELECT max(noticeNo) FROM notice;";
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
	} // 글 마지막 번호 받아오기
	
	
	
	// 공지 카운트
	public int getNoticeCount() {
		int cnt = 0;
		
		try {
			getCon();
			sql="select count(*) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			System.out.println("DAO : DB에 저장된 공지 글의 수 " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return cnt;
	} // 공지 카운트
	
	
	
	// 게시글 불러오기
	public List<NoticeDTO> getNoticeList(int startRow, int pageSize) {
		
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>(); // 업캐스팅
		
		try {
			con = getCon();
			sql = "select * from notice"
					+ " order by noticeNo DESC limit ?, ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1); // 시작위치 (1, 2, ...페이지 => 0, 10, ...)
			pstmt.setInt(2, pageSize); // 페이지당 글 개수
			
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setNoticeTitle(rs.getString("noticeTitle"));
				dto.setNoticeContents(rs.getString("noticeContents"));
				dto.setNoticeDate(rs.getDate("noticeDate"));
				dto.setNoticeRc(rs.getInt("noticeRc"));
				dto.setNoticeFile(rs.getString("noticeFile"));
				
				noticeList.add(dto);
				
			}
			
			System.out.println("DAO : 공지 글 저장완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return noticeList;
	} // 게시글 불러오기

	
	// 특정 글만 조회수 1 증가
	public void updateNoticeRc(int noticeNo) {
		try {
			con = getCon();
			sql = "update notice set noticeRc=noticeRc+1 where noticeNo=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			int cnt = pstmt.executeUpdate(); // int 타입으로 몇개가 업데이트 되었는지 리턴 => 1개가 정상
			
			if(cnt==1) {
			System.out.println(noticeNo + "번 공지 조회수 1증가");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	} // 특정 글만 조회수 1 증가
	
	
	// n번 글 조회
	public NoticeDTO getNotice(int noticeNo) {
		NoticeDTO dto = null;
		
		try {
			con = getCon();
			sql = "select * from notice where noticeNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new NoticeDTO();
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setNoticeContents(rs.getString("noticeContents"));
				dto.setNoticeDate(rs.getDate("noticeDate"));
				dto.setNoticeFile(rs.getString("noticeFile"));
				dto.setNoticeTitle(rs.getString("noticeTitle"));
				dto.setNoticeRc(rs.getInt("noticeRc"));
			}
			System.out.println("DAO : 글 정보 저장완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
	} // 글 내용보기
	
	
	// 글 삭제하기
	public void deleteNotice(int noticeNo) {
		
		try {
			con = getCon();
			
			sql = "DELETE FROM notice WHERE noticeNo = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			pstmt.executeUpdate();
			
			System.out.println("deleteNotice 작업 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	} // 글 삭제하기
	
	
	// 글 수정하기
	public void updateNotice(NoticeDTO dto) {
		
		try {
			con = getCon();
			sql = "UPDATE notice SET noticeTitle=?, noticeContents=?, noticeFile=? WHERE noticeNo = ?; ";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNoticeTitle());
			pstmt.setString(2, dto.getNoticeContents());
			pstmt.setString(3, dto.getNoticeFile());
			pstmt.setInt(4, dto.getNoticeNo());
			
			pstmt.executeUpdate();
			
			System.out.println(dto.getNoticeNo() + "번 글 DB 수정 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	
	// 제목 + 내용으로 검색된 공지글 개수를 반환하는 메서드
	public int getSearchNoticeCount(String keyWord) {
	    int count = 0;
	    
	    try {
	        con = getCon();
	        String sql = "SELECT COUNT(*) FROM notice WHERE noticeTitle LIKE ? or noticeContents LIKE?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, "%" + keyWord + "%");
	        pstmt.setString(2, "%" + keyWord + "%");

	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            count = rs.getInt(1);
	        } System.out.println("카운트" + count);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        closeDB();
	    }
	    
	    return count;
	}
	
	
	// 제목 + 내용검색 리스트 반환
	public List<NoticeDTO> getSearchNoticeList(String keyWord, int startRow, int pageSize) {
		List<NoticeDTO> searchNoticeList = new ArrayList<NoticeDTO>();
			
		try {
			con = getCon();
				
			sql = "select * from notice where noticeTitle like ? or noticeContents like? order by noticeNo DESC limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyWord + "%");
			pstmt.setString(2, "%" + keyWord + "%");
			pstmt.setInt(3, startRow-1); 
			pstmt.setInt(4, pageSize); 
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setNoticeTitle(rs.getString("noticeTitle"));
				dto.setNoticeContents(rs.getString("noticeContents"));
				dto.setNoticeDate(rs.getDate("noticeDate"));
				dto.setNoticeRc(rs.getInt("noticeRc"));
				dto.setNoticeFile(rs.getString("noticeFile"));
					
				searchNoticeList.add(dto);
				System.out.println("dao 리스트 사이즈" + searchNoticeList.size());
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return searchNoticeList;
		
	} // 제목 + 내용검색 리스트 반환
	
	


}//DAO
