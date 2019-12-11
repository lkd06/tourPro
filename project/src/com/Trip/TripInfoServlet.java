package com.Trip;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proFile.FileManager;
import com.cart.CartDAO;
import com.cart.CartDTO;
import com.mem.CustomInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.proFile.ProFileDTO;
import com.util.DBConn;
import com.util.DBConn;
import com.util.MyUtil;

public class TripInfoServlet extends HttpServlet{
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
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();//최상위 폴더 위치
		
		Connection conn = DBConn.getConnenction();
		TripInfoDAO dao = new TripInfoDAO(conn);
		MyUtil myUtil = new MyUtil();
		
		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "ProFile";
		//System.out.println(path);
		//System.out.println(path);
		File f = new File(path);
		
		if(!f.exists()) {
			f.mkdirs();
		}
		
		//실제주소(처음부터 끝까지 전부)
		String uri = req.getRequestURI();
		
		String url;
		int numPerPage = 3;//나중에 개수 변경
		if(uri.indexOf("tripboard.km")!=-1) {
			//System.out.println("main에서 잘 넘어옴");
			//System.out.println("게시판 틀 만들자");
			int start;
			int end;
			int currentPage = 1;
			String pageNum = req.getParameter("pageNum");
			String value = req.getParameter("product");
			String key = req.getParameter("key");
			
			if(key==null || key.equals("")) {
				key="country";
			}
			if(value==null || value.equals("")) {
				value="";
			}
			
			int dataCount = dao.getCount(key,value);
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}
			if(totalPage<currentPage) {
				currentPage = totalPage;
			}
			start = (currentPage-1)*numPerPage+1;
			end =(currentPage)*numPerPage;
			
			
			List<TripInfoDTO> lists = dao.lists(value, key, start, end);
			//삭제, 다운
			
			String downloadPath = cp +"/travel/download.km";
			String deletePath = cp +"/travel/delete.km";
			
			//이미지 경로
			String imagePath = cp + "/pds/ProFile";
			req.setAttribute("imagePath", imagePath);
			//이미지
			
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("deletePath", deletePath);
			req.setAttribute("lists", lists);
			req.setAttribute("pageNum", currentPage);
			//밑에 깔아줄 페이지번호들
			String listUrl =cp+ "/travel/tripboard.km";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("count", dataCount);
			
