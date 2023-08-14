package com.spring.mvc.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mvc.entity.ToDo;

@Controller
public class HomeController {

	@Autowired
	ServletContext context;
	
	@RequestMapping("/home")
    public String showHome(Model m) {
		
		String str="home";
		m.addAttribute("page", str);
		
		List<ToDo>list=(List<ToDo>) context.getAttribute("list");
		m.addAttribute("todos",list);
        return "home";
    }
	
	@RequestMapping("/add")
	public String addToDo(Model m)
	{
		ToDo todo=new ToDo();
		
		m.addAttribute("page","add");
		m.addAttribute("todo",todo);
     return "home";
    }
	
	@RequestMapping(value ="/saveToDo", method = RequestMethod.POST)
	public String saveToDo(@ModelAttribute("todo") ToDo todo, Model m) {
	    todo.setTodoDate(new Date());

	    List<ToDo> list = (List<ToDo>) context.getAttribute("list");
	    list.add(todo);
	    
	    m.addAttribute("msg", "successfully added");
	    
	    System.out.println(todo);
	    
	    return "home";
	}

	
	
	@RequestMapping("/aboutUs")
	public String aboutUs(Model m)
	{
		m.addAttribute("page","aboutUs");
     return "home";
    }
}
