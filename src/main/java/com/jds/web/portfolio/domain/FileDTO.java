package com.jds.web.portfolio.domain;

import java.sql.Timestamp;

public class FileDTO {

	private int file_no;			// 파일 코드 (pk)
	private int p_no;				// 포폴 코드 (포폴pk)
	private String file_name;		// 파일 이름
	private String file_path;		// 파일 경로
	private Timestamp file_regDate;	// 파일 등록 날짜
	private boolean fileChk;
	
	public FileDTO() {}

	public FileDTO(int file_no, int p_no, String file_name, String file_path, Timestamp file_regDate, boolean fileChk) {
		this.file_no = file_no;
		this.p_no = p_no;
		this.file_name = file_name;
		this.file_path = file_path;
		this.file_regDate = file_regDate;
		this.fileChk = fileChk;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public Timestamp getFile_regDate() {
		return file_regDate;
	}

	public void setFile_regDate(Timestamp file_regDate) {
		this.file_regDate = file_regDate;
	}

	public boolean getFileChk() {
		return fileChk;
	}

	public void setFileChk(boolean fileChk) {
		this.fileChk = fileChk;
	}

	@Override
	public String toString() {
		return "FileDTO [file_no=" + file_no + ", p_no=" + p_no + ", file_name=" + file_name + ", file_path="
				+ file_path + ", file_regDate=" + file_regDate + ", fileChk=" + fileChk + "]";
	}
	
}
