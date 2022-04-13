package com.blackah.site.config;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class APIClass {
	private String serviceKey_farm = "z1YQ5QToCMjMwftYKYtHV1c0R527v0AL892gk%2F3xxHo8UE5n84%2BANIIO%2F4Fakc2jUqDfXnLHpy%2BeagMobxZOpQ%3D%3D";
	private String url = "http://openapi.epis.or.kr/openapi/service/PcInfoService/getFrmprdWltprPcList";
	
	public Object response(Map<String,Object> params) throws UnsupportedEncodingException {
		String decodeServiceKey = URLDecoder.decode(this.serviceKey_farm, "UTF-8");
		
		UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
				.queryParam("serviceKey", decodeServiceKey)
				.queryParam("dates", params.get("dates").toString().replaceAll("-", ""))
				.queryParam("lcode", params.get("lcode"))
				.queryParam("mcode", params.get("mcode"))
				.queryParam("scode", params.get("scode"))
				.queryParam("marketco", params.get("marketco"))
				.queryParam("cocode", params.get("cocode"))
				.queryParam("pageNo", params.get("pageNo"))
				.queryParam("numOfRows", params.get("numOfRows"))

				.build(false);

		
		RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
        
        restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
        ResponseEntity<Object> response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), Object.class);
        
        System.out.println("======= url : " + builder.toUriString());
        
		return response.getBody();
	}
	
}
