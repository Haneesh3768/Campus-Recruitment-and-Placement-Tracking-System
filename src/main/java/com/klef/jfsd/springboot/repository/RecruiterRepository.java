package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.Recruiter;

public interface RecruiterRepository extends JpaRepository<Recruiter, Integer>
{
		@Query("select r from Recruiter r where r.status='PENDING'")
		public List<Recruiter> getpendingrecruiters();
		
		@Query("select count(r) from Recruiter r")
		public long getrecruitercount();
		
		
		
		@Query("SELECT r.company, COUNT(r) FROM Recruiter r GROUP BY r.company")
	    List<Object[]> countRecruitersByCompany();

	    @Query("SELECT r.status, COUNT(r) FROM Recruiter r GROUP BY r.status")
	    List<Object[]> countRecruitersByStatus();
}
