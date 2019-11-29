package com.util;

//page ó��
public class MyUtil {

	//��ü ������ �� ���ϱ�
	public int getPageCount(int numPerPage,int dataCount) {
		int pageCount=0;
		
		pageCount = dataCount/numPerPage;
		if(dataCount%numPerPage!=0) {
			pageCount++;
		}
		
		return pageCount;
	}
	
	//����¡ ó�� �޼ҵ�
	//currentPage:���� ǥ���� ������
	//totalPage:��ü ������ ��
	//listUrl: ��ũ ������ URL(list.jsp)
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		//������ 1 2 3 4 5 ������  >>�⺻Ʋ
		int numPerBlock = 5;
		int currentPageSetup;//ǥ���� ������ -1(����)
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
		
		//ǥ���� ù������
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		if(currentPage%numPerBlock==0) {
			currentPageSetup=currentPageSetup-numPerBlock;
		}
		
		//������
		if(totalPage>numPerBlock && currentPageSetup>0) {
			sb.append("<a href=\""+listUrl+"pageNum="+
					currentPageSetup+"\">������</a>&nbsp;");
			
			//<a href="list.jsp?pageNum=5">������</a>&nbsp;
		}
		
		//�ٷΰ��� ������
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
		
		//������
		if(totalPage-currentPageSetup>numPerBlock) {
			sb.append("<a href=\""+ listUrl + "pageNum="+page+"\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=11"">������</a>
		}
		
		return sb.toString();
	}
	public String ReplypageIndexList(int currentPage,int totalPage,String listUrl) {
		
		int numPerBlock = 5; //ǥ�õǴ� �������� ��
		int currentPageSetup; //ǥ���� ������ -1 (����)
		int page; // for ���� i �� ���� ���� 
					
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			return ""; //�޼ҵ� ��ȯ�� string �̶� null �� ��ȯ 
		}
		
		//listUrl
		//list.jsp?pageNum=5
		//list.jsp?searchKey=name&searchValue='suzi'&pageNum=5
		
		if(listUrl.indexOf("?")!=-1) //true�̸� 
			listUrl = listUrl +"&"; 
		//�ڷ� �˻��� url �Ѿ�� ��� pagenum �� �������� ���̱� ���� & ���� ó��
			
		else
			listUrl = listUrl + "?";
		
		//ǥ���� ù ������ 1
		currentPageSetup = (currentPage/numPerBlock) * numPerBlock;
		
		if(currentPage%numPerBlock==0)
			currentPageSetup = currentPageSetup-numPerBlock;
		
		//������
		if(totalPage>numPerBlock && currentPageSetup>0) {
			sb.append("<a href=\"" + listUrl+ "replypageNum=" + 
					currentPageSetup + "\">������</a>&nbsp;"); 
			
			//<a href = "list.jsp?pageNum=5>������</a>"
		}
	
		//�ٷΰ���������
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
		
		//������
			//12-5(=7)>5
		if(totalPage-currentPageSetup>numPerBlock) {
			
			sb.append("<a href=\"" + listUrl + "replypageNum=" +
					page + "\">������</a>&nbsp;" );	
			//<a href="list.jsp?pageNum=11">������</a>
		}
		
		return sb.toString();
	}
	
	
}
