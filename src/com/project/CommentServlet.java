package com.project;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Trip.TripInfoDAO;
import com.Trip.TripInfoDTO;
import com.mem.CustomInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.MyUtil;



public class CommentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}


	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {

		RequestDispatcher rd= req.getRequestDispatcher(url);
		rd.forward(req, resp);	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();

		Connection conn = DBConn.getConnenction();

		CommentDAO commentdao = new CommentDAO(conn);
		ReplyDAO replydao = new ReplyDAO(conn);
		//CommentImageDAO imagedao = new CommentImageDAO(conn);

		MyUtil myutil = new MyUtil();
		
		HttpSession session = req.getSession();
		CustomInfo cinfo = (CustomInfo)session.getAttribute("cinfo");

		String uri = req.getRequestURI();

		String url;

		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "imageFile";

		File f= new File(path);
		if(!f.exists())
			f.mkdirs();	

		if(uri.indexOf("comment.km")!=-1) { //후기 리스트

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null) {
				if(req.getMethod().equalsIgnoreCase("GET")) {
					searchValue = URLDecoder.decode(searchValue,"UTF-8");
				}				
			}else {
				searchKey = "subject";
				searchValue="";
			}

			int dataCount = commentdao.getDataCount(searchKey, searchValue);

			int numPerPage = 10;
			int totalPage = myutil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage) 
				currentPage = totalPage;

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<CommentDTO> lists = commentdao.getList(start, end,searchKey,searchValue);

			String param ="";
			if(!searchValue.equals("")){ 
				param = "?searchKey=" + searchKey;
				param += "&searchValue=" +  URLEncoder.encode(searchValue,"UTF-8"); 	
			}

			//페이지 처리
			String listUrl = cp + "/kmtour/comment.km"+param;
			String pageIndexList = myutil.pageIndexList(currentPage, totalPage, listUrl);

			//article 로 가는 주소 정리
			String articleUrl= cp+"/kmtour/commentarticle.km";

			if(param.equals("")){
				articleUrl=articleUrl+ "?pageNum=" + currentPage ; 
			}else{
				articleUrl = articleUrl + param + "&pageNum=" + currentPage; 
			}

		
	////////////////////////////////////////////////////////////////////////////////////
		
			List<CommentDTO> bestlists=commentdao.bestList(1, 4);
			String imagePath = cp+"/pds/imageFile";
		/*	System.out.println(imagePath);*/
