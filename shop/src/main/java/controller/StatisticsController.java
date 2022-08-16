package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.StatisticsService;


@WebServlet("/controller/*")
public class StatisticsController extends HttpServlet {
	
	private StatisticsService statisticsService;
 	
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		response.setContentType("application/json");
    		response.setCharacterEncoding("utf-8");
    		Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
    		
			if( request.getParameter("year") !=null) {
    			year = Integer.parseInt(request.getParameter("year"));
			}
			
    		// 응답 형태 결정
    		
    		Gson gson = new Gson();
    		String result = "";
    		System.out.print(year);
    		String uri = request.getRequestURI() ;
    		System.out.println(uri);
    		int n = request.getContextPath().length();
    		String command = uri.substring(n);
    		statisticsService =new StatisticsService();
    		if(command.equals("/controller/getCountByHiredate")) {
    				List<Map<String,Object>> list =statisticsService.selectCountByHiredate(year); 
    				result = gson.toJson(list);
    		}else if(command.equals("/controller/getCountByCustomer")) {
    				List<Map<String,Object>> list = statisticsService.selectCountByCustomer(year);
    				result = gson.toJson(list);
    		}else {
    			System.out.println("잘못된 요청");
    		}
    		
    		PrintWriter out = response.getWriter();
    		out.write(result);
    		out.flush();
    		out.close();
    		
	}

}
