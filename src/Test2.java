
class Parent{
	public void pprn(){
		System.out.println("부모-pprn()");
	}
}

class Child extends Parent{
		public void cprn(){
			System.out.println("자식-cprn()");
		}
}


public class Test2 {

	public static void main(String[] args) {

		Parent p = new Parent();
		
		p.pprn();
		
		System.out.println("-------------------------------------");
		
		Child c = new Child();
		
		c.cprn();
		c.pprn();
		
		System.out.println("-------------------------------------");
		// 업캐스팅
		
		Parent p1 = new Child();
		
		p1.pprn();
		
		
		System.out.println("-------------------------------------");

		// 다운 캐스팅
		// 자식의 레퍼런스에 부모의 인스턴스를 저장
		
		// Child c1 = new Parent();
		// Child c1 = (Child)new Parent();

		// 강제형변환 => 컴파일러에게 문제가 있음을 알고, 그래도 진행한다.
		// c1.pprn();
		// c1.cprn();
		
		// 업캐스팅/다운캐스팅 시에는 2번에 단계를 사용해서 에러를 체크한다.
		// 1) 컴파일시 컴파일 오류 체크
		// 2) 실행할 때 예외를 체크한다
		
		////////////////////////////////////////////////////////////
		
		Parent p2 = new Child();
		
		Child c2 = (Child)p2;
		
		c2.pprn();
		c.cprn();
	}

}
