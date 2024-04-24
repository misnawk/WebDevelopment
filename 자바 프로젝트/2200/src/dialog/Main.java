package dialog;




public class Main {

	
	public static void main(String[] args) {
				try {
					DialogFrom dialog = new DialogFrom();
					dialog.show();
					
					
					DialogHandler dialogHandler = new DialogHandler();
					dialogHandler.messageReceived();
				
					
				} catch (Exception e) {
					e.printStackTrace();
				}
	
	}
}
