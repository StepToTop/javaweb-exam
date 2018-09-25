package com.action;

import java.security.Policy;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import com.dao.TAdminDAO;
import com.dao.TShitiDAO;
import com.dao.TTimuDAO;
import com.dao.TKechengDAO;
import com.dao.TTimuShitiDAO;
import com.model.TAdmin;
import com.model.TShiti;
import com.model.TShiti;
import com.model.TTimu;
import com.model.TTimuShiti;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type;
import com.util.Pagination;
import com.util.RandomNo;

public class shitiAction extends ActionSupport
{
	private int shitiId;
	private String shitiName;
	private String shitiJieshao;
	private int kechengId;
	
	private String message;
	private String path;
	private Integer shitiNandu;	
	private Integer danxuanCount;	
	private Integer duoxuanCount;		
	private Integer jiandaCount;		
	
	private TShitiDAO shitiDAO;
	private TTimuDAO timuDAO;	
	private TKechengDAO kechengDAO;	
	private TTimuShitiDAO timuShitiDAO;	
	
	public String shitiAdd()
	{
		TShiti shiti=new TShiti();
		shiti.setShitiName(shitiName);
		shiti.setShitiNandu(shitiNandu);
		shiti.setShitiJieshao(shitiJieshao);
		shiti.setKechengId(kechengId);
		shiti.setShitiShijian(new Date().toLocaleString());
		shiti.setDel("no");
		shitiDAO.save(shiti);
		this.setMessage("操作成功");
		this.setPath("shitiMana.action");
		return "succeed";
	}
	
	public String shitiDel()
	{
		TShiti shiti=shitiDAO.findById(shitiId);
		shiti.setDel("yes");
		shitiDAO.attachDirty(shiti);
		this.setMessage("删除成功");
		this.setPath("shitiMana.action");
		return "succeed";
	}
	
