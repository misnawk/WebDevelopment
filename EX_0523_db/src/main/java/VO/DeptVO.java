package VO;

public class DeptVO {

		//필드는 테이블의 속성(컬럼)으로 지정
		private int deptno; //부서번호
		private String dname; //이름
		private String loc; // 위치
		
		public int getDeptno() {
			return deptno;
		}
		public void setDeptno(int deptno) {
			this.deptno = deptno;
		}
		public String getDname() {
			return dname;
		}
		public void setDname(String dname) {
			this.dname = dname;
		}
		public String getLoc() {
			return loc;
		}
		public void setLoc(String loc) {
			this.loc = loc;
		}
}