////////////////////////////////////////////////////////////////////////////////////		
			
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("bestlists", bestlists);
			req.setAttribute("imagePath", imagePath);
						
			url = "/project/comment.jsp";
			forward(req, resp, url);
			
			
		}else if(uri.indexOf("commentwrite.km")!=-1) {  //후기 작성하기

			TripInfoDAO tripdao = new TripInfoDAO(conn);
			
			List<TripInfoDTO> contilists= tripdao.getConti();
			List<TripInfoDTO> data= tripdao.getContiData();
			String conti = req.getParameter("conti");
		
			req.setAttribute("conti", conti);
			req.setAttribute("contilists", contilists);
			req.setAttribute("data", data);
			
			
			url = "/project/commentwrite.jsp";
			forward(req, resp, url);		

		}else if(uri.indexOf("commentwrite_ch.km")!=-1) {  //후기 작성하기
			
			String conti = req.getParameter("conti");
			TripInfoDAO tripdao = new TripInfoDAO(conn);
			
			
			List<TripInfoDTO> contilists= tripdao.getConti();
			List<TripInfoDTO> data= tripdao.getContiData(conti);
			
			String product = req.getParameter("product");
			
			req.setAttribute("product", product);
			req.setAttribute("contilists", contilists);
			req.setAttribute("data", data);
			req.setAttribute("conti", conti);
			
			url = "/project/commentwrite.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("commentwrite_ok.km")!=-1) { //후기 insert

			int maxNum = commentdao.getMaxNum(); // 후기글
			String product = req.getParameter("products");
			
			//String c = req.getParameter("product");
			System.out.println(product+"!!!");
			String encType="UTF-8";
			int maximagesize = 10*1024*1024;
			MultipartRequest mr = new MultipartRequest(req, path,maximagesize,encType, new DefaultFileRenamePolicy());

			CommentDTO commentdto = new CommentDTO();

			commentdto.setNo(maxNum+1);
			commentdto.setId(mr.getParameter("id"));
			commentdto.setProduct(product);
			commentdto.setSubject(mr.getParameter("subject"));
			commentdto.setContent(mr.getParameter("content"));		

			if(mr.getFile("imageupload")!=null) {

				commentdto.setImagefilename(mr.getFilesystemName("imageupload"));

			}

			commentdao.insertComment(commentdto);

			url = cp+"/kmtour/comment.km";
			//resp.sendRedirect(url);

		}else if(uri.indexOf("commentarticle.km")!=-1) {

			int no=Integer.parseInt(req.getParameter("no"));

			String pageNum = req.getParameter("pageNum");		
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("seachValue");

			String imagePath = cp+"/pds/imageFile";

			if(searchValue!=null) {
				searchValue = URLDecoder.decode(searchValue,"UTF-8");
			}

			commentdao.updateHitCount(no);
			CommentDTO dto = commentdao.getReadData(no);

			if(dto==null) {
				url=cp+"kmtour/comment.km";
				resp.sendRedirect(url);		
			}

			dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));

			String param = "pageNum="+pageNum;

			if(searchValue!=null) {
				param += "&searchKey="+searchKey + "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");				
			}


			req.setAttribute("dto", dto);
			req.setAttribute("params", param);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("imagePath", imagePath);

			url = "/project/commentarticle.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("reply_ok.km")!=-1) {

			int no = Integer.parseInt(req.getParameter("no")); 

			String pageNum = req.getParameter("pageNum");	

			ReplyDTO replydto = new ReplyDTO();

			int maxnum = replydao.getReplyMaxNum();

			replydto.setNo(no);
			replydto.setReplyno(maxnum+1);
			replydto.setId(req.getParameter("id"));
			replydto.setContent(req.getParameter("content"));
			replydto.setCreated(req.getParameter("created"));

			replydao.insertReply(replydto);

			req.setAttribute("no", no);
			req.setAttribute("replydto", replydto);
			req.setAttribute("pageNum", pageNum);

			System.out.println(replydto.getId());

			url = cp+"/kmtour/commentarticle.km?no="+no; //pageNum="+pageNum+"&;
			resp.sendRedirect(url);

		}else if(uri.indexOf("updatecount_ok")!=-1) {

			int no=Integer.parseInt(req.getParameter("no")); 

			commentdao.updateCount(no);

			url = cp+"/kmtour/commentarticle.km?no=" +no; //pageNum="+pageNum+"&;
			resp.sendRedirect(url);

		} else if(uri.indexOf("commentdelete.km")!=-1) {

			int no=Integer.parseInt(req.getParameter("no")); 
			String pageNum= req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
	
			String params = "pageNum="+pageNum;

			if(searchValue!=null) {
				params +=  "&searchKey=" + searchKey+ "&searchValue="+searchValue;
			}
						
			commentdao.deleteComment(no);

			url=cp+"/kmtour/comment.km?"+params;
			resp.sendRedirect(url);	

		}else if(uri.indexOf("commentupdate.km")!=-1) {

			int no = Integer.parseInt(req.getParameter("no")); 
			String pageNum= req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if(searchValue!=null) {
				searchValue = URLDecoder.decode(searchValue,"utf-8");
			}

			String param = "pageNum="+pageNum;

			if(searchValue!=null) {
				param +=  "&searchKey=" + searchKey+ "&searchValue="+URLEncoder.encode(searchValue,"UTF-8");		
			}

			CommentDTO dto = commentdao.getReadData(no);

			req.setAttribute("no", no);
			req.setAttribute("dto", dto);
			req.setAttribute("pageNum",pageNum);
			req.setAttribute("params", param);
			req.setAttribute("searchKey", searchKey);
			req.setAttribute("searchValue", searchValue);

			url = "/project/commentupdate.jsp";
			forward(req, resp, url);	

		}else if(uri.indexOf("commentupdate_ok.km")!=-1) {		

			int no = Integer.parseInt(req.getParameter("no"));
			String pageNum= req.getParameter("pageNum");
			System.out.println("no: "+no+", pageNum: "+pageNum);
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			String encType="UTF-8";
			int maximagesize = 10*1024*1024;
			MultipartRequest mr = new MultipartRequest(req, path,maximagesize,encType, new DefaultFileRenamePolicy());


			String imagePath = cp+"/pds/imageFile";
			String params = "pageNum="+pageNum;

			if(searchValue!=null) {
				params +=  "&searchKey=" + searchKey+ "&searchValue="+searchValue;				
			}

			CommentDTO commentdto = new CommentDTO();

			commentdto.setNo(no);
			commentdto.setContent(mr.getParameter("content"));			
			commentdto.setProduct(mr.getParameter("product"));
			commentdto.setSubject(mr.getParameter("subject"));
			/*commentdto.setContent(mr.getParameter("content"));*/

			if(mr.getFile("imageupload")!=null) {

				commentdto.setImagefilename(mr.getFilesystemName("imageupload"));
			}


			commentdao.updateComment(commentdto);

			url = cp+"/kmtour/commentarticle.km?"+params+"&no="+no;
			resp.sendRedirect(url);
		}
	}
}