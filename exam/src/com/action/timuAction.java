package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TJiaoyuanDAO;
import com.dao.TTimuDAO;
import com.dao.TTimuShitiDAO;
import com.model.TStu;
import com.model.TTimu;
import com.model.TTimuShiti;
import com.opensymphony.xwork2.ActionSupport;

public class timuAction extends ActionSupport
{
	private int timuId;
	private String timuName;
	private String timuXuanxianga;
	private String timuXuanxiangb;
	private String timuXuanxiangc;
	private String timuXuanxiangd;
	private String timuDaan;
	private int timuFenshu;
	private String timuLeixing;
	private int kechengId;
	private Integer timuNandu;
	
	private String message;
	private String path;
	
	private TTimuDAO timuDAO;
	private TTimuShitiDAO timuShitiDAO;
	private TJiaoyuanDAO jiaoyuanDAO;
	
	private int shitiId;
	
	public String timu_danxuan_EditPre()
	{
		TTimu timu=timuDAO.findById(timuId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timu", timu);
		return ActionSupport.SUCCESS;
	}
	
	public String timu_danxuan_Edit()
	{
		TTimu timu=timuDAO.findById(timuId);
		timu.setTimuName(timuName);
		timu.setTimuXuanxianga(timuXuanxianga);
		timu.setTimuXuanxiangb(timuXuanxiangb);
		timu.setTimuXuanxiangc(timuXuanxiangc);
		timu.setTimuXuanxiangd(timuXuanxiangd);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
//		timu.setTimuLeixing(timuLeixing);
//		timu.setKechengId(kechengId);
		timu.setTimuNandu(timuNandu);		
		timuDAO.attachDirty(timu);
		this.setMessage("更新成功");
		this.setPath("timuByKecheng.action?kechengId="+timu.getKechengId());
		return "succeed";
	}
	
	public String timu_danxuan_Add()
	{
		TTimu timu=new TTimu();
		timu.setTimuName(timuName);
		timu.setTimuXuanxianga(timuXuanxianga);
		timu.setTimuXuanxiangb(timuXuanxiangb);
		timu.setTimuXuanxiangc(timuXuanxiangc);
		timu.setTimuXuanxiangd(timuXuanxiangd);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
		timu.setTimuLeixing(timuLeixing);
		timu.setKechengId(kechengId);
		timu.setTimuNandu(timuNandu);		
		
		
		
		timu.setDel("no");
		timuDAO.save(timu);
		this.setMessage("操作成功");
		this.setPath("admin/timu/timuLeixing.jsp");
		return "succeed";
	}
	
	public String timu_duoxuan_EditPre()
	{
		TTimu timu=timuDAO.findById(timuId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timu", timu);
		return ActionSupport.SUCCESS;
	}
	
	public String timu_duoxuan_Edit()
	{
		TTimu timu=timuDAO.findById(timuId);
		timu.setTimuName(timuName);
		timu.setTimuXuanxianga(timuXuanxianga);
		timu.setTimuXuanxiangb(timuXuanxiangb);
		timu.setTimuXuanxiangc(timuXuanxiangc);
		timu.setTimuXuanxiangd(timuXuanxiangd);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
//		timu.setTimuLeixing(timuLeixing);
//		timu.setKechengId(kechengId);
		timu.setTimuNandu(timuNandu);		
		timuDAO.attachDirty(timu);
		this.setMessage("更新成功");
		this.setPath("timuByKecheng.action?kechengId="+timu.getKechengId());
		return "succeed";
	}
	
	public String timu_duoxuan_Add()
	{
		TTimu timu=new TTimu();
		timu.setTimuName(timuName);
		timu.setTimuXuanxianga(timuXuanxianga);
		timu.setTimuXuanxiangb(timuXuanxiangb);
		timu.setTimuXuanxiangc(timuXuanxiangc);
		timu.setTimuXuanxiangd(timuXuanxiangd);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
		timu.setTimuLeixing(timuLeixing);
		timu.setKechengId(kechengId);
		timu.setTimuNandu(timuNandu);		
		
		
		timu.setDel("no");
		timuDAO.save(timu);
		this.setMessage("操作成功");
		this.setPath("admin/timu/timuLeixing.jsp");
		return "succeed";
	}
	public String timu_panduan_Add()
	{
		TTimu timu=new TTimu();
		timu.setTimuName(timuName);
		timu.setTimuXuanxianga(timuXuanxianga);
		timu.setTimuXuanxiangb(timuXuanxiangb);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
		timu.setTimuLeixing(timuLeixing);
		timu.setKechengId(kechengId);
		timu.setTimuNandu(timuNandu);		
		
		timu.setDel("no");
		timuDAO.save(timu);
		this.setMessage("操作成功");
		this.setPath("admin/timu/timuLeixing.jsp");
		return "succeed";
	}
	
	public String timu_jianda_EditPre()
	{
		TTimu timu=timuDAO.findById(timuId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timu", timu);
		return ActionSupport.SUCCESS;
	}
	
	public String timu_chengxusheji_EditPre()
	{
		TTimu timu=timuDAO.findById(timuId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timu", timu);
		return ActionSupport.SUCCESS;
	}
	
	public String timu_jianda_Edit()
	{
		TTimu timu=timuDAO.findById(timuId);
		timu.setTimuName(timuName);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
//		timu.setTimuLeixing(timuLeixing);
//		timu.setKechengId(kechengId);
		timu.setTimuNandu(timuNandu);	
		timuDAO.attachDirty(timu);
		this.setMessage("更新成功");
		this.setPath("timuByKecheng.action?kechengId="+timu.getKechengId());
		return "succeed";
	}
	
	//简单、程序设计题新增方法
	public String timu_jianda_Add()
	{
		TTimu timu=new TTimu();
		timu.setTimuName(timuName);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
		timu.setTimuLeixing(timuLeixing);
		timu.setKechengId(kechengId);
		timu.setTimuNandu(timuNandu);		
		
		timu.setDel("no");
		timuDAO.save(timu);
		this.setMessage("操作成功");
		this.setPath("admin/timu/timuLeixing.jsp");
		return "succeed";
	}
	
	
	
	public String timuDel()
	{
		TTimu timu=timuDAO.findById(timuId);
		timu.setDel("yes");
		timuDAO.attachDirty(timu);
		this.setMessage("操作成功");
		System.out.println(timu.getKechengId()+"&&&");
		this.setPath("timuByKecheng.action?kechengId="+timu.getKechengId());
		return "succeed";
	}

	public String timuByKecheng()
	{
		String sql="from TTimu where del='no' and kechengId="+kechengId+" order by timuLeixing";
		List timuList=timuDAO.getHibernateTemplate().find(sql);
//		List timuList=timuDAO.findBySqlPage(sql,pageSize, pageNow);
//		this.setPageTotle(timuDAO.getSqlPageTotle());
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timuList", timuList);
		return ActionSupport.SUCCESS;
	}
	
	public String timuByKecheng1()
	{
		String sql="from TTimu where del='no' and kechengId="+kechengId+" order by timuLeixing";
		List timuList=timuDAO.getHibernateTemplate().find(sql);
//		List timuList=timuDAO.findBySqlPage(sql,pageSize, pageNow);
//		this.setPageTotle(timuDAO.getSqlPageTotle());
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timuList", timuList);
		request.put("shitiId", shitiId);
		return ActionSupport.SUCCESS;
	}
	
	public String timuByShiti()
	{
		List timuList=new ArrayList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		String sql="from TTimuShiti where shitiId=?";
		Object con[]={shitiId};
		List timuShitiList=timuShitiDAO.getHibernateTemplate().find(sql,con);
		for(int i=0;i<timuShitiList.size();i++)
		{
			TTimuShiti timuShiti=(TTimuShiti)timuShitiList.get(i);
			TTimu timu=timuDAO.findById(timuShiti.getTimuId());
			timuList.add(timu);
		}
		request.put("timuList", timuList);
		request.put("shitiId", shitiId);
		return ActionSupport.SUCCESS;
	}
	
	
	public String timuByShiti_kaoshi()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session= ServletActionContext.getContext().getSession();
		TStu stu=(TStu)session.get("stu");
		
		String sqlk="from TJiaoyuan where stuId=? and shitiId=?";
		Object conk[]={stu.getStuId(),shitiId};
		List list=jiaoyuanDAO.getHibernateTemplate().find(sqlk,conk);
		if(list.size()>0)
		{
			request.put("err", "你已经参加过此考试。请不要重复考试");
			return ActionSupport.ERROR;
		}
		
		List timuList=new ArrayList();
		String sql="from TTimuShiti where shitiId=?";
		Object con[]={shitiId};
		List timuShitiList=timuShitiDAO.getHibernateTemplate().find(sql,con);
		for(int i=0;i<timuShitiList.size();i++)
		{
			TTimuShiti timuShiti=(TTimuShiti)timuShitiList.get(i);
			TTimu timu=timuDAO.findById(timuShiti.getTimuId());
			timuList.add(timu);
		}
		request.put("timuList", timuList);
		request.put("shitiId", shitiId);
		return ActionSupport.SUCCESS;
	}


	public int getKechengId()
	{
		return kechengId;
	}

	public void setKechengId(int kechengId)
	{
		this.kechengId = kechengId;
	}

	public void setTimuLeixing(String timuLeixing)
	{
		this.timuLeixing = timuLeixing;
	}

	public String getMessage()
	{
		return message;
	}

	public int getShitiId()
	{
		return shitiId;
	}

	public void setShitiId(int shitiId)
	{
		this.shitiId = shitiId;
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

	public String getTimuDaan()
	{
		return timuDaan;
	}

	public void setTimuDaan(String timuDaan)
	{
		this.timuDaan = timuDaan;
	}

	public TTimuDAO getTimuDAO()
	{
		return timuDAO;
	}

	public void setTimuDAO(TTimuDAO timuDAO)
	{
		this.timuDAO = timuDAO;
	}

	public int getTimuFenshu()
	{
		return timuFenshu;
	}

	public void setTimuFenshu(int timuFenshu)
	{
		this.timuFenshu = timuFenshu;
	}

	public int getTimuId()
	{
		return timuId;
	}

	public void setTimuId(int timuId)
	{
		this.timuId = timuId;
	}


	public String getTimuLeixing()
	{
		return timuLeixing;
	}

	public String getTimuName()
	{
		return timuName;
	}

	public void setTimuName(String timuName)
	{
		this.timuName = timuName;
	}

	public String getTimuXuanxianga()
	{
		return timuXuanxianga;
	}

	public void setTimuXuanxianga(String timuXuanxianga)
	{
		this.timuXuanxianga = timuXuanxianga;
	}

	public String getTimuXuanxiangb()
	{
		return timuXuanxiangb;
	}

	public TTimuShitiDAO getTimuShitiDAO()
	{
		return timuShitiDAO;
	}

	public void setTimuShitiDAO(TTimuShitiDAO timuShitiDAO)
	{
		this.timuShitiDAO = timuShitiDAO;
	}

	public void setTimuXuanxiangb(String timuXuanxiangb)
	{
		this.timuXuanxiangb = timuXuanxiangb;
	}

	public String getTimuXuanxiangc()
	{
		return timuXuanxiangc;
	}

	public void setTimuXuanxiangc(String timuXuanxiangc)
	{
		this.timuXuanxiangc = timuXuanxiangc;
	}

	public String getTimuXuanxiangd()
	{
		return timuXuanxiangd;
	}

	public void setTimuXuanxiangd(String timuXuanxiangd)
	{
		this.timuXuanxiangd = timuXuanxiangd;
	}

	public TJiaoyuanDAO getJiaoyuanDAO()
	{
		return jiaoyuanDAO;
	}

	public void setJiaoyuanDAO(TJiaoyuanDAO jiaoyuanDAO)
	{
		this.jiaoyuanDAO = jiaoyuanDAO;
	}

	
	
	public Integer getTimuNandu() {
		return timuNandu;
	}

	public void setTimuNandu(Integer timuNandu) {
		this.timuNandu = timuNandu;
	}



	private int pageNow = 1; // 初始化为1,默认从第一页开始显示
	private int pageSize = 10; // 每页显示3条记录
	private int pageTotle = 1;// 总页数
	
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageTotle() {
		return pageTotle;
	}
	public void setPageTotle(int pageTotle) {
		this.pageTotle = pageTotle;
	}
	
}
