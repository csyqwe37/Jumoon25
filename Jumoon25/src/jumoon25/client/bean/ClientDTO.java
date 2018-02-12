package jumoon25.client.bean;

import java.sql.Timestamp;

public class ClientDTO {
	private String client_id;
	private String client_name;
	private String client_sex;
	private String client_phone;
	private String client_image;
	private String client_address;
	private int client_point;
	private Timestamp client_regdate;
	
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getClient_sex() {
		return client_sex;
	}
	public void setClient_sex(String client_sex) {
		this.client_sex = client_sex;
	}
	public String getClient_phone() {
		return client_phone;
	}
	public void setClient_phone(String client_phone) {
		this.client_phone = client_phone;
	}
	public String getClient_image() {
		return client_image;
	}
	public void setClient_image(String client_image) {
		this.client_image = client_image;
	}
	public String getClient_address() {
		return client_address;
	}
	public void setClient_address(String client_address) {
		this.client_address = client_address;
	}
	public int getClient_point() {
		return client_point;
	}
	public void setClient_point(int client_point) {
		this.client_point = client_point;
	}
	public Timestamp getClient_regdate() {
		return client_regdate;
	}
	public void setClient_regdate(Timestamp client_regdate) {
		this.client_regdate = client_regdate;
	}
  
}
