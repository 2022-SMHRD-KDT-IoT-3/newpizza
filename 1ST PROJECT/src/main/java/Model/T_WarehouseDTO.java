package Model;

public class T_WarehouseDTO {

	private String w_addr;
	private String mem_id;
	String w_latitude;
	String w_longitude;
	
	public T_WarehouseDTO(String w_addr, String mem_id, String w_latitude, String w_longitude) {
		super();
		this.w_addr = w_addr;
		this.mem_id = mem_id;
		this.w_latitude = w_latitude;
		this.w_longitude = w_longitude;
	}
	

	public T_WarehouseDTO(String w_addr, String mem_id) {
		super();
		this.w_addr = w_addr;
		this.mem_id = mem_id;
	}


	public String getW_addr() {
		return w_addr;
	}

	public void setW_addr(String w_addr) {
		this.w_addr = w_addr;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getW_latitude() {
		return w_latitude;
	}

	public void setW_latitude(String w_latitude) {
		this.w_latitude = w_latitude;
	}

	public String getW_longitude() {
		return w_longitude;
	}

	public void setW_longitude(String w_longitude) {
		this.w_longitude = w_longitude;
	}
	
	
	
	
	
}
