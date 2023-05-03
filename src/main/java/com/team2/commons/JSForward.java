package com.team2.commons;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.tools.DocumentationTool.Location;

public class JSForward {
		public static void alertAndBack(HttpServletResponse response
				                        ,String msg) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				out = response.getWriter();
				out.print("<script>");
				out.print(" alert('"+msg+"!'); ");
				out.print(" history.back(); ");
				out.print("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		public static void alertAndMove(HttpServletResponse response,
				                       String msg,String location) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print(" alert('"+msg+"'); ");
				out.print(" location.href='"+location+"'; ");
				out.print("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}// class JSFoward