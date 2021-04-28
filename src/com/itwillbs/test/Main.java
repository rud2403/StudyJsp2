package com.itwillbs.test;

public class Main {

	String name = "홍길동";
	String tel = "010-1234-1234";
	static int kor = 80;
	static int eng = 77;
	static int math = 86;
	
	itwillBean ib1 = new itwillBean();
	
	void showInfo(){
		
		System.out.println("이름 : " + name +" 전화번호 :" + tel);
	}
	
	void showScore(){
		
		System.out.println("총합 : " + (kor+math+eng) + " 평균 : " + ((kor+math+eng)/3.0));
	}
	
	// 메소드 생성 showTotal() -> itwillBean 객체를 사용해서
	// 사용정보 + 점수 정보 (총점, 평균)을 출력
	void showTotal(itwillBean bean){
		System.out.println("이름 : " + bean.getName()+ " 전화번호 : " + bean.getTel());
		System.out.println("총합 : " + (bean.getEng() + bean.getKor() + bean.getMath()) + " 전화번호 : " + bean.getTel());


	}
	
	// 계산전용 객체 Calc 생성
	// 총점 : 계산 후 리턴
	// 평균 : 계산 후 출력하는 기능까지 포함
	// 해당 메소드를 오버로딩해서 정수 3개, 객체정보를 사용하는 메소드

	
	public static void main(String[] args){
		itwillBean ib = new itwillBean();
		
		System.out.println(ib.toString());
		System.out.println("--------------------------------------");
		
		// 객체 생성없이 학생 한명의 정보를 생성 후
		// 학생의 정보 출력, 점수의 총 합과 평균을 계산 후 출력
		
		
		// 메소드 생성 showInfo() : 이름, 전화번호 출력
		//       "     showScore() : 총합, 평균 출력
		
		
		Main m = new Main();
		m.showInfo();
		m.showScore();
		
		System.out.println("---------------------------------");

		itwillBean jung = new itwillBean();
		jung.setName("정학생");
		jung.setTel("010-1234-1234");
		jung.setKor(66);
		jung.setEng(77);
		jung.setMath(88);
		
		m.showTotal(jung);
		
		System.out.println("---------------------------------------------");
		
		CalcPro c = new CalcPro();
		
		System.out.println(c.SUM(kor, eng, math));
		System.out.println(c.SUM(ib));

	}
}
