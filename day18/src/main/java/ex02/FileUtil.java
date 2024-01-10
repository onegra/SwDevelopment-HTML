package ex02;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	
	private static FileUtil instance = new FileUtil();
	public static FileUtil getInstance() {
		return instance;
		}
	private FileUtil() {}
	
	//����ó���� ���õ� �ʵ�
	private HttpServletRequest request = null;
	private String saveDirectory = null;
	private int maxPostSize = 1024 * 1024 * 20;
	private String encoding = "UTF-8";
	private FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	//request�� ���޹޾Ƽ� ���� �� �ٸ� �����͸� dto�� ��Ƽ� ��ȯ�ϴ� �Լ�
	public Ex02DTO getDTO(HttpServletRequest request) throws IOException, ParseException {
		Ex02DTO dto = null;
		
		// 1) ������ ���丮�� ������ ���� �����ؾ� �Ѵ�
		if(saveDirectory == null) {
			this.request = request;
			ServletContext application = request.getServletContext();
			saveDirectory = application.getRealPath("/upload");
			File dir = new File(saveDirectory);
			dir.mkdirs();
			
			System.out.println(saveDirectory); //Ȯ�ο�
			
		}
		
		// 2)request�� �̿��Ͽ� MultipartRequest ��ü�� �����Ѵ�
		// �̶� ÷�������� saveDirectory ��ġ�� �ڵ����� �����ȴ� (���ε�ȴ�)
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy);
	
		// 3) �Ϲ� ���ڿ� �Ķ���ʹ� getParameter(String name)���� �޴´�
		String title = mpRequest.getParameter("title");
		
		// 4) ÷�������� getFile(String name)���� �޴´�
		File image = mpRequest.getFile("image"); //<input type="file" name="image">
		
		//5) java.sql.Date�� new java.sql.Date(new java.util.Date().getTime())�� �޴´�
		// String - > java.util.Date -> long -> java.sql.Date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String inputDate = mpRequest.getParameter("eventDate");
		java.util.Date d1 = sdf.parse(inputDate);
		long time = d1.getTime();
		java.sql.Date d2 = new java.sql.Date(d1.getTime());
		
		//6) �غ�� ���� dto�� ��� �����Ѵ�
		dto = new Ex02DTO();
		dto.setTitle(title);
		dto.setImage(image.getName());
		dto.setEventDate(d2); //������ �̸��� ���ڿ� �������� �����Ѵ�
		return dto;
	}
	
	//saveDirectory
	public String[] getFileNames() {
		String[] arr = null;
		if(saveDirectory != null) {
			File dir = new File(saveDirectory);
			arr = dir.list();
		} 
		return arr;
	}
	
}
