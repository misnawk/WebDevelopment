package Test0415_Night;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.SwingConstants;

public class DynamicOderList {
	
	static private int curY = 20;
	static private ArrayList<Integer> tran_Y;
	static private ArrayList<JPanel> pan_Y;
	static private ArrayList<String> menu_contain;
	static private ArrayList<Integer> menu_count;
	static private ArrayList<Integer> menu_price;
	static private JPanel orderScrollBase;
	static private JScrollPane orderScroll;
	static private int createPoint_Y = 20;
	
	private int currentPoint_Y;
	
	static private JFrame frame;
	private JPanel orderMenuPanel;
	private JButton orderMenuDeleteBtn;
	private JPanel orderList_1;
	private JButton deleteBtn;
	private JButton orderRequestBtn;
	private int tempPrice;
	private int defaultSize;
	private int menuHeight;
	private int gap = 20;
	
	public DynamicOderList(
			ArrayList<Integer> tran_Y,
			ArrayList<JPanel> pan_Y,
			ArrayList<String> menu_contain,
			ArrayList<Integer> menu_count,
			ArrayList<Integer> menu_price,
			JFrame frame,
			JScrollPane orderScroll,
			JPanel orderScrollBase,
			int defaultSize,
			JPanel orderList_1,
			JButton deleteBtn,
			JButton orderRequestBtn) {
		
		this.frame = frame;
		this.tran_Y = tran_Y;
		this.pan_Y = pan_Y;
		this.menu_contain = menu_contain;
		this.menu_count = menu_count;
		this.menu_price = menu_price;
		this.orderScroll = orderScroll;
		this.orderScrollBase = orderScrollBase;
		this.defaultSize = defaultSize;
		this.orderList_1 = orderList_1;
		this.deleteBtn = deleteBtn;
		this.orderRequestBtn = orderRequestBtn;
	}
	
