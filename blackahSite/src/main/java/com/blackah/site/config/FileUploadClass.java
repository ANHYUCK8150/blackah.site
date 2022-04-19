package com.blackah.site.config;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadClass {
	private static final String PREFIX_URL ="upload/";
	public String restore(MultipartFile multipartFile, HttpServletRequest request, HttpSession session) {
		String url = null;
		
		try {
			//파일정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			//서버에 저장 할 파일 이름
			String saveFileName = genSavefileName(extName);
			
			ServletContext context = session.getServletContext();
			String root_path = context.getRealPath(request.getContextPath());
			
			//String root_path = request.getSession().getServletContext().getRealPath("/");
			//String root_path = System.getProperty("user.dir")+"/src/main/resources/static/";
			System.out.println("originFilename :" + originFilename);
			System.out.println("extName :" + extName);
			System.out.println("size :" + size);
			System.out.println("saveFileName :" + saveFileName);
			System.out.println("url :" + root_path + PREFIX_URL + saveFileName);
			
			writeFile(multipartFile, saveFileName,root_path);
			url = PREFIX_URL + saveFileName;
			
		} catch (IOException e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
		
		return url;	
	}

	//파일을 실제로 write하는 메소드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName, String root_path) throws IOException {
		
		boolean result = false;
		
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(root_path + PREFIX_URL + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}

	private String genSavefileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
}
