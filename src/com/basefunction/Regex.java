package com.basefunction;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Regex {


		public  boolean isMobileNO1(String mobiles){  
			  
			String value="手机号";  
			  
			String regExp = "^[1]([3][0-9]{1}|59|58|88|89)[0-9]{8}$";  
			  
			Pattern p = Pattern.compile(regExp);  
			  
			Matcher m = p.matcher(value);  
			  
			return (m.find());//boolean  
		  }
		public  boolean isMobileN02(String mobiles){
			Pattern p = Pattern.compile("^((17[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");    
			Matcher m = p.matcher(mobiles);  
			System.out.println("控制台  ：isMobileN02  ---"+m.matches());  
		    return m.matches();  
		    
		} 
		public  boolean isValidName(String name){
			String regex="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]"; 
			Pattern p = Pattern.compile(regex); 
			Matcher m = p.matcher(name);
			System.out.println("控制台  ：isValidName  ---"+!m.matches());  
			return m.matches(); 
		}
		public  boolean isValidAddr(String addr){
			String regex="[`~!@$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]"; 
			Pattern p = Pattern.compile(regex); 
			Matcher m = p.matcher(addr);
			System.out.println("控制台  ：isValidAddr  ---"+!m.matches());  
			if(addr.length()<6&&!m.matches()){
				System.out.println("控制台  ：isValidAddr  ---地址长度不够"); 
				return false; 
			}else {
				return true;
			}
			
		}
}




