package code;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.Buffer;

public class fileout {
	public fileout() {
		// TODO Auto-generated constructor stub
	}
	///写文件
	public fileout(String str,String url,int count)
	{	
		OutputStreamWriter pw = null;
		try {
		    File file =new File(url);    
		    if  (!file .exists()  && !file .isDirectory())      
		    {       
		        file .mkdir();    
		    }  
		    url=url+"/"+String.valueOf(count+1)+".txt";
			pw = new OutputStreamWriter(new FileOutputStream(url),"UTF-8");
			pw.write(str);
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	///读文件
	public static String read(String filePathAndName) {
		  String fileContent = "";
		  try { 
		   File f = new File(filePathAndName);
		   if(f.isFile()&&f.exists()){
		    InputStreamReader read = new InputStreamReader(new FileInputStream(f),"UTF-8");
		    BufferedReader reader=new BufferedReader(read);
		    String line;
		    while ((line = reader.readLine()) != null) {
		     fileContent += line;
		    }  
		    read.close();
		   }
		  } catch (Exception e) {
		   System.out.println("读取文件内容操作出错");
		   e.printStackTrace();
		  }
		  return fileContent;
		} 
}
