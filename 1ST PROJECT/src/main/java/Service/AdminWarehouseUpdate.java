package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_WarehouseDAO;
import Model.T_WarehouseDTO;

public class AdminWarehouseUpdate implements Command {
	@Override

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	// â�� ���� ���� ���
		System.out.println("[WarehouseUpdateService]");
		String nextpage = "";
	request.setCharacterEncoding("utf-8");
		
	String mem_id = request.getParameter("mem_id");
	String w_addr = request.getParameter("w_addr");
	
	System.out.println("������ �� ���̵� : " + mem_id);
	System.out.println("������ �� �ּ� : " + w_addr);
	
	T_WarehouseDTO dto = new T_WarehouseDTO(w_addr, mem_id);
	
	T_WarehouseDAO dao = new T_WarehouseDAO();
	int cnt = dao.Update(dto);
	PrintWriter out = response.getWriter();
	
	if (cnt > 0) {
		System.out.println("â�� ���� ������ �����Ͽ����ϴ�.");
		out.write("success"); 
		nextpage = "AdminWarehouseSelect.jsp";
	} else {
		System.out.println("â�� ���� ������ �����Ͽ����ϴ�.");
		out.write("fail"); 
		nextpage = "goMain";
	}
		return nextpage;
	}

}
