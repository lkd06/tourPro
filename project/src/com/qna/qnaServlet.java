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
			
			//�Ѿ�� ������ ��ȣ(MyUtil, ����, ����)ed
			String pageNum = req.getParameter("pageNum");

			int  currentPage = 1; //ó�� �����ϸ� ������ ������

			if(pageNum!=null)
				currentPage = Integer.parseInt(pageNum);

			//�˻�
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null){ //����ڰ� �˻��� ������
				searchKey = "subject";
				if(req.getMethod().equalsIgnoreCase("GET")) { //request�� ��ܿ��� �޼ҵ��� ����� ��ҹ��ڸ� �������� �ʰ� GET������� �Ѿ���� 
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			}else{ //�˻��� ���� �ʾ�����

				searchKey = "subject";
				searchValue = "";
			}

			//��ü ������ ���ϱ�
			int dataCount = dao.getDataCount(searchKey, searchValue);
			
			//�� �������� ���ϱ�
			int numPerPage = 9; //�ϳ��� �������� ǥ�õ� �Խù� ����
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			//��ü������������ ǥ���� �������� �� ū���
			if(currentPage>totalPage && currentPage!=1)
				currentPage = totalPage;

			//DB���� ������ �������� ���۰� ��
			//System.out.println(currentPage);
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<qnaDTO> lists = dao.getList(start, end, searchKey, searchValue);


			String param = "";
			if(!searchValue.equals("")){ //�˻�������
				param = "?searchKey=" + searchKey;
				param+= "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
			}


			//������ ó��
			String listUrl = cp + "/query/qna.km" + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);


			//article �ּ� ����, ���������
			String articleUrl = cp + "/query/qnaarticle.km";

			if(param.equals("")){ //null�̸� �˻��� ���Ѱ�
				articleUrl = articleUrl + "?pageNum=" + currentPage; //num�� �Ʒ� for�� �ȿ����� �������

			}else { //�˻��� ������
				articleUrl = articleUrl + param + "&pageNum=" + currentPage;
			}


			//������ �ϴ� ������
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

			dao.updateHitCount(num);//��ȸ�� ����

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
