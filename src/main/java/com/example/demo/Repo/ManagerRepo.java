package com.example.demo.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Manager;
import com.example.demo.Model.User;

@Repository
public interface ManagerRepo extends JpaRepository<Manager,String> {
	Manager findByUsername(String username);

}
