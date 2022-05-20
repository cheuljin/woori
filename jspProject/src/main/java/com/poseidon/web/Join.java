package com.poseidon.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.JoinDAO;
import com.poseidon.dto.JoinDTO;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Join() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");;
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		JoinDTO dto = new JoinDTO(age, id, passwd, name, addr, email, tel);
		//dao
		JoinDAO dao = new JoinDAO();
		int result = dao.join(dto);
		PrintWriter pw = response.getWriter();
		if(result == 0) {
			//뭔가 잘못되었다.
			System.out.println("가입 안됨");
			pw.println("<html>");
			pw.println("<head>");
			pw.println("<meta charset=\"UTF-8\">");
			pw.println("<title>가입 컽!</title>");
			pw.println("</head>");
			pw.println("<body>");
			pw.println("<h1>가입에 탈락하였구나</h1>");
			pw.println("<h1> 다시 ㄱㄱ </h1>");
			pw.println("<a href='./join'>가입하러가보자</a>");
			pw.println("</body>");
			pw.println("</html>");

		}else {
			//뭔가 됨
			System.out.println("가입 됨");
			pw.println("<html>");
			pw.println("<head>");
			pw.println("<meta charset=\"UTF-8\">");
			pw.println("<title>가입성공</title>");
			pw.println("</head>");
			pw.println("<body>");
			pw.println("<h1>가입에 성공하였구나</h1>");
			pw.println("<a href='./index'>로그인하러가자</a>");
			pw.println("</body>");
			pw.println("</html>");
		}

	}

}
