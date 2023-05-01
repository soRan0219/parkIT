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
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//디비연결
	private void getCon() throws Exception{
		Context init = new InitialContext(); //업캐스팅
		// 고정문구"java:comp/env/다른문구context파일의 name값입력"
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/project");
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

}//DAO
