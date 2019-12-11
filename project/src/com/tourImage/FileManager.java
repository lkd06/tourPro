package com.tourImage;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {

	//1. 파일 다운로드
	public static boolean doFileDownload(HttpServletResponse response,
			String saveFileName,String originalFileName, String path) {
		
		
		try {
			String fullPath = path + File.separator + saveFileName;
			if(originalFileName==null || originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			
			//한글 이름 파일을 다운 받을 때 깨짐 방지
			originalFileName = 
					new String(originalFileName.getBytes("euc-kr"),
							"ISO-8859-1");
			File f = new File(fullPath);
			if(!f.exists()) {
				return false;
			}
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition",
					"attachment;fileName="+originalFileName);
			//읽어서
			BufferedInputStream bis = 
					new BufferedInputStream(new FileInputStream(f));
			
			//내보냄
			OutputStream out =response.getOutputStream();
			int data;
			byte[] bytes =new byte[4096];
			
			while((data=bis.read(bytes,0,4096))!=-1) {
				out.write(bytes,0,data);
			}
			out.flush();
			out.close();
			bis.close();
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		
		return true;
	}
	
	
	 
	//2. 파일 삭제
	public static void doFileDelete(String fileName,String path) {
		try {
			String fullPath = path+File.separator+fileName;
			
			File f = new File(fullPath);
			if(f.exists()) {
				f.delete();
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
