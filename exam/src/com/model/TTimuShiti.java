package com.model;

/**
 * TTimuShiti generated by MyEclipse Persistence Tools
 */

public class TTimuShiti implements java.io.Serializable
{

	// Fields

	private Integer id;

	private Integer shitiId;

	private Integer timuId;

	// Constructors

	/** default constructor */
	public TTimuShiti()
	{
	}

	/** full constructor */
	public TTimuShiti(Integer shitiId, Integer timuId)
	{
		this.shitiId = shitiId;
		this.timuId = timuId;
	}

	// Property accessors

	public Integer getId()
	{
		return this.id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getShitiId()
	{
		return this.shitiId;
	}

	public void setShitiId(Integer shitiId)
	{
		this.shitiId = shitiId;
	}

	public Integer getTimuId()
	{
		return this.timuId;
	}

	public void setTimuId(Integer timuId)
	{
		this.timuId = timuId;
	}

}