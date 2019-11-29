package com.notice;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.cart.CartDAO;
import com.mem.CustomInfo;
import com.cart.CartDTO;
import com.util.DBConn;
import com.util.MyUtil;

public class NoticeServlet extends HttpServlet {

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
		NoticeDAO ndao = new NoticeDAO(conn);

		MyUtil myUtil = new MyUtil();

		String uri = req.getRequestURI();
		String url;

		if(uri.indexOf("no_create.km")!=-1) {
			
			url = "/notice/no_create.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("no_create_ok.km")!=-1) {

			NoticeDTO dto = new NoticeDTO();

			int maxNum = ndao.getMaxNum();

			dto.setNum(maxNum+1);
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setNoti(req.getParameter("noti"));

			ndao.insertData(dto);

			url = cp + "/not/no_list.km";
			resp.sendRedirect(url);

		}else if(uri.indexOf("no_list.km")!=-1) {

			url = "/notice/no_list.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("no_article.km")!=-1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}

			//조회수 증가
			ndao.updateHitCount(num);

			NoticeDTO dto = ndao.getReadData(num);

			if(dto==null) {
				url = cp + "/not/no_list.km";
				resp.sendRedirect(url);
			}

			//라인수
			int lineSu = dto.getContent().split("\n").length;

			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

			String param = "pageNum="+pageNum;

			if(searchValue!=null) {
				param += "&searchKey="+searchKey;
				param += "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}

			req.setAttribute("dto", dto);
			req.setAttribute("params", param);
			req.setAttribute("lineSu", lineSu);
			req.setAttribute("pageNum", pageNum);

			url = "/notice/no_article.jsp";
			forward(req, resp, url);

		}
	}
}
