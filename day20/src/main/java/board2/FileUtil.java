package board2;

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
	
	private String saveDirectory = "C:\\upload";
	private int maxPostSize = 1024 * 1024 * 20;
	private String encoding = "UTF-8";
	private FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public BoardDTO getDTO(HttpServletRequest request) throws IOException {
		BoardDTO dto = new BoardDTO();
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy);
	
		File uploadFile = mpRequest.getFile("uploadFile");
		if(uploadFile != null) {
			dto.setImage(uploadFile.getName());
		}
		
		dto.setTitle(mpRequest.getParameter("title"));
		dto.setWriter(mpRequest.getParameter("writer"));
		dto.setContent(mpRequest.getParameter("content"));
		dto.setIpaddr(mpRequest.getParameter("ipaddr"));
		return dto;
	}
	
}
