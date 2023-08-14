package com.spring.mvc.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.spring.mvc.entity.ToDo;

public class MyListener  implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
     System.out.println("context destroyed....");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
       
		System.out.println("context created....");
		List<ToDo> list = new ArrayList<>();
		
		ServletContext context = sce.getServletContext();
		context.setAttribute("list", list); 
		
	}

}
