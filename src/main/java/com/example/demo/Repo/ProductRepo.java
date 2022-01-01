package com.example.demo.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Manager;
import com.example.demo.Model.Product;


@Repository
public interface ProductRepo extends JpaRepository<Product,String> {
	List<Product> findByPname(String product);
	Product findByPid(int pid);
	List<Product> findByManager(Manager mn);

}
