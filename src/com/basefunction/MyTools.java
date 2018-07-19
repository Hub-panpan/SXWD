package com.basefunction;


import java.text.SimpleDateFormat;

import java.util.Date;
public class MyTools {
	/**  
	 *  * 
	 *  将int型数据转换为String型数据 
	 *   
	 *     num为要转换的int型数据   *  String类型  
	 *      */ 
	
	public static String intToStr(int num){
		return String.valueOf(num);
		
	}
	
	/**  
	  *比较时间。 
	  * today当前时间，temp为上次投票时间。这两个参数都是以毫秒显示的时间 
	  *  String类型    */
	public static String compareTime(long today,long temp){
		
		int limitTime=60;    //设置时间为60分钟
		long count=today-temp;//计算当前时间 与上次  投票相差的毫秒数 （该结果一定是大于0）
		
		 
		if(count<=limitTime*60*1000){//如果相差小于等于60分钟 1分=60秒，1秒=1000毫秒)
			return "no";}	
		else{
			return "yes";
			
		}
		
	}
		/**   
		*格式化时间为指定格式。
		*首先通过Date类的构造方法根据给出的毫秒数获取一个时间，
		*然后将该时间转换为指定格式，如"年-月-日 时:分:秒"   
		*  ms为毫秒数   *  String类型*/
		
		
		public static String formatDate1(long ms){
			
			Date date=new Date(ms);  
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String strDate=format.format(date);
			return strDate;
			
			
		}
		
		
		
		
	}
	

