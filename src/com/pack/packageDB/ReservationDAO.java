package com.pack.packageDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReservationDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	ReservationDTO rdto=null;
	TouristDTO tdto=null;
	String sql="";
	private Connection getConnection() throws Exception{
		Context inti=new InitialContext();
		DataSource ds=(DataSource)inti.lookup("java:comp/env/jdbc/jspbeginner");
		con=ds.getConnection();
		return con;
	}
	
	public void insertTourist(TouristDTO tdto){
		
		try {
			sql = "insert into tourist values(?,?,?,?,?,?,?,?,?,?,?)";
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tdto.getReserve_no());
			pstmt.setString(2, tdto.getPackage_no());
			pstmt.setString(3, tdto.getTour_person_level());
			pstmt.setString(4, tdto.getTour_ko_name());
			pstmt.setString(5, tdto.getTour_last_name());
			pstmt.setString(6, tdto.getTour_first_name());
			pstmt.setString(7, tdto.getTour_birthday());
			pstmt.setString(8, tdto.getTour_gender());
			pstmt.setString(9, tdto.getTour_nation());
			pstmt.setString(10, tdto.getTour_passport_num());
			pstmt.setString(11, tdto.getTour_passport_end());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertTourist에러 "+e.getMessage());
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	public void insertReservation(ReservationDTO rdto){
		
		try {
			sql = "insert into reservation values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rdto.getEmail());
			pstmt.setString(2, rdto.getReader_name());
			pstmt.setString(3, rdto.getReserve_no());
			pstmt.setString(4, rdto.getPackage_no());
			pstmt.setString(5, rdto.getReserve_state());
			pstmt.setString(6, rdto.getAirplane_no());
			pstmt.setString(7, rdto.getReader_phone());
			pstmt.setString(8, rdto.getReader_number());
			pstmt.setString(9, rdto.getGuide_no());
			pstmt.setInt(10, rdto.getTotal_price());
			pstmt.setString(11, rdto.getEct());
			pstmt.setString(12, rdto.getId());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertReservation에러 "+e.getMessage());
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
	}
	
	public String searchReserve_no(){
		String reserve_no = "0";
		try {
			sql = "SELECT reserve_no FROM tourist order by 1 desc";
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				reserve_no = rs.getString(1);
			}
			
		} catch (Exception e) {
			System.out.println("searchReserve_no 오류 " + e.getMessage());
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return reserve_no;
	}
	
	public int getNowTourist(String package_no){
		
		int nowTourist = 0;
		try {
			sql = "select count(*) from tourist where package_no=?";
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, package_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				nowTourist = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getNowTourist 오류 " + e.getMessage());
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return nowTourist;
	}
	
	public List getReservation(String id){
		
		List list = new ArrayList();
		HashMap map;
		
//		ReservationDTO Rdto = new ReservationDTO();
//		PackageVO Pvo = new PackageVO();
//		AgencyVO Avo = new AgencyVO();
		try {
			sql = "select * from reservation r inner join packagelist p on r.package_no = p.package_no inner join travel_agency t on p.travel_agency_no = t.travel_agency_no where id=?";
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				map = new HashMap();
				
				map.put("email", rs.getString("email"));
				map.put("reader_name", rs.getString("reader_name"));
				map.put("reserve_no", rs.getString("reserve_no"));
				map.put("package_no", rs.getString("package_no"));
				map.put("reserve_state", rs.getString("reserve_state"));
				map.put("airplane_no", rs.getString("airplane_no"));
				map.put("reader_phone", rs.getString("reader_phone"));
				map.put("reader_number", rs.getString("reader_number"));
				map.put("guide_no", rs.getString("guide_no"));
				map.put("total_price", rs.getInt("total_price"));
				map.put("ect", rs.getString("ect"));
				map.put("id", id);
				
	            map.put("travel_agency_no", rs.getInt("travel_agency_no"));
				map.put("product_subject", rs.getString("product_subject"));
				map.put("product_simple_info", rs.getString("product_simple_info"));
				map.put("product_info", new String(rs.getBytes("product_info")));
				map.put("package_img_src", rs.getString("package_img_src"));
				map.put("reservation_no", rs.getInt("reservation_no"));
				map.put("travel_period", rs.getInt("travel_period"));
				map.put("min_start_no", rs.getInt("min_start_no"));
				map.put("package_price_baby", rs.getInt("package_price_baby"));
				map.put("package_price_child", rs.getInt("package_price_child"));
				map.put("package_price_adult", rs.getInt("package_price_adult"));
				map.put("availability_start_date", rs.getString("availability_start_date"));
				map.put("availability_end_date", rs.getString("availability_end_date"));
				
	            map.put("travel_agency_name", rs.getString("travel_agency_name"));
				map.put("travel_agency_phone_number", rs.getString("travel_agency_phone_number"));
				map.put("travel_agency_fax_number", rs.getString("travel_agency_fax_number"));
				map.put("travel_agency_email", rs.getString("travel_agency_email"));
				map.put("travel_agency_consulting_time", rs.getString("travel_agency_consulting_time"));
				
				ResultSet rs1 = null;
				
				sql = "select count(*) as 'nowTourist' from tourist where reserve_no=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rs.getString("reserve_no"));
				rs1 = pstmt.executeQuery();
				rs1.next();
				
				map.put("nowtourist", rs1.getString("nowtourist"));
				
	            list.add(map);
			}
		} catch (Exception e) {
			System.out.println("getReservation 오류 " + e.getMessage());
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return list;
	}
	
	public List getTourist(String reserve_no){
		TouristDTO tdto;
		List<TouristDTO> list = new ArrayList();
		try {
			
			sql = "select * from tourist where reserve_no=?";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reserve_no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				tdto = new TouristDTO();
				
				tdto.setReserve_no(rs.getString("reserve_no"));
				tdto.setPackage_no(rs.getString("package_no"));
				tdto.setTour_person_level(rs.getString("tour_person_level"));
				tdto.setTour_ko_name(rs.getString("tour_ko_name"));
				tdto.setTour_last_name(rs.getString("tour_last_name"));
				tdto.setTour_first_name(rs.getString("tour_first_name"));
				tdto.setTour_birthday(rs.getString("tour_birthday"));
				tdto.setTour_gender(rs.getString("tour_gender"));
				tdto.setTour_nation(rs.getString("tour_nation"));
				tdto.setTour_passport_num(rs.getString("tour_passport_num"));
				tdto.setTour_passport_end(rs.getString("tour_passport_end"));
				
				list.add(tdto);
			}
			
		} catch (Exception e) {
			System.out.println("getTourist 오류 " + e.getMessage());
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
}
