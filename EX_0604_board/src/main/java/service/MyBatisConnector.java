package service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MyBatisConnector {
    
	//SqlSessionFactory : SqlSession 객체를 생성
	//SqlSession객체 : SQL의 실행이나 트랜잭션 관리를 한다.
	SqlSessionFactory  factory=null;
	private static MyBatisConnector connector; 
	
	public MyBatisConnector()
	{
		try {
			//sqlMapConfig.xml�о���δ�.
			Reader reader = 
				Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//single-ton
	public static MyBatisConnector getInstance(){
		if(connector==null)
			connector = new MyBatisConnector();
		return connector;
	}
	
	
	
	public SqlSessionFactory  getSqlSessionFactory()
	{
		return factory;
	}
}
