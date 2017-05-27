package gz.it.pratice.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//md5加密工具
public class MD5Util {

	public static String md5(String password){

		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			byte[] array = md.digest(password.getBytes()); //加密后的md5数据
			StringBuffer sb = new StringBuffer();
			for(byte b:array){
				//转换好后的字符串
				String str = null;
				
				//把每个10进制的数字转换成16进制的字符串
				str = Integer.toHexString(b);	
				
				//如果是赋值则保留后两位字符串
				if(b<0){
					str = str.substring(str.length()-2);
				}
				
				//如果转换后只有1位，则在前面补0
				if(str.length()==1){
					str = "0"+str;
				}
				
				
				sb.append(str);
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			System.out.println("加密失败");
			throw new RuntimeException(e);
		}
	}
	
	public static String powerfulMd5(String password){
		return md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(md5(password))))))))))))))))))))))));
	}
	
	public static void main(String[] args) {
		System.out.println(MD5Util.md5("123456"));
		
		//e10adc3949ba59abbe56e057f20f883e     -->123456
		
		
		System.out.println(powerfulMd5("123456"));
	}
}
