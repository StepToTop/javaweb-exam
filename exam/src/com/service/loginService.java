package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.TAdminDAO;
import com.dao.TKechengDAO;
import com.dao.TShitiDAO;
import com.dao.TStuDAO;
import com.dao.TTeaDAO;
import com.dao.TTimuShitiDAO;
import com.model.TAdmin;
import com.model.TStu;
import com.model.TTea;
import com.model.TTimuShiti;

public class loginService
{
	private TAdminDAO adminDAO;
	private TStuDAO stuDAO;
	private TTeaDAO teaDAO;
	private TKechengDAO kechengDAO;
	private TTimuShitiDAO timuShitiDAO;
	private TShitiDAO shitiDAO;
	
	public TKechengDAO getKechengDAO()
	{
		return kechengDAO;
	}
	public void setKechengDAO(TKechengDAO kechengDAO)
	{
		this.kechengDAO = kechengDAO;
	}
	public TAdminDAO getAdminDAO()
	{
		return adminDAO;
	}
	public TShitiDAO getShitiDAO()
	{
		return shitiDAO;
	}
	public void setShitiDAO(TShitiDAO shitiDAO)
	{
		this.shitiDAO = shitiDAO;
	}
	public void setAdminDAO(TAdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}
	public TStuDAO getStuDAO()
	{
		return stuDAO;
	}
	public void setStuDAO(TStuDAO stuDAO)
	{
		this.stuDAO = stuDAO;
	}
	public TTeaDAO getTeaDAO()
	{
		return teaDAO;
	}
	public void setTeaDAO(TTeaDAO teaDAO)
	{
		this.teaDAO = teaDAO;
	}
	public TTimuShitiDAO getTimuShitiDAO()
	{
		return timuShitiDAO;
	}
	public void setTimuShitiDAO(TTimuShitiDAO timuShitiDAO)
	{
		this.timuShitiDAO = timuShitiDAO;
	}
	
	
	
	public String login(String userName,String userPw,int userType)
	{
		System.out.println("userType"+userType);
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		
		if(userType==0)//系统管理员登陆
		{
			String sql="from TAdmin where userName=? and userPw=?";
			Object[] con={userName,userPw};
			List adminList=adminDAO.getHibernateTemplate().find(sql,con);
			if(adminList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TAdmin admin=(TAdmin)adminList.get(0);
				 session.setAttribute("userType", 0);
	             session.setAttribute("admin", admin);
	             result="yes";
			}
		}
		if(userType==1)//老师登录
		{
			String sql="from TTea where loginName=? and loginPw=?";
			Object[] con={userName,userPw};
			List teaList=teaDAO.getHibernateTemplate().find(sql,con);
			if(teaList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TTea tea=(TTea)teaList.get(0);
				 session.setAttribute("userType", 1);
	             session.setAttribute("tea", tea);
	             result="yes";
			}
			
		}
		if(userType==2)//学生登录
		{
			String sql="from TStu where stuXuehao=?  and loginPw=?";
			Object[] con={userName,userPw};
			List adminList=adminDAO.getHibernateTemplate().find(sql,con);
			if(adminList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TStu stu=(TStu)adminList.get(0);
				 
				 session.setAttribute("userType", 2);
	             session.setAttribute("stu", stu);
	             result="yes";
			}
		}
		return result;
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		String userType=session.getAttribute("userType").toString();
		if("0".equals(userType)){
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		admin.setUserPw(userPwNew);
		adminDAO.getHibernateTemplate().update(admin);
		session.setAttribute("admin", admin);
		}else if("1".equals(userType))
		{
			TTea tea=(TTea)session.getAttribute("tea");
			tea.setLoginPw(userPwNew);
			teaDAO.getHibernateTemplate().update(tea);
			session.setAttribute("tea", tea);
		}
		else//学生
		{
			TStu stu=(TStu)session.getAttribute("stu");
			stu.setLoginPw(userPwNew);
			stuDAO.getHibernateTemplate().update(stu);
			session.setAttribute("stu", stu);
		}
		
		return "yes";
    }
    
    
    public List kechengSelect()
    {
    	try 
		{
			Thread.sleep(100);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String sql="from TKecheng where del='no'";
		List kechengList=kechengDAO.getHibernateTemplate().find(sql);
		return kechengList;
    }
    
    
    
    public List stuSelect()
    {
    	List stuList=stuDAO.getHibernateTemplate().find("from TStu where del='no'");
		return stuList;
    }
    
    public String timuAddShiti(int timuId,int shitiId)
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		String sql="from TTimuShiti where shitiId=? and timuId=?";
		Object con[]={shitiId,timuId};
		List list=timuShitiDAO.getHibernateTemplate().find(sql,con);
		if(list.size()==0)
		{
			TTimuShiti timuShiti=new TTimuShiti();
			timuShiti.setShitiId(shitiId);
			timuShiti.setTimuId(timuId);
			timuShitiDAO.save(timuShiti);
			result="yes";
		}
		if(list.size()>0)
		{
			result="no";
		}
		return result;
    }
    
    
    public String timuDelShiti(int timuId,int shitiId)
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		String sql="delete from TTimuShiti where shitiId=? and timuId=?";
		Object con[]={shitiId,timuId};
		int i=timuShitiDAO.getHibernateTemplate().bulkUpdate(sql,con);
		if(i==1)
		{
			result="yes";
		}
		if(i!=1)
		{
			result="no";
		}
		return result;
    }
    
    public List shitiSelect()
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		return shitiList;
    }
}
