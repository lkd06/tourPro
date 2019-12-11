package com.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReDAO {

	private Connection conn;

	public ReDAO(Connection conn) {
		this.conn=conn;
	}

	public int getReplyCount(int num) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql;

		try {

			sql = "select NVL(count(*),0) from qnare where num=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			
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

	public int getReplyMaxNum() {
		
		int maxnum = 0;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		
		try {
			sql = "select nvl(max(replyno),0) from qnare";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				maxnum  = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
					
		} catch (Exception e) {
			System.out.println("replyGetMaxNum" + e.toString());
		}
		
		return maxnum;
		
	}
	

	public int insertReply(ReDTO dto) {

		int result=0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "insert into qnare (num,replyno,id,content,created) ";
			sql += "values (?,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getNum());
			pstmt.setInt(2, dto.getReplyno());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getContent());

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println("insertReply 에러 "+e.toString());
		}
		return result;

	}
	
	public List<ReDTO> getReplyList(int start,int end,int num){
		
		 List<ReDTO> lists = new ArrayList<>();
		 ResultSet rs;
		 PreparedStatement pstmt;
		 String sql ;
		 
		 try {
			
			 sql = "select * from(";
			 sql += "select rownum rnum, data.* from(";
			 sql += "select replyno,id,content,created from qnare where num=? order by replyno desc)data) ";
			 sql += "where rnum>=? and rnum<=? ";
			 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReDTO dto = new ReDTO();
				
				dto.setReplyno(rs.getInt("replyno"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				
				lists.add(dto);			
				
			}
			 
			 rs.close();
			 pstmt.close();
			 
		} catch (Exception e) {
			System.out.println("getReplyList에러" +e.toString());
		}
		return lists;
	}

	
	public List<ReDTO> getReplyList(){
		
		 List<ReDTO> lists = new ArrayList<>();
		 ResultSet rs;
		 PreparedStatement pstmt;
		 String sql ;
		 
		 try {
			
			sql="select * from qnare";
			 
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReDTO dto = new ReDTO();
				
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				
				lists.add(dto);			
				
			}
			 
			 rs.close();
			 pstmt.close();
			 
		} catch (Exception e) {
			System.out.println("getReplyList에러" +e.toString());
		}
		return lists;
	}

}
