package Test0415_Night;

import java.awt.*;
import java.awt.geom.RoundRectangle2D;

import javax.swing.*;

public class RoundedPanel extends JPanel{
	  public RoundedPanel() {
	        setBackground(Color.WHITE); // 배경색 설정
	    }
	@Override
	protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Dimension arcs = new Dimension(10, 10); // 호의 너비와 높이
        int width = getWidth();
        int height = getHeight();
        Graphics2D graphics = (Graphics2D) g;
        graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphics.setColor(getBackground());
        graphics.fillRoundRect(0, 0, width - 1, height - 1, arcs.width, arcs.height); // 둥근 테두리
        graphics.setColor(getForeground());
        graphics.drawRoundRect(0, 0, width - 1, height - 1, arcs.width, arcs.height); // 테두리 그리기
     // 이미지 영역을 라운드 처리합니다.
        graphics.setClip(new RoundRectangle2D.Double(0, 0, width, height, arcs.width, arcs.height));
    }
    

    @Override
    public boolean isOpaque() {
        return false;
    }
}
