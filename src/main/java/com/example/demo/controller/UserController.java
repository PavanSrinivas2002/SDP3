package com.example.demo.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.Model.Cart;
import com.example.demo.Model.LikePost;
import com.example.demo.Model.Manager;

import com.example.demo.Model.Post;
import com.example.demo.Model.Product;
import com.example.demo.Model.SavePost;
import com.example.demo.Model.User;
import com.example.demo.Repo.CartRepo;
import com.example.demo.Repo.LikePostRepo;
import com.example.demo.Repo.ManagerRepo;
import com.example.demo.Repo.PostRepo;
import com.example.demo.Repo.ProductRepo;
import com.example.demo.Repo.SavePostRepo;
import com.example.demo.Repo.UserRepo;
@Controller
@SessionAttributes("admin")
public class UserController {
	    public String username;
	    
	    
	    
        @Autowired
        public UserRepo user;
        @Autowired
        public CartRepo cr;
        @Autowired
        public LikePostRepo lpr;
        @Autowired
        public SavePostRepo spr;
        @Autowired
        public ManagerRepo mg;
        @Autowired
        public PostRepo pr;
        @Autowired
        public ProductRepo prodrepo;
        
		@RequestMapping(value="/check")
		public String display()
		{
			return "check";
		}
		@RequestMapping(value="/adduser")
		public String adduser(User u)
		{
			System.out.println(u.username);
			user.save(u);
			return "login";
		}
		
		
		
