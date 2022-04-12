package Model;

public class T_DeviceDTO {

private String device_uid;
private String device_loc;
private String device_inst_date;
private String mem_id;


public T_DeviceDTO(String device_uid, String device_loc, String device_inst_date, String mem_id) {
	super();
	this.device_uid = device_uid;
	this.device_loc = device_loc;
	this.device_inst_date = device_inst_date;
	this.mem_id = mem_id;
}

public String getDevice_uid() {
	return device_uid;
}
public void setDevice_uid(String device_uid) {
	this.device_uid = device_uid;
}
public String getDevice_loc() {
	return device_loc;
}
public void setDevice_loc(String device_loc) {
	this.device_loc = device_loc;
}
public String getDevice_inst_date() {
	return device_inst_date;
}
public void setDevice_inst_date(String device_inst_date) {
	this.device_inst_date = device_inst_date;
}
public String getMem_id() {
	return mem_id;
}
public void setMem_id(String mem_id) {
	this.mem_id = mem_id;
}







	
	
	
}
