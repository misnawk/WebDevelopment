package service;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBService {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBService single = null;

	public static DBService getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
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
			// TODO: handle exception
		}
	}
	
	//생성자에서 준비해둔 정보를 기반으로 DB에 연결
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return conn;
	}
	
	
}
