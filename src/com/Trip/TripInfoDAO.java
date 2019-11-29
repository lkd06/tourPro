package com.Trip;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.CommentDTO;

public class TripInfoDAO {

	private Connection conn;
	public TripInfoDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int getCount() {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select nvl(count(*),0) from tib";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("trip getcount : "+e.toString());
		}
		
		return count;
	}
	
	public int getCount(String key,String value) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select nvl(count(*),0) from tib where "+key+" like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+value+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("trip getcount : "+e.toString());
		}
		
		return count;
	}
	
	//num�� ���� maxNum
	public int maxNum() {
		int maxNum=0;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql = "select nvl(max(num),0) from tib";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxNum=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("TripInfo maxNum: "+e.toString());
		}
		
		return maxNum;
	}
	
	
	//�Է�
	public void insertData(TripInfoDTO dto) {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql ="insert into tib(num,conti,country,title,price,inwon,startdate,enddate,event,guide,content,count,filename) ";
			sql+=" values(?,?,?,?,?,?,?,?,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, maxNum()+1);
			pstmt.setString(2, dto.getConti());
			pstmt.setString(3, dto.getCountry());
			pstmt.setString(4, dto.getTitle());
			pstmt.setString(5, dto.getPrice());
			pstmt.setInt(6, dto.getInwon());
			pstmt.setString(7, dto.getStartdate());
			pstmt.setString(8, dto.getEnddate());
			pstmt.setString(9, dto.getEvent());
			pstmt.setString(10, dto.getGuide());
			pstmt.setString(11, dto.getContent());
			pstmt.setString(12, dto.getFilename());
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println("TripInfo insertData: "+e.toString());
		}
	}
	
	//�˻� ����Ʈ
	public List<TripInfoDTO> lists(){
		List<TripInfoDTO> lists = new ArrayList<TripInfoDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql="select num,country,title,price,inwon,to_char(startdate,'yyyy-mm-dd') startdate,to_char(enddate,'yyyy-mm-dd') enddate,";
			sql+="event,guide,content,count,filename ";
			sql+="from tib";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TripInfoDTO dto = new TripInfoDTO();
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
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("tripinfo lists(): "+e.toString());
		}
		return lists;
	}
	//��� ���ؿ� ����� ����Ʈ ���(ex>������ ���� �Ǵ� ���� �Ǵ� ������)
	//>>�̰� �Ű����� �߰��ؼ� ������ �� ���� �� ��
	
	//�˻���+������ ���� ���
	public List<TripInfoDTO> lists(String value,String key, int start,int end){
		List<TripInfoDTO> lists = new ArrayList<TripInfoDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {

			sql="select * from (";
			sql+="select rownum rnum, data.* ";
			sql+="from ( ";
			sql+="select num,country,title,price,inwon,to_char(startdate,'yyyy-mm-dd') startdate,to_char(enddate,'yyyy-mm-dd') enddate,";
			sql+="event,guide,content,count,filename ";
			sql+="from tib where "+ key +" like ? order by num desc) data )";
			sql+="where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			System.out.println(start+" "+end);
			pstmt.setString(1, "%"+value+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TripInfoDTO dto = new TripInfoDTO();
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
				System.out.println("����Ʈ�� �ִ� ��...");
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("tripinfo lists(): "+e.toString());
		}
		return lists;
	}
	//�� �Խù��� ���� �˻�
	public TripInfoDTO getData(int num){
		TripInfoDTO dto = new TripInfoDTO();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql="select num,country,title,price,inwon,to_char(startdate,'yyyy-mm-dd') startdate,to_char(enddate,'yyyy-mm-dd') enddate,";
			sql+="event,guide,content,count,filename ";
			sql+="from tib where num="+num;
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
	//����
	public void delete(int num) {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql="delete from tib where num="+num;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("tripinfo delete:" + e.toString());
		}
	}
	
	//����, ���� ������� ����
	public void update(TripInfoDTO dto) {
		PreparedStatement pstmt = null;
		String sql;
		try {
			/*
			sql="update tib set country=?, title=?, price=?, inwon=?,";
			sql+="startdate=?,enddate=?,guide=?,content=? ";
			sql+="where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getCountry());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getPrice());
			pstmt.setInt(4, dto.getInwon());
			pstmt.setString(5, dto.getStartdate());
			pstmt.setString(6, dto.getEnddate());
			pstmt.setString(7, dto.getGuide());
			pstmt.setString(8, dto.getContent());
			pstmt.setInt(9, dto.getNum());
			*/
			sql="update tib set title=?,";
			sql+="guide=? ";
			sql+="where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getGuide());
			pstmt.setInt(3, dto.getNum());
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("tripinfo update(): "+e.toString());
		}
	}
	
	//��ȸ�� ����
	public void countUp(int num) {
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql="update tib set count=count+1 ";
			sql+="where num="+num;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("tripinfo countUp: "+e.toString());
		}
	}
	
	//���� �ο��� Ž��
	private int inwon(int num) {
		int inwon =0;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql="select inwon from tib where num="+num;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				inwon = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("tripinfo inwon: "+e.toString());
		}
		
		return inwon;
	}
	//���� �� �ο��� ����, �ϴ� ��ü �� ���X
	public boolean inwonDown(int num,int inCount) {
		PreparedStatement pstmt = null;
		String sql;
		inCount=1;//����ϴ� �ο���
		try {
			int count = inwon(num);
			//���� �ο��� ��û �ο����� ���� �� �Ұ�
			if(count<inCount) return false;
			
			sql="update tib set count=? ";
			sql+="where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count-inCount);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("tripinfo inwonDown: "+e.toString());
		}
		//�ο� ���� ����
		return true;
	}
	//���� ��� �� �ο��� ����, �ϴ� ��ü �� ���X
	public void inwonUp(int num,int inCount) {
		PreparedStatement pstmt = null;
		String sql;
		inCount=1;//����ϴ� �ο���
		try {
			int count = inwon(num);
			//���� �ο��� ��û �ο����� ���� �� �Ұ�
			
			sql="update tib set count=? ";
			sql+="where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count+inCount);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("tripinfo inwonUp: "+e.toString());
		}
	}
	
	
	//���� ����/�ٿ�ε��
	public TripInfoDTO getReadData(int num) {
		TripInfoDTO dto = new TripInfoDTO();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		
		try {
			sql = "select filename from tib ";
			sql +="where num="+num;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setFilename(rs.getString(1));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("trip getreaddata: "+e.toString());
		}
		
		return dto;
	}
	
	//���߿� ���� �ҰŸ�
	
	
	//�߰�
	//commentwrite ��
	public List<TripInfoDTO> getConti(){
		
		List<TripInfoDTO> lists = new ArrayList<>();
		TripInfoDTO dto;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		
		try {
			
			/*sql = "SELECT DISTINCT A.conti, B.country, B.title ";
			sql += "FROM tib A, tib B ";
			sql += "WHERE A.conti=B.conti";
			*/
			sql = "select distinct conti ";
			sql+= "from tib";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				
				 dto = new TripInfoDTO();
				dto.setConti(rs.getString("conti"));
					

				lists.add(dto);
			}
			
			rs.close();
			pstmt.close();
		
		} catch (Exception e) {
			System.out.println("tripinfo getData() ����: "+e.toString());
		}
		return lists;
	}
	
	
