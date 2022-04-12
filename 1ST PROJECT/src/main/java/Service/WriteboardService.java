package Service;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Inter.Command;
import Model.BoardDAO;
import Model.BoardDTO;

public class WriteboardService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			request.setCharacterEncoding("UTF-8");

			String savePath = request.getServletContext().getRealPath("./file");
			System.out.println(savePath);
			
			// maxsize : �̹����� ũ�� ����
			 int maxsize = 10 * 1024 * 1024; // = 10MB

			String encoding = "UTF-8";

			// filePolicy : �����̸� �ߺ�����
			DefaultFileRenamePolicy filePolicy = new DefaultFileRenamePolicy();

			MultipartRequest multi = new MultipartRequest(request,savePath, maxsize,encoding,filePolicy);
			


			String title = multi.getParameter("title");
			String writer = multi.getParameter("writer");
			
			String fileName = URLEncoder.encode(multi.getFilesystemName("fileName"),"UTF-8");
//			if(fileName==null) {
//				fileName="1";
//			}
			String content = multi.getParameter("content");

			System.out.println("title" + title);
			System.out.println("content" + content);
			System.out.println("fileName" + fileName); 
			System.out.println("writer" + writer);

			System.out.println("������� ����!");
			
		
            BoardDTO dto = new BoardDTO(0, title, content, fileName, "", writer, 0);		
//			BoardDTO dto = new BoardDTO(0, title, writer, fileName, content, "", 0);
			int cnt = new BoardDAO().insertBoard(dto);
			
			if (cnt > 0) {
				System.out.println("���Ͼ��ε� ����!");
			} else {
				System.out.println("���Ͼ��ε� ����!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "BoardMain.jsp";
	}

}
