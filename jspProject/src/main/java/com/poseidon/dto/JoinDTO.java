package com.poseidon.dto;

public class JoinDTO {
	private int age;
	private String id, passwd, name, email, addr, tel;
	
	   public JoinDTO(String id) {
		      this.id = id;
		   }

	
	//생성자
	public JoinDTO(int age, String id, String passwd, String name, String addr, String email, String tel) {
		
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.email = email;
		this.tel = tel;

	}


	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	



}
