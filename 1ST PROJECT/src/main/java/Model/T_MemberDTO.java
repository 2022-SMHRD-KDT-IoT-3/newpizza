package Model;

public class T_MemberDTO {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private String mem_type;
	private String mem_joindate;
	
	public T_MemberDTO() {
		super();
	}
	
	public T_MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_phone) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
	}
	
	public T_MemberDTO(String mem_id, String mem_pw) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
	}


	public T_MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_phone, String mem_type,
			String mem_joindate) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
		this.mem_type = mem_type;
		this.mem_joindate = mem_joindate;
	}
	
	public T_MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_phone, String mem_type) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
		this.mem_type = mem_type;
	}
	
	public T_MemberDTO(String mem_id, String mem_pw, String mem_name) {
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getMem_pw() {
		return mem_pw;
	}


	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public String getMem_phone() {
		return mem_phone;
	}


	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}


	public String getMem_type() {
		return mem_type;
	}


	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}

	
	
}

