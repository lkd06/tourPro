package com.proFile;

public class ProFileDTO {
	
	private int num;	//���ε� ��ȣ
	private String subject;	//���ε� ����
	private String saveFileName;	//���� �̸�
	private String originalFileName;	//���ε��� ���ϸ�
	private String content;	//��ǰ ����

	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}	

}
