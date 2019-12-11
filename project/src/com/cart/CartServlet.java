package com.cart;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Trip.TripInfoDTO;
import com.mem.CustomInfo;
import com.util.DBConn;
import com.util.MyUtil;

public class CartServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		
		Connection conn = DBConn.getConnenction();
		CartDAO dao = new CartDAO(conn);
		
		MyUtil myUtil = new MyUtil();
		
		String uri = req.getRequestURI();
		String url;
		
		if(uri.indexOf("c_create.km")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			/*
			if(info==null) {
				
				url = "/cart/login.jsp";
				forward(req, resp, url);
				return;
			}*/
			url = "/cart/c_create.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("c_create_ok.km")!=-1) {
			
			CartDTO dto = new CartDTO();
			
			dto.setC_name(req.getParameter("c_name"));
			dto.setC_num(Integer.parseInt(req.getParameter("c_num")));
			dto.setC_price(Integer.parseInt(req.getParameter("c_price")));
			dto.setC_inwon(Integer.parseInt(req.getParameter("c_inwon")));
			
			dao.insertData(dto);
			
			url = cp + "/carts/c_list.km";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("c_list.km")!=-1) {
			//변경
			HttpSession session = req.getSession();
			CustomInfo cinfo = (CustomInfo)session.getAttribute("CustomInfo");
			
			//0930 추가
			int start;
			int end;
			int currentPage = 1;
			String pageNum = req.getParameter("pageNum");
			
			//0930 추가
			
			List<CartDTO> lists = dao.getLists(cinfo.getId());
			//변경
			
			
			//포워딩하는 데이터
			req.setAttribute("lists", lists);
			
			url = "/cart/c_list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("c_update.km")!=-1) {
			
			int c_num = Integer.parseInt(req.getParameter("c_num"));
			
			CartDTO dto = dao.getReadData(c_num);
			
			if(dto==null) {
				url = cp+"/carts/list.km";
				resp.sendRedirect(url);
			}
			
			req.setAttribute("dto", dto);
			
			url = "/carts/c_update.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("delete_ok.km")!=-1) {
			
			int num = Integer.parseInt(req.getParameter("num"));
			
			dao.deleteData(num);
			
			url = cp + "/carts/c_list.km";
			resp.sendRedirect(url);
		}else if(uri.indexOf("article.km")!=-1) {
		
			String c_num = req.getParameter("c_num");

			TripInfoDTO dto = dao.getData(Integer.parseInt(c_num));
			req.setAttribute("dto", dto);			
			url="/cart/c_article.jsp?c_num="+c_num;
			forward(req, resp, url);
		}else if(uri.indexOf("buy.km")!=-1) {
			int num = Integer.parseInt(req.getParameter("num"));
			int c_num = Integer.parseInt(req.getParameter("c_num"));
			TripInfoDTO dto = dao.getData(c_num);
			req.setAttribute("dto", dto);
			CartDTO Cdto = dao.getReadData(num);
			req.setAttribute("Cdto", Cdto);
			url = "/cart/buyView.jsp";
			forward(req, resp, url);
		}
		else if(uri.indexOf("buy_ok.km")!=-1) {
			//tib table update
			//cart table update
			int c_num=Integer.parseInt(req.getParameter("c_num"));
			int num=Integer.parseInt(req.getParameter("num"));
			
			int inwon=Integer.parseInt(req.getParameter("count"));
			dao.tripUpdate(c_num, inwon);
			dao.cartUpdate(num);
			
			url=cp+"/carts/c_list.km";
			resp.sendRedirect(url);
		}
	}
}
