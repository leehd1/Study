package com.member.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.board.packboardDB.questionDTO;



public class MemberDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	String sql ="";
	//멤버변수
	//생성자
	//메소드
	//디비연결 하는메소드()
	private Connection getConnection() throws Exception{
//		String dbUrl="jdbc:mysql://localhost:3306/jsp2";
//		String dbId="jspid";
//		String dbPass="jsppass";
		Connection con=null;
		//1단계 드라이버로더
		//Class.forName("com.mysql.jdbc.Driver");
		//2단계 디비연결
		//con=DriverManager.getConnection(dbUrl, dbId, dbPass);
		
		// 커넥션 풀(Connection Pool)
		// 데이터베이스와 연결된 Connection 객체를 미리 생성 풀(Pool)속에 저장
		// 필요할때 마다 풀에 접근 Connection 객체 사용, 끝나면 반환
		// DBCP API -> commons.apache.org
		// 다운 commons-collections4-4.1.jar
		// commons-dbcp2-2.1.1.jar  commons-pool2-2.4.2.jar
		// WebContent WEB-INF  lib 설치
		
		// 1. WebContent  META-INF context.xml
		// 2. WebContent  WEB-INF web.xml
		// 3. 디비사용시 이름을 불러서 사용
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
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
	
	
	
	public boolean insertMember(MemberBean mb){
		// 디비 연동하는 프로그램 설치 (JDBC)
		// JSP2 - WebContent - WEB-INF - lib - 
		//   mysql-connector-java-5.1.39-bin.jar
//		     com폴더 mysql 폴더 jdbc 폴더   Driver.java
		
		
		int result = 0; //회원가입 성공여부
		try{
			//예외가 발생할 명령문
			// 1단계 드라이버로더	// 2단계 디비연결 => 연결정보 저장
			con=getConnection();
			//out.println("연결성공");
			// 3단계 sql 객체 생성
			// Statement  PreparedStatement CallableStatement
			//String sql="insert into 테이블이름(열이름,...) values(값,값)";
			sql="insert into wt_member(num,id,pw,name,email,regdate,level) values(?,?,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,mb.getNum());
			pstmt.setString(2,mb.getId());  
			pstmt.setString(3,mb.getPw()); 
			pstmt.setString(4,mb.getName()); 
			pstmt.setString(5, mb.getEmail());
			pstmt.setTimestamp(6,mb.getDate());
		
			// 4단계 실행
			result = pstmt.executeUpdate(); //회원가입 성공하면 1리턴, 실패시0리턴
			
			//만약 회원가입에 성공하면.. true리턴
			if(result != 0){
				return true;
			}
			freeResource();
		}catch(Exception e){
			//예외처리
			e.printStackTrace();
		}
		
		return false; //회원가입 실패시! false리턴
		
	}// insertMember()메소드
	
	/*로그인 처리시.. 사용하는 메소드*/
	//login.jsp에서 사용자로부터 입력받은 id,pass
    //wd값과 DB에 있는 id,passwd값을 확인하여 로그인처리
	public int userCheck(String id,String pw){
		int check=-1; //1 -> 아이디, 비밀번호 맞음
					  //0 -> 아이디 맞음, 비밀번호 틀림
					  //-1 -> 아이디 틀림
		try {
			//1단계 드라이버로더
			//2단계 디비연결
			con=getConnection();
			//3단계 sql : id에 해당하는 passwd 가져오기
			sql="select pw from wt_member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			//4단계 rs = 실행
			rs=pstmt.executeQuery();
			//5단계 rs 첫번째행 이동하여.. id에 해당하는 데이터가 pass가 있으면.
			if(rs.next()){
				//로그인시.. 입려한 pass와  DB에 저장되어 있는 pass가 같으면
				if(pw.equals(rs.getString("pw"))){
					check=1;//아이디 맞음,비밀번호 맞음 판별값 저장
				//비밀번호가 틀리면
				}else{
					check=0;//아이디 맞음, 비밀번호틀림 판별값 저장
				}
			//id에 해당하는 데이터가 pass가 없으면(아이디가 없다는 뜻과 같음)	
			}else{
				check=-1; //아이디 없음 판별값 저장
			}
			freeResource();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public void deleteMember(String id) {
		try {
			con = getConnection();
			sql = "delete from wt_member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			freeResource();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public boolean duplicateIdCheck(String id)
	   {
	      Connection conn = null;
	      PreparedStatement pstm = null;
	      ResultSet rs = null;
	      boolean x= false;
	      
	      try {
	         
	         StringBuffer query = new StringBuffer();
	         query.append("SELECT id FROM wt_member WHERE id=?");
	                  
	         conn = getConnection();
	         pstm = conn.prepareStatement(query.toString());
	         pstm.setString(1, id);
	         rs = pstm.executeQuery();
	         
	         if(rs.next()) x= true;
	         
	         return x;
	         
	      } catch (Exception sqle) {
	         throw new RuntimeException(sqle.getMessage());
	      } finally {
	         try{
	            if ( pstm != null ){ pstm.close(); pstm=null; }
	            if ( conn != null ){ conn.close(); conn=null;   }
	         }catch(Exception e){
	            throw new RuntimeException(e.getMessage());
	         }
	      }
	   } // end duplicateIdCheck()

	
	public MemberBean getMember(String id){
		String sql = "select * from wt_member where id=?";
		//SawonDTO객체 생성
		MemberBean dto = new MemberBean();
		try{
			con= getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			freeResource();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public void modifyMember(MemberBean mb) {
		
		
		try {
			con = getConnection();
			sql = "update wt_member set pw=?, name=?, email=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getPw());
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getEmail());
			pstmt.setString(4, mb.getId());
			
			pstmt.executeUpdate();
			freeResource();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String findid(String email) {
	      
	      Connection con=null;
	      String sql="";
	      PreparedStatement pstmt=null;
	      sql = "select id from wt_member where email=?";
	      ResultSet rs=null;
	      String id = "0";
	      
	      try{
	         con = getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, email);
	         
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            id=rs.getString(1);
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally{
	         if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	      }
	      return id;
	   }

	 public int idCheck(String id){
	      int check=1;
	      Connection con=null;
	      String sql="";
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      try {
	         con = getConnection();
	         
	         sql = "select * from wt_member where id=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()){   //검색한 레코드가 있으면
	            check = 1;   //중복
	         }else {         //검색한 레코드가 없으면
	            check = 0;   //중복아님
	         }
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	      }
	      return check;
	   }

	
	public int getmemberlever(String id){
		System.out.println("getmemberlever : "+id);
		int level = 0;
			try {
				con = getConnection();
				sql = "select level from wt_member where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					level = rs.getInt("level");
				}
				System.out.println(level);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				freeResource();
			}
		
		return level;
		
	}

	public List<questionDTO> getMooniList(String id) {
		List<questionDTO> list = new ArrayList<questionDTO>();
		try {
			String sql = "select * from question where qid=?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				questionDTO dto = new questionDTO();
				dto.setQtitle(rs.getString("qtitle"));
				dto.setQcate(rs.getString("qcate"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setQstate(rs.getString("qstate"));
				dto.setQno(rs.getInt("qno"));
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("getMooniList()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
		
		return list;
	}

	public questionDTO MooniRead(int qno) {
		questionDTO dto = new questionDTO();
		try {
			String sql = "select * from question where qno=?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setDate(rs.getTimestamp("date"));
			dto.setQcate(rs.getString("qcate"));
			dto.setQcontent(rs.getString("qcontent"));
			dto.setQfilerealname(rs.getString("qfilerealname"));
			dto.setQtitle(rs.getString("qtitle"));
			
		} catch (Exception e) {
			System.out.println("MooniRead()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
			
		return dto;
	}
	// 회원의 아이디를 기준으로 travel_agency_no 값 얻기
	public int getAgency_No(String id) {
		int travel_agency_no = 0;
		sql = "SELECT travel_agency_no FROM wt_member where id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			
			travel_agency_no = rs.getInt("travel_agency_no");
		} catch (Exception e) {
			System.out.println("getAgency_No()매소드 에러 "+e.getMessage());
		}finally {
			freeResource();
		}
		return travel_agency_no;
	}

}//클래스
