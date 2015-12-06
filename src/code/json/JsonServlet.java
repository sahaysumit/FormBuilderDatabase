package  code.json;


import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import java.sql.*;
import java.util.Iterator;
import java.io.PrintWriter;  
import java.net.MalformedURLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;

import org.codehaus.jackson.map.JsonSerializer;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;


public class JsonServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
  
    private String dbURL = "jdbc:mysql://localhost:3306/form_builder";
    private String dbUser = "root";
    private String dbPass = ""; 
    String message=null;
  
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	HttpSession session=request.getSession(true);  
        String uname=(String)session.getAttribute("username");
		 doProcess(request, response, uname);
    	 dofeedback(request, response, uname);
    	
}
//  
//    public void doCheck(HttpServletRequest request, HttpServletResponse response, String uname) throws MalformedURLException,
//    IOException {
//    	
//    	   Connection con;
//    	   PreparedStatement ps;
//    	   PrintWriter out = response.getWriter();
//    	   
//    	
//    	   try {    
//    		 Class.forName("com.mysql.jdbc.Driver");
//    		 con = DriverManager.getConnection(dbURL, dbUser, dbPass);
//    		 
//    		 String pwd=request.getParameter("password");
//    		
//    		 ps = con.prepareStatement("select * from userid where username='"+uname+"'and password='"+pwd+"'");
//    		 ResultSet rs = ps.executeQuery();
//    		 if (rs.next()){
//    			 response.sendRedirect("main.html");
//    			
//    	    	
//
//    		//	getServletContext().getRequestDispatcher("JsonServlet").forward(request, response);
//		 }
//
//        	 else{
//    			message = "Invalid username or password"; 
//    			request.setAttribute("Message", message);
//    			getServletContext().getRequestDispatcher("/open.jsp").forward(request, response);
//    		 }
//    	   }
//    	   
//    	   catch
//    		 	(Exception e) {
//    	        out.println(e); 
//    	         
//    	   }
//    	
//    	
//    }


    
   public void doProcess(HttpServletRequest request, HttpServletResponse response, String uname) throws MalformedURLException,
   IOException {

	  Connection con;
      PreparedStatement ps;
      PrintWriter out = response.getWriter(); 
    	  
      try {    
    		 Class.forName("com.mysql.jdbc.Driver");
    		 con = DriverManager.getConnection(dbURL, dbUser, dbPass);
    		 
    		 
    	      Statement stmt;
    	      String maxid = "SELECT MAX(form_id) FROM form";
    	      stmt=con.createStatement();
    	      ResultSet rs1 = stmt.executeQuery(maxid);
    	      while (rs1.next()) {
    	      int idmax = (rs1.getInt("MAX(form_id)"));
    	      
    	      int realmax =idmax + 1;
    	     
    	      
    	     
    		 String formelement =request.getParameter("items");
    		 String formname = request.getParameter("formname");
     		 if(formelement!=null && formname!=null && uname!=null){
  
     		 String sql = "INSERT INTO form (form_name, form_link, form_elements, username) VALUES (?, ?, ?, ?)"; 
             PreparedStatement pst = con.prepareStatement(sql);
             pst.setObject(1, formname);
             pst.setObject(2, "localhost:8080/FormBuilderDatabase/id/"+realmax);
     		 pst.setObject(3, formelement);
     		 pst.setObject(4, uname);
             pst.executeUpdate();
             pst.close();
     		 }
     		 else{} 
     		 ps = con.prepareStatement("select * from form  where username='"+uname+"'");
     	//	
     		 ResultSet rs = ps.executeQuery();
          
     		 JSONArray jarray = new JSONArray();
                   
              while (rs.next()) {
                 int form_id = rs.getInt(1);
                 String form_name = rs.getString(2);
                 String form_link = rs.getString(3);
                 String formelements= rs.getString(4);
                 
                 JSONObject jsonelements= new JSONObject(formelements);
                 JSONObject jobj = new JSONObject();
                 
                 jobj.put("formname",form_name);
                 jobj.put("formelements",jsonelements);
                 jarray.put(jobj);
              	}
               
              	response.getWriter().write(jarray.toString());
              	
         
    	   } }catch 
    	   	(Exception e) {
             out.println(e); 
         }

         out.close();
    }
   

public void dofeedback(HttpServletRequest request, HttpServletResponse response, String uname) throws MalformedURLException,
   IOException {

	   Connection con;
	 
	   
    

    	   try {    
    		 Class.forName("com.mysql.jdbc.Driver");
    		 con = DriverManager.getConnection(dbURL, dbUser, dbPass);
    	   
    		 String testing = request.getParameter("send");
    		 String name = request.getParameter("name");
    		 String id = request.getParameter("formid"); 
    		 String  version = request.getParameter("version");
    	   int fbno = 1;
    	   Statement stmt;
    	   String fb = "SELECT MAX(feedback_no) FROM feedbacktable WHERE form_id="+id;
    	   stmt=con.createStatement();
    	   ResultSet rs1 = stmt.executeQuery(fb);
    	   while (rs1.next()) {
    	   int fbmax = (rs1.getInt("MAX(feedback_no)"));
    	   fbno=fbmax+1;
    	
//    	   for(int l=0; l<=fbmax; l++){
//    		  if(l>fbmax){
//    			  fbno=l;
//    		  }}
    	   }
    		 
    		 JSONObject jobject = new JSONObject(testing);
    		 JSONObject formfld = jobject.getJSONObject("formfield");
       		 JSONArray formelm = formfld.getJSONArray("formelements");
    		
       		 for (int j = 0; j < formelm.length(); ++j) {
       			 JSONObject rec = formelm.getJSONObject(j);
    			 JSONArray value = rec.getJSONArray("inputt");
    			     	
    			 for (int p=0; p<value.length(); p++){
    			    	       	  
    			    String valve = value.getString(p);
    			    String labell = rec.getString("labell").toString();
    			    String type = rec.getString("type").toString();
    			    System.out.println(labell);
    			    System.out.println(type);
    			    System.out.println(valve);
    			    
if (!valve.isEmpty() && !type.isEmpty()){
     		 String sql = "INSERT INTO feedbacktable (feedback_no, form_id, form_version, form_name, element_type, label, value, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
             PreparedStatement pst = con.prepareStatement(sql);

             pst.setObject(1, fbno);
             pst.setObject(2, id);
             pst.setObject(3, version);
             pst.setObject(4, name);
             pst.setObject(5, type);
             pst.setObject(6, labell);
             pst.setObject(7, valve);
             pst.setObject(8, uname);
          
             pst.executeUpdate();
             pst.close();
           
}
else{}		 
    				 }
 			   }
	   
           } catch 
           (Exception e) {
             }
     }
       
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
  	 doPost(request, response);
  	
  	 response.setContentType("application/json");
  }
}   