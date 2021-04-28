package com.itwillbs.test;

public class CalcPro{

	int kor =10;
	int eng = 20;
	int math = 30;
	
	public int SUM(int kor, int eng, int math){
		return kor + eng + math;

	}	
	
	public void AVG(int kor, int eng, int math){

		System.out.println("총합 : " + (kor + eng + math)/3);

		
	}
	
	public int SUM(itwillBean ib){
		return ib.getKor() + ib.getEng() + ib.getMath(); 
	}	
	
	public void AVG(itwillBean ib){
		
		System.out.println("평균 : " + (ib.getKor() + ib.getEng() + ib.getMath())/3);
		
	}
	
	
	public static void main(String[] args) {

		CalcPro c = new CalcPro();

		
	}

}
