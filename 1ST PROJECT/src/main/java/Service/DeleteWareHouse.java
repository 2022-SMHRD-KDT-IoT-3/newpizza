package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.T_WarehouseDAO;

public class DeleteWareHouse implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[DeleteWareHouse.java]");
		
		// ȸ������ ���� ���

		String mem_id = request.getParameter("mem_id");
		String WH_Num = request.getParameter("WH_Num");
		
		T_WarehouseDAO dao = new T_WarehouseDAO();
		int cnt = dao.DeleteWarehouse(mem_id, WH_Num);

		if (cnt > 0) {
			System.out.println("â������ ���� ����");
		} else {
			System.out.println("â������ ���� ����");
		}

		String nextpage = "AdminWarehouseSelect.jsp";

		return nextpage;
	}

}
