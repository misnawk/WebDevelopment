package service;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBService {
	
	static DBService single = null; //변수선언
	
	public static DBService getInstance() {
		if(single == null) { //최초면 만들고 아니면 return
			single = new DBService();
		}
		return single;
	}
	
	//ds를 전역으로 만든 이유는 생성자 밖에서 사용해야 할 일이 있기 때문이다.
	DataSource ds;
	
	
	public DBService() {
		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context)ic.lookup("java:comp/env");
			ds = (DataSource)ctx.lookup("jdbc/oracle_test");
		} catch (Exception e) {
			
		}
	}
	
	// 생성자에서 준비해둔 정보를 기반으로 DB에 연결
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			
		}
		return conn;
	}
}