		@RequestMapping(value="/logincheck")
		public ModelAndView logincheck(User u,HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			
			ModelAndView mv=new ModelAndView("redirect:/dashboard");
			long count=mg.count();
			ModelAndView mv2=new ModelAndView("redirect:/home");
			ModelAndView mv3=new ModelAndView("login");
			Manager m=new Manager();
			m.username=u.username;
			m.password=u.password;
			Manager m2=mg.findByUsername(m.username);
			
				if(m2!=null && m2.password.equals(m.password))
				{
				    s.setAttribute("admin", m2);	
					mv.addObject("admin",m2);
					mv.addObject("count",count);
					return mv;
				}
			
			User u2=user.findByUsername(u.username);
			if(u2!=null && u2.password.equals(u.password))
			{
				s.setAttribute("user", u2);
				mv2.addObject("user", u2);
				return mv2;
			}
			mv3.addObject("message", "Invalid Login");
			return mv3;
		}
		@RequestMapping(value="/home")
		public ModelAndView home(HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			ModelAndView mv=new ModelAndView("home");
			User u=user.findByUsername("username");
			mv.addObject("user", u2);
			List<Post> posts=pr.findAll();
			mv.addObject("posts", posts);
			return mv;
		}
		@RequestMapping(value="/likepost/{id}")
		public String likepost(@PathVariable("id")long id,HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			
			Post p=pr.findById(id);
			LikePost lp=lpr.findByUserAndPost(u2, p);
			if(lp==null)
			{
				p.likes+=1;
				p.isliked=true;
				pr.save(p);
				LikePost nlp=new LikePost();
				nlp.user=u2;
				nlp.post=p;
				lpr.save(nlp);
				
			}
			String referer = request.getHeader("Referer");
		    return "redirect:"+ referer+"#"+id;
			
		}
		@RequestMapping(value="/dislikepost/{id}")
		public String dislikepost(@PathVariable("id")long id,HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			Post p=pr.findById(id);
			LikePost lp=lpr.findByUserAndPost(u2, p);
			if(lp!=null)
			{
				p.likes-=1;
				p.isliked=true;
				lpr.delete(lp);
				pr.save(p);
			}
			String referer = request.getHeader("Referer");
		    return "redirect:"+ referer+"#"+id;
			
		}
		
		
		@RequestMapping(value="/profile")
		public ModelAndView profile(HttpServletRequest req)
		{
			HttpSession s=req.getSession();
			User u2=(User)s.getAttribute("user");
			
			ModelAndView mv=new ModelAndView("/profile");
			
			mv.addObject("user", u2);
			return mv;
		}
		@RequestMapping(value="/savepost/{id}")
		public String savepost(@PathVariable("id")long id,HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			
			Post p=pr.findById(id);
			SavePost sp=spr.findByUserAndPost(u2, p);
			if(sp==null)
			{
				SavePost nsp=new SavePost();
				nsp.user=u2;
				nsp.post=p;
				spr.save(nsp);
			}
			else {
				spr.delete(sp);
			}
			String referer = request.getHeader("Referer");
		    return "redirect:"+ referer;
			
		}
		@RequestMapping(value="/saved")
		public ModelAndView savedposts(HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			
			ModelAndView mv=new ModelAndView("saved");
			
			List<SavePost> sp=spr.findByUser(u2);
			List<Post> posts=pr.findAll();
			mv.addObject("savedposts", sp);
			mv.addObject("posts", posts);
			return mv;
		
}
		@RequestMapping(value="/shop")
		public ModelAndView shop(HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			ModelAndView mv=new ModelAndView("/shop");
			List<Product> ps=prodrepo.findAll();
			mv.addObject("products", ps);
			mv.addObject("user", u2);
			return mv;
}
		@RequestMapping(value="/addtocart/{id}")
		public String addtocart(@PathVariable("id") int id,HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			Product p=prodrepo.findByPid(id);
			String referer = request.getHeader("Referer");
			Cart ca=cr.findByUserAndProduct(u2, p);
			if(ca==null)
			{
		    Cart c=new Cart();
		    c.product=p;
		    c.quantity=1;
		    c.user=u2;
			cr.save(c);
			}
			else {
				ca.quantity+=1;
				cr.save(ca);
			}
			
			return "redirect:"+ referer;
}
		@RequestMapping(value="/buyproduct/{id}")
		public ModelAndView productpage(@PathVariable("id") int id,HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			ModelAndView mv=new ModelAndView("/product_user");
			Product p=prodrepo.findByPid(id);
			mv.addObject("product",p);
		    mv.addObject("user", u2);
			return mv;
}
		/*
		@RequestMapping(value="/orderproduct")
		public ModelAndView orderproduct(@PathVariable("id") int id,HttpServletRequest request,Order order)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			List<Cart> ct=cr.findByUser(u2);
			ModelAndView mv=new ModelAndView("placeorder");
			for(Cart i : ct)
			{
		
				Order o=new Order();
				o.user=i.user;
				o.product=i.product;
				o.address=order.address;
				o.paymethod=order.paymethod;
				o.quantity=i.quantity;
				o.cost=i.quantity*i.product.price;
				or.save(o);
			}
			return mv;
}
		*/
		@RequestMapping(value="/cart")
		public ModelAndView cart(HttpServletRequest request)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			ModelAndView mv=new ModelAndView("cart");
			List<Cart> cart=cr.findByUser(u2);
			mv.addObject("user",u2);
			mv.addObject("cart", cart);
			return mv;
}
		@RequestMapping(value="/removefromcart/{id}")
		public ModelAndView removefromcart(HttpServletRequest request,@PathVariable("id") long id)
		{
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			ModelAndView mv=new ModelAndView("redirect:/cart");
			cr.deleteById(id);
			
			return mv;
}
		
		@RequestMapping(value="/shop/{username}")
		public ModelAndView shopbyuser(HttpServletRequest request,@PathVariable("id") long id,@PathVariable("username")String Username)
		{
			Manager mn=mg.findByUsername(username);
			List<Product> ps=prodrepo.findByManager(mn);
			HttpSession s=request.getSession();
			User u2=(User)s.getAttribute("user");
			ModelAndView mv=new ModelAndView("shop");
			mv.addObject("products",ps);		
			return mv;
}
		
		
		}
