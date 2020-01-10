package command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class StorepicUpdateCommend implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		System.out.println("업로드 경로: " + saveDirectory);

		String fileSystemName = null; // 실제 저장되는 파일 이름

		int maxPostSize = 5 * 1024 * 1024; // POST 받기, 최대 5M byte
		String encoding = "utf-8"; // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복에 대한 정책

		MultipartRequest multi = null;

		try {
			// MultipartRequest 객체 생성. 생성한것만으로도
			// 파일 저장 까지 마무리
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

			// 1. Parameter 추출
			Enumeration names = null;
			names = multi.getParameterNames(); // form 의 name들 추출

			// 2. File 들 추출
			names = multi.getFileNames(); // type="file" 요소의 name 들 추출
			while (names.hasMoreElements()) {

				String name = (String) names.nextElement();

				// 위 name 에는 폼 요소의 name 이 담겨 있다.
				// 그 name 을 사용하여 원래 파일(업로드 한 파일) 정보를 가져온다.
				String originalFileName = multi.getOriginalFileName(name);

				// 업로드할 폴더에 동일이름의 파일이 있으면 현재 업로드하는 파일이름은 바뀌어서 저장됨.
				// 물리적으로 저장된 파일 이름
				String fileSystemName = multi.getFilesystemName(name);

				// 업로딩 된 파일의 타입 : MIME 타입 (ex: image/png, image/jpeg...)
				String fileType = multi.getContentType(name);

				// File 객체 추출 가능
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
			out.println("파일 처리 예외 발생");
			throw e;
		}
	}

}
