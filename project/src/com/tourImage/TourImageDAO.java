package com.tourImage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TourImageDAO {

private Connection conn = null;
	
	public TourImageDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int insertData(TourImageDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into image(id,num,";
			sql += "fileName,name,created) values(?,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getNum());
			pstmt.setString(3, dto.getFileName());
			pstmt.setString(4, dto.getName());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {

			System.out.println(e.toString());
		}
		return result;
	}//end insertdata
	
	public int updateData(TourImageDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update image set fileName=?, created=sysdate, name=? where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getFileName());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getNum());
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {

			System.out.println(e.toString());
		}
		return result;
	}
	
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select nvl(max(num),0) from image";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				maxNum = rs.getInt(1);
				rs.close();
				pstmt.close();
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}//end getMaxNum
	
	//전체 데이터 구하기
	public List<TourImageDTO> getLists(){
		
		List<TourImageDTO> lists = new ArrayList<TourImageDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select id,num,fileName, to_char(created,'yyyy-mm-dd') created, name ";
			sql += "from image order by num desc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) {
				
				TourImageDTO dto = new TourImageDTO();
				
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getInt("num"));
				dto.setFileName(rs.getString("fileName"));
				dto.setCreated(rs.getString("created"));
				dto.setName(rs.getString("name"));
				
				lists.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}//end getLists
	
	//데이터 한 개 구하기
		public TourImageDTO getReadData(int num){
			
			TourImageDTO dto = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				sql = "select id,num,fileName, to_char(created,'yyyy-mm-dd') created, name ";
				sql += "from image where num=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery(); 			
				pstmt = conn.prepareStatement(sql);
				
				if(rs.next()) {
					
					dto = new TourImageDTO();
					
					dto.setId(rs.getString("id"));
					dto.setNum(rs.getInt("num"));
					dto.setFileName(rs.getString("fileName"));
					dto.setCreated(rs.getString("created"));
					dto.setName(rs.getString("name"));
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return dto;
		}//end getLists
	
		public int deleteData(int num) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				sql = "delete image where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;
		}//end deleteData
		
		//-----------------------------------------
		//전체 데이터 개수 구하기
		
		public int getDataCount(String searchKey, String searchValue) {
			
			int dataCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				searchValue = "%" + searchValue + "%";
			
				sql = "select nvl(count(*),0) from image where " + searchKey +" like ?";
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, searchValue);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dataCount = rs.getInt(1);
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return dataCount;
		}//end getdatacount
		//-----------------------------------------------------
		public List<TourImageDTO> getLists(int start, int end, String searchKey, String searchValue){
			
			List<TourImageDTO> lists = new ArrayList<TourImageDTO>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			System.out.println(searchKey+"   key");
			try {
				searchValue = "%" + searchValue + "%";
				sql = "select * from (";
				sql += "select rownum rnum, data.* from (";
				sql += "select id,num,fileName, to_char(created,'yyyy-mm-dd') created, name ";
				sql += "from image where " + searchKey + " like ? order by num desc) data) "; 
				sql += "where rnum>=? and rnum<=?";
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, searchValue);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					TourImageDTO dto = new TourImageDTO();
					
					dto.setId(rs.getString("id"));
					dto.setNum(rs.getInt("num"));
					dto.setFileName(rs.getString("fileName"));
					dto.setCreated(rs.getString("created"));
					dto.setName(rs.getString("name"));
					
					lists.add(dto);
				}//end while
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return lists;
		}//end getlists
	
	
	
	
}