public List<TripInfoDTO> getContiData(){
		
		List<TripInfoDTO> lists = new ArrayList<>();
		TripInfoDTO dto;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		
		try {
			
			/*sql = "SELECT DISTINCT A.conti, B.country, B.title ";
			sql += "FROM tib A, tib B ";
			sql += "WHERE A.conti=B.conti";
			*/
			sql = "select conti,title,country ";
			sql+= "from tib";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				
				dto = new TripInfoDTO();
				dto.setConti(rs.getString("conti"));
				dto.setTitle(rs.getString("title"));
				dto.setCountry(rs.getString("country"));
					

				lists.add(dto);
			}
			
			rs.close();
			pstmt.close();
		
		} catch (Exception e) {
			System.out.println("tripinfo getData() ����: "+e.toString());
		}
		return lists;
	}
	
public List<TripInfoDTO> getContiData(String conti){
	
	List<TripInfoDTO> lists = new ArrayList<>();
	TripInfoDTO dto;
	PreparedStatement pstmt = null;
	String sql;
	ResultSet rs = null;
	
	try {
		
		/*sql = "SELECT DISTINCT A.conti, B.country, B.title ";
		sql += "FROM tib A, tib B ";
		sql += "WHERE A.conti=B.conti";
		*/
		sql = "select conti,title,country ";
		sql+= "from tib ";
		sql+="where conti='"+conti+"'";
		
		pstmt = conn.prepareStatement(sql);
		//pstmt.setString(1, conti);
		rs = pstmt.executeQuery();
	
		while(rs.next()) {
			
			dto = new TripInfoDTO();
			dto.setConti(rs.getString("conti"));
			dto.setTitle(rs.getString("title"));
			dto.setCountry(rs.getString("country"));
				

			lists.add(dto);
		}
		
		rs.close();
		pstmt.close();
	
	} catch (Exception e) {
		System.out.println("tripinfo getData() ����: "+e.toString());
	}
	return lists;
}
	
}
