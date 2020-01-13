package command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.ShopDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class StorepicUpdateCommand implements Command {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 실제 저장되는 물리적인 경로 확인하기
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		System.out.println("업로드 경로: " + saveDirectory);

		String fileSystemName1, fileSystemName2, fileSystemName3; // 실제 저장되는 파일 이름

		int maxPostSize = 5 * 1024 * 1024; // POST 받기, 최대 5M byte
		String encoding = "utf-8"; // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복에 대한 정책

		MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트

		
		
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			Enumeration names = null;
			names = multi.getFileNames();
			
			while(names.hasMoreElements()){
				String name = (String)names.nextElement();
				
			// 2. File 추출
				File file = multi.getFile(name);
				if (file != null) {
					// 이미지 파일 다루기
					BufferedImage bi = ImageIO.read(file);
					if (bi == null) {
						System.out.println("이미지 파일이 아닙니다.");
					}
					bi.flush();
				}
			}
		} catch (Exception e) {
			System.out.println("파일처리 예외 발생");
		}

		// 실제 업로딩 된 파일 이름 (FileRenamePolicy 적용후)
		fileSystemName1 = multi.getFilesystemName("sh_picture1");
		fileSystemName2 = multi.getFilesystemName("sh_picture2");
		fileSystemName3 = multi.getFilesystemName("sh_picture3");

		// 파일 url, 나중에 link url 을 response 해줘야 한다
		String fullpath1 = saveDirectory + "\\" + fileSystemName1;
		String fullpath2 = saveDirectory + "\\" + fileSystemName2;
		String fullpath3 = saveDirectory + "\\" + fileSystemName3;

		int sh_uid = Integer.parseInt(multi.getParameter("sh_uid"));
		String sh_picture1 = fullpath1;
		String sh_picture2 = fullpath2;
		String sh_picture3 = fullpath3;

		ShopDAO dao = new ShopDAO();
		int cnt = 0;

		try {
			cnt = dao.infopicupdate(sh_uid, sh_picture1, sh_picture2, sh_picture3);
			request.setAttribute("info", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
