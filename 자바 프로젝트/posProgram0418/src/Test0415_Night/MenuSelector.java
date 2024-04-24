package Test0415_Night;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Insets;
import java.awt.Label;
import java.awt.Point;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;



public class MenuSelector {
	
	private JFrame frame;
	private JScrollPane menuSelect_scroll;
	private JPanel menuSelect_basePanel;
	private String imgAddress;
	private String menuInfo;
	private String menuPrice;
	
	private JPanel menuPanel;
	private JPanel opaque_menuPanel;
	private JButton addToCartBtn;
	private JLabel menuInfoLbl;
	private JLabel menuPriceLbl;
	
	private static int itemCnt = 0;
	public static int getItemCnt() {
		return itemCnt;
	}
	private static int countX = 10;
	private static int countY = 20;
	
	public MenuSelector(
			
			JFrame frame,
			JScrollPane menuSelect_scroll,
			JPanel menuSelect_basePanel,
			String imgAddress,
			String menuInfo,
			String menuPrice) {
		
		
		this.frame = frame;
		this.menuSelect_scroll = menuSelect_scroll;
		this.menuSelect_basePanel = menuSelect_basePanel;
		this.imgAddress = imgAddress;
		this.menuInfo = menuInfo;
		this.menuPrice = menuPrice;
		
		itemCount();
		createMenuPanel();
		mouseEvent();
//		itemCount();
	}
	
	public void itemCount() {
//		GUIManager guiManager = GUIManager.getInstance();
//		int tempN = guiManager.getMenuSelect_basePanel_DefaultSize();
//		System.out.println(tempN);
//		if(itemCnt%5 == 0 && itemCnt!=0 ) {
//			countX = 10;
//			countY += 270;
//			// 여기서 menubasepanel 크기 조절하면댐 증가값에 따라
//			System.out.println(countY);
//		}else {
//			countX += 216;
//			System.out.printf(" %d번 y값 %d ,",itemCnt,countY);
//		}
		//////////////////
		if(itemCnt%5 == 0 && itemCnt!=0 ) {
			countX = 10;
			countY += 270;
			// 여기서 menubasepanel 크기 조절하면댐 증가값에 따라
			System.out.println(countY);
		}else if (itemCnt%5 != 0){
			countX += 216;
			System.out.printf(" %d번 y값 %d ,",itemCnt,countY);
		}
		////////////////////

		
		itemCnt++;
	}
	
	public static int getCountY() {

		return countY;
	}

