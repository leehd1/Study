package com.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.travelpackage.PackageInfo;
import com.travelpackage.PackageList;
import com.travelpackage.PackageSearch;

@SuppressWarnings("serial")
public class PackageController extends HttpServlet{
    
    @Override protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { doHandle(request, response); }
    @Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { doHandle(request, response); }
    protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());
        ActionMove move = null;
        Action action = null;
        
        System.out.println(command);
        
        if (command.equals("/info.pack")) {
            
            action = new PackageInfo();
            
            try {
                move = action.execution(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        } else if (command.equals("/list.pack")) {
            
            action = new PackageList();
            
            try {
                move = action.execution(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/search.pack")) {
            
            action = new PackageSearch();
            
            try {
                move = action.execution(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
         
        if (move.isRedirect()) {
            response.sendRedirect(move.getPath());
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher(move.getPath());
            dispatcher.forward(request, response);
        }
    }
    
}
