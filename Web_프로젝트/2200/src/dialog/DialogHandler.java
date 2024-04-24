package dialog;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

import javax.xml.crypto.Data;


public class DialogHandler {

    private ServerSocket serverSocket; // 서버 소켓을 저장하는 멤버 변수 선언
    private String message;

    public String getMessage() {
    	return this.message;
    }
    
    // 클라이언트로부터 메시지를 받는 메소드
    public void messageReceived() {
        try {
            this.serverSocket = new ServerSocket(1233);
            // 무한 루프를 통해 클라이언트의 연결을 지속적으로 받음
            while (true) {
                //클라이언트의 연결을 수락하고 소켓 생성
                Socket clientSocket = serverSocket.accept();
                BufferedReader reader = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
             

                // 클라이언트로부터 메시지를 읽음
                 this.message = reader.readLine();    
               
                 Data_Sort data_Sort = new Data_Sort();
            
                 data_Sort.dataSort(message);
                 
                // 클라이언트 소켓 닫기
                clientSocket.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
}
