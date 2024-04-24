package dialog;

import java.awt.Label;
import java.util.ArrayList;
import java.util.Arrays;

import javax.swing.JLabel;

public class Data_Sort {
	
		

	DialogFrom dialogFrom = new DialogFrom();
	
   
    
	
    public void dataSort(String message) {
    	
    	String[] dataArray = message.split("@");
        
    	for(int i = 0; i<dataArray.length; i++) {
    			
    		dialogFrom.createLabel(dataArray[i]); 
    	}
    }   
}
