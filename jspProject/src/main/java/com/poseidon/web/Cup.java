package com.poseidon.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poseidon.dao.BoardDAO;
import com.poseidon.dto.CommentDTO;

@WebServlet("/cup")
public class Cup extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Cup() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("b_no"));
		System.out.println(request.getParameter("c_no"));
		System.out.println(session.getAttribute("m_id"));
		
		CommentDTO dto = new CommentDTO();
		
		if(session.getAttribute("m_id") != null && request.getParameter("c_no") != null) {
			//값 담기
			dto.setB_no(Integer.parseInt(request.getParameter("b_no")));
			dto.setC_no(Integer.parseInt(request.getParameter("c_no")));
			dto.setM_id((String) session.getAttribute("m_id"));
			//db에 물어보기
			BoardDAO dao = new BoardDAO();
			dto = dao.commentDetail(dto);
			
		}else {
			//값이 안들어온다면 여기로
		}
		//페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher("./commentUpdate.jsp");
		//값 붙이기
		request.setAttribute("dto", dto);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("b_no"));
		System.out.println(request.getParameter("c_no"));
		System.out.println(request.getParameter("comment"));
		System.out.println(session.getAttribute("m_id"));
		if(session.getAttribute("m_id") != null 
				&& request.getParameter("c_no") != null
				&& request.getParameter("comment") != null) {
			//저장하기
			CommentDTO dto = new CommentDTO();
			dto.setB_no(Integer.parseInt(request.getParameter("b_no")));
			dto.setC_no(Integer.parseInt(request.getParameter("c_no")));
			dto.setM_id((String) session.getAttribute("m_id"));
			dto.setC_comment(request.getParameter("comment"));
			
			BoardDAO dao = new BoardDAO();
			dao.commentUpdate(dto);
			
		}else {
			
		}
		//detail?b_no=b_no
		response.sendRedirect("./detail?b_no="+request.getParameter("b_no"));
	}

}


























