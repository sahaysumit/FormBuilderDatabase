package code.json;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class MainServlet extends HttpServlet implements Filter {
	private static final long serialVersionUID = 1L;
	 private String dbURL = "jdbc:mysql://localhost:3306/form_builder";
	    private String dbUser = "root";
	    private String dbPass = ""; 
	    String message=null;
	   
  
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}
@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("username");
   	     doCheck(request, response, uname);
	}
	 public void doCheck(HttpServletRequest request, HttpServletResponse response, String uname) throws MalformedURLException,
	    IOException, ServletException {
	    	   HttpSession session = request.getSession();
	    	   
	    	   Connection con;
	    	   PreparedStatement ps;
	    	   PrintWriter out = response.getWriter();
	    	   boolean permission = false;
	    	   
	    	  
	    	   try {    
	    		 Class.forName("com.mysql.jdbc.Driver");
	    		 con = DriverManager.getConnection(dbURL, dbUser, dbPass);
	    		 
	    		 String pwd=request.getParameter("password");
	    		
	    		 ps = con.prepareStatement("select * from userid where username='"+uname+"'and password='"+pwd+"'");
	    		 ResultSet rs = ps.executeQuery(); 
	    		 while (rs.next()){
	    			 permission =true;
	    			

//	    			    HttpSession session=request.getSession();  
//	    		        session.setAttribute("uname",uname); 
//	    		        response.sendRedirect("main.html");
//	    		        response.getWriter().write(uname);
	    
			 }
              if (permission==true){
            	  
            	     session = request.getSession();
            	     session.setAttribute("username", uname);
	    			 RequestDispatcher redis = request
                  .getRequestDispatcher("main.jsp");
                  redis.forward(request, response);
            	  
              }
	        	 else{
	    			message = "Invalid username or password"; 
	    			request.setAttribute("Message", message);
	    			 RequestDispatcher redis = request
                     .getRequestDispatcher("open.jsp");
                      redis.forward(request, response);
	    			
	    		 }
	    	   }
	    	   
	    	   catch
	    		 	(Exception e) {
	    	        out.println(e); 
	    	         
	    	   }
	    	  }
	    
	 
	    	
	    

     @Override
     public void doFilter(ServletRequest req, ServletResponse res,
             FilterChain chain) throws IOException, ServletException {
         // TODO Auto-generated method stub
         HttpServletRequest request = (HttpServletRequest) req;
         HttpServletResponse response = (HttpServletResponse) res;
         HttpSession session = request.getSession(false);
         if (session != null && session.isNew()) {
             response.setHeader("Pragma", "no-cache");
             response.setHeader("Cache-Control", "no-cache");
        
             
             chain.doFilter(request, response);
         }
        
         else{
        	 response.sendRedirect("open.jsp");
         }
     }

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
