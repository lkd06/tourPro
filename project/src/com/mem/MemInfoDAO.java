package com.mem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemInfoDAO {
	private Connection conn;
	public MemInfoDAO(Connection conn) {
		this.conn = conn;
	}
	
	//입력
	public int insertData(MemInfoDTO dto){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql="insert into meminfo (id, pw, name, tel, type, addr, email) values (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getType());
			pstmt.setString(6, dto.getAddr());
			pstmt.setString(7, dto.getEmail());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	//전체 출력
	public List<MemInfoDTO> getList(){
		List<MemInfoDTO> lists = new ArrayList<MemInfoDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql="select id, pw, name, tel, type, addr, email from meminfo";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemInfoDTO dto = new MemInfoDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setType(rs.getString("type"));
				dto.setAddr(rs.getString("addr"));
				dto.setEmail(rs.getString("email"));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	
	//검색
	public MemInfoDTO getReadData(String id) {
		MemInfoDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql="select id, pw, name, tel, type, addr, email from meminfo where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new MemInfoDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setType(rs.getString("type"));
				dto.setAddr(rs.getString("addr"));
				dto.setEmail(rs.getString("email"));
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	//수정
	public int updateData(MemInfoDTO dto) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql="update meminfo set pw=?, name=?, tel=?, type=?, addr=?, email=? where id=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getType());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getId());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	//삭제
	public int deleteData(String id) {
		int result = 0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql = "delete meminfo where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//중복확인용
	public int findID(String id) {
		int count=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql="select nvl(count(*),0) from meminfo where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("meminfo findID(): " + e.toString());
		}
		
		
		return count;
	}
}
