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
 * // 센서 데이터 추가 기능 System.out.println("[t_sensorAddServiceCon]"); String
 * nextpage = "";
 * 
 * // 1. post방식 인코딩 request.setCharacterEncoding("UTF-8");
 * 
 * // 2. 데이터 받아오기 String[] sensor_type =
 * request.getParameterValues("sensor_type"); String[] sensor_unit =
 * request.getParameterValues("sensor_unit"); String[] sensor_inst_date =
 * request.getParameterValues("sensor_inst_date");
 * 
 * 
 * // 3. 데이터 DTO로 묶기 // MemberDTO dto = new MemberDTO() // MemberDTO dto = new
 * MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_joindate, mem_type); //
 * MemberDTO dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone);
 * T_SensorDTO dto = new T_SensorDTO(sensor_type, sensor_unit, sensor_type);
 * 
 * // 4. DB 연결할 DAO 호출 T_SensorDAO dao = new T_SensorDAO(); int cnt =
 * dao.t_sensorAdd(dto);
 * 
 * // 세션 선언 // HttpSession Session = request.getSession();
 * 
 * // 5. 실행결과 확인 if (cnt > 0) { System.out.println("T_sensor add 성공하였습니다.");
 * 
 * // Session.setAttribute("mem_name", mem_name);
 * 
 * nextpage = "index.jsp";
 * 
 * } else { System.out.println("T_sensor add 실패하였습니다."); nextpage = "goMain"; }
 * 
 * return nextpage;
 * 
 * // 회원가입 기능 마지막 줄 } }
 */