package com.blackah.site.controller;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CoddingTestContoller {
	
	@RequestMapping("myplace/coding.do")
	public String cdt() {
		return "Intro/cdt";
	}
	
	@RequestMapping("myplace/solution.do")
	@ResponseBody
	public String solution(@RequestParam(value="solutionMode", required=false)String solutionMode
			,@RequestParam(value="number[]", required=false)String[] number
			,@RequestParam(value="decimal", required=false)String decimal
			,@RequestParam(value="second", required=false)String second
			,@RequestParam(value="text", required=false)String text
		) {
		
		String result = "";
		
		
		if(solutionMode.equals("MaxNum")) {
			Arrays.sort(number, new Comparator<String>() { 
				public int compare(String o1, String o2) {
					return (o2+o1).compareTo(o1+o2); 
				}
			});
		 
			for(int i=0;i<number.length;i++) {
				result += number[i];
			}
		 
			result = (String) (result.charAt(0) == '0' ? '0' : result); 
		}else if(solutionMode.equals("SignForm")) {
			int n = text.length();
			int sec = Integer.parseInt(second);
			
			Queue<String> que = new LinkedList<String>();
			
			for(int i=0;i<n;i++) {
				que.add("_");
			}
			
			
			Boolean sw = false;
			for(int i=0;i<sec;i++) {
				int idx = i%n;
				
				if(idx == 0) {
					sw = !sw;
				}
				
				que.remove();
				
				if(sw) {
					que.add(text.substring(idx, idx+1).replace(" ", "_"));
				}else {
					que.add("_");
				}
			}
			
			while(!que.isEmpty()) {
				String tmp = que.poll();
				result += tmp;
			}
			
		}else if(solutionMode.equals("decimal")) {
			HashSet<Integer> set = new HashSet<Integer>();
	        permutation("", decimal, set);
	        int count = 0;
	        while(set.iterator().hasNext()){
	            int a = set.iterator().next();
	            System.out.println(a);
	            set.remove(a);
	            if(a==2) count++;
	            if(a%2!=0 && isPrime(a)){
	                count++;
	            }
	        }
	        
	        result = Integer.toString(count);
		}
		
		return result;
	}
	
	public void permutation(String prefix, String str, HashSet<Integer> set) {
        int n = str.length();
        if(!prefix.equals("")) set.add(Integer.valueOf(prefix));
        for (int i = 0; i < n; i++)
          permutation(prefix + str.charAt(i), str.substring(0, i) + str.substring(i+1, n), set);
	}
	
	public boolean isPrime(int n){
        if(n==0 || n==1) return false;
        for(int i=3; i<=(int)Math.sqrt(n); i+=2){
            if(n%i==0) return false;
        }
        return true;
    }


}
