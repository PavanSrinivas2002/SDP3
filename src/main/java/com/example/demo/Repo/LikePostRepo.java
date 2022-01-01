package com.example.demo.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.LikePost;
import com.example.demo.Model.Manager;
import com.example.demo.Model.Post;
import com.example.demo.Model.User;

@Component
@Repository
public interface LikePostRepo extends JpaRepository<LikePost,User> {

    LikePost findByUserAndPost(User user,Post post);
}