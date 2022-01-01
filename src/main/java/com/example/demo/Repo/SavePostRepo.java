package com.example.demo.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Post;
import com.example.demo.Model.SavePost;
import com.example.demo.Model.User;

@Component
@Repository
public interface SavePostRepo extends JpaRepository<SavePost,User> {

    List<SavePost> findByUser(User user);
    SavePost findByUserAndPost(User user,Post post);
}