	public String shitiAutoPre()
	{
		TShiti shiti=shitiDAO.findById(shitiId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shiti", shiti);
		return ActionSupport.SUCCESS;
	}
	
	//自动组卷 
	public String shitiAuto()
	{
		TShiti shiti=shitiDAO.findById(shitiId);
		
		String sql1="from TTimuShiti where  shitiId="+shitiId;
		List uList=timuDAO.getHibernateTemplate().find(sql1);
		for(int j=0;j<uList.size();j++)
		{
			TTimuShiti timuS=(TTimuShiti)uList.get(j);
			timuShitiDAO.delete(timuS);		
		}
//		String sql1="from TTimu where del='no' and kechengId="+kechengId+" and timuLeixing='danxuan' order by timuId";
//		List danList=timuDAO.getHibernateTemplate().find(sql1);
//		
//		String sql2="from TTimu where del='no' and kechengId="+kechengId+" and timuLeixing='duoxuan' order by timuId";
//		List duoList=timuDAO.getHibernateTemplate().find(sql2);
//		
//		String sql3="from TTimu where del='no' and kechengId="+kechengId+" and timuLeixing='jianda' order by timuId";
//		List jiandaList=timuDAO.getHibernateTemplate().find(sql3);
		
		int iCount1=0;
		int iCount2=0;
		int iCount3=0;
		if(danxuanCount>0){
		    iCount1 =timuFind(danxuanCount,"danxuan",shiti);}
		if(danxuanCount>0){
			iCount2 =timuFind(danxuanCount,"duoxuan",shiti);}
		if(danxuanCount>0){
			iCount3 =timuFind(danxuanCount,"jianda",shiti);}
		
		shiti.setShitiShijian(new Date().toLocaleString());
		shitiDAO.attachDirty(shiti);
		
		
		this.setMessage("组卷结束！单选题数量：["+iCount1+"]多选题数量：["+iCount2+"]简答题数量：["+iCount3+"]");
		this.setPath("timuByShiti.action?shitiId="+shitiId);
		return "succeed";
	}
	//private ArrayList selList;
	
	
	/**
	 * 染色体的初始化，根据试题的总题量，得到染色体的长度，根据初始种群的大小，生成染色体；
	 * 染色体内题目按题型一次排列，便于进行下面的操作
	 * @return
	 */
	public List<List<TShiti>> ChromosomeInti(Policy p,TTimuShiti gm){
	
		 
//System.out.print("检测参数"+gm.getId());
		//得到知识点的内容
		String kpStr = "";
		int[] knowledgePointIds = null;//知识点Ids
		if(kpStr!=null&&!kpStr.trim().equals("")){
			String[] kpStrings = kpStr.split(",");
			knowledgePointIds = new int[kpStrings.length];
			for(int i=0;i<kpStrings.length;i++){
				knowledgePointIds[i] = Integer.parseInt(kpStrings[i]);
			}
		}
		
		//得到题型的具体内容
		String typeStr = "";
		int[] typeIds = null;//题型Id列表
		int[] sourse=null;//题型的分数
		int[] counts=null;//每种题型的题量
		if(typeStr!=null&&!typeStr.trim().equals("")){
			String[] typeStrings = typeStr.split(",");
			int typeLength = typeStrings.length;
			typeIds = new int[typeLength/3];
			sourse = new int[typeLength/3];
			counts =new int[typeLength/3];
			for(int i=0,j=0;i<typeLength;i+=3,j++){
				typeIds[j] = Integer.parseInt(typeStrings[i]);
				sourse[j] = Integer.parseInt(typeStrings[i+1]);
				counts[j] = Integer.parseInt(typeStrings[i+2]);
			}
		}					
		/*
		 * 染色体的初始化
		 */
		
		//intiLib(knowledgePointIds,typeIds); //初始种群
		List<List<TShiti>> chromosomeList = new ArrayList<List<TShiti>>();//染色体的列表	
		for(int i=0;i<chromosomeList.size()*2;i++){//根据系统规定的染色体的数量的两倍进行循环
			List<TShiti> tqList = new ArrayList<TShiti>();//一个染色体
		
			for(int j=0;j<tqList.size();j++){//根据题型去取试题
				List<TShiti> tqTypeList = null ;//得到第一种题型的所有试题
				int[] random = RandomNo.getRandomList(tqTypeList.size(),i);//产生一个从0到tqTypeList.size()-1的
//System.out.println("检测参数======》"+counts[j]+"("+counts.length+")");																		//随机数组，我们取前面几个加入到染色体内
				for(int k=0;k<counts[j];k++){//根据该种题型在染色体内所占的题量加入
					TShiti tq = (TShiti) chromosomeList.get(random[k]);
					tqList.add(tq);
				}	
				
			}
			chromosomeList.add(tqList);//把一个染色体加入到染色体列表
			
		}
		return chromosomeList;
	}
	/**
	 * 求染色体的适应值
	 */
	public int getAdaptive(List<TShiti> qsList,Policy p){
		
		double errorD = 0.0;//难度误差
		double errorDt = 0.0;//区分度误差
		double errorKp = 0.0;//知识点误差
		double errorLateTime = 0.0;//最近出题时间误差
		double errorExposure = 0.0;//曝光度误差
		double errorTime = 0.0;//总的考试时间误差
		
		double sumD = 0.0;//试题的难度和
		double sumDt = 0.0;//区分度的和
		double sumTime = 0.0;//考试时间和
		double sumEx = 0.0;//总的曝光度
		long sumLateTime = 0;//总的最近答题时间
	
		
		int length = qsList.size();//染色体长度
		for(int i=0;i<length;i++){
			TShiti t = qsList.get(i);
			
			sumD += t.getKechengId();
			
		}
		
		
//测试参数
//System.out.println("测试参数");
//System.out.println("难度误差"+errorD);
//System.out.println("区分度误差"+errorDt);
//System.out.println("总的曝光度"+sumEx);		
//System.out.println("答题时间误差"+errorTime);	
		double thisAvgEx =0.0;
		if(sumEx!=0){
			thisAvgEx = sumEx/length;
		}else{
			thisAvgEx = 0;
		}
		if(thisAvgEx>0){
			errorExposure = thisAvgEx - 0;//比平均曝光度大多少
		}else{
			errorExposure = 0.0;//如果小于平均曝光度，那么该染色体的曝光误差就为0
		}	
//System.out.println("曝光度误差"+errorExposure);		
		
		double avgS = sumLateTime/(double)1/(double)length;
		if(avgS>0){
			errorLateTime = avgS - 0;
		}else
		{
			errorLateTime = 0.0;
		}
		
//System.out.println("平均最近答题时间比率误差"+errorLateTime);

	//计算知识点误差
		String chapterStr  = null;
		int[] chapterIds = null;//章节Ids
		int[] ratio = null;
		if(chapterStr!=null&&!chapterStr.trim().equals("")){
			String[] kpStrings = chapterStr.split(",");
			chapterIds = new int[kpStrings.length/2];
			ratio = new int[kpStrings.length/2];
			for(int i=0,j=0;i<kpStrings.length;j++,i+=2){
				chapterIds[j] = Integer.parseInt(kpStrings[i]);
				ratio[j] = Integer.parseInt(kpStrings[i+1]);
			}

		}
		
		double factor = 0.0;
		for(int i=0;i<qsList.size();i++){//计算总的赋分因子
			TShiti qs = qsList.get(i);
			
		}
		
		
		for(int i=0;i<chapterIds.length;i++){
			double fa=0.0;
			
			double ra = fa/factor;//在题的赋分因子在总的试题赋分因子的比率
			double errorX = Math.abs(ra-ratio[i]/(double)100);//某一章的误差
			errorKp += errorX;//总误差
		}

	
	//函数适应值得计算 我们把适应值放大十万倍，然后去掉其小数部分，即转化为整型
	int fitenessAll = (int)((errorD+errorDt+errorKp+errorLateTime+errorExposure+errorTime)*100000);
//System.out.println("总的适应值"+fitenessAll);
	
	return fitenessAll;
	}

	
/**
 * 根据染色体的适应值，对染色进行排序
 */	
	public void sortChr(List<List<TShiti>>  chromosomeList){
		//Policy p = policyManager.getPolicyById(7);
		int[] fitnesses = new int[chromosomeList.size()];//先把适应值存到数组中，这样就不用再排序的使用总是计算适应值了
		for(int i=0;i<chromosomeList.size();i++){
			fitnesses[i] = 1; 
		}
		//我们采用快速排序法
		sort(fitnesses,chromosomeList,0,fitnesses.length-1);
	}
	
	private void sort(int[] number,List<List<TShiti>>  chromosomeList,int left,int right){
		if(left<right)
	    {
	      
	      int s=number[left];
	      int a = left;
	      int i=left;
	      int j=right+1;
	      while(true)
	      {
	        //令索引 i 從數列左方往右方找，直到找到大於 s 的數
	        while(i+1<number.length &&number[++i]<s);
	        //令索引 j 從數列右方往左方找，直到找到小於 s 的數
	        while(j>0&&number[--j]>s);
	        if(i>=j) break; //如果 i >= j，則離開迴圈
	        swap(number,chromosomeList,i,j);//如果 i < j，則交換索引i與j兩處的值

	      }
	      //将左侧轴与j交换
	      number[left]=number[j];
	      number[j]=s;
	      List<TShiti> tqLista = chromosomeList.get(a);
		  List<TShiti> tqListj = chromosomeList.get(j);
		  chromosomeList.set(a, tqListj);
		  chromosomeList.set(j, tqLista);
	      
	      sort(number,chromosomeList,left,j-1);//轴左边进行递归

		  sort(number,chromosomeList,j+1,right);//轴右边进行递归

	   }
	  }
	
	private static void swap(int[] number,List<List<TShiti>>  chromosomeList,int i, int j) {
	    int t;
	    t=number[i];
	    number[i]=number[j];
	    number[j]=t;
//System.out.print("第"+i+"个与"+j+"交换");
	    List<TShiti> tqListi = chromosomeList.get(i);
	    List<TShiti> tqListj = chromosomeList.get(j);
	    chromosomeList.set(i, tqListj);
	    chromosomeList.set(j, tqListi);
	 }
	
	
	/**
	 * 交叉函数
	 */
	public void crossDo(List<List<TShiti>>  chromosomeList){
		Random ra = new Random();
		int length = chromosomeList.size();
		for(int i=0;i<chromosomeList.size();i++){
			if(1<ra.nextInt(100)/(double)100){
				crossGe(chromosomeList,length);
			}
		}
	}
	/**
	 * 交叉的实现
	 * @param chromosomeList
	 * @param size
	 */
	private void crossGe(List<List<TShiti>>  chromosomeList,int size){
		
		Random ra = new Random();
		List<TShiti> tqList1 = chromosomeList.get(ra.nextInt(size));
		List<TShiti> tqList2 = chromosomeList.get(ra.nextInt(size));
		
		for(int i=0;i<tqList1.size();i++){
			if(ra.nextInt(100)/(double)100<0.3){//百分之30的数据进行交换
				TShiti tq1 = tqList1.get(i);
				TShiti tq2 = tqList2.get(i);
				
				int state = 0;
				for(int j=0;j<tqList1.size();j++){
					if(tq1.getDel()==tqList2.get(j).getDel()){
						state=1;
						break;
					}
					if(tq2.getDel()==tqList1.get(j).getDel()){
						state=1;
						break;
					}
				}
				if(state==0){
					tqList1.set(i, tq2);
					tqList2.set(i, tq1);
				}else{
					i--;//如果取到的试题不符合，我们继续去初始化题库去取
				}
				
			}
		}
		
	}

	/**
	 * 变异函数
	 */
	public void mutationDo(List<List<TShiti>>  chromosomeList){
		Random ra = new Random();
		int length = chromosomeList.size();
		}
	
	/**
	 *变异的实现
	 * @param chromosomeList
	 * @param size
	 */
	private void mutationGe(List<List<TShiti>>  chromosomeList,int size){
		Random ra = new Random();
		int length = chromosomeList.size();
		List<TShiti> tqList1 = chromosomeList.get(ra.nextInt(size));//随机选出一个染色体进行变异
		for(int i=0;i<tqList1.size();i++){
			
			if(ra.nextInt(100)/(double)100<0.2){//被随机选中的染色体的20%的数据进行变异
				TShiti tq1 = tqList1.get(i);
				TShiti tq2 = null;
				Map tyList = null;
				//这个循环水根据试题类型，去初始化题库里去取符合该类型的试题
				for(int j=0;j<tyList.size();j++){
					Type type = (Type)tyList.get(j);
					
						Map tqList2 = null;
						tq2 = (TShiti) tqList2.get(ra.nextInt(tqList2.size()));//得到替换的试题
					}	
				}
				//判断该试题中此染色体里是否存在，如果存在，那么就不需要此试题，再去初始化题库寻找新的试题
				int state = 0;
				TShiti tq2 = null;
				for(int j=0;j<tqList1.size();j++){
					TTimuShiti tq1 = null;
					if(tq1.getId()==tq2.getKechengId()){
						state=1;
						break;
					}
				}
				
				if(state==0){
					tqList1.set(i, tq2);
				}else{
					i--;//如果取到的试题不符合，我们继续去初始化题库去取
				}
				
				
			}
		}

	
	private int timuFind(int selCount,String pLeixing,TShiti shiti)
	{
		int okCount=0;
		 ArrayList selList=new ArrayList();
		String strSel="";
		String sql1="from TTimu where del='no' and kechengId="+shiti.getKechengId()
		+" and timuLeixing='"+pLeixing+"' and timuNandu="+shiti.getShitiNandu()+" order by timuId";
		List danList=timuDAO.getHibernateTemplate().find(sql1);	
		int iList=danList.size();
		if(iList>0)
		{
			if(iList<selCount)
			{
				for(int j=0;j<danList.size();j++)
				{
					TTimu timu=(TTimu)danList.get(j);
				    selList.add(timu.getTimuId());
				    okCount++;
				}
			}
			else
			{
		        java.util.Random rd =new java.util.Random();
				while(okCount<selCount)
				{
					int xId = rd.nextInt(iList) ;
					TTimu timu=(TTimu)danList.get(xId);
					if(!strSel.contains(timu.getTimuId().toString()))
					{
						strSel+=timu.getTimuId()+",";
						selList.add(timu.getTimuId());
						okCount++;
					}
				}
			}
		}
		
		for(int j=0;j<selList.size();j++)
		{
			TTimuShiti timuS= new TTimuShiti();
			timuS.setShitiId(shiti.getShitiId());
			timuS.setTimuId(Integer.parseInt(selList.get(j).toString()));

			timuShitiDAO.save(timuS);
			
		}
		
		return okCount;
	}
	public String shitiEditPre()
	{
		TShiti shiti=shitiDAO.findById(shitiId);
		Map request=(Map)ServletActionContext.getContext().get("request");
    	String sql="from TKecheng where del='no'";
		List kechengList=kechengDAO.getHibernateTemplate().find(sql);
		request.put("kechengList", kechengList);
		request.put("shiti", shiti);
		return ActionSupport.SUCCESS;
	}
	
	public String shitiEdit()
	{
		TShiti shiti=shitiDAO.findById(shitiId);
		shiti.setShitiName(shitiName);
		shiti.setShitiNandu(shitiNandu);
		shiti.setShitiJieshao(shitiJieshao);
		shiti.setKechengId(kechengId);
		shiti.setShitiShijian(new Date().toLocaleString());
		shitiDAO.attachDirty(shiti);
		this.setMessage("更新成功");
		this.setPath("shitiMana.action");
		return "succeed";
	}
	
	public String shitiMana()
	{
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		
		for(int i=0;i<shitiList.size();i++)
		{
			TShiti shiti=(TShiti)shitiList.get(i);
			int kechengId=shiti.getKechengId();

			shiti.setKechengName(kechengDAO.findById(kechengId).getKechengName());

		}
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shitiList", shitiList);
		return ActionSupport.SUCCESS;
	}
	
	public String shitiAll()
	{
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shitiList", shitiList);
		return ActionSupport.SUCCESS;
	}
	
	public String shitiAll1()
	{
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shitiList", shitiList);
		return ActionSupport.SUCCESS;
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

	public TShitiDAO getShitiDAO()
	{
		return shitiDAO;
	}

	public void setShitiDAO(TShitiDAO shitiDAO)
	{
		this.shitiDAO = shitiDAO;
	}

	public int getShitiId()
	{
		return shitiId;
	}

	public void setShitiId(int shitiId)
	{
		this.shitiId = shitiId;
	}

	public String getShitiJieshao()
	{
		return shitiJieshao;
	}

	public void setShitiJieshao(String shitiJieshao)
	{
		this.shitiJieshao = shitiJieshao;
	}

	public String getShitiName()
	{
		return shitiName;
	}

	public void setShitiName(String shitiName)
	{
		this.shitiName = shitiName;
	}

	public Integer getShitiNandu() {
		return shitiNandu;
	}

	
	public Integer getDanxuanCount() {
		return danxuanCount;
	}

	public void setDanxuanCount(Integer danxuanCount) {
		this.danxuanCount = danxuanCount;
	}

	public Integer getDuoxuanCount() {
		return duoxuanCount;
	}

	public void setDuoxuanCount(Integer duoxuanCount) {
		this.duoxuanCount = duoxuanCount;
	}

	public Integer getJiandaCount() {
		return jiandaCount;
	}

	public void setJiandaCount(Integer jiandaCount) {
		this.jiandaCount = jiandaCount;
	}

	public TTimuDAO getTimuDAO() {
		return timuDAO;
	}

	public void setTimuDAO(TTimuDAO timuDAO) {
		this.timuDAO = timuDAO;
	}

	public TKechengDAO getKechengDAO() {
		return kechengDAO;
	}

	public void setKechengDAO(TKechengDAO kechengDAO) {
		this.kechengDAO = kechengDAO;
	}

	public TTimuShitiDAO getTimuShitiDAO() {
		return timuShitiDAO;
	}

	public void setTimuShitiDAO(TTimuShitiDAO timuShitiDAO) {
		this.timuShitiDAO = timuShitiDAO;
	}

	public int getKechengId() {
		return kechengId;
	}

	public void setKechengId(int kechengId) {
		this.kechengId = kechengId;
	}

	public void setShitiNandu(Integer shitiNandu) {
		this.shitiNandu = shitiNandu;
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
