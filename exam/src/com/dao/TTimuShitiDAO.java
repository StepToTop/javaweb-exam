package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TTimuShiti;

/**
 * Data access object (DAO) for domain model class TTimuShiti.
 * 
 * @see com.model.TTimuShiti
 * @author MyEclipse Persistence Tools
 */

public class TTimuShitiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TTimuShitiDAO.class);

	// property constants
	public static final String SHITI_ID = "shitiId";

	public static final String TIMU_ID = "timuId";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TTimuShiti transientInstance)
	{
		log.debug("saving TTimuShiti instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TTimuShiti persistentInstance)
	{
		log.debug("deleting TTimuShiti instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TTimuShiti findById(java.lang.Integer id)
	{
		log.debug("getting TTimuShiti instance with id: " + id);
		try
		{
			TTimuShiti instance = (TTimuShiti) getHibernateTemplate().get(
					"com.model.TTimuShiti", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TTimuShiti instance)
	{
		log.debug("finding TTimuShiti instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TTimuShiti instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TTimuShiti as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByShitiId(Object shitiId)
	{
		return findByProperty(SHITI_ID, shitiId);
	}

	public List findByTimuId(Object timuId)
	{
		return findByProperty(TIMU_ID, timuId);
	}

	public List findAll()
	{
		log.debug("finding all TTimuShiti instances");
		try
		{
			String queryString = "from TTimuShiti";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TTimuShiti merge(TTimuShiti detachedInstance)
	{
		log.debug("merging TTimuShiti instance");
		try
		{
			TTimuShiti result = (TTimuShiti) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TTimuShiti instance)
	{
		log.debug("attaching dirty TTimuShiti instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TTimuShiti instance)
	{
		log.debug("attaching clean TTimuShiti instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TTimuShitiDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TTimuShitiDAO) ctx.getBean("TTimuShitiDAO");
	}
}