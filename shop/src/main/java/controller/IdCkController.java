package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.CustomerService;

@WebServlet("/idckController")
public class IdCkController extends HttpServlet {
	private CustomerService customerService;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		this.customerService = new CustomerService();
		String idck = request.getParameter("idck");
		System.out.println(idck + " <-- idck");
		
		String id = this.customerService.getIdCheck(idck);
		// id -> null -> idck사용가능 -> yes
		// id -> select값 -> idck사용불가 -> no
		
		Gson gson = new Gson();
		String jsonStr = "";
		if(id == null) {
			jsonStr = gson.toJson("y");
		} else {
			jsonStr = gson.toJson("n");
		}
		
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();
	}
}
