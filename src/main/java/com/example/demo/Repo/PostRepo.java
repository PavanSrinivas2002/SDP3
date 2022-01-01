package com.example.demo.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Manager;
import com.example.demo.Model.Post;
@Component
@Repository
public interface PostRepo extends JpaRepository<Post,Long> {

    List<Post> findPostByManagerOrderById(Manager manager);

    List<Post> findAllByOrderByIdDesc();
    Post findById(long id);
}