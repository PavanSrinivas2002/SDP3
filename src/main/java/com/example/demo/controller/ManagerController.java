package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Model.Manager;
import com.example.demo.Model.Post;
import com.example.demo.Repo.LikePostRepo;
import com.example.demo.Repo.ManagerRepo;
import com.example.demo.Repo.PostRepo;
import com.example.demo.Repo.UserRepo;

@Controller
@SessionAttributes("admin")
public class ManagerController {
  
  @Autowired
  PostRepo pr;
  @Autowired
  LikePostRepo lpr;
  @Autowired
  ManagerRepo mr;
  @Autowired
  UserRepo ur;
  
@RequestMapping("/addproductform")
public ModelAndView addproductform()
{
  ModelAndView mv=new ModelAndView("addproduct");
  return mv;
}
@RequestMapping(value="/dashboard")
public ModelAndView dashboard(HttpServletRequest request)
{
	HttpSession s=request.getSession();
	Manager m2=(Manager)s.getAttribute("admin");
	ModelAndView mv=new ModelAndView("managerindex");
    long likes=lpr.count();
	long count=ur.count();
	mv.addObject("count",count);
	mv.addObject("likes",likes);
	return mv;
}
@RequestMapping("/addpost")
public ModelAndView addPost(Post p,@RequestParam("image") MultipartFile multipartFile)throws IOException
{
	
  ModelAndView mv=new ModelAndView("redirect:/myposts");
  pr.save(p);
  String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
    p.setPhotos(fileName);
     
    Post savedUser = pr.save(p);

    String uploadDir = "user-photos/" + savedUser.getId();

    FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
return  mv;

}
@RequestMapping("/allposts")
public ModelAndView getAllPost(){
   ModelAndView mv=new ModelAndView("allpossts");
   mv.addObject("posts",(List<Post>)pr.findAllByOrderByIdDesc());
       return mv;
   }
@RequestMapping("/myposts")
public  ModelAndView gettPostsOfUser(){
  ModelAndView mv=new ModelAndView("/myposts");
 // Manager manager=mr.findByUsername(username);
    List<Post> postList= pr.findAllByOrderByIdDesc();
    mv.addObject("posts", postList);
    return mv;
}
@RequestMapping("/deletepost/{id}")
public  ModelAndView gettPostsOfUser( @PathVariable("id")int id,HttpServletRequest request){
  
  System.out.println(id);
  Post p=pr.findById(id);
  System.out.println(id+p.manager.username);
  pr.delete(p);
  String redir="redirect:/myposts";
  ModelAndView mv2=new ModelAndView(redir);
    return mv2;
}
}