			url="/trip/list.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("upload.km")!=-1) {
			//System.out.println("글쓰자");
			url="/trip/upload.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("upload_ok.km")!=-1) {
			//System.out.println("글 저장하자");
			String upload = req.getParameter("filename");
			String encType ="UTF-8";
			int maxSize = 10*1024*1024;
			MultipartRequest mr = 
					new MultipartRequest(req, path,maxSize, encType,
							new DefaultFileRenamePolicy());
			TripInfoDTO dto =new TripInfoDTO();
			dto.setConti(mr.getParameter("conti"));
			dto.setTitle(mr.getParameter("title"));
			dto.setCountry(mr.getParameter("country"));
			dto.setPrice(mr.getParameter("price"));
			dto.setInwon(Integer.parseInt(mr.getParameter("inwon")));
			dto.setContent(mr.getParameter("content"));
			dto.setStartdate(mr.getParameter("startdate"));
			dto.setEnddate(mr.getParameter("enddate"));
			dto.setGuide(mr.getParameter("guide"));
			//올린 파일이 있으면
			if(mr.getFile("filename")!=null) {
				//ProFileDTO dto = new ProFileDTO();
				dto.setFilename(mr.getFilesystemName("filename"));
			}
			dao.insertData(dto);
			url=cp+"/travel/tripboard.km";
			resp.sendRedirect(url);
		}else if(uri.indexOf("article.km")!=-1) {
			String pageNum = req.getParameter("pageNum");
			String num = req.getParameter("num");
			
			TripInfoDTO dto = dao.getData(Integer.parseInt(num));
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			req.setAttribute("dto", dto);
			
			String downloadPath = cp +"/travel/download.km";
			String deletePath = cp +"/travel/delete.km";
			String imagePath = cp + "/pds/ProFile";
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("deletePath", deletePath);
			
			if(pageNum==null ||pageNum.equals("")) pageNum="1";
			
			url="/trip/article.jsp?num="+num+"&pageNum="+pageNum;
			forward(req, resp, url);
		}else if(uri.indexOf("download.km")!=-1) {
			int num = Integer.parseInt(req.getParameter("num"));
			TripInfoDTO dto = dao.getReadData(num);
			
			boolean flag = 
					FileManager.doFileDownload(resp, dto.getFilename(),
					dto.getFilename(), path);
			
			if(flag==false) {
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out =resp.getWriter();
				
				out.print("<script type='text/javascript'>");
				out.print("alert('Download Error');");
				out.print("history.back();");
				out.print("</script>");
			}
			
		}else if(uri.indexOf("delete.km")!=-1) {
			//이미지 삭제하고 db에 있는 거 삭제(순서가 중요한가?)
			
			int num=Integer.parseInt(req.getParameter("num"));
			TripInfoDTO dto = dao.getReadData(num);
			FileManager.doFileDelete(dto.getFilename(),path);
			
			dao.delete(num);
			int currentPage = 1;
			String pageNum = req.getParameter("pageNum");
			if((pageNum!=null || pageNum.equals(""))){
				currentPage= Integer.parseInt(pageNum);
			}
			int dataCount = dao.getCount();
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage) {
				currentPage=totalPage;
			}
			req.setAttribute("pageNum", currentPage);
			url=cp+"/travel/tripboard.km?pageNum="+currentPage;
			resp.sendRedirect(url);
		}else if(uri.indexOf("purchase.km")!=-1) {
			String id = req.getParameter("id");
			String pageNum = req.getParameter("pageNum");
			int num = Integer.parseInt(req.getParameter("num"));

			int count;//=0;
			if(req.getParameter("count")==null) {
				count=1;
			}else {
				count = Integer.parseInt(req.getParameter("count"));
			}
			TripInfoDTO dto = dao.getData(num);

			if(pageNum==null ||pageNum.equals("")) pageNum="1";
			req.setAttribute("num", num);
			req.setAttribute("id", id);
			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("count", count);
			url="/trip/purchase.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("purchase_up.km")!=-1) {
			String id = req.getParameter("id");
			String pageNum = req.getParameter("pageNum");
			int num = Integer.parseInt(req.getParameter("num"));
			int count = Integer.parseInt(req.getParameter("count"));
			int inwon;
			count+=1;
			
			TripInfoDTO dto = dao.getData(num);
			inwon = dto.getInwon();
			if(count >inwon) {
				count=inwon;
				req.setAttribute("message", "더이상 추가할 수 없습니다.");
			}
			
			if(pageNum==null ||pageNum.equals("")) pageNum="1";
			req.setAttribute("num", num);
			req.setAttribute("id", id);
			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("count", count);
			url="/trip/purchase.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("purchase_down.km")!=-1) {
			String id = req.getParameter("id");
			String pageNum = req.getParameter("pageNum");
			int num = Integer.parseInt(req.getParameter("num"));
			
			int count = Integer.parseInt(req.getParameter("count"));
			
			count-=1;
			
			if(count<1 ) {
				count=1;
				req.setAttribute("message", "더이상 감소할 수 없습니다.");
			}
			
			TripInfoDTO dto = dao.getData(num);
			
			if(pageNum==null ||pageNum.equals("")) pageNum="1";
			req.setAttribute("num", num);
			req.setAttribute("id", id);
			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("count", count);
			url="/trip/purchase.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("purchase_ok.km")!=-1) {
			CartDTO c_dto = new CartDTO();
			CartDAO c_dao = new CartDAO(conn);
			String id = req.getParameter("id");
			//System.out.println("insert 들어옴");
			HttpSession session = req.getSession();
			CustomInfo cinfo = (CustomInfo)session.getAttribute("CustomInfo");
			
			c_dto.setId(cinfo.getId());
			
			c_dto.setC_name(req.getParameter("title"));
			c_dto.setC_num(Integer.parseInt(req.getParameter("num")));
			c_dto.setC_price(Integer.parseInt(req.getParameter("price")));
			c_dto.setC_inwon(Integer.parseInt(req.getParameter("count")));
			
			c_dao.insertData(c_dto);
			//System.out.println("insert 성공");
			url=cp+"/travel/purchase.km";
			resp.sendRedirect(url);
			
			
		}
		
	}
}
