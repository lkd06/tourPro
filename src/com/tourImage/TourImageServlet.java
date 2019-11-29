package com.tourImage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.proFile.FileManager;
import com.util.DBConn;
import com.util.MyUtil;

public class TourImageServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp,String url) throws ServletException, IOException {
		
		RequestDispatcher reqdisp = req.getRequestDispatcher(url);
		reqdisp.forward(req,resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		Connection conn = DBConn.getConnenction();
		TourImageDAO dao = new TourImageDAO(conn);
		
		String url;
		
		MyUtil myUtil = new MyUtil();//+
		
		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" +File.separator + "imageFile"; //"saveFile"
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(uri.indexOf("write.km")!=-1) {
			HttpSession session = req.getSession();
			CustomInfo cinfo = (CustomInfo)session.getAttribute("CustomInfo");
			
			url = "/tourImage/write.jsp";
			forward(req,resp,url);
		
		}else if(uri.indexOf("write_ok.km")!=-1){
			//1. 파일 업로드
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mreq = new MultipartRequest(req, path,maxSize,encType, new DefaultFileRenamePolicy());
			
			TourImageDTO dto = new TourImageDTO();
			//2. 파일 DB에 저장
			if(mreq.getFile("upload")!=null) {
				HttpSession session = req.getSession();
				CustomInfo cinfo = (CustomInfo)session.getAttribute("CustomInfo");
				
				dto.setId(cinfo.getId());
				dto.setNum(dao.getMaxNum() + 1);
				dto.setFileName(mreq.getFilesystemName("upload"));
				dto.setName(mreq.getParameter("name"));
				dao.insertData(dto);
			}
			url = cp + "/tourImages/list.km";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list.km")!=-1){
			
			//---------------------------------------------
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1; //처음 실행되는 페이지
			
			if(pageNum!=null)
				currentPage = Integer.parseInt(pageNum);
			
			//검색
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue!=null){ //사용자가 검색을 했으면
				if(req.getMethod().equalsIgnoreCase("GET")) { //request에 담겨오는 메소드의 방식이 대소문자를 구분하지 않고 GET방식으로 넘어오면 
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			}else{ //검색을 하지 않았을때

				searchKey = "num";
				searchValue = "";
			}
			
			//전체 데이터 개수
			int dataCount = dao.getDataCount(searchKey, searchValue);
			
			//전체 페이지 수
			int numPerPage = 12;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			//경우: 현재 페이지 수 > 전체 페이지 수
			if(currentPage > totalPage)
				currentPage = totalPage;
			//DB에서 데이터 시작과 끝
			int start = (currentPage - 1)*numPerPage + 1;
			int end = currentPage * numPerPage;	
			//------------------------------
			List<TourImageDTO> lists = dao.getLists(start, end, searchKey, searchValue); 	
			
			String param = "";
			if(!searchValue.equals("")){		
				param = "?searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}
			
			//페이지 처리
			String listUrl = cp + "/tourImages/list.km"+param; 
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			String deletePath = cp + "/tourImages/delete.km";
			String imagePath = cp + "/pds/imageFile";
			String downloadPath = cp + "/tourImages/download.km";
			//--------------------------------------------------------------
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			//---------------------------------------------	
			req.setAttribute("imagePath", imagePath);//+
			req.setAttribute("lists", lists);
			req.setAttribute("downloadPath", downloadPath); 
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("pageNum", currentPage);//+
			req.setAttribute("totalPage", totalPage);//총 페이지 출력용
			url = "/tourImage/list.jsp?pageNum=" + currentPage; 
			forward(req,resp,url);
		
		}else if(uri.indexOf("download.km")!=-1) {
			int num = Integer.parseInt(req.getParameter("num"));
			TourImageDTO dto = dao.getReadData(num);
			
			boolean flag = FileManager.doFileDownload(resp, dto.getFileName(),
					dto.getFileName(), path);
			
			if(flag==false) {
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out =resp.getWriter();
				
				out.print("<script type='text/javascript'>");
				out.print("alert('Download Error');");
				out.print("history.back();");
				out.print("</script>");
			}
		}else if(uri.indexOf("delete.km")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));	//num
			TourImageDTO dto = dao.getReadData(num);
			
			String pageNum = req.getParameter("pageNum");	//pageNum
			int currentPage = 1; //처음 실행되는 페이지
			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			//검색
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			if(searchValue != null) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			
			//전체 데이터 개수
			int dataCount = dao.getDataCount(searchKey, searchValue);
			//전체 페이지 수
			int numPerPage = 12;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			//경우: 현재 페이지 수 > 전체 페이지 수
			if(currentPage > totalPage)
				currentPage = totalPage;
			//DB에서 데이터 시작과 끝
			
			//1. 파일 삭제
			FileManager.doFileDelete(dto.getFileName(), path);
			//2. DB에서 데이터 삭제
			dao.deleteData(num);
			
			String params = "pageNum=" + pageNum;
			if(searchValue!=null) {
				params += "&searchKey=" + searchKey + "&searchValue=" +  URLEncoder.encode(searchValue, "UTF-8");
			}
			
			url = cp + "/tourImages/list.km?"+params;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("update.km")!=-1) {
			int num = Integer.parseInt(req.getParameter("num"));
			TourImageDTO dto = dao.getReadData(num);
			String pageNum = req.getParameter("pageNum");
			
			if(dto == null) {
				url = cp + "/tourImages/update.km";
				resp.sendRedirect(url);
			}
			
			req.setAttribute("num", num);
			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			
			url = "/tourImage/update.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("update_ok.km")!=-1){
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue != null)
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
			//---------------------------------------------페이지처리
			
			int currentPage = 1; //처음 실행되는 페이지
			
			if(pageNum!=null)
				currentPage = Integer.parseInt(pageNum);
	
			//전체 데이터 개수
			int dataCount = dao.getDataCount(searchKey, searchValue);
			//전체 페이지 수
			int numPerPage = 12;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			//경우: 현재 페이지 수 > 전체 페이지 수
			if(currentPage > totalPage)
				currentPage = totalPage;
			//------------------------------------------------
			
		
			//1. 파일 업로드
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mreq = new MultipartRequest(req, path,maxSize,encType, new DefaultFileRenamePolicy());		
			
			String imagePath = cp + "/pds/imageFile";
			
			TourImageDTO dto =new TourImageDTO();
			dto.setNum(num);
			dto.setName(mreq.getParameter("name"));
			
			if(mreq.getParameter("name")==null || mreq.getParameter("name").equals("")) {

			}
			dto.setFileName(mreq.getFilesystemName("upload"));
			
			if(mreq.getFile("upload")!=null) {
				dto.setFileName(mreq.getFilesystemName("upload"));
			}
			
			dao.updateData(dto);
			
			String params = "pageNum=" + pageNum;
			if(searchValue!=null) {
				params += "&searchKey=" + searchKey + "&searchValue=" +  URLEncoder.encode(searchValue, "UTF-8");
			}
			
			url = cp + "/tourImages/list.km?"+params;
			resp.sendRedirect(url);
		}
		
	}

}
