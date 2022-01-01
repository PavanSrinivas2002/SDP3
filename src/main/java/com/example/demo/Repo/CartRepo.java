package com.example.demo.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Cart;
import com.example.demo.Model.Product;
import com.example.demo.Model.User;

@Component
@Repository
public interface CartRepo extends JpaRepository<Cart,Long> {
Cart findById(long id);
Cart findByUserAndProduct(User u,Product p);
List<Cart> findByUser(User user);
}