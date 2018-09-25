package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TFenshuDAO;
import com.dao.TJiaoyuanDAO;
import com.dao.TTimuDAO;
import com.dao.TTimuShitiDAO;
import com.model.TJiaoyuan;
import com.model.TStu;
import com.model.TTimu;
import com.model.TTimuShiti;
import com.opensymphony.xwork2.ActionSupport;

public class jiaoyuanAction extends ActionSupport
{
	private TJiaoyuanDAO jiaoyuanDAO;
	private TTimuDAO timuDAO;
	private TTimuShitiDAO timuShitiDAO;
	private TFenshuDAO fenshuDAO;
	private int shitiId;
	private int stuId;

	public TJiaoyuanDAO getJiaoyuanDAO()
	{
		return jiaoyuanDAO;
	}

	public int getShitiId()
	{
		return shitiId;
	}

	public TTimuDAO getTimuDAO()
	{
		return timuDAO;
	}

	public void setTimuDAO(TTimuDAO timuDAO)
	{
		this.timuDAO = timuDAO;
	}

	public TTimuShitiDAO getTimuShitiDAO()
	{
		return timuShitiDAO;
	}

	public void setTimuShitiDAO(TTimuShitiDAO timuShitiDAO)
	{
		this.timuShitiDAO = timuShitiDAO;
	}

	public TFenshuDAO getFenshuDAO()
	{
		return fenshuDAO;
	}

	public void setFenshuDAO(TFenshuDAO fenshuDAO)
	{
		this.fenshuDAO = fenshuDAO;
	}

	public void setShitiId(int shitiId)
	{
		this.shitiId = shitiId;
	}

	public int getStuId()
	{
		return stuId;
	}

	public void setStuId(int stuId)
	{
		this.stuId = stuId;
	}

	public void setJiaoyuanDAO(TJiaoyuanDAO jiaoyuanDAO)
	{
		this.jiaoyuanDAO = jiaoyuanDAO;
	}
	
	public String jiaoyuanAdd()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		Map session= ServletActionContext.getContext().getSession();
		TStu stu=(TStu)session.get("stu");
		
		String sql="from TTimuShiti where shitiId=?";
		Object con[]={shitiId};
		List timuShitiList=timuShitiDAO.getHibernateTemplate().find(sql,con);
		for(int i=0;i<timuShitiList.size();i++)
		{
			TJiaoyuan jiaoyuan=new TJiaoyuan();
			jiaoyuan.setStuId(stu.getStuId());
			
			TTimuShiti timuShiti=(TTimuShiti)timuShitiList.get(i);
			jiaoyuan.setTimuId(timuShiti.getTimuId());
			jiaoyuan.setShitiId(shitiId);
			
			String[] timu1Daan=request.getParameterValues(timuShiti.getTimuId().toString());
			if(timu1Daan.length==1)//danxuanti
			{
				jiaoyuan.setTimuDaan(timu1Daan[0]);
			}
			if(timu1Daan.length>1)//duoxuanti
			{
				String s="";
				for(int j=0;j<timu1Daan.length;j++)
				{
					s+=timu1Daan[j];
				}
				jiaoyuan.setTimuDaan(s);
			}
			jiaoyuanDAO.save(jiaoyuan);
		}
		
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String yuejuan()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		List timuList=new ArrayList();
		
		String sql="from TJiaoyuan where shitiId=? and stuId=?";
		Object con[]={shitiId,stuId};
		List jaoyuanList=jiaoyuanDAO.getHibernateTemplate().find(sql,con);
		for(int i=0;i<jaoyuanList.size();i++)
		{
			TJiaoyuan jiaoyuan=(TJiaoyuan)jaoyuanList.get(i);
			TTimu timu=timuDAO.findById(jiaoyuan.getTimuId());
			timu.setTimuDaanAsStu(jiaoyuan.getTimuDaan());
			timuList.add(timu);
		}
		
		if(timuList.size()==0)
		{
			request.put("msg", "该考生没有参加考试");
			return "msg";
		}
		
		String sql11111="from TFenshu where shitiId=? and stuId=?";
		Object con11111[]={shitiId,stuId};
		List list=fenshuDAO.getHibernateTemplate().find(sql11111,con11111);//是否已经阅卷。并且打分
		/*if(list.size()>0)
		{
			request.put("msg", "已经阅卷过。请重新选择");
			return "msg";
		}*/
		request.put("timuList", timuList);
		request.put("shitiId", shitiId);
		request.put("stuId", stuId);
		return ActionSupport.SUCCESS;
	}
	
	public String shijuanLook()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		List timuList=new ArrayList();
		
		String sql="from TJiaoyuan where shitiId=? and stuId=?";
		Object con[]={shitiId,stuId};
		List jaoyuanList=jiaoyuanDAO.getHibernateTemplate().find(sql,con);
		for(int i=0;i<jaoyuanList.size();i++)
		{
			TJiaoyuan jiaoyuan=(TJiaoyuan)jaoyuanList.get(i);
			TTimu timu=timuDAO.findById(jiaoyuan.getTimuId());
			timu.setTimuDaanAsStu(jiaoyuan.getTimuDaan());
			timuList.add(timu);
		}
		
		if(timuList.size()==0)
		{
			request.put("msg", "该考生没有参加考试");
			return "msg";
		}
		
		String sql11111="from TFenshu where shitiId=? and stuId=?";
		Object con11111[]={shitiId,stuId};
		List list=fenshuDAO.getHibernateTemplate().find(sql11111,con11111);//是否已经阅卷。并且打分
		request.put("timuList", timuList);
		request.put("shitiId", shitiId);
		request.put("stuId", stuId);
		return ActionSupport.SUCCESS;
	}

}
