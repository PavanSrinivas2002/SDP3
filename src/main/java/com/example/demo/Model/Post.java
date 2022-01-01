package com.example.demo.Model;

import java.beans.Transient;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.annotation.CreatedDate;

import com.example.demo.controller.UserController;

@Entity
@Table
public class Post {
  @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long id;

    public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public Manager getManager() {
    return manager;
  }

  public void setManager(Manager manager) {
    this.manager = manager;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public String getPhotos() {
    return photos;
  }

  public void setPhotos(String photos) {
    this.photos = photos;
  }

  @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
  public Manager manager;
    @Column(columnDefinition="TEXT")
    public String content;

    @CreatedDate
    @Temporal(TemporalType.DATE)
    @Column
    private Date createdDate = new java.sql.Date(new java.util.Date().getTime());

    
    @Column(nullable = true, length = 64)
    public String photos;
    
    @Column
    public long likes;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
    public Product product;
    public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public long getLikes() {
    return likes;
  }

  public void setLikes(long likes) {
    this.likes = likes;
  }

  @Transient
    public String getPhotosImagePath() {
        if (photos == null || id ==0) return null;
         
        return "../user-photos/" + id + "/" + photos;
    }
  public boolean isliked;
  public boolean isIsliked() {
    return isliked;
  }

  public void setIsliked(boolean isliked) {
    this.isliked = isliked;
  }

  public boolean getLiked(long id)
  {
    System.out.println(id);
    return true;
  }
}