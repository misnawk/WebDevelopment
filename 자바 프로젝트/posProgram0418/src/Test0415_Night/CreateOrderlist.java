package Test0415_Night;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.SwingConstants;



public class CreateOrderlist {
	private JPanel pan_2;
	
	private JPanel pan_2_1;
	private JPanel pan_2_2;
	
	private RoundedPanel orderRoundPanel;
	private JScrollPane orderScroll;
	private JPanel orderScrollBase;
	private JPanel totalPricePanel;
	
	
	public CreateOrderlist(
			JPanel pan_2,
			JPanel pan_2_1,
			JPanel pan_2_2,
			RoundedPanel orderRoundPanel,
			JScrollPane orderScroll,
			JPanel orderScrollBase) {
	
		this.pan_2 = pan_2;
		this.pan_2_1 = pan_2_1;
		this.pan_2_2 = pan_2_2;
		this.orderRoundPanel = orderRoundPanel;
		this.orderScroll = orderScroll;
		this.orderScrollBase = orderScrollBase;
	}
	
	public JPanel createPan_2_1() {
		GridBagConstraints gbc1 = new GridBagConstraints();
        gbc1.fill = GridBagConstraints.BOTH; // 컴포넌트를 채우는 방법 설정
        gbc1.weightx = 1.0; // 컴포넌트의 가로 비율 설정
        gbc1.weighty = 0.6; // 컴포넌트의 세로 비율 설정
        gbc1.gridx = 0; // 그리드 배치 X 좌표
        gbc1.gridy = 0; // 그리드 배치 Y 좌표
        
		pan_2_1 = new JPanel();
		pan_2_1.setBounds(20,70,430,500);
		pan_2_1.setBackground(Color.decode("#9136AF"));
		pan_2_1.setLayout(null);
		pan_2.add(pan_2_1,gbc1);
		
		return pan_2_1;
	}
	
	public JPanel createPan_2_2() {
		GridBagConstraints gbc2 = new GridBagConstraints();
        gbc2.fill = GridBagConstraints.BOTH; // 컴포넌트를 채우는 방법 설정
        gbc2.weightx = 1.0; // 컴포넌트의 가로 비율 설정
        gbc2.weighty = 0.4; // 컴포넌트의 세로 비율 설정
        gbc2.gridx = 0; // 그리드 배치 X 좌표
        gbc2.gridy = 1; // 그리드 배치 Y 좌표
        
		pan_2_2 = new JPanel();
		pan_2_2.setBounds(20,70,430,500);
		pan_2_2.setBackground(Color.decode("#360D58"));
		pan_2_2.setLayout(null);
		pan_2.add(pan_2_2,gbc2);
		
		return pan_2_2;
	}
	
	public void createOrderRoundPanel() {
		orderRoundPanel = new RoundedPanel();
		orderRoundPanel.setBounds(20, 70, 430, 400);
		orderRoundPanel.setBackground(Color.decode("#dddddd"));
		orderRoundPanel.setLayout(null);
		pan_2_1.add(orderRoundPanel);
	}
	
	public JScrollPane createOrderScroll() {
		orderScroll = new JScrollPane();
		orderScroll.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		orderScroll.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
		orderScroll.setBounds(20, 20, 390, 320);
		orderRoundPanel.add(orderScroll);
		
		return orderScroll;
	}
	
	public JPanel createOrderScrollBase() {
		orderScrollBase = new JPanel();
		orderScrollBase.setLayout(null);
		orderScrollBase.setPreferredSize(new Dimension(372, 317)); // 스크롤 패널의 크기 설정
		orderScrollBase.setBackground(Color.LIGHT_GRAY);
		orderScroll.setViewportView(orderScrollBase);
		
		return orderScrollBase;
	}
	
	public void createTotalPricePanel() {
		totalPricePanel = new JPanel();
		totalPricePanel.setBounds(0,340,430,60);
		totalPricePanel.setBackground(Color.DARK_GRAY);
		totalPricePanel.setLayout(null);
		orderRoundPanel.add(totalPricePanel);
	}
	
	public void createTxtLbl() {
		Font f = new Font("맑은 고딕", Font.BOLD, 16);
		
		JLabel txtLbl = new JLabel("총 주문금액");
		txtLbl.setBounds(20,10,100,40);
		txtLbl.setBackground(Color.white);
		txtLbl.setFont(f);
		txtLbl.setOpaque(true);
		totalPricePanel.add(txtLbl);
	}
	
	public JLabel createTotalPriceLbl() {
		Font f = new Font("맑은 고딕", Font.BOLD, 20);
		
		JLabel totalPriceLbl = new JLabel("0원");
		totalPriceLbl.setBounds(140,10,270,40);
		totalPriceLbl.setBackground(Color.white);
		totalPriceLbl.setOpaque(true);
		totalPriceLbl.setFont(f);
		totalPriceLbl.setHorizontalAlignment(SwingConstants.RIGHT);
		totalPricePanel.add(totalPriceLbl);
		
		return totalPriceLbl;
	}
	
	public JButton createOrderRequestBtn() {
		JButton orderRequestBtn = new JButton("주문요청");
		orderRequestBtn.setBounds(50,80,200,80);
		orderRequestBtn.setBackground(Color.yellow);
		orderRequestBtn.setEnabled(false);
		pan_2_2.add(orderRequestBtn);
		
		orderRequestBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("주문요청완료!!!!!!!!!!!!!");
				GUIManager guiManager = GUIManager.getInstance();
				guiManager.sendOrderlist();
			}
		});
		return orderRequestBtn;
	}
	
}
