package com.klef.jfsd.springboot.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.AppliedJobs;
import com.klef.jfsd.springboot.model.Recruiter;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.AppliedJobsRepository;
import com.klef.jfsd.springboot.repository.JobsRepository;
import com.klef.jfsd.springboot.repository.RecruiterRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{

	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private RecruiterRepository recruiterRepository;
	
	@Autowired
	private JobsRepository jobsRepository;
	
	@Autowired
	private AppliedJobsRepository appliedJobsRepository;


	@Override
	public Admin checklogin(String username, String password) {
		return adminRepository.checklogin(username, password);
	}

	
	 @Override
	    public String addStudent(Student student) {
	        studentRepository.save(student);
	        return "Student Added Successfully";
	    }
	 
	 
	@Override
	public List<Student> viewstudents() {
		return studentRepository.findAll();
	}
	
	@Override
	public List<AppliedJobs> findalljobsapplied(long sid) {
		return appliedJobsRepository.findallappliedjobs(sid);
	}


		@Override
		public long studentcount() {
			
			return studentRepository.count();
		}


		@Override
		public List<Recruiter> getpendingrecruiters() 
		{
			return recruiterRepository.getpendingrecruiters();
		}


		@Override
		public Recruiter getrecruiterbyid(int rid) 
		{
			return recruiterRepository.findById(rid).get();
		}


		@Override
		public String updaterecruiterstatus(int id, String status) 
		{
			Recruiter r = recruiterRepository.findById(id).get();
			r.setStatus(status);
			
			recruiterRepository.save(r);
			
			return "Recruiter Status updated successfully";
		}


		@Override
		public List<Recruiter> getallrecruiters() 
		{
			return recruiterRepository.findAll();
		}
		
		public Student viewstudentbyid(long id)
		{
			return studentRepository.getstudentbyid(id);
		}


		@Override
		public String updatestudentstatus(long id, String status) 
		{
			Student s = studentRepository.getstudentbyid(id);
			s.setStatus(status);
			
			studentRepository.save(s);
			
			return "Status updated Successfully";
		}


		@Override
		public long getrecruitercount() 
		{
			return recruiterRepository.getrecruitercount();
		}


		@Override
		public long jobpostingschartcount() 
		{
			return jobsRepository.jobpostingscount();
		}
		
		public List<Object[]> getApplicationsPerJob() {
		    return appliedJobsRepository.countApplicationsPerJob();
		}



	    public List<Object[]> getApplicationsByStatus() {
	        return appliedJobsRepository.countApplicationsByStatus();
	    }

	    public List<Object[]> getJobsByType() {
	        return jobsRepository.countJobsByType();
	    }

	    public List<Object[]> getRecruitersByCompany() {
	        return recruiterRepository.countRecruitersByCompany();
	    }

	    public List<Object[]> getStudentsByGender() {
	        return studentRepository.countStudentsByGender();
	    }


		@Override
		public long jobpostingscount() 
		{
			return jobsRepository.jobpostingscount();
		}
		
		
		public List<Object[]> getJobCountByCompany() {
	        return jobsRepository.findJobCountByCompany();
	    }


	
	


	

	

}
