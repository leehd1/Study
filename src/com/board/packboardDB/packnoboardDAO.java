package com.board.packboardDB;

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

public class packnoboardDAO {
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
	
	public int getBoardCount(String n){
		int count=0;
		try {
			con = getConnection();
			if(n.equals("a")){
			sql="select count(*) as count from packnoboard";
			}
			if(n.equals("b")){
			sql="select count(*) as count from packspboard";
			}
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt("count");
			}
		} catch (Exception e) {
			System.out.println("getboardCount()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		return count;
	}
	
	public int getBoardCount(String search1, String search2, String search3){
		System.out.println("getBoardCount �떎�뻾");
		System.out.println(search1);
		System.out.println(search2);
		System.out.println(search3);
		System.out.println("getBoardCount諛쏆쓬 search1,2,3====");
		int count=0;
		try {
			con = getConnection();
			if(search3.equals(" ")){
				search3 ="";
			}
			if(search1.equals(" ")){
				search1 = "";
			}
			if(!(search2.equals(" "))){
				
				System.out.println("search2媛� 怨듬갚�씠 �븘�땺�떆");
				sql="select count(*) as count from packnoboard where nocate like ? and " + search2 + " like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search1+"%");
				pstmt.setString(2, "%"+search3+"%");
			}else{
				System.out.println("search2媛� 怨듬갚�씪�븣 �떎�뻾");
				
				sql="select count(*) as count from packnoboard where nocate like ? and (notitle like ? or nocontent like ?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search1+"%");
				pstmt.setString(2, "%"+search3+"%");
				pstmt.setString(3, "%"+search3+"%");
			}
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt("count");
				
			}
			System.out.println("count媛쒖닔 : "+count);
		} catch (Exception e) {
			System.out.println("getBoardCount(search) �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		return count;
	}
	
	public List<packnoboardDTO> getBoardList(String search1, String search2, String search3, int startRow, int pageSize){
		
		List<packnoboardDTO> list = new ArrayList<>();
		try {
			con = getConnection();
			if(search3.equals(" ")){
				search3 ="";
			}
			if(search1.equals(" ")){
				search1 ="";
			}
			if(!(search2.equals(" "))){
				
				sql = "select * from packnoboard where nocate like ? and " + search2 + " like ? limit ?,?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search1+"%");
				pstmt.setString(2, "%"+search3+"%");
				pstmt.setInt(3, startRow-1);
				pstmt.setInt(4, pageSize);
				rs = pstmt.executeQuery();
			}else {
				
				sql="select * from packnoboard where nocate like ? and (notitle like ? or nocontent like ?) limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search1+"%");
				pstmt.setString(2, "%"+search3+"%");
				pstmt.setString(3, "%"+search3+"%");
				pstmt.setInt(4, startRow-1);
				pstmt.setInt(5, pageSize);
				rs = pstmt.executeQuery();
			}
				
				while(rs.next()){
					packnoboardDTO bdto = new packnoboardDTO();
					bdto.setCount(rs.getInt("count"));
					bdto.setNono(rs.getInt("nono"));
					bdto.setDate(rs.getTimestamp("date"));
					bdto.setNocate(rs.getString("nocate"));
					bdto.setNotitle(rs.getString("notitle"));
					
					list.add(bdto);
				}
			
		} catch (Exception e) {
			System.out.println("getBoardCount(search)�뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		return list;
	}
	
	public packnoboardDTO getBoard(int num){
		try {
			con=getConnection();
			
			sql="update packnoboard set count=count+1 where nono=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			sql="select * from packnoboard where nono=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs=pstmt.executeQuery();
		
			if(rs.next()){
				bdto=new packnoboardDTO();
				bdto.setNotitle(rs.getString("notitle"));
				bdto.setCount(rs.getInt("count"));
				bdto.setNocate(rs.getString("nocate"));
				bdto.setNocontent(rs.getString("nocontent"));
				bdto.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return bdto;
	}

	public List<packnoboardDTO> getnoBoardList(int startRow, int pageSize) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<packnoboardDTO> boardList = new ArrayList<>();
		try{
			//1,2 �뵒鍮꾩뿰寃�
			con=getConnection();
			//3 sql �쟾泥� board 湲�媛��졇�삤湲�  
			//�젙�젹 理쒓렐湲� 留⑥쿂�쓬 re_ref�궡由쇱감�닚 �떟湲��닚�꽌 re_seq �삤由꾩감�닚
			// limit �떆�옉�뻾-1 , 紐뉕컻 
			sql="select * from packnoboard limit ?,?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			//4 rs = �떎�뻾 ���옣
			rs=pstmt.executeQuery();
			//5 rs �떎�쓬�뻾�씠�룞 �뜲�씠�꽣 �엳�쑝硫�  BoardBean bb 媛앹껜 �깮�꽦
			//    bb 硫ㅻ쾭蹂��닔  <-  rs �뿴�쓣 ���옣
			//  諛곗뿴 boardList �븳移� ���옣
			while(rs.next()){
				packnoboardDTO bb=new packnoboardDTO();
				bb.setCount(rs.getInt("count"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setNocate(rs.getString("nocate"));
				bb.setNocontent(rs.getString("nocontent"));
				bb.setNono(rs.getInt("nono"));
				bb.setNotitle(rs.getString("notitle"));
				boardList.add(bb);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return boardList;
	}
	
	public List<packspboardDTO> getspBoardList(int startRow, int pageSize) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<packspboardDTO> boardList = new ArrayList<>();
		try{
			//1,2 �뵒鍮꾩뿰寃�
			con=getConnection();
			//3 sql �쟾泥� board 湲�媛��졇�삤湲�  
			//�젙�젹 理쒓렐湲� 留⑥쿂�쓬 re_ref�궡由쇱감�닚 �떟湲��닚�꽌 re_seq �삤由꾩감�닚
			// limit �떆�옉�뻾-1 , 紐뉕컻 
			sql="select * from packspboard order by spno desc limit ?,?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			//4 rs = �떎�뻾 ���옣
			rs=pstmt.executeQuery();
			//5 rs �떎�쓬�뻾�씠�룞 �뜲�씠�꽣 �엳�쑝硫�  BoardBean bb 媛앹껜 �깮�꽦
			//    bb 硫ㅻ쾭蹂��닔  <-  rs �뿴�쓣 ���옣
			//  諛곗뿴 boardList �븳移� ���옣
			while(rs.next()){
				packspboardDTO bb=new packspboardDTO();
				bb.setDate(rs.getTimestamp("date"));
				bb.setSpcate(rs.getString("spcate"));
				bb.setSpcontent(rs.getString("spcontent"));
				bb.setSpid(rs.getString("spid"));
				bb.setSpno(rs.getInt("spno"));
				bb.setStar(rs.getInt("spstar"));
				bb.setSppackage(rs.getString("sppackage"));
				bb.setSptitle(rs.getString("sptitle"));
				bb.setSpcount(rs.getInt("spcount"));
				boardList.add(bb);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return boardList;
	}

	public void questionupload(questionDTO qdto) {

		String sql="insert into question(qid,qcate,qcontent,qtitle,qfilename,qfilerealname,date,qstate) values(?,?,?,?,?,?,?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qdto.getQid());
			pstmt.setString(2, qdto.getQcate());
			pstmt.setString(3, qdto.getQcontent());
			pstmt.setString(4, qdto.getQtitle());
			pstmt.setString(5, qdto.getQfilename());
			pstmt.setString(6, qdto.getQfilerealname());
			pstmt.setTimestamp(7, qdto.getDate());
			pstmt.setString(8, "처리대기");
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("questionupload()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	
	public List visited (String id) {
		HashMap map;
		List list = new ArrayList();
		try {
			con = getConnection();
			String sql = "select p.package_no, p.package_total_no, p.availability_start_date, p.availability_end_date, p.product_subject, substring(p.package_no, 7, 2) as country from reservation r inner join packagelist p on r.package_no = p.package_no where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				map = new HashMap();
				map.put("package_no", rs.getString("package_no"));
				map.put("package_total_no", rs.getString("package_total_no"));
				map.put("availability_start_date", rs.getString("availability_start_date"));
				map.put("availability_end_date", rs.getString("availability_end_date"));
				map.put("product_subject", rs.getString("product_subject"));
				map.put("country", rs.getString("country"));
				
				list.add(map);
			}
				
		} catch (Exception e) {
			System.out.println("packspboard_spcate()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}

		return list;
	}

	public void spboardinsert(packspboardDTO dto) {
		try {
			String sql = "insert into packspboard(spno,spid,sptitle,spcate,spstar,spcontent,date,sppackage,spcount,spsimple_content) values(?,?,?,?,?,?,?,?,0,?)";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getSpno());
			pstmt.setString(2, dto.getSpid());
			pstmt.setString(3, dto.getSptitle());
			pstmt.setString(4, dto.getSpcate());
			pstmt.setInt(5, dto.getStar()/2);
			pstmt.setString(6, dto.getSpcontent());
			pstmt.setTimestamp(7, dto.getDate());
			pstmt.setString(8, dto.getSppackage());
			pstmt.setString(9, dto.getSpsimple_content());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("spboardinsert()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally{
			freeResource();
		}
	}
	
	public packspboardDTO getspboard(int nono){
		packspboardDTO dto = new packspboardDTO();
		try {
			con = getConnection();
			
			sql="update packspboard set spcount=spcount+1 where spno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, nono);
			
			pstmt.executeUpdate();
			
			String sql = "select * from packspboard where spno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nono);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setDate(rs.getTimestamp("date"));
			dto.setSpcate(rs.getString("spcate"));
			dto.setSpcontent(rs.getString("spcontent"));
			dto.setSpid(rs.getString("spid"));
			dto.setSppackage(rs.getString("sppackage"));
			dto.setSptitle(rs.getString("sptitle"));
			dto.setStar(rs.getInt("spstar"));
			dto.setSpno(rs.getInt("spno"));
			dto.setSpcount(rs.getInt("spcount"));
			dto.setSpsimple_content(rs.getString("spsimple_content"));
			
			
		} catch (Exception e) {
			System.out.println("getspboard()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		
		return dto;
	}
	public void replyinsert(replyDTO dto) {
		
		try {
			con=getConnection();
			String sql = "insert into reply(reno,recontent,date,resp,reid) values(?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getReno());
			pstmt.setString(2, dto.getRecontent());
			pstmt.setTimestamp(3, dto.getDate());
			pstmt.setInt(4, dto.getResp());
			pstmt.setString(5, dto.getReid());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("replyinsert()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		
	}
	
	public int regetcount(int spno){
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) as count from reply where resp=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, spno);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt("count");
			}
			
		} catch (Exception e) {
			System.out.println("regetcount()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		return count;
	}
	
	public List<replyDTO> getreply(int no){
		List<replyDTO> list = new ArrayList<>(); 
		try {
			con = getConnection();
			sql = "select * from reply where resp=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				replyDTO dto = new replyDTO();
				dto.setDate(rs.getTimestamp("date"));
				dto.setRecontent(rs.getString("recontent"));
				dto.setReno(rs.getInt("reno"));
				dto.setResp(rs.getInt("resp"));
				dto.setReid(rs.getString("reid"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getreply()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		
		return list;
		
	}
	public void replydelete(int reno) {
		try {
			con = getConnection();
			String sql = "delete from reply where reno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reno);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("replydelete()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	public int spboardserchCount(String search1, String search2){
		int count = 0;
		System.out.println(search1);
		System.out.println(search2);
		try {
			con =getConnection();
			String sql = "select count(*) as count from packspboard where "+search1+" like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search2+"%");
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt("count");
			}
			
		} catch (Exception e) {
			System.out.println("spboardsearchCount()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		return count;
	}
	
	public List<packspboardDTO> spboardsearch(String search1, String search2,int startRow, int pageSize) {
		List<packspboardDTO> list = new ArrayList<>();
		try {
			con = getConnection();
			String sql = "select * from packspboard where "+search1+" like ? order by spno desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search2+"%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				packspboardDTO dto = new packspboardDTO();
				dto.setSpcate(rs.getString("spcate"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setSpcontent(rs.getString("spcontent"));
				dto.setSpcount(rs.getInt("spcount"));
				dto.setSpid(rs.getString("spid"));
				dto.setSpno(rs.getInt("spno"));
				dto.setSppackage(rs.getString("sppackage"));
				dto.setSptitle(rs.getString("sptitle"));
				dto.setStar(rs.getInt("spstar"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("spboardsearch()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		return list;
	}
	public packspboardDTO spboardgetData(int spno) {
		sql = "select * from packspboard where spno=?";
		packspboardDTO dto = new packspboardDTO();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, spno);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			dto.setSpno(rs.getInt("spno"));
			dto.setSpcate(rs.getString("spcate"));
			dto.setStar(rs.getInt("spstar"));
			dto.setSpcontent(rs.getString("spcontent"));
			dto.setSppackage(rs.getString("sppackage"));
			dto.setSpsimple_content(rs.getString("spsimple_content"));
			dto.setSptitle(rs.getString("sptitle"));
			
		} catch (Exception e) {
			System.out.println("spboardgetData()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		return dto;
	}
	public void packspboardUpdate(packspboardDTO dto, int spno) {
		System.out.println("spno : "+spno);
		sql = "UPDATE packspboard SET sptitle=?, spcontent=?, spsimple_content=?, spstar=? WHERE spno=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getSptitle());
			pstmt.setString(2, dto.getSpcontent());
			pstmt.setString(3, dto.getSpsimple_content());
			pstmt.setInt(4, dto.getStar()/2);
			pstmt.setInt(5, spno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("packspboardUpdate()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	public void spboardDelete(int spno) {
		sql = "DELETE from packspboard where spno=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, spno);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("spboardDelete()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
	}
	
	public List getspboardc(){
		List list = new ArrayList();
		sql = "SELECT * FROM packspboard order by spcount desc limit 3";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				packspboardDTO dto = new packspboardDTO();
				dto.setSptitle(rs.getString("sptitle"));
				dto.setSpsimple_content(rs.getString("spsimple_content"));
				dto.setStar(rs.getInt("spstar"));
				dto.setSpcate(rs.getString("spcate"));
				dto.setSpno(rs.getInt("spno"));
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return list;
	}
	public List getPackageTitle(String spid) {
		List list = new ArrayList();
		sql = "SELECT p.product_subject, p.package_no FROM reservation r INNER JOIN packagelist p on r.package_no = p.package_no where r.id=?";
		try {
			con =getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, spid);
			rs = pstmt.executeQuery();
			rs.next();
			list.add(rs.getString(1));
			list.add(rs.getString(2));
		} catch (Exception e) {
			System.out.println("getPackageTitle()留ㅼ냼�뱶 �뿉�윭 "+e.getMessage());
		}finally {
			freeResource();
		}
		return list;
	}
}
