/*
 * package Service;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import Inter.Command; import Model.T_MemberDAO; import Model.T_MemberDTO;
 * import Model.T_SensorDAO; import Model.T_SensorDTO;
 * 
 * public class t_sensorAdd implements Command {
 * 
 * @Override public String execute(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException {
 * 
 * // ���� ������ �߰� ��� System.out.println("[t_sensorAddServiceCon]"); String
 * nextpage = "";
 * 
 * // 1. post��� ���ڵ� request.setCharacterEncoding("UTF-8");
 * 
 * // 2. ������ �޾ƿ��� String[] sensor_type =
 * request.getParameterValues("sensor_type"); String[] sensor_unit =
 * request.getParameterValues("sensor_unit"); String[] sensor_inst_date =
 * request.getParameterValues("sensor_inst_date");
 * 
 * 
 * // 3. ������ DTO�� ���� // MemberDTO dto = new MemberDTO() // MemberDTO dto = new
 * MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate, mem_type); //
 * MemberDTO dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone);
 * T_SensorDTO dto = new T_SensorDTO(sensor_type, sensor_unit, sensor_type);
 * 
 * // 4. DB ������ DAO ȣ�� T_SensorDAO dao = new T_SensorDAO(); int cnt =
 * dao.t_sensorAdd(dto);
 * 
 * // ���� ���� // HttpSession Session = request.getSession();
 * 
 * // 5. ������ Ȯ�� if (cnt > 0) { System.out.println("T_sensor add �����Ͽ����ϴ�.");
 * 
 * // Session.setAttribute("mem_name", mem_name);
 * 
 * nextpage = "index.jsp";
 * 
 * } else { System.out.println("T_sensor add �����Ͽ����ϴ�."); nextpage = "goMain"; }
 * 
 * return nextpage;
 * 
 * // ȸ������ ��� ������ �� } }
 */