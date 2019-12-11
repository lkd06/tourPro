package com.qna;

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

import com.project.ReplyDTO;
import com.util.DBConn;
import com.util.MyUtil;

public class qnaServlet extends HttpServlet{

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

		String cp = req.getContextPath();
		Connection conn = DBConn.getConnenction();
		qnaDAO dao = new qnaDAO(conn);
		ReDAO rdao = new ReDAO(conn);
		
		MyUtil myUtil = new MyUtil();
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		
		String url;
		
		if(uri.indexOf("qna.km")!=-1){
			
			//넘어온 페이지 번호(MyUtil, 수정, 삭제)ed
			String pageNum = req.getParameter("pageNum");

			int  currentPage = 1; //처음 실행하면 나오는 페이지

			if(pageNum!=null)
				currentPage = Integer.parseInt(pageNum);

			//검색
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null){ //사용자가 검색을 했으면
				searchKey = "subject";
				if(req.getMethod().equalsIgnoreCase("GET")) { //request에 담겨오는 메소드의 방식이 대소문자를 구분하지 않고 GET방식으로 넘어오면 
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			}else{ //검색을 하지 않았을때

				searchKey = "subject";
				searchValue = "";
			}

			//전체 데이터 구하기
			int dataCount = dao.getDataCount(searchKey, searchValue);
			
			//총 페이지수 구하기
			int numPerPage = 9; //하나의 페이지에 표시될 게시물 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			//전체페이지수보다 표시할 페이지가 더 큰경우
			if(currentPage>totalPage && currentPage!=1)
				currentPage = totalPage;

			//DB에서 가져올 데이터의 시작과 끝
			//System.out.println(currentPage);
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<qnaDTO> lists = dao.getList(start, end, searchKey, searchValue);


			String param = "";
			if(!searchValue.equals("")){ //검색했을때
				param = "?searchKey=" + searchKey;
				param+= "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
			}


			//페이지 처리
			String listUrl = cp + "/query/qna.km" + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);


			//article 주소 정리, 사용자정의
			String articleUrl = cp + "/query/qnaarticle.km";

			if(param.equals("")){ //null이면 검색을 안한거
				articleUrl = articleUrl + "?pageNum=" + currentPage; //num은 아래 for문 안에서만 만들어짐

			}else { //검색을 했을때
				articleUrl = articleUrl + param + "&pageNum=" + currentPage;
			}


			//포워딩 하는 데이터
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("articleUrl", articleUrl);

			url = "/qna/qna.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("qnacreated.km")!=-1){
			
			url = "/qna/qnacreated.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("qnacreated_ok.km")!=-1){
			
			qnaDTO dto = new qnaDTO();
			
			int maxNum = dao.getMaxNum();
			
			dto.setId(req.getParameter("id"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setCreated(req.getParameter("created"));
			dto.setEmail(req.getParameter("email"));
			dto.setIpAddr(req.getRemoteAddr());
			
			dao.insertData(dto);
			
			url = cp + "/query/qna.km";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("qnaarticle.km")!=-1){

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}

			dao.updateHitCount(num);//조회수 증가

			qnaDTO dto = dao.getReadData(num);

			if(dto==null) {

				url = cp + "/query/qna.km";
				resp.sendRedirect(url);
			}

			int lineSu = dto.getContent().split("\n").length;

			dto.setContent(dto.getContent().replace("\n", "<br/>"));

			String param = "pageNum=" + pageNum;

			if(searchValue!=null) {
				param += param + "&searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			req.setAttribute("dto", dto);
			req.setAttribute("params", param);
			req.setAttribute("lineSu", lineSu);
			req.setAttribute("pageNum", pageNum);

			url = "/qna/qnaarticle.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("qnare_ok.km")!=-1) {
			
			int num = Integer.parseInt(req.getParameter("num")); 

			String pageNum = req.getParameter("pageNum");	

			ReDTO redto = new ReDTO();

			int maxnum = rdao.getReplyMaxNum();

			redto.setNum(num);
			redto.setReplyno(maxnum+1);
			redto.setId(req.getParameter("id"));
			redto.setContent(req.getParameter("content"));
			redto.setCreated(req.getParameter("created"));

			rdao.insertReply(redto);

			req.setAttribute("num", num);
			req.setAttribute("replydto", redto);
			req.setAttribute("pageNum", pageNum);

			//System.out.println(replydto.getId());

			url = cp+"/query/qnaarticle.km?num="+num; //pageNum="+pageNum+"&;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("qnadeleted_ok.km")!=-1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}

			dao.deleteData(num);

			String params = "pageNum="+pageNum;

			if(searchValue!=null) {
				params += "&searchKey="+searchKey;
				params += "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}

			url = cp + "/query/qna.km?" + params;
			resp.sendRedirect(url);
		
		}else if(uri.indexOf("qnaupdated.km")!=-1){

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}

			String param = "pageNum=" + pageNum;

			if(searchValue!=null) {
				param = param + "&searchKey=" + searchKey;
				param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			qnaDTO dto = dao.getReadData(num);

			if(dto==null) {
				url = cp + "/query/qna.km";
				resp.sendRedirect(url);
			}

			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("params", param);
			req.setAttribute("searchKey", searchKey);
			req.setAttribute("searchValue", searchValue);

			url = "/qna/qnaupdated.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("qnaupdated_ok.km")!=-1){

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			qnaDTO dto = new qnaDTO();

			dto.setNum(num);
			dto.setId(req.getParameter("id"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setCreated(req.getParameter("created"));
			dto.setEmail(req.getParameter("email"));
			dto.setIpAddr(req.getRemoteAddr());

			dao.updateData(dto);

			String params = "pageNum=" + pageNum;

			if(searchValue!=null) {
				params+= "&searchKey=" + searchKey;
				params+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			url = cp + "/query/qna.km?="+ params;
			resp.sendRedirect(url);
			
		}

			
	
	}
	
}
