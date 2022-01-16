package frontend;

import java.time.LocalDate;

import entity.Account;
import entity.Answer;
import entity.CategoryQuestion;
import entity.Department;
import entity.Exam;
import entity.Group;
import entity.Position;
import entity.PositionName;
import entity.Question;
import entity.TypeName;
import entity.TypeQuestion;

public class Program {

	public static void main(String[] args) {

		// Tao DEPARTMENT
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Phòng sale";

		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Phòng kinh tế ";

		Department department3 = new Department();
		department3.id = 3;
		department3.name = "Phòng giám đốc";

		Department department4 = new Department();
		department4.id = 4;
		department4.name = "Phòng tài chính";

		Department department5 = new Department();
		department5.id = 5;
		department5.name = "Phòng bảo vệ";

		// Tao POSITION

		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.DEV;

		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.TEST;
		Position position3 = new Position();
		position3.id = 3;
		position3.name = PositionName.SCRUM_MASTER;

		Position position4 = new Position();
		position4.id = 4;
		position4.name = PositionName.PM;

		Position position5 = new Position();
		position5.id = 5;
		position5.name = PositionName.DEV;

		// Tao ACCOUNT

		Account account1 = new Account();
		account1.id = 1;
		account1.email = "iloveyou@gmail.com";
		account1.userName = "thanhpham";
		account1.fullName = "Phạm Đức Thanh";
		account1.department = department4;
		account1.position = position3;
		account1.createDate = LocalDate.now();

		Account account2 = new Account();
		account1.id = 2;
		account2.email = "omchay@gmail.com";
		account2.userName = "danghau";
		account2.fullName = "Đặng Đình Hậu";
		account2.department = department2;
		account2.position = position2;
		account2.createDate = LocalDate.of(2020, 10, 1);

		Account account3 = new Account();
		account3.id = 3;
		account3.email = "taothichmi@gmail.com";
		account3.userName = "hieutrung";
		account3.fullName = "Phạm Trung Hiếu";
		account3.department = department5;
		account3.position = position4;
		account3.createDate = LocalDate.now();

		Account account4 = new Account();
		account4.id = 4;
		account4.email = "chode@gmail.com";
		account4.userName = "saule";
		account4.fullName = "Lê Thanh Sáu";
		account4.department = department4;
		account4.position = position5;
		account4.createDate = LocalDate.of(2019, 1, 10);

		Account account5 = new Account();
		account5.id = 5;
		account5.email = "taolao@gmail.com";
		account5.userName = "thinguyen";
		account5.fullName = "Nguyễn Trường Thi";
		account5.department = department1;
		account5.position = position1;
		account5.createDate = LocalDate.now();

		// Tạo GROUP

		Group group1 = new Group();
		group1.id = 1;
		group1.name = "FAMILY";
		group1.creator = account1;
		group1.createDate = LocalDate.of(2021, 1, 2);

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "SÚC VẬT";
		group2.creator = account3;
		group2.createDate = LocalDate.now();

		Group group3 = new Group();
		group3.id = 3;
		group3.name = "HELLO";
		group3.creator = account2;
		group3.createDate = LocalDate.of(2020, 12, 12);

		Group group4 = new Group();
		group4.id = 4;
		group4.name = "M-TP";
		group4.creator = account4;
		group4.createDate = LocalDate.now();

		Group group5 = new Group();
		group5.id = 5;
		group5.name = "365band";
		group5.creator = account5;
		group5.createDate = LocalDate.now();

		// Tạo GROUP AND ACCOUNT

		Group[] groupOfAccount1 = { group1, group3, group4 };
		account1.groups = groupOfAccount1;

		Group[] groupOfAccount2 = { group1, group2, group3, group4, group5 };
		account3.groups = groupOfAccount2;

		Group[] groupOfAccount3 = { group2 };
		account2.groups = groupOfAccount3;

		Group[] groupOfAccount4 = { group1, group4, group5 };
		account4.groups = groupOfAccount4;

		Group[] groupOfAccount5 = { group1, group5 };
		account5.groups = groupOfAccount5;

		Account[] accountOfG1 = { account1, account2, account3 };
		group1.accounts = accountOfG1;

		Account[] accountOfG2 = { account3, account4 };
		group2.accounts = accountOfG2;

		Account[] accountOfG3 = { account5 };
		group3.accounts = accountOfG3;

		Account[] accountOfG5 = { account1, account3, account2, account4, account5 };
		group4.accounts = accountOfG5;

		Account[] accountOfG4 = { account1, account5 };
		group3.accounts = accountOfG4;

		// Tạo TypeQuestion

		TypeQuestion typeQuestion1 = new TypeQuestion();
		typeQuestion1.id = 1;
		typeQuestion1.name = TypeName.ESSAY;

		TypeQuestion typeQuestion2 = new TypeQuestion();
		typeQuestion2.id = 2;
		typeQuestion2.name = TypeName.MULTIPLE_CHOICE;

		TypeQuestion typeQuestion3 = new TypeQuestion();
		typeQuestion3.id = 3;
		typeQuestion3.name = TypeName.ESSAY;

		TypeQuestion typeQuestion4 = new TypeQuestion();
		typeQuestion4.id = 4;
		typeQuestion4.name = TypeName.ESSAY;

		TypeQuestion typeQuestion5 = new TypeQuestion();
		typeQuestion5.id = 5;
		typeQuestion5.name = TypeName.MULTIPLE_CHOICE;

		// Tạo CategoryQuestion

		CategoryQuestion categoryQuestion1 = new CategoryQuestion();
		categoryQuestion1.id = 1;
		categoryQuestion1.name = "JAVA";

		CategoryQuestion categoryQuestion2 = new CategoryQuestion();
		categoryQuestion2.id = 2;
		categoryQuestion2.name = "RUBY";

		CategoryQuestion categoryQuestion3 = new CategoryQuestion();
		categoryQuestion3.id = 3;
		categoryQuestion3.name = "POSTMAN";

		CategoryQuestion categoryQuestion4 = new CategoryQuestion();
		categoryQuestion4.id = 4;
		categoryQuestion4.name = "SQL";

		CategoryQuestion categoryQuestion5 = new CategoryQuestion();
		categoryQuestion5.id = 5;
		categoryQuestion5.name = "NET";

		// Tạo Question

		Question question1 = new Question();
		question1.id = 1;
		question1.content = "JAVA là gì";
		question1.category = categoryQuestion1;
		question1.type = typeQuestion2;
		question1.creator = account3;
		question1.createDate = LocalDate.now();

		Question question2 = new Question();
		question2.id = 2;
		question2.content = "RUBY là gì";
		question2.category = categoryQuestion2;
		question2.type = typeQuestion1;
		question2.creator = account2;
		question2.createDate = LocalDate.of(2021, 1, 1);

		Question question3 = new Question();
		question3.id = 3;
		question3.content = "POSTMAN là gì";
		question3.category = categoryQuestion3;
		question3.type = typeQuestion1;
		question3.creator = account1;
		question3.createDate = LocalDate.now();

		Question question4 = new Question();
		question4.id = 4;
		question4.content = "SQL là gì";
		question4.category = categoryQuestion4;
		question4.type = typeQuestion3;
		question4.creator = account5;
		question4.createDate = LocalDate.now();

		Question question5 = new Question();
		question5.id = 5;
		question5.content = " NET là gì ";
		question5.category = categoryQuestion1;
		question5.type = typeQuestion1;
		question5.creator = account4;
		question5.createDate = LocalDate.of(2020, 12, 12);

		// Tạo Answer

		Answer answer1 = new Answer();
		answer1.id = 1;
		answer1.content = "Trả lời JAVA";
		answer1.question = question1;
		answer1.isCorrect = true;

		Answer answer2 = new Answer();
		answer2.id = 2;
		answer2.content = "Trả lời POSTMAN";
		answer2.question = question3;
		answer2.isCorrect = true;

		Answer answer3 = new Answer();
		answer3.id = 3;
		answer3.content = "Trả lời RUBY";
		answer3.question = question2;
		answer3.isCorrect = false;

		Answer answer4 = new Answer();
		answer4.id = 4;
		answer4.content = "Trả lời SQL";
		answer4.question = question4;
		answer4.isCorrect = true;

		Answer answer5 = new Answer();
		answer5.id = 5;
		answer5.content = "Trả lời NET";
		answer5.question = question5;
		answer5.isCorrect = false;

		// Tạo Exam

		Exam exam1 = new Exam();
		exam1.id = 1;
		exam1.code = "AB15";
		exam1.title = "Kiểm tra JAVA";
		exam1.category = categoryQuestion1;
		exam1.duration = 15;
		exam1.creator = account1;
		exam1.createDate = LocalDate.now();

		Exam exam2 = new Exam();
		exam2.id = 2;
		exam2.code = "AA20";
		exam2.title = "Kiểm tra POSTMAN";
		exam2.category = categoryQuestion3;
		exam2.duration = 60;
		exam2.creator = account2;
		exam2.createDate = LocalDate.now();

		Exam exam3 = new Exam();
		exam3.id = 3;
		exam3.code = "AA10";
		exam3.title = "Kiểm tra RUBY";
		exam3.category = categoryQuestion2;
		exam3.duration = 60;
		exam3.creator = account5;
		exam3.createDate = LocalDate.of(2021, 12, 31);

		Exam exam4 = new Exam();
		exam4.id = 4;
		exam4.code = "AA30";
		exam4.title = "Kiểm tra SQL";
		exam4.category = categoryQuestion5;
		exam4.duration = 45;
		exam4.creator = account3;
		exam4.createDate = LocalDate.now();

		Exam exam5 = new Exam();
		exam5.id = 5;
		exam5.code = "AA15";
		exam5.title = "Kiểm tra NET";
		exam5.category = categoryQuestion4;
		exam5.duration = 45;
		exam5.creator = account4;
		exam5.createDate = LocalDate.now();

		// Exam & Question

		Exam[] questionOfExam1 = { exam1 };
		question1.exams = questionOfExam1;

		Exam[] questionOfExam2 = { exam2 };
		question2.exams = questionOfExam2;

		Exam[] questionOfExam3 = { exam2, exam4, exam5 };
		question3.exams = questionOfExam3;

		Exam[] questionOfExam4 = { exam1, exam2, exam3, exam5 };
		question4.exams = questionOfExam4;

		Exam[] questionOfExam5 = { exam1, exam2, exam3, exam4, exam5 };
		question5.exams = questionOfExam5;

		Question[] examByQuestion1 = { question1, question4, question5 };
		exam1.questions = examByQuestion1;

		Question[] examByQuestion2 = { question2, question3, question4, question5 };
		exam2.questions = examByQuestion2;

		Question[] examByQuestion3 = { question2 };
		exam3.questions = examByQuestion3;

		Question[] examByQuestion4 = { question3, question5 };
		exam4.questions = examByQuestion4;

		Question[] examByQuestion5 = { question1 };
		exam5.questions = examByQuestion5;

		// IN RA ĐỐI TƯỢNG

		// 1 Department
		System.out.println("Thong tin phong ban : ");
		System.out.println("name: " + department1.name);
		System.out.println("id: " + department1.id);

		// 2 Position
		System.out.println("Thong tin chuc vu : ");
		System.out.println("name: " + position1.name);
		System.out.println("id: " + position1.id);

		// 3 Account
		System.out.println("Thong tin nhan vien : ");
		System.out.println("name: " + account1.fullName);
		System.out.println("id: " + account1.id);
		System.out.println("email: " + account1.email);
		System.out.println("department: " + account1.department.name);
		System.out.println("position: " + account1.position.name);
		System.out.println("createDate: " + account1.createDate);

		// 4 Group
		System.out.println("Thong tin nhom : ");
		System.out.println("name: " + group1.name);
		System.out.println("id: " + group1.id);
		System.out.println("creator: " + group1.creator.fullName);
		System.out.println("createDate: " + group1.createDate);

		// 5 TypeQuestion
		System.out.println("Thong tin loai cau hoi : ");
		System.out.println("name: " + typeQuestion1.name);
		System.out.println("id: " + typeQuestion1.id);

		// 6 CategoryQuestion
		System.out.println("Thong tin chu de cau hoi : ");
		System.out.println("name: " + categoryQuestion1.name);
		System.out.println("id: " + categoryQuestion1.id);

		// 7 Question
		System.out.println("Thong tin cau hoi : ");
		System.out.println("content: " + question1.content);
		System.out.println("id: " + question1.id);
		System.out.println("category: " + question1.category.name);
		System.out.println("type: " + question1.type.name);
		System.out.println("creator: " + question1.creator.fullName);
		System.out.println("createDate: " + question1.createDate);

		// 8 Answer
		System.out.println("Thong tin cau tra loi : ");
		System.out.println("content: " + answer1.content);
		System.out.println("id: " + answer1.id);
		System.out.println("question: " + answer1.question.content);
		System.out.println("isCorrect: " + answer1.isCorrect);

		// 9 Exam
		System.out.println("Thong tin de thi : ");
		System.out.println("id: " + exam1.id);
		System.out.println("code: " + exam1.code);
		System.out.println("title: " + exam1.title);
		System.out.println("category: " + exam1.category.name);
		System.out.println("duration: " + exam1.duration);
		System.out.println("creator: " + exam1.creator.fullName);

	}

}
