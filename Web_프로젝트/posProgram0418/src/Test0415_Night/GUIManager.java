package Test0415_Night;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import java.io.*;
import java.net.*;



import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import java.io.*;
import java.net.*;



public class GUIManager {
	private static GUIManager instance;
	
    private JFrame frame;
    
    private JPanel pan_1; 
    private JPanel pan_2;
    
    private JPanel pan_1_1;
    private JPanel pan_1_2;
    
    private JScrollPane menuSelect_scroll;
    private JPanel menuSelect_basePanel;
    
    private JPanel pan_2_1;
    private JPanel pan_2_2;
    
    private JButton clearOrderBtn;
    private RoundedPanel orderRoundPanel;
    private JScrollPane orderScroll;
    private JPanel orderScrollBase;
    
    private JLabel totalPriceLbl;
    
    private ArrayList<Integer> tran_Y;
    private ArrayList<JPanel> pan_Y;
    private ArrayList<String> menu_contain;
    private ArrayList<Integer> menu_count;
    private ArrayList<Integer> menu_price;
    
    private final int defaultSize =317;
    private final int menuSelect_basePanel_DefaultSize =725;
    
    private JButton orderRequestBtn;

    
	
	
	
	private String orderaaaaaaaaaa = "";    
    private int totalPrice;

