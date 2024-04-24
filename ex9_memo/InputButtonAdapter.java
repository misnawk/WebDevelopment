package ex9_memo;

import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JTextArea;
import javax.swing.JTextField;

public class InputButtonAdapter implements ActionListener {
		
	JTextField jTextField;
	JTextArea textArea;

	public InputButtonAdapter(JTextField jTextField, JTextArea textArea) {
		this.jTextField  = jTextField;
		this.textArea= textArea;
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		//TextField의 내용을 getText()해서
		String tfsf = jTextField.getText();
		
		textArea.append(tfsf + "\n");
		
		//TextField의 내용은 비운다.
		jTextField.setText(" ");
		
		//TextArea로 SetText()를 해준다.
//		textArea.setText("tfsf");
		
	
		

	}

	
}
