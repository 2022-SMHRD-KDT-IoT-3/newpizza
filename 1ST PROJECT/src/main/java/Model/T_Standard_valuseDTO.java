package Model;

public class T_Standard_valuseDTO {

	private String st_seq;
	private String sensor_type;
	private String st_value;
	private String w_seq;
	
	
	
	public T_Standard_valuseDTO(String st_seq, String sensor_type, String st_value, String w_seq) {
		super();
		this.st_seq = st_seq;
		this.sensor_type = sensor_type;
		this.st_value = st_value;
		this.w_seq = w_seq;
	}


	public String getSt_seq() {
		return st_seq;
	}


	public void setSt_seq(String st_seq) {
		this.st_seq = st_seq;
	}


	public String getSensor_type() {
		return sensor_type;
	}


	public void setSensor_type(String sensor_type) {
		this.sensor_type = sensor_type;
	}


	public String getSt_value() {
		return st_value;
	}


	public void setSt_value(String st_value) {
		this.st_value = st_value;
	}


	public String getW_seq() {
		return w_seq;
	}


	public void setW_seq(String w_seq) {
		this.w_seq = w_seq;
	}

	
	
}
	
	
	
