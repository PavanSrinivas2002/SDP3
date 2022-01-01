package com.example.demo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
@Controller
@SessionAttributes("admin")
public class ClientController {

		@RequestMapping(value="/")
		public String display()
		{
						return "index";
		}
		@RequestMapping(value="/about")
		public String about()
		{
			return "about";
		}
		@RequestMapping(value="/login")
		public String login()
		{
			return "login";
		}
		@RequestMapping(value="/register")
		public String register()
		{
			return "register";
		}
		
}
