package entity;

public class Department {
	public int id;
	public String name;

	// hàm khởi tạo
	// có thể có hoặc k tham số cũng dc

	// HÀM KHỞI TẠO có tham số
	// public Department(int id, String name) {
	// this.id = id;
	// this.name = name;

	// }

	// public Department(String name, int id) {
	// this.id = id;
	// this.name = name;

	// }

	// public Department() {
	// this.id= 0;
	// this.name = "NULL";

	// }

	public Department(int id) {
		this.id = id;
		// this.name = "NULL";

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Phong ban :" + name + " -> ID = " + id;
	}

	// cách tạo HÀM KT nhanh

	public Department(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Department(String name, int id) {
		super();
		this.name = name;
		this.id = id;
	}

	public Department() {
		super();
	}

}