	public void createOrder(String menuName, String menuPrice) {
		
		if(!deleteBtn.isEnabled()) {
			deleteBtn.setEnabled(true);
			orderRequestBtn.setEnabled(true);
		}
		if(menu_contain.contains(menuName)) {
			return;
		}
		
		System.out.println("이거 출력되냐?");
		
		orderMenuPanel = new JPanel();
		orderMenuPanel.setBounds(20, createPoint_Y, 347, 100);
		orderMenuPanel.setLayout(null);
		orderMenuPanel.setBackground(Color.blue);
		orderScrollBase.add(orderMenuPanel);
		
		orderMenuDeleteBtn = new JButton("X");
		orderMenuDeleteBtn.setBounds(317,0,30,30);
		orderMenuDeleteBtn.setBackground(Color.gray);
		orderMenuDeleteBtn.setMargin(new Insets(5, 5, 5, 5));
		orderMenuPanel.add(orderMenuDeleteBtn);
		
		tran_Y.add(createPoint_Y);
		pan_Y.add(orderMenuPanel);
		menu_contain.add(menuName);
		menu_count.add(1);
		tempPrice = priceParseInt(menuPrice);
		menu_price.add(tempPrice);
		int price_index = menu_price.indexOf(tempPrice);
		
		GUIManager guiManager = GUIManager.getInstance();
		guiManager.menuTotalPrice(menu_price);
		////////////////////////////////////////
		guiManager.setMenu_Info(menu_contain,menu_count,menu_price);
		//////////////////////////////////////////
		JButton menuSubBtn = new JButton("-");
		menuSubBtn.setBounds(5 ,70,30,30);
		menuSubBtn.setBackground(Color.gray);
		menuSubBtn.setMargin(new Insets(5, 5, 5, 5));
		orderMenuPanel.add(menuSubBtn);
		
		JLabel orderMenuNameLbl = new JLabel();
		orderMenuNameLbl.setBounds(0,0,300,30);
		orderMenuNameLbl.setOpaque(true);
		orderMenuNameLbl.setBackground(Color.GRAY);
		orderMenuNameLbl.setText(menuName);
		orderMenuPanel.add(orderMenuNameLbl);
		
		JLabel orderMenuPriceLbl = new JLabel();
		orderMenuPriceLbl.setBounds(217,70,130,30);
		orderMenuPriceLbl.setOpaque(true);
		orderMenuPriceLbl.setBackground(Color.gray);
		orderMenuPriceLbl.setText(menuPrice); // 현재가격 = 상품가격;
		orderMenuPriceLbl.setHorizontalAlignment(SwingConstants.RIGHT);
		orderMenuPanel.add(orderMenuPriceLbl);
		
		JLabel menuCntLbl = new JLabel("1");
		menuCntLbl.setBounds(40,70,30,30);
		menuCntLbl.setOpaque(true);
		menuCntLbl.setBackground(Color.yellow);
		
		menuCntLbl.setHorizontalAlignment(SwingConstants.CENTER);
		orderMenuPanel.add(menuCntLbl);
		System.out.println(menuCntLbl.getText());
		
		JButton menuAddBtn = new JButton("+");
		menuAddBtn.setBounds(75 ,70,30,30);
		menuAddBtn.setBackground(Color.gray);
		menuAddBtn.setMargin(new Insets(5, 5, 5, 5));
		orderMenuPanel.add(menuAddBtn);
		
		menuSubBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				String temp = menuCntLbl.getText();
				int tempN = Integer.parseInt(temp);
				if(tempN > 1) {
					temp = Integer.toString(tempN-1);
					menuCntLbl.setText(temp.trim());
					
					// 현재가격 -= 상품가격;
					menu_price.set(price_index, menu_price.get(price_index)-tempPrice);
					menu_count.set(price_index, tempN-1);
					String tempP = priceToString(menu_price.get(price_index));
					orderMenuPriceLbl.setText(tempP);
					System.out.println(tempN-1);
					////////////////////
					guiManager.setMenu_Info(menu_contain,menu_count,menu_price);
					///////////////////
					guiManager.menuTotalPrice(menu_price);
					// priceLbl.setText(Integer.toString(현재가격));
				}
			}
		});
		menuAddBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				String temp = menuCntLbl.getText();
				int tempN = Integer.parseInt(temp);
				temp = Integer.toString(tempN+1);
				menuCntLbl.setText(temp.trim());
				menu_price.set(price_index, menu_price.get(price_index)+tempPrice);
				menu_count.set(price_index, tempN+1);
				String tempP = priceToString(menu_price.get(price_index));
				orderMenuPriceLbl.setText(tempP);
				System.out.println(tempN+1);
				
				/////////////////
				guiManager.setMenu_Info(menu_contain,menu_count,menu_price);
				
				//////////////////
				guiManager.menuTotalPrice(menu_price);
				// 현재가격 += 상품가격;
				// priceLbl.setText(Integer.toString(현재가격));
			}
		});	
		
		
		orderScroll.repaint();
		
		int baseHeight = orderScrollBase.getHeight();
		menuHeight = orderMenuPanel.getHeight();
		
		int differeseY = (baseHeight - (createPoint_Y + menuHeight)) *-1;
		
		if((createPoint_Y + menuHeight) > baseHeight) {
			orderScrollBase.setPreferredSize(new Dimension(372, baseHeight + differeseY +gap));
			
			frame.revalidate();

		} else {
			orderScrollBase.repaint();
		}
		createPoint_Y += menuHeight + gap;
		
		currentPoint_Y = createPoint_Y;
		System.out.println(createPoint_Y);
		//////////////////////////////////////////////////////////////
		orderMenuDeleteBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            	try{
            		int n = pan_Y.indexOf(orderMenuPanel);
            		
            		int size = pan_Y.size()-1;
            		System.out.println("aaa " + n +" " + size);
            		System.out.println("bbb " + tran_Y + " " + (tran_Y.size()-1));
            		tran_Y.remove(tran_Y.size()-1);
                	pan_Y.remove(n);
                	menu_contain.remove(n);
                	menu_price.remove(n);
                	
                	orderScrollBase.remove(orderMenuPanel);
                	guiManager.menuTotalPrice(menu_price);


            		if(n != size ) {
//            			System.out.println("마지막아님");
            			for(int i = n; i < pan_Y.size(); i++){
//            				System.out.println(i + " " + tran_Y.get(i));
            				JPanel temp = pan_Y.get(i);
            				temp.setBounds(20, tran_Y.get(i), 347, 100);
            				pan_Y.set(i, temp);
            			}
            		}
            		System.out.println(createPoint_Y - (menuHeight + gap) + " " + defaultSize);
            		if(createPoint_Y - (menuHeight + gap) > defaultSize) {
//                		System.out.println("@@@@@@@@@@@@@@ " + (orderScrollBase.getHeight()-(menuHeight + gap)));
                		orderScrollBase.setPreferredSize(new Dimension(372, orderScrollBase.getHeight()-(menuHeight + gap)));
                		frame.revalidate(); // 프레임을 다시 그리도록 요청하여 변경사항을 반영
                	} else if(createPoint_Y > defaultSize) {
                		orderScrollBase.setPreferredSize(new Dimension(372, defaultSize));
                		frame.revalidate();
                	}else {
                		orderScroll.repaint();
                		
                	}
            		orderScrollBase.repaint();
            		createPoint_Y -= menuHeight + gap;

            		
            	} catch (Exception er) {
            		System.out.println("error : " + er.getMessage());
				}
            }
        });	
		////////////////////////////////////////////////////////////////
	}
	
	public void deleteOrder() {
		for(int i = 0; i < tran_Y.size(); i++) {
			orderScrollBase.remove(pan_Y.get(i)); 
		}
		createPoint_Y = 20;

		tran_Y.clear();
		pan_Y.clear();
		menu_contain.clear();
		menu_count.clear();
		menu_price.clear();
		orderScrollBase.setPreferredSize(new Dimension(317, defaultSize));
		
		if(deleteBtn.isEnabled()) {
			deleteBtn.setEnabled(false);
		}
		orderScrollBase.repaint();
		frame.revalidate();
	}
	
	public int priceParseInt(String menuPrice) {
		
		String temp = menuPrice.replace(",", "");
		temp = temp.replace("원", "");
		int tempN = Integer.parseInt(temp.trim());
		System.out.println(tempN);
		return tempN;
	}
	public String priceToString(int price) {
		String temp = Integer.toString(price);
		StringBuilder formattedNumber = new StringBuilder(temp);
		switch(temp.length()) {
		case 4:
			formattedNumber = formattedNumber.insert(1,",");
			break;
		case 7:
			formattedNumber = formattedNumber.insert(4,",");
			break;
		}
		
		return formattedNumber.toString()+"원";
	}
}