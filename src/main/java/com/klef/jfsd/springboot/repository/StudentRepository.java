package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{
	@Query("select s from Student s where s.id=?1")
	public Student getstudentbyid(long id);
	
	
	@Query("SELECT s.gender, COUNT(s) FROM Student s GROUP BY s.gender")
    public List<Object[]> countStudentsByGender();

    @Query("SELECT s.address, COUNT(s) FROM Student s GROUP BY s.address")
    public List<Object[]> countStudentsByAddress();
}
