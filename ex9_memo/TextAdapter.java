package ex9_memo;

import javax.swing.JButton;
import javax.swing.JTextField;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

public class TextAdapter implements DocumentListener {

	JTextField jt;
	JButton jb;
	
	
	//데이터 정보 다른 클래스로 가져오는법
	//1. 생성자의 파라미터로 넘긴다.
	public TextAdapter(JTextField jt ,JButton jb) {
		this.jt = jt;
		this.jb= jb;
	}
	//2. 메서드의 파라미터로 넘긴다.
	
	@Override
	public void insertUpdate(DocumentEvent e) {
		change();

	}

	@Override
	public void removeUpdate(DocumentEvent e) {
		change();

	}

	@Override
	public void changedUpdate(DocumentEvent e) {
		change();

	}
	
	public void change() {
		if(jt.getText().length() == 0) {
			jb.setEnabled(false);
		}else {
			jb.setEnabled(true);
		}
	}

}
