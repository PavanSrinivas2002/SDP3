package com.example.demo.Model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class LikePost {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long id;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
	public User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
	public Post post;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