    private  GUIManager() {
        initialize();
    }
    public static synchronized GUIManager getInstance() {
        if (instance == null) {
            instance = new GUIManager();
        }
        return instance;
    }
    public void show() {
        frame.setVisible(true);
    }
    private void initialize() {
        frame = new JFrame(); // 프레임 생성
        frame.setBounds(100, 100, 1600, 900); // x축위치,y축위치, width, height
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 프레임이 닫힐 때 프로그램이 종료되도록 설정
        frame.setResizable(false); // 프레임 창크기 조절 X
        
        frame.setLayout(new GridBagLayout()); // 프레임 레이아웃 = gridBagLayout으로 설정
        
        GridBagConstraints gbc1 = new GridBagConstraints(); // 그리드 배치의 레이아웃 설정을 위한 객체 생성
        gbc1.fill = GridBagConstraints.BOTH;	// 컴포넌트가 가능한 큰 영역을 차지하도록 설정
        gbc1.weightx = 0.7;	// X 축에 대한 가중치 설정 (30% 차지)
        gbc1.weighty = 1.0; // Y 축에 대한 가중치 설정 (100% 차지)
        gbc1.gridx = 0;	// 그리드 배치에서 컴포넌트의 열 위치 설정
        gbc1.gridy = 0; // 그리드 배치에서 컴포넌트의 행 위치 설정
        
        pan_1 = new JPanel();	// 판넬생성
        pan_1.setBackground(Color.white); // 판넬 색지정
        pan_1.setLayout(new GridBagLayout()); // 판넬 레이아웃지정 
        frame.getContentPane().add(pan_1, gbc1); // 프레임.추가(컴포넌트,레이아웃설정)
        
        GridBagConstraints gbc2 = new GridBagConstraints(); // 그리드 배치의 레이아웃 설정을 위한 객체 생성
        gbc2.fill = GridBagConstraints.BOTH; // 컴포넌트가 가능한 큰 영역을 차지하도록 설정
        gbc2.weightx = 0.3; // X 축에 대한 가중치 설정 (30% 차지)
        gbc2.weighty = 1.0; // Y 축에 대한 가중치 설정 (100% 차지)
        gbc2.gridx = 1; // 그리드 배치에서 컴포넌트의 열 위치 설정
        gbc2.gridy = 0; // 그리드 배치에서 컴포넌트의 행 위치 설정
        
        pan_2 = new JPanel(); // 판넬생성
        pan_2.setBackground(Color.lightGray); // 판넬 색지정
        pan_2.setLayout(new GridBagLayout()); // 판넬 레이아웃지정
        frame.getContentPane().add(pan_2, gbc2); // 프레임.추가(컴포넌트,레이아웃설정)
        
        GridBagConstraints gbc3 = new GridBagConstraints(); // 그리드 배치의 레이아웃 설정을 위한 객체 생성
        gbc3.fill = GridBagConstraints.BOTH; // 컴포넌트가 가능한 큰 영역을 차지하도록 설정
        gbc3.weightx = 1.0;	// X 축에 대한 가중치 설정 (100% 차지)
        gbc3.weighty = 0.15; // Y 축에 대한 가중치 설정 (15% 차지)
        gbc3.gridx = 0;	// 그리드 배치에서 컴포넌트의 열 위치 설정
        gbc3.gridy = 0;	// 그리드 배치에서 컴포넌트의 행 위치 설정
        
        pan_1_1 = new JPanel(); // 판넬생성
        pan_1_1.setBackground(Color.blue); // 판넬 색지정
        pan_1_1.setLayout(null); // 판넬 레이아웃지정 null = 사용자 정의 레이아웃
        pan_1.add(pan_1_1, gbc3); // 판넬1.추가(컴포넌트,레이아웃설정)
        
		////////////////////////////////////////////
        
        GridBagConstraints gbc4 = new GridBagConstraints();	// 그리드 배치의 레이아웃 설정을 위한 객체 생성
      	gbc4.fill = GridBagConstraints.BOTH; // 컴포넌트가 가능한 큰 영역을 차지하도록 설정
      	gbc4.weightx = 1.0; // X 축에 대한 가중치 설정 (100% 차지)
      	gbc4.weighty = 0.85; // Y 축에 대한 가중치 설정 (85% 차지)
      	gbc4.gridx = 0; // 그리드 배치에서 컴포넌트의 열 위치 설정
      	gbc4.gridy = 1; // 그리드 배치에서 컴포넌트의 행 위치 설정
      	pan_1_2 = new JPanel(); // 판넬생성
      	pan_1_2.setBackground(Color.black); // 판넬 색지정
      	pan_1_2.setLayout(null); // 판넬 레이아웃지정 null = 사용자 정의 레이아웃
      	pan_1.add(pan_1_2, gbc4); // 판넬1.추가(컴포넌트,레이아웃설정)
      
      	menuSelect_scroll = new JScrollPane(); // 스크롤판넬 생성
      	menuSelect_scroll.setBounds(5,0,1100,728); // x축위치,y축위치, width, height 
    	menuSelect_scroll.setBackground(Color.black); // 판넬 색지정
    	pan_1_2.add(menuSelect_scroll); // 판넬1_2.추가(컴포넌트,레이아웃설정)

        menuSelect_basePanel = new JPanel(); // 판넬 생성
        menuSelect_basePanel.setPreferredSize(new Dimension(1082, 725)); // 메뉴선택_기반판넬 ★JScrollPane 에 넣을때는 함수가 다름
        menuSelect_basePanel.setBackground(Color.black); // 색지정
        menuSelect_basePanel.setLayout(null); // 레이아웃설정 null = 사용자 정의 레이아웃
        menuSelect_scroll.setViewportView(menuSelect_basePanel); // 메뉴선택_스크롤.뷰포트설정(메뉴선택_기반파넬) ★JScrollPane 에 넣을때는 함수가 다름

        //////////////
        menuSelect_scroll.getViewport().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                // 스크롤 이벤트 발생 시 패널을 다시 그립니다.
            	menuSelect_scroll.repaint();
            	frame.revalidate();
            	System.out.println("@@@@@ 111");
            }
        });
        ////////////////
        MenuSelector ms1 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/도도한나쵸 치즈맛.jpg", "도도한나쵸 치즈맛", "3,000원");
        MenuSelector ms2 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/돌아온썬.jpg", "돌아온썬", "3,000원");
        MenuSelector ms3 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/떡볶이.jpg", "떡볶이", "3,000원");
        MenuSelector ms4 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/바나나킥.jpg", "바나나킥", "3,000원");
        MenuSelector ms5 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/왕꿈틀이.jpg", "왕꿈틀이", "3,000원");
        MenuSelector ms6 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/신라면.jpg", "신라면", "3,000원");
        MenuSelector ms7 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/콘칩.jpg", "콘칩", "3,000원");
        MenuSelector ms8 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/콜라.jpg", "콜라", "3,000원");
        MenuSelector ms9 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/포카칩 어니언.jpg", "포카칩 어니언", "3,000원");
        MenuSelector ms10 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/포카칩 오리지널.jpg", "포카칩 오리지널", "3,000원");
        MenuSelector ms11 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/홈런볼.jpg", "홈런볼", "3,000원");
        MenuSelector ms12 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/홈런볼.jpg", "홈런볼2", "3,000원");
        MenuSelector ms13 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/홈런볼.jpg", "홈런볼3", "3,000원");
        MenuSelector ms14 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/홈런볼.jpg", "홈런볼4", "3,000원");
        MenuSelector ms15 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/홈런볼.jpg", "홈런볼5", "3,000원");
        MenuSelector ms16 = new MenuSelector( frame, menuSelect_scroll, menuSelect_basePanel, "res/홈런볼.jpg", "홈런볼6", "3,000원");
        if (ms16.getCountY()+270 > menuSelect_basePanel_DefaultSize ) {
        	menuSelect_basePanel.setPreferredSize(new Dimension(1082, ms16.getCountY()+270));
        	frame.revalidate();
        }
