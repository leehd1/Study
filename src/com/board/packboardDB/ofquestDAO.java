package com.board.packboardDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ofquestDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	packnoboardDTO bdto=null;
	String sql="";
	
	private Connection getConnection() throws Exception{
		Context inti=new InitialContext();
		DataSource ds=(DataSource)inti.lookup("java:comp/env/jdbc/jspbeginner");
		con=ds.getConnection();
		return con;
	}
	public void freeResource(){
	      if(con != null){
	         try {
	            con.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      if(rs != null){
	         try {
	            rs.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      if(pstmt != null){
	         try {
	            pstmt.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	   }
	
	public List<ofquestDTO> ofquest(String search1, String search2) {
		System.out.println(search1);
		System.out.println(search2);
		List<ofquestDTO> list = new ArrayList<>();
		try {
			con = getConnection();
			String sql = "select * from ofquest where ofcate2=? and ofcate1=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search1);
			pstmt.setString(2, search2);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ofquestDTO dto = new ofquestDTO();
				dto.setOfcate1(rs.getString("ofcate1"));
				dto.setOfcate2(rs.getString("ofcate2"));
				dto.setOfcontent(rs.getString("ofcontent"));
				dto.setOftitle(rs.getString("oftitle"));
				
				list.add(dto);
			
			}
			freeResource();
		} catch (Exception e) {
			System.out.println("ofquest()매소드 에러 "+e.getMessage());
		}
		return list;
	}
	
}
