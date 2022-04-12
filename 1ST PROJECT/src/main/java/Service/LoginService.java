package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Model.T_MemberDAO;
import Model.T_MemberDTO;

public class LoginService implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//�α��� ���
		System.out.println("[LoginServiceCon]");
		
		// 1. post��� ���ڵ�
		request.setCharacterEncoding("UTF-8");
		
		// 2. email, pw �޾ƿ���
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		// 3. login�޼ҵ� ȣ��
		T_MemberDTO dto = new T_MemberDAO().login(mem_id, mem_pw);
		
		// 4. �������п���
		if(dto != null) {
			System.out.println("-- �α��� ����");
			System.out.println("�α��� ���̵� : " + dto.getMem_id());
			System.out.println("�α��� ��й�ȣ : " + dto.getMem_pw());
			System.out.println("�α��� �̸� : " + dto.getMem_name());
			
			HttpSession session = request.getSession();
			 session.setAttribute("info", dto);
			 //MemberDTO dtot = (MemberDTO)session.getAttribute("info");
			 // System.out.println(dtot.getMem_id());
		}else {
			System.out.println("-- �α��� ����");
		}
		
		//�α��α�� ��������
		String nextpage = "goMain";
		
		return nextpage;
	}
}
