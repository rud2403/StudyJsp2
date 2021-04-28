package com.itwillbs.test;

public class itwillBean {

	private String name;
	private String tel;
	private int math;
	private int kor;
	private int eng;
	
//	public itwillBean() {
//		오버로딩된 생성자가 없을 경우에만 
//		컴파일러가 자동으로 생성해주는 기본생성자	
//	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	
	
	@Override
	public String toString() {
		return "itwillBean [name=" + name + ", tel=" + tel + ", math=" + math + ", kor=" + kor + ", eng=" + eng + "]";
	}
	
	
	
}
