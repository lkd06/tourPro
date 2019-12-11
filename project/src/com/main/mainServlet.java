package com.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConn;

public class mainServlet extends HttpServlet{

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
		String imagePath = cp + "/pds/ProFile";
		req.setCharacterEncoding("UTF-8");
		mainDAO dao = new mainDAO(DBConn.getConnenction());
		if(uri.indexOf("main.km")!=-1) {
			
			List<mainDTO> lists = dao.getList();
			
			req.setAttribute("lists", lists);
			req.setAttribute("imagePath", imagePath);
			
			url="/project/index.jsp";
			forward(req, resp, url);
		}
	}

}
