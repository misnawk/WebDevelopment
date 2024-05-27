package vo;

public class PersonVO {
	String name;
	int age;
	String tel;
	
	public String getName() {
		return name;
	}
	public PersonVO(String name,int age, String tel) {
		this.name = name;
		this.age = age;
		this.tel = tel;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
