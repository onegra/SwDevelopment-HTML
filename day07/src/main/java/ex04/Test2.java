package ex04;

public class Test2 {
	 Test2() {
		 System.out.println("Test2 생성자 호출");
	 }
	 private static Test2 instance;
	 public static Test2 getInstance() {
		 if(instance ==  null) {
			 instance = new Test2();
		 }
		 return instance;
	 }

}
