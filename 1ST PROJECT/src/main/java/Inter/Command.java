package Inter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	//�����ϴ� �޼ҵ带 ����
	//request, response������ �� �� �ֵ���
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	
	
}
