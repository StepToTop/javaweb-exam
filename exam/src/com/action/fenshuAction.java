package com.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.TFenshuDAO;
import com.dao.TShitiDAO;
import com.dao.TStuDAO;
import com.model.Fuzhu;
import com.model.TFenshu;
import com.model.TStu;
import com.model.TTea;
import com.opensymphony.xwork2.ActionSupport;

public class fenshuAction extends ActionSupport
{
	private int fenshu;
	private int shitiId;
	private int stuId;
	private String message;
	private String path;
	private TFenshuDAO fenshuDAO;
	private TStuDAO stuDAO;
	private TShitiDAO shitiDAO;
	
	
	public String fenshuAdd()
	{
			TFenshu fenshu1=new TFenshu();
			fenshu1.setFenshu(fenshu);
			fenshu1.setShitiId(shitiId);
			fenshu1.setStuId(stuId);
			
			/* WebContext ctx = WebContextFactory.get(); 
			 HttpSession session=ctx.getSession(); 
			 TTea teacher=(TTea) session.getAttribute("tea");
			
			fenshu1.setTeaId(teacher.getTeaId());*/
			Map request=(Map)ServletActionContext.getContext().get("request");
			Map session= ServletActionContext.getContext().getSession();
			TTea stu=(TTea)session.get("tea");
			fenshu1.setYuejuanDate(new Timestamp(new Date().getTime()));
			fenshuDAO.save(fenshu1);
			this.setMessage("操作成功");
			this.setPath("stuAll.action");
			return "succeed";
		
	}
	
	
	public String fenshuMana()
	{
		String sql="from TFenshu where shitiId=? order by fenshu desc";
		Object[] cc={shitiId};
		List fenshuList=fenshuDAO.getHibernateTemplate().find(sql,cc);
		for(int i=0;i<fenshuList.size();i++)
		{
			TFenshu fenshu=(TFenshu)fenshuList.get(i);
			fenshu.setStuRealName(stuDAO.findById(fenshu.getStuId()).getStuRealname());
			fenshu.setShitiName(shitiDAO.findById(fenshu.getShitiId()).getShitiName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("fenshuList", fenshuList);
		
		String sql1="select avg(fenshu) from TFenshu where shitiId=?";//统计改试卷的平均分数
		Object[] cc1={shitiId};
		List fenshuList1=fenshuDAO.getHibernateTemplate().find(sql1,cc1);
		System.out.println(fenshuList1.size()+"^^");
		for(int i=0;i<fenshuList1.size();i++)
		{
			fenshuList1.get(i);
			try
			{
				request.put("pingjunpen",fenshuList1.get(i));
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String shitinanyidu()//根据平均分排名
	{
		List fuzhuList=new ArrayList();
		
		String sql1="select avg(fenshu),shitiId from TFenshu group by shitiId order by avg(fenshu)";//统计改试卷的平均分数
		List fenshuList1=fenshuDAO.getHibernateTemplate().find(sql1);
		for(int i=0;i<fenshuList1.size();i++)
		{
			Object[] o=(Object[])fenshuList1.get(i);
			System.out.println(o[0]+"^^^"+o[1]);
			
			Fuzhu fuzhu=new Fuzhu();
			fuzhu.setPingjunfen(o[0].toString());
			fuzhu.setShiti(shitiDAO.findById(Integer.parseInt(o[1].toString())));
			fuzhuList.add(fuzhu);
		}
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("fuzhuList",fuzhuList);
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String fenshuByMe()
	{
		Map session= ServletActionContext.getContext().getSession();
		TStu stu=(TStu)session.get("stu");
		String sql="from TFenshu where stuId=?";
		Object[] cc={stu.getStuId()};
		List fenshuList=fenshuDAO.getHibernateTemplate().find(sql,cc);
		for(int i=0;i<fenshuList.size();i++)
		{
			TFenshu fenshu=(TFenshu)fenshuList.get(i);
			fenshu.setShitiName(shitiDAO.findById(fenshu.getShitiId()).getShitiName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("fenshuList", fenshuList);
		return ActionSupport.SUCCESS;
	}
	
	
	public int getFenshu()
	{
		return fenshu;
	}
	public void setFenshu(int fenshu)
	{
		this.fenshu = fenshu;
	}
	
	public TShitiDAO getShitiDAO()
	{
		return shitiDAO;
	}


	public void setShitiDAO(TShitiDAO shitiDAO)
	{
		this.shitiDAO = shitiDAO;
	}


	public TFenshuDAO getFenshuDAO()
	{
		return fenshuDAO;
	}
	public void setFenshuDAO(TFenshuDAO fenshuDAO)
	{
		this.fenshuDAO = fenshuDAO;
	}
	
	public TStuDAO getStuDAO()
	{
		return stuDAO;
	}


	public void setStuDAO(TStuDAO stuDAO)
	{
		this.stuDAO = stuDAO;
	}


	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public int getShitiId()
	{
		return shitiId;
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
	
}
