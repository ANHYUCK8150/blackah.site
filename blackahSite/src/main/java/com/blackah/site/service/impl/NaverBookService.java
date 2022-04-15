package com.blackah.site.service.impl;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.blackah.site.vo.BookVO;
import com.blackah.site.vo.PagingVO;

@Service("BookAPI")
public class NaverBookService {
	private static String clientID = "AOkXvfRXeD2arOihiY58";
    private static String clientSecret = "7ZNBRedIW8";
 
    public List<BookVO> searchBook(String keyword, int display, int start, PagingVO pagingVO){
        List<BookVO> list = null;
        try {
            URL url;
            url = new URL("https://openapi.naver.com/v1/search/"
                    + "book.xml?query="
                    + URLEncoder.encode(keyword, "UTF-8")
                    + (display !=0 ? "&display=" +display :"")
                    + (start !=0 ? "&start=" +start :""));
 
            URLConnection urlConn = url.openConnection();
            urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput(
                    new InputStreamReader(urlConn.getInputStream()));
            
            int eventType = parser.getEventType();
            BookVO b = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
	                case XmlPullParser.END_DOCUMENT:
	                    break;
	                case XmlPullParser.START_DOCUMENT:
	                    list = new ArrayList<BookVO>();
	                    break;
	                case XmlPullParser.END_TAG: {
		                    String tag = parser.getName();
		                    if(tag.equals("item"))
		                    {
		                        list.add(b);
		                        b = null;
		                    }
		                }
	                case XmlPullParser.START_TAG: {
	                    String tag = parser.getName();
	                    switch (tag) {
	                    case "item":
	                        b = new BookVO();
	                        break;
	                    case "total":
	                    	pagingVO.PagingInit(Integer.parseInt(parser.nextText()), start, display);
	                        break;
	                    case "title":
	                        if(b != null)
	                            b.setTitle(parser.nextText());
	                        break;
	                    case "link":
	                        if(b != null)
	                            b.setLink(parser.nextText());
	                        break;
	                    case "image":
	                        if(b != null)
	                            b.setImage(parser.nextText());
	                        break;
	                    case "author":
	                        if(b != null)
	                            b.setAuthor(parser.nextText());
	                        break;
	                    case "price":
	                        if(b != null)
	                            b.setPrice(parser.nextText());
	                        break;
	                    case "discount":
	                        if(b != null)
	                            b.setDiscount(parser.nextText());
	                        break;
	                    case "publisher":
	                        if(b != null)
	                            b.setPublisher(parser.nextText());
	                        break;
	                    case "pubdate":
	                        if(b != null)
	                            b.setPubdate(parser.nextText());
	                        break;
	                    case "isbn":
	                        if(b != null)
	                            b.setIsbn(parser.nextText());
	                        break;
	                    case "description":
	                        if(b != null)
	                            b.setDescription(parser.nextText());
	                        break;
	                    }
	                    
	                }
                }
                eventType = parser.next();
            }
            
            
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            e.printStackTrace();
        }
        return list;
    }

}
