package Model;

public class T_Sensor_valueDTO {

	private String sv_seq;
	private String sensor_seq;
	private String sv_data;
	private String sv_date;
	private String gate_num;
	private String mem_id;
	private String sensor_type;
	private String device_seq;
	

	public T_Sensor_valueDTO(String device_seq, String sensor_type, String sv_data, String sv_date) {
		super();
		this.sv_data = sv_data;
		this.sv_date = sv_date;
		this.sensor_type = sensor_type;
		this.device_seq = device_seq;
	}

	// T_Sensor_valueDTO dto = new T_Sensor_valueDTO(device_seq, sensor_type, sv_data, sv_date);
//	SENSOR_SEQ, SENSOR_TYPE, SV_DATE,T_SENSOR_VALUE
	
	
	
	
	public T_Sensor_valueDTO(String sensor_seq, String sv_data, String gate_num) {
		super();
		this.sensor_seq = sensor_seq;
		this.sv_data = sv_data;
		this.gate_num = gate_num;
	}

	/*
	 * public T_Sensor_valueDTO(String sv_seq, String sensor_seq, String sv_data,
	 * String gate_num) { super(); this.sv_seq = sv_seq; this.sensor_seq =
	 * sensor_seq; this.sv_data = sv_data; this.gate_num = gate_num; }
	 */

	public T_Sensor_valueDTO(String sv_seq, String sensor_seq, String sv_data, String sv_date, String gate_num,
			String mem_id) {
		super();
		this.sv_seq = sv_seq;
		this.sensor_seq = sensor_seq;
		this.sv_data = sv_data;
		this.sv_date = sv_date;
		this.gate_num = gate_num;
		this.mem_id = mem_id;
	}



	public String getSv_seq() {
		return sv_seq;
	}

	public void setSv_seq(String sv_seq) {
		this.sv_seq = sv_seq;
	}

	public String getSensor_seq() {
		return sensor_seq;
	}

	public void setSensor_seq(String sensor_seq) {
		this.sensor_seq = sensor_seq;
	}

	public String getSv_data() {
		return sv_data;
	}

	public void setSv_data(String sv_data) {
		this.sv_data = sv_data;
	}

	public String getSv_date() {
		return sv_date;
	}

	public void setSv_date(String sv_date) {
		this.sv_date = sv_date;
	}

	public String getGate_num() {
		return gate_num;
	}

	public void setGate_num(String gate_num) {
		this.gate_num = gate_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getSensor_type() {
		return sensor_type;
	}

	public void setSensor_type(String sensor_type) {
		this.sensor_type = sensor_type;
	}

	public String getDevice_seq() {
		return device_seq;
	}

	public void setDevice_seq(String device_seq) {
		this.device_seq = device_seq;
	}

}