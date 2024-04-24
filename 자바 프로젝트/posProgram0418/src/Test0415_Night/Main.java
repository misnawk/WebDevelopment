package Test0415_Night;

import java.awt.EventQueue;

public class Main {
	
	public static void main(String[] args) {
        EventQueue.invokeLater(() -> {
            try {
                GUIManager guiManager = GUIManager.getInstance();
                guiManager.show();
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }
}
