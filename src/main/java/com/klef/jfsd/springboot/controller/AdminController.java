package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.xalan.lib.sql.ObjectArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.AppliedJobs;
import com.klef.jfsd.springboot.model.Recruiter;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("admin")
public class AdminController 
{

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/")
	public ModelAndView admin()
	{
		ModelAndView mv= new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		ModelAndView mv = new ModelAndView("redirect:/admin/adminlogin");
		return mv;
	}
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv= new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@GetMapping("sessionexpiry")
	public ModelAndView sessionexpiry()
	{
		ModelAndView mv = new ModelAndView("sessionexpiry");
		return mv;
	}
	
	@PostMapping("checklogin")
	@ResponseBody
	public ModelAndView checklogin(HttpServletRequest request)
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	
		Admin admin = adminService.checklogin(username, password);
		ModelAndView mv = new ModelAndView();
		
		if(admin != null)
		{
		
			HttpSession session = request.getSession(false);
			session.setAttribute("admin", admin);
			
			mv.setViewName("redirect:/admin/dashboard");
		
		}
		
		else
		{
			mv.setViewName("adminlogin");
			mv.addObject("message","Login Failed");
			
			
		}
		return mv;
		
		
	}
	
	@GetMapping("unauth")
	public ModelAndView unauth()
	{
		ModelAndView mv = new ModelAndView("unauth");
		return mv;
	}
	
	 @GetMapping("addstudent")
	    public ModelAndView addStudentForm() {
	        ModelAndView mv = new ModelAndView("addstudent");
	        return mv;
	    }
	
	   @PostMapping("addstudentrecord")
	   public ModelAndView addstudentrecord(HttpServletRequest request) {
	       long id = Long.parseLong(request.getParameter("id"));
	       String name = request.getParameter("name");
	       String dob = request.getParameter("dob"); 
	       String gender = request.getParameter("gender");
	       String password = request.getParameter("password");
	       String address = request.getParameter("address"); 
	       String email = request.getParameter("email");
	       String contact = request.getParameter("contact");

	       Student student = new Student();
	       student.setId(id);
	       student.setName(name);
	       student.setDob(dob);
	       student.setGender(gender);
	       student.setPassword(password);
	       student.setAddress(address);
	       student.setEmail(email);
	       student.setContact(contact);
	       student.setStatus("Registered");

	       String msg = adminService.addStudent(student);

	       ModelAndView mv = new ModelAndView("addstudent");
	       mv.addObject("message", msg);
	       return mv;
	   }
	   
	   

	
	   @GetMapping("/viewstudents")
	   public ModelAndView viewstudents() {
	       ModelAndView mv = new ModelAndView();
	       List<Student> studentList = adminService.viewstudents();

	       mv.setViewName("viewstudents");
	       mv.addObject("studentlist", studentList);
	       
	       long count = adminService.studentcount();
	       mv.addObject("studentcount",count);
	       
	       return mv;
	   }
	   
	   @GetMapping("/dashboard")
	   public ModelAndView dashboard(HttpServletRequest request,HttpServletResponse response) throws IOException {
		   HttpSession session = request.getSession();
		   Admin admin = (Admin) session.getAttribute("admin");

			if(admin==null)
			{
				response.sendRedirect("/admin/sessionexpiry");
			}
	       ModelAndView mv = new ModelAndView("dashboard");
	       long rcnt = adminService.getrecruitercount();
	       long studentCount = adminService.studentcount();
	       long jcnt = adminService.jobpostingscount();
	       mv.addObject("studentcount",studentCount);
	       mv.addObject("rcnt", rcnt);
	       mv.addObject("jcnt", jcnt);
	       return mv;
	   }
	   
	   
	   @GetMapping("getpendingrecruiters")
	   public ModelAndView getpendingrecruiters(HttpServletRequest request)
	   {
		   HttpSession  session = request.getSession();
		   Admin admin = (Admin) session.getAttribute("admin");
		   if(admin==null)
		   {
			   ModelAndView mv = new ModelAndView("redirect:/admin/sessionexpiry");
			   return mv;
		   }
		   List<Recruiter> rlist = adminService.getallrecruiters();
		   ModelAndView mv = new ModelAndView("viewpendingrecruiters");
		   mv.addObject("rlist", rlist);
		   
		   return mv;
		   
	   }
	   
	   @GetMapping("setstatus/{id}/{status}")
		public ModelAndView setrecruiterstatus(@PathVariable("id")int id, @PathVariable("status")String status)
		{
			String msg = adminService.updaterecruiterstatus(id, status);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/admin/getpendingrecruiters");		
			return mv;
		}
	   
	   
	   @GetMapping("getallrecruiters")
	   public ModelAndView getallrecruiters(HttpServletRequest request, HttpServletResponse response)
	   {
		   HttpSession  session = request.getSession();
		   Admin admin = (Admin) session.getAttribute("admin");
		   if(admin==null)
		   {
			   ModelAndView mv = new ModelAndView("redirect:/admin/sessionexpiry");
			   return mv;
		   }
		   
		   List<Recruiter> rlist =  adminService.getallrecruiters();
		   ModelAndView mv = new ModelAndView("viewallrecruiters");
		   mv.addObject("rlist", rlist);		   
		   return mv;
	   }
	   
	   
	   @GetMapping("setstatustoblocked/{id}/{status}")
		public ModelAndView setrecruiterstatustoblocked(@PathVariable("id")int id, @PathVariable("status")String status)
		{
			String msg = adminService.updaterecruiterstatus(id, status);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/admin/getallrecruiters");		
			return mv;
		}
	   
	   @GetMapping("setstudentstatus/{id}/{status}")
		public ModelAndView setstudentstatus(@PathVariable("id")long id, @PathVariable("status")String status)
		{
			String msg = adminService.updatestudentstatus(id, status);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/admin/viewstudents");		
			return mv;
		}
	   
	   @GetMapping("/applications-per-job")
	   public ResponseEntity<List<Object[]>> getApplicationsPerJob() {
	       return ResponseEntity.ok(adminService.getApplicationsPerJob());
	   }


	    @GetMapping("/applications-by-status")
	    public ResponseEntity<List<Object[]>> getApplicationsByStatus() {
	        return ResponseEntity.ok(adminService.getApplicationsByStatus());
	    }

	    @GetMapping("/jobs-by-type")
	    public ResponseEntity<List<Object[]>> getJobsByType() {
	        return ResponseEntity.ok(adminService.getJobsByType());
	    }

	    @GetMapping("/recruiters-by-company")
	    public ResponseEntity<List<Object[]>> getRecruitersByCompany() {
	        return ResponseEntity.ok(adminService.getRecruitersByCompany());
	    }

	    @GetMapping("/students-by-gender")
	    public ResponseEntity<List<Object[]>> getStudentsByGender() {
	        return ResponseEntity.ok(adminService.getStudentsByGender());
	    }
	    
	    
	    @GetMapping("jobpostings")
	    public ModelAndView getJobCountByCompany() 
	    {
	        List<Object[]> jlist =  adminService.getJobCountByCompany();
	        ModelAndView mv = new ModelAndView("jobpostings");
	        mv.addObject("jlist", jlist);
	        return mv;
	    }
	    
	    @GetMapping("getstudentjobs")
	    public ModelAndView getstudentjobs(HttpServletRequest request)
	    {
	    	
	    	
	    	ModelAndView mv = new ModelAndView("studentjobs");
	    	
	    	return mv;
	    }
	    
	    
	    @PostMapping("getjobs")
	    public ModelAndView getjobs(HttpServletRequest request)
	    {
	    	List<AppliedJobs> jobs = adminService.findalljobsapplied(Long.parseLong(request.getParameter("sid")));
	    	
	    	AppliedJobs job = null;
    	    if (!jobs.isEmpty()) {
    	        job = jobs.get(0); 
    	    }
	    	
	    	ModelAndView mv = new ModelAndView("studentjobs");
	    	mv.addObject("jobs",jobs);
	    	mv.addObject("job",job);
	    	return mv;
	    }

	   
	 
	
	
	
}
