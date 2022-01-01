/*package com.example.demo.Model;

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
@Entity
@Table
public class Order {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long id;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
	public User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
	public Product product;
	
	@Column
	public int quantity;

	@Column
	public float cost;
	
	@Column
	public String address;
	
	@Column
	public String paymethod;
	
	@CreatedDate
    @Temporal(TemporalType.DATE)
    @Column
    private Date orderDate = new java.sql.Date(new java.util.Date().getTime());

}
*/