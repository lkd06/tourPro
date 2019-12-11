package com.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class mainDAO {
	private Connection conn;
	public mainDAO(Connection conn) {
		this.conn = conn;
	}
	
	public List<mainDTO> getList(){
		List<mainDTO> lists = new ArrayList<mainDTO>();
		String sql;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			sql="select filename,country,num,price from tib ";
			sql+="order by count";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mainDTO dto = new mainDTO();
				dto.setFilename(rs.getString("filename"));
				dto.setCountry(rs.getString("country"));
				dto.setNum(rs.getInt("num"));
				dto.setPrice(rs.getString("price"));
				
				lists.add(dto);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("main getlist: "+e.toString());
		}
		
		
		return lists;
	}
}
