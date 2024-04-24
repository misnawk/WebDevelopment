package dialog;

import java.awt.Color;
import java.awt.Component;
import java.awt.EventQueue;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.LineBorder;
public class DialogFrom {

    private JFrame frame;
    private JPanel small;
    private int x = 0; // x 좌표를 멤버 변수로 선언

    //라벨 만드는 메서드
    public void createLabel(String data) {
    	
  
    	
    	System.out.println(data);
        JLabel label = new JLabel();
        label.setText(data);
        label.setOpaque(true); // 라벨의 배경색을 보이게 설정
        label.setBackground(Color.WHITE); // 라벨의 배경색을 흰색으로 설정
        small.add(label);
    }

//    public static void main(String[] args) {
//    	System.out.println(1);
//        DialogFrom dialog = new DialogFrom();
//        dialog.show();  
//    }

    public void show() {
        frame.setVisible(true);
    }

    public DialogFrom() {
        initialize();
    }

    
    private void initialize() {

        JPanel background = new JPanel();
        background.setBackground(Color.decode("#D3D3D3")); // 회색
        background.setLayout(null);
        background.setBounds(10, 10, 860, 740);
       

        JPanel BigBox = new JPanel();
        BigBox.setBackground(Color.decode("#6699CC")); // 파랑
        BigBox.setLayout(null);
        BigBox.setBounds(110, 30, 650, 550);
        background.add(BigBox);

        small = new JPanel();
        small.setBackground(Color.decode("#ADD8E6")); // 하늘        
        small.setBounds(45, 30, 560, 500);
        BigBox.add(small);

        JButton OK_Button = new JButton("확인");
        OK_Button.setBounds(100, 600, 200, 100);
        background.add(OK_Button);

        JButton Cancel_Button = new JButton("취소");
        Cancel_Button.setBounds(560, 600, 200, 100);
        background.add(Cancel_Button);
        
        frame = new JFrame();
        
        frame.add(background);
        
        
        frame.setLayout(null);
        frame.setBounds(100, 100, 900, 800);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}

	



