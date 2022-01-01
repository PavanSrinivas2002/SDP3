package com.example.demo.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Model.Product;
import com.example.demo.Repo.ProductRepo;


@Controller
@SessionAttributes("admin")
public class ProductController {
	@Autowired
	ProductRepo pr;
	
	@RequestMapping(value="/addproduct")
	public ModelAndView addproduct(Product p,@RequestParam("image") MultipartFile multipartFile,HttpServletRequest request)  throws IOException
	{
		ModelAndView mv=new ModelAndView("product");
		System.out.println(p.pname);
		 String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
	        p.setPhotos(fileName);
	         
	        Product savedUser = pr.save(p);
	 
	        String uploadDir = "user-photos/" + savedUser.getPid();
	 
	        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
	        mv.addObject("product",p);
		return mv;
	}
	@RequestMapping(value="/searchproduct/")
	public ModelAndView addproduct(String pname)
	{
		ModelAndView mv=new ModelAndView();
		List<Product> ps=pr.findByPname(pname);
		mv.addObject("ps", ps);
		mv.setViewName("products");
		return mv;
	}
	@RequestMapping(value="/allproducts")
	public ModelAndView allproducts(String pname)
	{
		ModelAndView mv=new ModelAndView("allproducts");
		List<Product> ps=pr.findAll();
		mv.addObject("products", ps);
		return mv;
	}
	@RequestMapping(value="/product/{pid}")
	public ModelAndView allproducts(@PathVariable("pid")int pid)
	{
		System.out.println(pid);
		ModelAndView mv=new ModelAndView("/productpage");
		Product p=pr.findByPid(pid);
		mv.addObject("product", p);
		return mv;
	}
	@RequestMapping(value="/deleteproduct/{pid}")
	public String deleteproducts(@PathVariable("pid")int pid, HttpServletRequest request)
	{
		System.out.println(pid);
		Product p=pr.findByPid(pid);
		pr.delete(p);
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;

	}
	@RequestMapping(value="/updateproduct")
	public ModelAndView deleteproducts(Product p)
	{
		ModelAndView mv=new ModelAndView("/allproducts");
		pr.save(p);
		return mv;
	}

}
