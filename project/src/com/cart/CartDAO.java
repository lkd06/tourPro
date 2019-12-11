package com.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Trip.TripInfoDTO;

public class CartDAO {

	private Connection conn;
	
	public CartDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int getCount() {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select nvl(count(*),0) from cart";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("cart getcount : "+e.toString());
		}
		
		return count;
	}
	
	public int maxNum() {
		int num = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs =null;
	
		try {
			sql = "select nvl(max(num),0) from cart";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("cart maxnum "+e.toString());
		}
		return num;
	}
	
	public int insertData(CartDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		int num=maxNum()+1;
		try {
			
			sql = "insert into cart (c_name,c_num,c_price,c_inwon,id,num,c_check) ";
			sql += "values (?,?,?,?,?,?,'no')";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getC_name());
			pstmt.setInt(2, dto.getC_num());
			pstmt.setInt(3, dto.getC_price());
			pstmt.setInt(4, dto.getC_inwon());
			pstmt.setString(5, dto.getId());
			pstmt.setInt(6, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	public List<CartDTO> getLists(){
		
		List<CartDTO> lists = new ArrayList<CartDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (";
			sql += "select c_name,c_num,c_price,c_inwon,c_check ";
			sql += "from cart order by c_num) data";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CartDTO dto = new CartDTO();

				dto.setC_name(rs.getString("c_name"));
				dto.setC_num(rs.getInt("c_num"));
				dto.setC_price(rs.getInt("c_price"));
				dto.setC_inwon(rs.getInt("c_inwon"));
				dto.setC_check(rs.getString("c_check"));
				lists.add(dto);	
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}

	
	public List<CartDTO> getLists(String id){
		
		List<CartDTO> lists = new ArrayList<CartDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (";
			sql += "select c_name,c_num,c_price,c_inwon,id,num,c_check ";
			sql += "from cart ";
			sql += "where id like '"+id+"' ";
			sql	+= " order by num desc) data ";
			
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CartDTO dto = new CartDTO();

				dto.setC_name(rs.getString("c_name"));
				dto.setC_num(rs.getInt("c_num"));
				dto.setC_price(rs.getInt("c_price"));
				dto.setC_inwon(rs.getInt("c_inwon"));
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getInt("num"));
				dto.setC_check(rs.getString("c_check"));
				lists.add(dto);	
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("id 추가"+e.toString());
		}
		
		return lists;
	}

	
	//c_num으로 조회한 한개의 데이터
	public CartDTO getReadData(int num) {
		
		CartDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select c_name,c_num,c_price,c_inwon,c_check from cart where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new CartDTO();

				dto.setC_name(rs.getString("c_name"));
				dto.setC_num(rs.getInt("c_num"));
				dto.setC_price(rs.getInt("c_price"));
				dto.setC_inwon(rs.getInt("c_inwon"));
				dto.setNum(num);
				dto.setC_check(rs.getString("c_check"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	
		
	//삭제하기
	public int deleteData(int num) {
			
		int result = 0;
			
		PreparedStatement pstmt = null;
		String sql;
			
		try {
				
			sql = "delete cart where num=?";
				
			pstmt = conn.prepareStatement(sql);
				
			pstmt.setInt(1, num);
				
			result = pstmt.executeUpdate();
				
			pstmt.close();
				
		} catch (Exception e) {
			System.out.println(e.toString());
		}
			
		return result;
	}
	
	
	public TripInfoDTO getData(int c_num) {
		TripInfoDTO dto = new TripInfoDTO();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql="select num,country,title,price,inwon,to_char(startdate,'yyyy-mm-dd') startdate,to_char(enddate,'yyyy-mm-dd') enddate,";
			sql+="event,guide,content,count,filename ";
			sql+="from tib where num="+c_num;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				dto.setNum(rs.getInt("num"));
				dto.setCountry(rs.getString("country"));
				dto.setTitle(rs.getString("title"));
				dto.setPrice(rs.getString("price"));
				dto.setInwon(rs.getInt("inwon"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setEvent(rs.getString("event"));
				dto.setGuide(rs.getString("guide"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setFilename(rs.getString("filename"));

			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("tripinfo getData(num): "+e.toString());
		}
		return dto;
	}
	
	public void tripUpdate(int c_num,int inwon) {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql="update tib set inwon=inwon-? where num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, inwon);
			pstmt.setInt(2, c_num);
			pstmt.executeUpdate();
			pstmt.close();
			
			
			
		} catch (Exception e) {
			System.out.println("cart tripupdate"+e.toString());
		}
	}
	
	public void cartUpdate(int num) {
		PreparedStatement pstmt = null;
		String sql;

		try {
			
			String check=getReadData(num).getC_check();
			
			if(check.equals("no")) {
				check="yes";
			}else {
				check="no";
			}

			sql ="update cart set c_check=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, check);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println("cart cartupdate "+e.toString());
		}
	}
	
	//수정하기, 결재 또는 취소 시에
	/*public int updateData(CartDTO dto,String check) {
				
			int result = 0;
				
			PreparedStatement pstmt = null;
			String sql;
			
			try {
					
				
					
				
					
			} catch (Exception e) {
				System.out.println(""+e.toString());
			}
				
			return result;
		}*/
}