	public void createMenuPanel() {
		int menuPanel_Width = 200;
		int menuPanel_Height = 250;
		
		menuPanel = new RoundedPanel();
		menuPanel.setBounds(countX,countY,menuPanel_Width,menuPanel_Height);
		menuPanel.setLayout(null);
		menuSelect_basePanel.add(menuPanel);
		
		opaque_menuPanel = new RoundedPanel();
		opaque_menuPanel.setBounds(0,0,menuPanel_Width+3,menuPanel_Height+3);
		opaque_menuPanel.setBackground(new Color(0,0,0,130));
		opaque_menuPanel.setLayout(null);
		opaque_menuPanel.setVisible(false);
		menuPanel.add(opaque_menuPanel);
		
		UIManager.put("Button.select", new Color(0, 0, 0, 0));
		addToCartBtn = new JButton() {
			{
		        setOpaque(false);
		        setFocusPainted(false);
		    }
		    @Override
		    protected void paintComponent(Graphics g) {
		    	if (getModel().isPressed()) {
		    		g.setColor(Color.decode("#E8BD33"));
		        } else {
		            g.setColor(Color.decode("#FFE400")); // 눌리지 않은 상태에서의 배경 색상
		        }
		    	
		        g.fillRoundRect(0, 0, getWidth(), getHeight(), 20, 20); // 20은 라운드 처리에 사용될 호의 너비와 높이입니다.
		        super.paintComponent(g);
		    }

		    @Override
		    protected void paintBorder(Graphics g) {
		        // 테두리를 그리지 않습니다.
		    }

		    @Override
		    public Insets getInsets() {
		        // 테두리 영역을 늘리지 않도록 합니다.
		        return new Insets(0, 0, 0, 0);
		    }
		};

		addToCartBtn.setText("담기");
		addToCartBtn.setBounds(10,200,180,40);
		addToCartBtn.setBackground(Color.decode("#FFE400"));
//		btn.setOpaque(false);
//		btn.setFocusPainted(false);
		opaque_menuPanel.add(addToCartBtn);
		
		// 이미지 아이콘 생성
				ImageIcon icon = new ImageIcon(imgAddress);
				Image image = icon.getImage();
				Image scaledImage = image.getScaledInstance(menuPanel_Width, 150, Image.SCALE_SMOOTH);
				ImageIcon scaledIcon = new ImageIcon(scaledImage);

				// 이미지를 표시할 JLabel 생성
				JLabel imageLabel = new JLabel(scaledIcon);
				imageLabel.setHorizontalAlignment(JLabel.CENTER); // 이미지 중앙 정렬
				imageLabel.setVerticalAlignment(JLabel.CENTER);

				// 이미지를 나타내는 패널 생성
				JPanel imagePanel = new JPanel(new BorderLayout()); // 레이아웃을 BorderLayout으로 설정
				imagePanel.add(imageLabel, BorderLayout.CENTER); // 이미지를 중앙에 배치

				// 이미지 패널의 크기 및 위치 설정
				imagePanel.setPreferredSize(new Dimension(menuPanel_Width, 150)); // 패널 크기 설정
				imagePanel.setBounds(0, 0, menuPanel_Width, 150); // 패널 위치 설정

				// 패널에 이미지 패널 추가
				menuPanel.add(imagePanel,BorderLayout.NORTH);
				
				JPanel menuInfoPanel = new JPanel();
				menuInfoPanel.setBounds(0,150,menuPanel_Width,100);
				menuInfoPanel.setBackground(Color.decode("#ffffff"));
				menuPanel.add(menuInfoPanel);
				Font f2 = new Font("맑은 고딕", Font.PLAIN, 20);
				menuInfoLbl = new JLabel(menuInfo); // 이부분 텍스트받고
				menuInfoLbl.setFont(f2);
				menuInfoLbl.setBorder(BorderFactory.createEmptyBorder(10, 10, 0, 10));
				
				menuInfoPanel.setLayout(new BorderLayout());
				menuInfoPanel.add(menuInfoLbl, BorderLayout.NORTH);
				Font f1 = new Font("맑은 고딕", Font.BOLD, 20);
				menuPriceLbl = new JLabel(menuPrice); // 이부분 텍스트받고
				menuPriceLbl.setFont(f1);
				menuPriceLbl.setBorder(BorderFactory.createEmptyBorder(0, 10, 10, 10));
				
				menuInfoPanel.add(menuPriceLbl, BorderLayout.SOUTH);
	}
	public void mouseEvent() {
		menuPanel.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				if(!opaque_menuPanel.isVisible()) {
					opaque_menuPanel.setVisible(true);
					System.out.println("마우스 감지");
				}
			}
		});
		
		menuPanel.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseExited(MouseEvent e) {
				Point p = e.getLocationOnScreen();
				SwingUtilities.convertPointFromScreen(p, menuPanel);
				
				if(!menuPanel.contains(p)) {
					opaque_menuPanel.setVisible(false);
					System.out.println("마우스 탈출");
				}
			}
		});
		
		addToCartBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// 간접적인 이벤트 처리
				String menuName = menuInfoLbl.getText();
				String menuPrice = menuPriceLbl.getText();
				try {
					GUIManager guiManager = GUIManager.getInstance();
			        // GUIManager의 메서드 호출
			        guiManager.addToCartBtnEvent(menuName, menuPrice);
//					form = new Form();
//					form.addToCartBtnEvent(menuName, menuPrice);
					
					
				} catch(Exception ee) {
					System.out.println(ee.getMessage());
				}
				

			}
		});
		
	}
	
}
