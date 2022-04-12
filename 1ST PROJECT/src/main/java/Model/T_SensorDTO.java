package Model;

public class T_SensorDTO {

private String sensor_seq; // ���� ����
private String device_seq; // ����̽� ����
private String sensor_type;	 // ���� Ÿ��
private String sensor_unit;	 // ���� ����
private String sensor_inst_date; // ���� ��ġ ����

public T_SensorDTO() {
	super();
}



public T_SensorDTO(String sensor_type, String sensor_unit, String sensor_inst_date) {
	super();
	this.sensor_type = sensor_type;
	this.sensor_unit = sensor_unit;
	this.sensor_inst_date = sensor_inst_date;
}

public String getSensor_type() {
	return sensor_type;
}
public void setSensor_type(String sensor_type) {
	this.sensor_type = sensor_type;
}
public String getSensor_unit() {
	return sensor_unit;
}
public void setSensor_unit(String sensor_unit) {
	this.sensor_unit = sensor_unit;
}
public String getSensor_inst_date() {
	return sensor_inst_date;
}
public void setSensor_inst_date(String sensor_inst_date) {
	this.sensor_inst_date = sensor_inst_date;
}



}