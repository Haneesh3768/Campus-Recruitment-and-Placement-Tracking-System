package com.klef.jfsd.springboot.service;

import java.util.List;


import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.AppliedJobs;
import com.klef.jfsd.springboot.model.Recruiter;
import com.klef.jfsd.springboot.model.Student;


public interface AdminService 
{

	public Admin checklogin(String username, String password);
	public List<Student> viewstudents();
	public String addStudent(Student student);
	
	public String updatestudentstatus(long id,String status);
	
	public List<Recruiter> getpendingrecruiters();
	public Recruiter getrecruiterbyid(int id);
	public String updaterecruiterstatus(int id,String status);
	public List<Recruiter> getallrecruiters();
	public List<Object[]> getJobCountByCompany(); 
	
	
	public List<AppliedJobs> findalljobsapplied(long sid);
	 
	
	//dashboard
	public long studentcount();
	public long getrecruitercount();
	public long jobpostingscount();
	
	public long jobpostingschartcount() ;
	public List<Object[]> getApplicationsPerJob() ;
    public List<Object[]> getApplicationsByStatus() ;
    public List<Object[]> getJobsByType() ;
    public List<Object[]> getStudentsByGender();
    public List<Object[]> getRecruitersByCompany() ;	
	

}
