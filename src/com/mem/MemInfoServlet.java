package com.mem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConn;

public class MemInfoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp,String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url;
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		req.setCharacterEncoding("UTF-8");
		Connection conn = DBConn.getConnenction();
		MemInfoDAO dao = new MemInfoDAO(conn);
		
		if(uri.indexOf("join.km")!=-1) {
			url="/mem/joinView.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("join_ok.km")!=-1) {
			
			MemInfoDTO dto = new MemInfoDTO();
			dto.setId(req.getParameter("ch_id"));
			dto.setPw(req.getParameter("ch_pw"));
			
			dto.setAddr(req.getParameter("addr"));
			dto.setEmail(req.getParameter("email"));
			dto.setName(req.getParameter("name"));
			dto.setTel(req.getParameter("tel"));
			dto.setType(req.getParameter("type"));
			
			dao.insertData(dto);
			
			HttpSession session = req.getSession();
			session.removeAttribute("id");

			//ȸ�� ���� �Ϸ� �� main���� �̵�
			//String sp[] = uri.split("member");
			//member���� main���� �̵��ϱ� ���� ��ü
			url = cp+"/main/main.km";
			resp.sendRedirect(url);
		}else if(uri.indexOf("login.km")!=-1) {
			//�α��� ȭ�� �� �Ѿ�� �ٷ�
			url="/mem/login.jsp";
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			MemInfoDTO dto = dao.getReadData(id);
			if(dto==null || !dto.getPw().equals(pw)) {
				//�޼����� �� ��
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out =resp.getWriter();
				out.print("<script type='text/javascript'>");
				out.print("alert('�α��� ����');");
				out.print("history.back();");
				out.print("</script>");
				//System.out.println("����");
				return;
			}else {
				//valid ID and PW
				HttpSession session = req.getSession(); 
				CustomInfo cinfo = new CustomInfo();
				cinfo.setId(dto.getId());
				cinfo.setName(dto.getName());
				cinfo.setType(dto.getType());
				//System.out.println("����");
				session.setAttribute("CustomInfo", cinfo);
				
			}
			//ȸ�� ���� �Ϸ� �� main���� �̵�
			String sp[] = uri.split("member");
			//member���� main���� �̵��ϱ� ���� ��ü
			url = cp+"/main/main.km";
			resp.sendRedirect(url);
		}else if(uri.indexOf("logout.km")!=-1) {
			
			HttpSession session = req.getSession();
			session.removeAttribute("CustomInfo");
			session.invalidate();
			
			
			//ȸ�� ���� �Ϸ� �� main���� �̵�
			//String sp[] = uri.split("member");
			//member���� main���� �̵��ϱ� ���� ��ü
			url = cp+"/main/main.km";
			resp.sendRedirect(url);
		}else if(uri.indexOf("idcheck.km")!=-1) {
			String id = req.getParameter("id");
			
			int count = dao.findID(id);
			HttpSession session = req.getSession();
			session.removeAttribute("CustomInfo");
			session.invalidate();
			
			if(count==0) {				
				session.setAttribute("id", id);	
				req.setAttribute("id", id);
			}
			
			
			url="/mem/joinView.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("delete.km")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo cinfo = (CustomInfo)session.getAttribute("CustomInfo");
			session.removeAttribute("CustomInfo");
			session.invalidate();
			dao.deleteData(cinfo.getId());
			//ȸ�� ���� �Ϸ� �� main���� �̵�
			//String sp[] = uri.split("member");
			//member���� main���� �̵��ϱ� ���� ��ü
			url = cp+"/main/main.km";
			resp.sendRedirect(url);
		}else if(uri.indexOf("memInfo.km")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo cinfo = (CustomInfo)session.getAttribute("CustomInfo");
			
			MemInfoDTO dto = dao.getReadData(cinfo.getId());
			req.setAttribute("dto", dto);
			//System.out.println(dto.getId());
			url="/mem/memView.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("update.km")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo cinfo = (CustomInfo)session.getAttribute("CustomInfo");
			
			MemInfoDTO dto = dao.getReadData(cinfo.getId());
			req.setAttribute("dto", dto);
			//System.out.println(dto.getId());
			url="/mem/updateView.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("update_ok.km")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo cinfo = (CustomInfo)session.getAttribute("CustomInfo");
			
			MemInfoDTO dto = new MemInfoDTO();
			dto.setId(cinfo.getId());
			dto.setPw(req.getParameter("ch_pw"));
			dto.setAddr(req.getParameter("addr"));
			dto.setEmail(req.getParameter("email"));
			dto.setName(req.getParameter("name"));
			dto.setTel(req.getParameter("tel"));
			dto.setType(req.getParameter("type"));
			//System.out.println(req.getParameter("type")); 
			dao.updateData(dto);
			//String sp[] = uri.split("member");
			//member���� main���� �̵��ϱ� ���� ��ü
			url = cp+"/member/memInfo.km";
			resp.sendRedirect(url);
		}else if(uri.indexOf("idCheck.km")!=-1) {
			//System.out.println(req.getAttribute("id"));
			
			url="/mem/idCheck.jsp";
			forward(req, resp, url);
			
		}
		
	}


}