//        menuSelect_basePanel.setPreferredSize(new Dimension(menuSelect_scroll.getWidth(), ms11.getCountY()));
        //////////////////////////
        CreateOrderlist col = new CreateOrderlist(pan_2, pan_2_1, pan_2_2, orderRoundPanel, orderScroll, orderScrollBase);
        pan_2_1 = col.createPan_2_1();
        pan_2_2 = col.createPan_2_2();
        col.createOrderRoundPanel();
        orderScroll = col.createOrderScroll();
        orderScrollBase = col.createOrderScrollBase();        
        col.createTotalPricePanel();
        col.createTxtLbl();
        totalPriceLbl = col.createTotalPriceLbl();
        orderRequestBtn = col.createOrderRequestBtn();
        
        clearOrderBtn = new JButton("refresh");
        clearOrderBtn.setBounds(20, 20, 150, 50);
        clearOrderBtn.setEnabled(false);
        pan_2_1.add(clearOrderBtn);
        
        tran_Y = new ArrayList<>();
		pan_Y = new ArrayList<>();
		menu_contain = new ArrayList<>();
		menu_count = new ArrayList<>();
		menu_price = new ArrayList<>();
		
		clearOrderBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				DynamicOderList dsp = new DynamicOderList(
						tran_Y, 
						pan_Y,
						menu_contain,
						menu_count,
						menu_price,
						frame, 
						orderScroll, 
						orderScrollBase, 
						defaultSize, 
						pan_2_1, 
						clearOrderBtn,
						orderRequestBtn);
				dsp.deleteOrder();
				totalPriceLbl.setText("0원");
			}
		});
    }

    

    public void addToCartBtnEvent(String menuName, String menuPrice) {
        
//        System.out.println("눌림 " + menuName + " " + menuPrice + " " + defaultSize + " " + orderScrollBase.getWidth());
        
         DynamicOderList dol = new DynamicOderList(
        		 tran_Y, 
        		 pan_Y,
        		 menu_contain,
        		 menu_count,
        		 menu_price, 
        		 frame, 
        		 orderScroll, 
        		 orderScrollBase, 
        		 defaultSize, 
        		 pan_2_1, 
        		 clearOrderBtn,
        		 orderRequestBtn);
         dol.createOrder(menuName,menuPrice);
    }
    
    public void menuTotalPrice(ArrayList<Integer> menu_price) {
    	System.out.println("총 가격은?");
    	int sum = 0;
    	for(int i : menu_price) {
    		sum += i;
    	}
    	totalPrice = sum;
    	totalPriceLbl.setText(Integer.toString(sum)+"원");
    	System.out.println(sum);
    }
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getMenuSelect_basePanel_DefaultSize() {
		return menuSelect_basePanel_DefaultSize;
	}
	public void sendOrderlist() {
		System.out.println("연결 완료");
		try {
            String message = orderaaaaaaaaaa  + totalPrice;
            		
            Socket socket = new Socket("localhost", 1233);
            PrintWriter writer = new PrintWriter(socket.getOutputStream(), true);
            writer.println(message);

            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
//            String response = reader.readLine().replace("Message received: ", "");
//            System.out.println(response);
//            JOptionPane.showMessageDialog(frame, "주문요청완료: " + response);
            JOptionPane.showMessageDialog(frame, "주문요청완료");
            
            socket.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
	}
	public void setMenu_contain(ArrayList<String> menu_contain) {
		
	}
	public void setMenu_Info(
			ArrayList<String> menu_contain ,
			ArrayList<Integer> menu_count,
			ArrayList<Integer> menu_price) {
		
		this.menu_contain = menu_contain;
		this.menu_count = menu_count;
		this.menu_price = menu_price;
		
		orderaaaaaaaaaa ="";
		for(int i = 0; i < menu_contain.size(); i++) {
			orderaaaaaaaaaa += menu_contain.get(i)+";" + menu_count.get(i) + ";" + menu_price.get(i) + "@";
		}
//		for(int i : menu_price) {
//			orderaaaaaaaaaa += i+"@";
//		}
		System.out.println("temp는?" + orderaaaaaaaaaa);
	}
}