package com.administer.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.board.packboardDB.packnoboardDTO;
import com.member.DB.MemberBean;

public class sellerAdminDAO {
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
	public void ListSave(sellerAdminDTO dto) {

		sql = "INSERT INTO selleradminlist(sellerid, sellername, selleremail, sellerphonenum, sellertravel_agency_consulting_time, sellerfaxnum)"+
				" VALUES(?,?,?,?,?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getSellerid());
			pstmt.setString(2, dto.getSellername());
			pstmt.setString(3, dto.getSelleremail());
			pstmt.setString(4, dto.getSellerphonenum());
			pstmt.setString(5, dto.getSellertravel_agency_consulting_time());
			pstmt.setString(6, dto.getSellerfaxnum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ListSave()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	public List<sellerAdminDTO> getSellerList() {
		List<sellerAdminDTO> list = new ArrayList<sellerAdminDTO>();
		
		sql = "SELECT * FROM selleradminlist";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				sellerAdminDTO dto = new sellerAdminDTO();
				dto.setSellerid(rs.getString("sellerid"));
				dto.setSellername(rs.getString("sellername"));
				dto.setSelleremail(rs.getString("selleremail"));
				dto.setSellerphonenum(rs.getString("sellerphonenum"));
				dto.setSellertravel_agency_no(rs.getInt("sellertravel_agency_no"));
				dto.setSellertravel_agency_consulting_time(rs.getString("sellertravel_agency_consulting_time"));
				dto.setSellerfaxnum(rs.getString("sellerfaxnum"));
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("getSellerList()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
		
		
		return list;
	}
	public void sellerToUpdate(int sellerInsert_no, String id) {
		System.out.println("sellerUpdate 매소드 실행 "+sellerInsert_no);
		System.out.println("update매소드 seller id : "+id);
		sql = "UPDATE wt_member SET level=4, travel_agency_no=? WHERE id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sellerInsert_no);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("sellerToUpdate()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	public sellerAdminDTO getAgencyINFO(int sellerInsert_no) {
		sellerAdminDTO dto = new sellerAdminDTO();
		sql = "SELECT * FROM selleradminlist WHERE sellertravel_agency_no=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sellerInsert_no);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			dto.setSellerid(rs.getString("sellerid"));
			dto.setSelleremail(rs.getString("selleremail"));
			dto.setSellername(rs.getString("sellername"));
			dto.setSellerphonenum(rs.getString("sellerphonenum"));
			dto.setSellertravel_agency_consulting_time(rs.getString("sellertravel_agency_consulting_time"));
			dto.setSellerfaxnum(rs.getString("sellerfaxnum"));
			dto.setSellertravel_agency_no(rs.getInt("sellertravel_agency_no"));
		} catch (Exception e) {
			System.out.println("getAgencyINFO()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
		return dto;
	}
	public void agencyINTO(sellerAdminDTO dto) {
		sql = "INSERT INTO travel_agency VALUES(?,?,?,?,?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getSellertravel_agency_no());
			pstmt.setString(2, dto.getSellername());
			pstmt.setString(3, dto.getSellerphonenum());
			pstmt.setString(4, dto.getSellerfaxnum());
			pstmt.setString(5, dto.getSelleremail());
			pstmt.setString(6, dto.getSellertravel_agency_consulting_time());
			
			pstmt.executeUpdate();
			
			String _member = "";
			
		} catch (Exception e) {
			System.out.println("agencyINTO()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	public void SellerAdminListDelete(int sellerInsert_no) {
		System.out.println("DELETE 페이지 no : "+sellerInsert_no);
		sql = "DELETE FROM selleradminlist WHERE sellertravel_agency_no=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sellerInsert_no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("SellerAdminListDelete()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	public List<MemberBean> getAllMember() {
		List<MemberBean> list = new ArrayList<MemberBean>();
		sql = "SELECT * FROM wt_member";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setLevel(rs.getInt("level"));
				bean.setTravel_agency_no(rs.getInt("travel_agency_no"));
				bean.setDate(rs.getTimestamp("regdate"));
				bean.setNum(rs.getInt("num"));
				
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getAllMember()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
		return list;
	}
	//admin의 회원정보수정
	public void changeMemberInfo(MemberBean bean) {
		sql = "UPDATE wt_member SET name=?, email=?, level=?, travel_agency_no=? WHERE num=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getEmail());
			pstmt.setInt(3, bean.getLevel());
			pstmt.setInt(4, bean.getTravel_agency_no());
			pstmt.setInt(5, bean.getNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("changeMemberInfo()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	
	
}
