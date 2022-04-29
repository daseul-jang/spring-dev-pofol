package com.jds.web.security.dto;

public class ResponseDataDTO {
	
	private String code;
	private String status;
	private String msg;
	private Object item;
	
	public ResponseDataDTO() {
		super();
	}

	public ResponseDataDTO(String code, String status, String msg, Object item) {
		super();
		this.code = code;
		this.status = status;
		this.msg = msg;
		this.item = item;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getItem() {
		return item;
	}

	public void setItem(Object item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "ResponseDataDTO [code=" + code + ", status=" + status + ", msg=" + msg + ", item=" + item + "]";
	}
}
