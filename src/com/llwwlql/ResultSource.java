package com.llwwlql;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

public class ResultSource {
	private static HttpClient httpclient = new DefaultHttpClient();
	public String GetResult(String Url) throws ClientProtocolException, IOException{
		HttpGet httpget = new HttpGet(Url);
		HttpResponse response = httpclient.execute(httpget);
		String strResult = null;
		if(response!=null)
		{
			HttpEntity entity = response.getEntity();
			strResult = EntityUtils.toString(entity,"UTF-8");
			EntityUtils.consume(entity);
		}
		else
		{
			System.out.println("ªÒ»° ß∞‹£°");
		}
		httpget.abort();
		return strResult;
	}
}
