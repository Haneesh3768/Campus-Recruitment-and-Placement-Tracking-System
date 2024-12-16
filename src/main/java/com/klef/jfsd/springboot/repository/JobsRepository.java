package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.AppliedJobs;
import com.klef.jfsd.springboot.model.Jobs;

import jakarta.transaction.Transactional;

@Repository
public interface JobsRepository extends JpaRepository<Jobs, Integer> {

	@Query("select j from Jobs j where j.id=?1")
    public Jobs findjobbyid(int id);
	
	@Query("select ap from AppliedJobs ap where ap.student.id=?1 and ap.status=?2")
	public  List<AppliedJobs> getapplicationsbystatus(long sid,String status);

    @Modifying
    @Transactional
    @Query("delete from Jobs j where j.email = ?1")
    public int deletejobByEmail(String jemail);
    
    @Query("select j from Jobs j where j.recruiterid=?1")
    public List<Jobs> findjobsbyrecruiterid(int rid);
    
    @Query("select count(j) from Jobs j where j.recruiterid=?1 and j.status!='Blocked'")
    public long findjobspostedbyrecruiter(int rid);
    
    @Query("select count(j) from Jobs j where j.recruiterid=?1 and j.status=?2")
    public long jobscount(int rid,String status);
    
    @Query("select count(j) from Jobs j where j.status!='Blocked'")
    public long jobpostingscount();
    
    
    
    @Query("SELECT j.type, COUNT(j) FROM Jobs j GROUP BY j.type")
    List<Object[]> countJobsByType();

    @Query("SELECT j.company, COUNT(j) FROM Jobs j GROUP BY j.company")
    List<Object[]> countJobsByCompany();

    @Query("SELECT AVG(j.salary), MAX(j.salary) FROM Jobs j")
    Object[] getSalaryStats();
    
    @Query("SELECT j.company, COUNT(j) FROM Jobs j GROUP BY j.company")
    List<Object[]> findJobCountByCompany();
    
}
