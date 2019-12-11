package com.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
	
	private Connection conn;

	public CommentDAO(Connection conn) {
		this.conn=conn;
	}

	public int insertComment(CommentDTO dto) {
		
		int result=0;
		PreparedStatement pstmt;
		String sql;
		
		try {
			
			sql = "insert into commentboard (no,product,id,subject,content,created,imagefilename,hitcount,count) ";
			sql += "values (?,?,?,?,?,sysdate,?,0,0)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, dto.getProduct());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getImagefilename());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
				
			
		} catch (Exception e) {
			System.out.println("insertComment 에러 "+e.toString());
		}
		return result;
	
	}
	
	public int getMaxNum() {
		
		int maxnum = 0;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		
		try {
			sql = "select nvl(max(no),0) from commentboard";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				maxnum  = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
					
		} catch (Exception e) {
			System.out.println("getMaxNum" + e.toString());
		}
		
		return maxnum;
		
	}
	

	public int getDataCount(String searchKey,String searchValue) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";
			sql = "select NVL(count(*),0) from commentboard ";
			sql += "where " +searchKey +" like ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				dataCount = rs.getInt(1); //첫번째 컬럼
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dataCount;
	}
	
	public int updateHitCount(int no) { //조회 수 증가

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update commentboard set hitcount=hitcount+1 ";
			sql +="where no=?";

			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;		
	}
	
	public int updateCount(int no) { //추천 수 증가

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update commentboard set count=count+1 ";
			sql +="where no=?";

			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;		
	}
	
	public int deleteComment(int no) {
		
		int result=0;
		PreparedStatement pstmt;
		String sql;
		
		try {
			
			sql ="delete commentboard where no=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			result= pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("deleteComment 에러"+e.toString());
		}
		
		return result;		
	}
	
	public int updateComment(CommentDTO dto) {
		
		int result=0;
		PreparedStatement pstmt;
		String sql;
		
		try {
			
			sql = "update commentboard set product=?,subject=?,content=?,created=sysdate where no=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getProduct());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNo());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("updateComment에러 "+e.toString());
		}
		return result;
	}
	
	public CommentDTO getReadData(int no) {

		CommentDTO dto = null; 
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;

		try {

			sql = "select no,product,id,subject,content,created,hitcount,imagefilename ";
			sql+= "from commentboard where no=?";

			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,no);

			rs=pstmt.executeQuery();

			while(rs.next()) {

				dto = new CommentDTO();

				dto.setNo(no);
				dto.setProduct(rs.getString("product"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));	
				dto.setCreated(rs.getString("created"));
				dto.setHitcount(rs.getInt("hitcount"));
				dto.setImagefilename(rs.getString("imagefilename"));
			
			}
			
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;	
	}
	
	public List<CommentDTO> getList(int start, int end, String searchKey, String searchValue){

		List<CommentDTO> lists = new ArrayList<>();

		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql;

		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select no,product,id,subject,hitcount,count, ";
			sql +="to_char(created,'YYYY-MM-DD')created ";
			sql += "from commentboard where "+searchKey+" like ? ";
			sql += "order by no desc) data) ";
			sql += "where rnum>=? and rnum<=?";
			
		
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				CommentDTO dto = new CommentDTO();

				dto.setNo(rs.getInt("no"));
				dto.setProduct(rs.getString("product"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitcount(rs.getInt("hitcount"));
				dto.setCount(rs.getInt("count"));
				dto.setCreated(rs.getString("created"));
		

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println("getList 에러 "+e.toString());
		}
		return lists;
	}


	
	
	public List<CommentDTO> bestList(int start, int end){
		
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		List<CommentDTO> lists = new ArrayList<>();
		
		try {
			
			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql+= "select no,imagefilename,product,id,subject,count,hitcount,created from commentboard order by count desc) data) ";
			sql += "where rnum>=? and rnum<=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 4);
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CommentDTO dto = new CommentDTO();
					
				dto.setNo(rs.getInt("no"));
				dto.setImagefilename(rs.getString("imagefilename"));				
				dto.setProduct(rs.getString("product"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setCount(rs.getInt("count"));
				dto.setHitcount(rs.getInt("hitcount"));				
				dto.setCreated(rs.getString("created"));
		
				lists.add(dto);
				
			}
			
			
		} catch (Exception e) {
			System.out.println("bestList에러"+e.toString());
		}
		
		return lists;
		
		
	}
}
