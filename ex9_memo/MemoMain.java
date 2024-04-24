package ex9_memo;

import java.awt.Color;
import java.awt.FileDialog;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileWriter;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class MemoMain {
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        // 컴포넌트를 붙힐 패널
        JPanel jPanel = new JPanel();
        jPanel.setBackground(Color.CYAN);

        jPanel.setLayout(null);

        Font font = new Font("", Font.PLAIN, 20);

        JTextField jTextField = new JTextField();
        jTextField.setBounds(10, 15, 180, 30);
        jTextField.setFont(font);

        // TextField에 적힌 내용을 TextArea로 보내주는 버튼
        JButton input_button = new JButton("확인");
        input_button.setBounds(190, 15, 60, 30);

        // TextField에 아무것도 안적혀있으면 비활성화
        input_button.setEnabled(false);

        // 텍스트파일 형식으로 저장할 내용이 있는 TestArea
        JTextArea jTextArea = new JTextArea();
        jTextArea.setBounds(10, 70, 230, 280);
        jTextArea.setEditable(false);

        // 텍스트파일로 저장하기 위한 버튼
        JButton save_button = new JButton("저장");
        save_button.setBounds(10, 356, 110, 30);

        // 프로그램 종료 버튼
        JButton close_button = new JButton("종료");
        close_button.setBounds(130, 356, 110, 30);

        // 패널에 컴포넌트 붙히기
        jPanel.add(jTextField);
        jPanel.add(input_button);
        jPanel.add(save_button);
        jPanel.add(close_button);
        jPanel.add(jTextArea);

        // TextField에 값이 들어가 있는지 확인하여 '확인'버튼을 활성화 또는 비활성화
        jTextField.getDocument().addDocumentListener(new TextAdapter(jTextField, input_button));

        // 확인 버튼 클릭시 TextField의 값을 TextArea로 전달
        input_button.addActionListener(new InputButtonAdapter(jTextField, jTextArea));

        // 저장 버튼 눌렀을 때 TextArea의 내용을 텍스트파일로 저장
        save_button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // 경로를 설정하는 FileDialog
                FileDialog fileDialog = new FileDialog(frame, "저장", FileDialog.SAVE);
                fileDialog.setVisible(true);

                // TestArea에 쓰여진 내용을 읽어오고
                String message = jTextArea.getText();

                String path = fileDialog.getDirectory() + fileDialog.getFile();
                System.out.println(path);

                FileWriter fileWriter = null;
                try {
                    fileWriter = new FileWriter(path);
                    fileWriter.write(message);
                } catch (Exception ex) {
                    ex.printStackTrace();
                } finally {
                    if (fileWriter != null) {
                        try {
                            fileWriter.close();
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            }
        });
        
        
        
        //프로그램 눌렀을 때 프로그램 종료
        close_button.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				frame.dispose();
			}
		});
        
        
        
        
        
        
        
        
        
        
        

        frame.add(jPanel);
        frame.setBounds(700, 200, 270, 440);

        frame.setVisible(true);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}
