package study.j0425;

public class T12VO {
	private String name;
	private int age;
	private String gender;
	private String hobby;
	private String job;
	private String mountain;
	private String content;
	private String fileName;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getMountain() {
		return mountain;
	}
	public void setMountain(String mountain) {
		this.mountain = mountain;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "T12VO [name=" + name + ", age=" + age + ", gender=" + gender + ", hobby=" + hobby + ", job=" + job
				+ ", mountain=" + mountain + ", content=" + content + ", fileName=" + fileName + "]";
	}
}
