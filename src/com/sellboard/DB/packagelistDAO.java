package com.sellboard.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.board.packboardDB.packnoboardDTO;

public class packagelistDAO {
	
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
	/* 패키지 고유번호 매소드*/
	public long package_no(String start_date){
	      long package_no = 0;
	      try {
	         sql = "SELECT package_no FROM packagelist where availability_start_date=? order by 1 desc";
	         
	         con = getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, start_date);
	         rs = pstmt.executeQuery();
	         
	         if (rs.next()) {
	        	 package_no = rs.getLong(1);
	         }
	         freeResource();
	      } catch (Exception e) {
	         System.out.println("package_no()매소드 오류 " + e.getMessage());
	      }
	      System.out.println("pack_no매소드에서 받은번호 :"+package_no);
	      return package_no;
	   }
	/* 하나의 패키지의 모두 총괄할 패키지 번호 매소드*/
	public int package_total_no(){
		int package_total_no = 0;
		try {
			sql = "select package_total_no from packagelist order by 1 desc";
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				package_total_no = rs.getInt(1);
			}
			freeResource();
		} catch (Exception e) {
			System.out.println("package_total_no()매소드 오류 "+e.getMessage());
		}
		
		return package_total_no; 
	}
	/* 상품 insert 매소드*/
	public void sellboardinsert(packagelistDTO dto){
		try {
			con = getConnection();
			String sql = "insert into packagelist(package_no, travel_period, availability_start_date, availability_end_date"
					+", reservation_no, min_start_no, now_reservation_no, travel_agency_no, product_subject, product_simple_info"
					+", product_info, package_price_Adult, package_price_child, package_price_baby, airplane_no, package_img_src"
					+", package_realimg_src, packageterm, selldate, package_total_no) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPackage_no());
			pstmt.setInt(2, dto.getTravel_period());
			pstmt.setString(3, dto.getAvailability_start_date());
			pstmt.setString(4, dto.getAvailability_end_date());
			pstmt.setInt(5, dto.getReservation_no());
			pstmt.setInt(6, dto.getMin_start_no());
			pstmt.setInt(7, dto.getNow_reservation_no());
			pstmt.setInt(8, dto.getTravel_agency_no());
			pstmt.setString(9, dto.getProduct_subject());
			pstmt.setString(10, dto.getProduct_simple_info());
			pstmt.setString(11, dto.getProduct_info());
			pstmt.setInt(12, dto.getPackage_price_Adult());
			pstmt.setInt(13, dto.getPackage_price_child());
			pstmt.setInt(14, dto.getPackage_price_baby());
			pstmt.setString(15, dto.getAirplane_no());
			pstmt.setString(16, dto.getPackage_img_src());
			pstmt.setString(17, dto.getPackage_realimg_src());
			pstmt.setInt(18, dto.getPackageterm());
			pstmt.setTimestamp(19, dto.getSelldate());
			pstmt.setInt(20, dto.getPackage_total_no());
			pstmt.executeUpdate();
			
			freeResource();
		} catch (Exception e) {
			System.out.println("sellboardinsert()매소드 에러 "+e.getMessage());
		}
	}
	
	public packagelistDTO getpackagelist(){
		packagelistDTO dto = new packagelistDTO();
		try {
			String sql = "select * from packagelist where package_total_no = 11 order by 1 desc";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			dto.setProduct_info(rs.getString("product_info"));
			dto.setAvailability_start_date(rs.getString("availability_start_date"));
			dto.setPackage_realimg_src(rs.getString("package_realimg_src"));
			dto.setPackage_img_src(rs.getString("package_img_src"));
			dto.setProduct_simple_info(rs.getString("product_simple_info"));
			freeResource();
		} catch (Exception e) {
			System.out.println("getpackagelist()매소드 에러 "+e.getMessage());
		}
		return dto;
	}

}
