package dialog;

import java.awt.Label;
import java.util.ArrayList;
import java.util.Arrays;

import javax.swing.JLabel;

public class Data_Sort {
	

	DialogFrom dialogFrom;
	
	public Data_Sort(DialogFrom dialogFrom) {
        this.dialogFrom = dialogFrom;
    }
	
	
    public void dataSort(String message) {
    	
    	String[] dataArray = message.split("@");
        
    	for(int i = 0; i<dataArray.length; i++) {
    			
    		String data =dataArray[i];
    		
    		dialogFrom.createLabel(data); 
    		System.out.println(data);
    		//dialogFrom.createLabel(dataArray[i]); 
    	
    	}
    }   
}
