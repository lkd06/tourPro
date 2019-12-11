package com.util;

//page 처리
public class MyUtil {

	//전체 페이지 수 구하기
	public int getPageCount(int numPerPage,int dataCount) {
		int pageCount=0;
		
		pageCount = dataCount/numPerPage;
		if(dataCount%numPerPage!=0) {
			pageCount++;
		}
		
		return pageCount;
	}
	
	//페이징 처리 메소드
	//currentPage:현재 표시할 페이지
	//totalPage:전체 페이지 수
	//listUrl: 링크 설정할 URL(list.jsp)
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		//◀이전 1 2 3 4 5 다음▶  >>기본틀
		int numPerBlock = 5;
		int currentPageSetup;//표시할 페이지 -1(이전)
		int page;//
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			return "";
		}
		
		
		//listUrl
		//list.jsp
		//list.jsp?serachKey='name'&searchValue='suzi'
		if(listUrl.indexOf("?")!=-1) {
			listUrl = listUrl+"&";
		}
		else {
			listUrl = listUrl+"?";
		}
		
		//표시할 첫페이지
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		if(currentPage%numPerBlock==0) {
			currentPageSetup=currentPageSetup-numPerBlock;
		}
		
		//◀이전
		if(totalPage>numPerBlock && currentPageSetup>0) {
			sb.append("<a href=\""+listUrl+"pageNum="+
					currentPageSetup+"\">◀이전</a>&nbsp;");
			
			//<a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
		}
		
		//바로가기 페이지
		page = currentPageSetup+1;
		
		while(page<=totalPage && page<=currentPageSetup+numPerBlock) {
			if(page==currentPage) {
				sb.append("<font color=\"Fuchsai\">"+page+"</font>&nbsp;");
				//<font color="Fuchsia">9</font>
			}else {
				sb.append("<a href=\""+listUrl+"pageNum="+
						page + "\">"+page + "</a>&nbsp;");
				//<a href="list.jsp?pageNum=3?>3</a>
			}
			
			page++;
		}
		
		//다음▶
		if(totalPage-currentPageSetup>numPerBlock) {
			sb.append("<a href=\""+ listUrl + "pageNum="+page+"\">다음▶</a>&nbsp;");
			//<a href="list.jsp?pageNum=11"">다음▶</a>
		}
		
		return sb.toString();
	}
	public String ReplypageIndexList(int currentPage,int totalPage,String listUrl) {
		
		int numPerBlock = 5; //표시되는 페이지의 수
		int currentPageSetup; //표시할 페이지 -1 (이전)
		int page; // for 문에 i 와 같은 역할 
					
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			return ""; //메소드 반환값 string 이라 null 로 반환 
		}
		
		//listUrl
		//list.jsp?pageNum=5
		//list.jsp?searchKey=name&searchValue='suzi'&pageNum=5
		
		if(listUrl.indexOf("?")!=-1) //true이면 
			listUrl = listUrl +"&"; 
		//자료 검색한 url 넘어올 경우 pagenum 를 마지막에 붙이기 위해 & 먼저 처리
			
		else
			listUrl = listUrl + "?";
		
		//표시할 첫 페이지 1
		currentPageSetup = (currentPage/numPerBlock) * numPerBlock;
		
		if(currentPage%numPerBlock==0)
			currentPageSetup = currentPageSetup-numPerBlock;
		
		//◀이전
		if(totalPage>numPerBlock && currentPageSetup>0) {
			sb.append("<a href=\"" + listUrl+ "replypageNum=" + 
					currentPageSetup + "\">◀이전</a>&nbsp;"); 
			
			//<a href = "list.jsp?pageNum=5>◀이전</a>"
		}
	
		//바로가기페이지
		page = currentPageSetup +1;
		
		while(page<=totalPage && page<=(currentPageSetup+numPerBlock)) {
			
			if(page==currentPage) {
				
				sb.append("<font color=\"red\">" + page + 
						"</font>&nbsp;");
				//<font color ="Fuchsia">9</font>
								
			}else { //<a href="list.jsp?pageNum=3">3</a>
				sb.append("<a href=\"" + listUrl + "replypageNum=" + 
						+ page + "\">" + page+ "</a>&nbsp;");		
				
			}
			
			page++;
		}
		
		//다음▶
			//12-5(=7)>5
		if(totalPage-currentPageSetup>numPerBlock) {
			
			sb.append("<a href=\"" + listUrl + "replypageNum=" +
					page + "\">다음▶</a>&nbsp;" );	
			//<a href="list.jsp?pageNum=11">다음▶</a>
		}
		
		return sb.toString();
	}
	
	
}
