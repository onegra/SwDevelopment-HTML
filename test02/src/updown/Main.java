package updown;

import java.util.Random;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Random ran = new Random();
		int cpu, user, count = 0;
		cpu = ran.nextInt(100) + 1;
		
		while(true) {
			System.out.println("숫자입력 (1~100) :");
			user = sc.nextInt();
			count++;
			if(user == cpu) {
				break;
			}
			else if (user < cpu) {
				System.out.println("up");
			}
			else if (user > cpu) {
				System.out.println("down");
			}
		}
		System.out.printf("정답 %d회만에 정답을 맞췄음\n",count);
		sc.close();
	}

}
