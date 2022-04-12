package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Model.T_MemberDAO;
import Model.T_MemberDTO;
import Model.T_WarehouseDAO;
import Model.T_WarehouseDTO;

public class WarehouseInsertService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	// 창고 정보입력 기능
		System.out.println("[WarehouseInsertService]");
		String nextpage = "";
	request.setCharacterEncoding("utf-8");
		
	String mem_id = request.getParameter("mem_id");
	String w_addr = request.getParameter("w_addr");
	
	System.out.println("창고에 입력할 아이디 : " + mem_id);
	System.out.println("창고에 입력할 주소 : " + w_addr);
	
	T_WarehouseDTO dto = new T_WarehouseDTO(w_addr, mem_id);
	
	T_WarehouseDAO dao = new T_WarehouseDAO();
	int cnt = dao.insert(dto);
	
	if (cnt > 0) {
		System.out.println("창고 정보 입력이 성공하였습니다.");
		
		nextpage = "index.jsp";
	} else {
		System.out.println("창고 정보 입력이 실패하였습니다.");
		nextpage = "goMain";
	}
		return nextpage;
	}

}
