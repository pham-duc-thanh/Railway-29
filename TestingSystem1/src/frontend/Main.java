package frontend;

import java.util.Iterator;

import entity.Department;

public class Main {

	public static void main(String[] args) {

		/*
		 * + khởi tạo đối tượng ban đầu chưa có gì => goi là HÀM KHỞI TẠO RỔNG + mặc
		 * định class nào mới tọa ra cũng có HÀM KHỞI TẠO RỔNG
		 * 
		 * + HÀM KHỞI TẠO ddc gọi ở chữ "new" khi gọi + tên hàm kt trùng vs class luôn
		 *
		 * ++//hàm khởi tạo // có thể có hoặc k tham số cũng dc
		 *
		 * + muốn tạo bao nhiêu hàm kt cũng dc, miễn là k dc trùng dữ liệu
		 */

		Department department1 = new Department(12, "Phong 1");
		// System.out.println(department1.toString());

		System.out.println("------------------");

		// System.out.println(a+1);
		// System.out.println("------------");
		// System.out.println(a++);

		// a++ = a+1
		// a++;
		// System.out.println(a++);
		// System.out.println("------------");
		// System.out.println(a);

		// int a= 1;

		// int b, z;

		// b = a++;

		// z = ++a;

		// System.out.println(a);

		// System.out.println("------------");

		// System.out.println(b);

		// System.out.println("------------");

		// System.out.println(z);

		// int a = 1;
		// int b = 2;

		// if ( !(a < b)) {

		// System.out.println("a > b va a < 10");
		// }else {
		// System.out.println("a = " + a);
		// }

		// int a = 1;

		// a *= 100;

		// System.out.println(a);

		// int a = 2;

		// if (a==1) {
		// System.out.println(a);

		// } else if (a==2) {
		// System.out.println("a = 2");

		// }

		// System.out.println("a =====");

		// int a = 1;

		// switch (a) {
		// case 1: {
		// System.out.println(" a= 1");
		// }
		// break;
		// case 2: {
		// System.out.println(" a= 2");
		// }
		// break;
		// case 3: {
		// System.out.println(" a= 3");

		// break;
		// }
		// default:
		// System.out.println("a =====");

		// }

		// kiểu MẢNG (vòng lặp)

		int a[] = { 10, 20, 30, 40, 50 };

		System.out.println("length mang a = " + a.length);

		// for (int i = 0; i < a.length; i++) {

		// for (int i = 0; i <= 5; i ++) {

		// for (int x = 0; x < 5 ; x++) {

		for (int x = 0; x < a.length; x++) {
			if (a[x] == 30) {
				continue;
			}

			// System.out.println(a[i]);
			// vòng FOR
			// System.out.println(" i = " +i + ",a[i] = " + a[i]);

			// System.out.println(" x = " +x + ",a[x] = " + a[x]);

			System.out.printf("x = %d, a[%d] = %d\n", x, x, a[x]);

			// System.out.println();

		}

		System.out.println("------------------");

		// For each

		int i = 0;

		// for(int t : a ) {
		// System.out.printf(" i = %d, t = %d\n", i, t);
		// i++;

		for (int t : a) {
			System.out.printf("t = %d\n", t);

		}

		System.out.println("--------while----------");

		int index = 0;
		while (index < a.length) {

			System.out.printf("index = %d, a[%d] = %d\n", index, index, a[index]);
			index++;
		}

		System.out.println("--------Do while----------");

		int y = 10;

		do {

			System.out.printf("index =  %d\n", y);
			y++;

		} while (y < a.length);

		
		System.out.println("------------------");
		
		int c = 10;

		
		
	//	System.out.println(c == 0 ? "Hello c" : "Good bye");
		
		if (c == 0) {
			System.out.println("Hello c");
		} else {
			System.out.println("Good bye");
		}
	}

	// System.out.println(++a);
	// System.out.println("------------");
	// System.out.println(a);

	// System.out.println(9.0/2);
	// System.out.println("------------");
	// System.out.println(10%2);

	// Department department2 = new Department("Phong 2", 2);
	// System.out.println(department2);
	// department1.setId(1);
	// department1.setName("Phòng 1");

	// System.out.println("-----------");

	/// System.out.println(department1.toString());\

	// Department department3 = new Department();
	// department3.setId(3);
	// department3.setName("Phong 3");
	// System.out.println(department3);

}
