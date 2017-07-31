public class SysRegisterAction  extends BaseFormBean{
	private String opRealname;// 真实姓名
	private String opOrg;// 单位名称
	private String opDep;// 单位部门
	private String mobile;// 手机
	private String businesstelephone;// 办公电话
	private String sex;// 性别
	private String email;// 邮箱
	private String passwordhash;// 密码
	private String code;
	private Map<String, Object> dataMap;
	private File cardFront;
	private File cardBack;
	private String cardFrontUrl;
	private String cardBackUrl;
	private String picFlag;
	private String memName;
	private String address;
	SysUserBo sysUserBo;
	MemberInfoBo memberInfoBo;
	SecUserMarkInfoBo secUserMarkInfoBo;
  public String saveUser(){ 
       try {
		Integer integer=sysUserBo.findByMobile(mobile);
		dataMap = new HashMap<>();
		if(integer!=null&&integer!=0){
			dataMap.put("flag", "success");
			dataMap.put("code", "1");
  			dataMap.put("msg", "手机号已存在");
  			return SUCCESS;
		}
		SysUser s =new SysUser();
		s.setOpName(email);
		SysUser integer1=sysUserBo.getByOpName(s);
		if(integer1!=null){
			dataMap.put("flag", "success");
			dataMap.put("code", "2");
  			dataMap.put("msg", "邮箱已存在");
  			return SUCCESS;
		}
	if(code==null || this.getHttpRequest().getSession().getAttribute("code")==null){
		dataMap.put("flag", "success");
		dataMap.put("code", "3");
		dataMap.put("msg","验证码失效,请重新登录!");
		return SUCCESS;
	}else if(code==null || this.getHttpRequest().getSession().getAttribute("code")==null || 
			!code.equalsIgnoreCase((String)this.getHttpRequest().getSession().getAttribute("code"))){
		dataMap.put("flag", "success");
		dataMap.put("code", "3");
		dataMap.put("msg","验证码不正确,请重新输入!");
		return SUCCESS;
	}
		byte[] cardFront =  (byte[]) this.getHttpRequest().getSession().getAttribute("cardFront");
		byte[] cardBack =  (byte[]) this.getHttpRequest().getSession().getAttribute("cardBack");
		if(cardFront==null||cardBack==null){
			dataMap.put("flag", "success");
  			dataMap.put("msg", "请上传名片");
  			return SUCCESS;
		}
		String path=System.getProperty("user.home")+"/project/uploadFiles";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		String cardBackUrl= (String) this.getHttpRequest().getSession().getAttribute("cardBackUrl"); 
		 String cardFrontUrl= (String) this.getHttpRequest().getSession().getAttribute("cardFrontUrl"); 
		File file = new File(path,cardFrontUrl);
		cardFrontUrl = file.getAbsolutePath();
		BufferedOutputStream bos=new BufferedOutputStream(new FileOutputStream(file));
		bos.write(cardFront);
		bos.flush();
		bos.close();
		File file1 = new File(path,cardBackUrl);
		cardBackUrl = file1.getAbsolutePath();
		BufferedOutputStream bos1=new BufferedOutputStream(new FileOutputStream(file1));
		bos1.write(cardBack);
		bos1.flush();
		bos1.close();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SysUser sysUser = new SysUser();
		String userId=UUID.randomUUID().toString().replace("-", "");
		sysUser.setOpNo(userId);
		sysUser.setOpRealname(opRealname);
		sysUser.setOpOrg(opOrg);
		sysUser.setOpOrgAddr(address);
		sysUser.setCardBack(cardBackUrl);
		sysUser.setCardFront(cardFrontUrl);
		sysUser.setOpName(email);
		sysUser.setMobile(mobile);
		sysUser.setSex(sex);
		sysUser.setOpSts("0");
		sysUser.setPasswordhash(Encryption.md5(passwordhash));
		sysUser.setBusinesstelephone(businesstelephone);
		sysUser.setOpDep(opDep);
		sysUser.setCreateTime(dateFormat.format(new Date()));
		SecUserMarkInfo  secUserMarkInfo = new SecUserMarkInfo();
		secUserMarkInfo.setUserId(userId);
		secUserMarkInfo.setPasswordMessege("用户注册");
		secUserMarkInfo.setPasswordState("0");
		sysUserBo.insertUserAndSec(sysUser, secUserMarkInfo);
		this.getHttpRequest().getSession().removeAttribute("cardFront");
		this.getHttpRequest().getSession().removeAttribute("cardFrontUrl");
		this.getHttpRequest().getSession().removeAttribute("cardBack");
		this.getHttpRequest().getSession().removeAttribute("cardBackUrl");
		dataMap.put("flag", "success");
		dataMap.put("msg","注册成功");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		dataMap.put("flag", "error");
		dataMap.put("msg", "注册失败");
		e.printStackTrace();
	}
	  
	  
	  return SUCCESS;
  }
  public String likeopOrg(){
	  List<String> cacheByKeyName=new ArrayList<>();;
	  dataMap = new HashMap<>();
	   try {
		   BaseCache bc = BaseCache.getInstance();
		   cacheByKeyName = (List<String>) bc.getCacheByKeyName("memNameOfEnt");
		   if(cacheByKeyName==null){
			   cacheByKeyName=memberInfoBo.findByMemName();
			   bc.put("memNameOfEnt", cacheByKeyName);
		   }
		dataMap.put("flag", "success");
		dataMap.put("msg", cacheByKeyName);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		dataMap.put("flag", "error");
		dataMap.put("msg", "查询失败");
		e.printStackTrace();
	}
	  return SUCCESS; 
  }
  public String upDateUserMessage(){
		dataMap = new HashMap<>();
	  try {
			String userId = (String) this.getHttpRequest().getSession().getAttribute("regNo");
		    SysUser sysUser1 = new SysUser();
		    sysUser1.setOpNo(userId);
		    SysUser sysUser = sysUserBo.getById(sysUser1);
		    if(sysUser.getMobile()!=null&&sysUser.getMobile().equals(mobile)){
		    	
		    }else{
		    Integer integer=sysUserBo.findByMobile(mobile);
			if(integer!=null&&integer!=0){
				dataMap.put("flag", "success");
				dataMap.put("code", "1");
	  			dataMap.put("msg", "手机号已存在");
	  			return SUCCESS;
			}
		    }
			String path=System.getProperty("user.home")+"/project/uploadFiles";
		    byte[] cardFront =  (byte[]) this.getHttpRequest().getSession().getAttribute("cardFront");
		    if(cardFront!=null&&cardFront.length!=0){
		    	 String cardFrontUrl= (String) this.getHttpRequest().getSession().getAttribute("cardFrontUrl"); 
		    	 File file = new File(path,cardFrontUrl);
				 BufferedOutputStream bos=new BufferedOutputStream(new FileOutputStream(file));
				 bos.write(cardFront);
				 bos.flush();
				 bos.close();
				 sysUser.setCardFront(file.getAbsolutePath());
				 this.getHttpRequest().getSession().removeAttribute("cardFront");
				 this.getHttpRequest().getSession().removeAttribute("cardFrontUrl");
		    }
		    byte[] cardBack =  (byte[]) this.getHttpRequest().getSession().getAttribute("cardBack");
		    if(cardBack!=null&&cardBack.length!=0){
		    	String cardBackUrl= (String) this.getHttpRequest().getSession().getAttribute("cardBackUrl");  
		    	File file1 = new File(path,cardBackUrl);
				BufferedOutputStream bos1=new BufferedOutputStream(new FileOutputStream(file1));
				bos1.write(cardBack);
				bos1.flush();
				bos1.close();
				sysUser.setCardBack(file1.getAbsolutePath());
				 this.getHttpRequest().getSession().removeAttribute("cardBack");
				 this.getHttpRequest().getSession().removeAttribute("cardBackUrl");
		    }
			sysUser.setMobile(mobile);
			sysUser.setBusinesstelephone(businesstelephone);
			sysUser.setOpDep(opDep);
			sysUserBo.updateUser(sysUser);
			dataMap.put("flag", "success");
			dataMap.put("msg","修改成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			dataMap.put("flag", "error");
			dataMap.put("msg", "修改失败");
		} 
		  return SUCCESS;
  }
  
  /**
   * 数据回显
   * @return
   */
  public String preUserMessage(){
	  try {
		  dataMap = new HashMap<>();
		  String userId = (String) this.getHttpRequest().getSession().getAttribute("regNo");
	      SysUser sysUser = new SysUser();
	      sysUser.setOpNo(userId);
	      SysUser sysUser1 = sysUserBo.getById(sysUser);
	      if(sysUser1!=null){
	    	sysUser1.setPasswordhash("");
	    	dataMap.put("flag", "success");
	    	dataMap.put("msg", sysUser1); 
	    	return SUCCESS;
	      }
	  } catch (Exception e) {
		// TODO: handle exception
		 dataMap.put("flag", "error");
		dataMap.put("msg", "查询失败");
	}
 
	  return SUCCESS;
  }
  
  public String upCard1(){
	  dataMap = new HashMap<>();
	  try {
		  if(cardFront!=null){
			BufferedInputStream bis=new BufferedInputStream(new FileInputStream(cardFront));
			 byte[] buf=new byte[bis.available()];
			 bis.read(buf);
			 this.getHttpRequest().getSession().setAttribute("cardFront", buf);  
			 String cardFrontUrl = new Date().getTime()+""+"f"+"."+"jpg";
			 this.getHttpRequest().getSession().setAttribute("cardFrontUrl", cardFrontUrl); 
		  }
	         dataMap.put("flag", "success");
	  } catch (Exception e) {
			// TODO Auto-generated catch block
		    dataMap.put("flag", "error");
			e.printStackTrace();
		}  
	  return SUCCESS;
	  
  }
  public String upCard2(){
	  dataMap = new HashMap<>(); 
	  try {
		  if(cardBack!=null){
			BufferedInputStream bis=new BufferedInputStream(new FileInputStream(cardBack));
			 byte[] buf=new byte[bis.available()];
			 bis.read(buf);
			 this.getHttpRequest().getSession().setAttribute("cardBack", buf);  
			 String cardBackUrl = new Date().getTime()+""+"b"+"."+"jpg";
			 this.getHttpRequest().getSession().setAttribute("cardBackUrl", cardBackUrl); 
		  }
			 dataMap.put("flag", "success");
	  } catch (Exception e) {
			// TODO Auto-generated catch block
		  dataMap.put("flag", "error");
			e.printStackTrace();
		} 
	  return SUCCESS;
	  
  }
  public String removeSessionForPhoto(){
	    this.getHttpRequest().getSession().removeAttribute("cardFront");
		this.getHttpRequest().getSession().removeAttribute("cardFrontUrl");
		this.getHttpRequest().getSession().removeAttribute("cardBack");
		this.getHttpRequest().getSession().removeAttribute("cardBackUrl");
	  return SUCCESS;
  }
  private String getWebRootUrl() throws Exception{
      String fileDirPath = this.getHttpRequest().getSession().getServletContext().getRealPath("/");
      if(fileDirPath == null){
          //如果返回为空，则表示服务器为weblogic，则需要使用另外的方法
          try{
              return this.getHttpRequest().getSession().getServletContext().getResource("/").getFile();
          }catch(MalformedURLException e){
              throw new Exception("获取项目的根目录出错！");
          }
      }else{
          return fileDirPath;
      }
  }
  
  public String goToPersonalCenter(){
	ActionContext.initialize(ServletActionContext.getRequest(),
		ServletActionContext.getResponse());
	return "personal";
	  
  }
  
public SysUserBo getSysUserBo() {
	return sysUserBo;
}

public MemberInfoBo getMemberInfoBo() {
	return memberInfoBo;
}

public void setMemberInfoBo(MemberInfoBo memberInfoBo) {
	this.memberInfoBo = memberInfoBo;
}

public void setSysUserBo(SysUserBo sysUserBo) {
	this.sysUserBo = sysUserBo;
}

public String getOpRealname() {
	return opRealname;
}
public void setOpRealname(String opRealname) {
	this.opRealname = opRealname;
}
public String getOpOrg() {
	return opOrg;
}
public void setOpOrg(String opOrg) {
	this.opOrg = opOrg;
}
public String getOpDep() {
	return opDep;
}
public void setOpDep(String opDep) {
	this.opDep = opDep;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getBusinesstelephone() {
	return businesstelephone;
}
public void setBusinesstelephone(String businesstelephone) {
	this.businesstelephone = businesstelephone;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPasswordhash() {
	return passwordhash;
}
public void setPasswordhash(String passwordhash) {
	this.passwordhash = passwordhash;
}
public String getCode() {
	return this.code;
}
public void setAuthCode(String code) {
	this.code = code;
}
public Map<String, Object> getDataMap() {
	return dataMap;
}
public void setDataMap(Map<String, Object> dataMap) {
	this.dataMap = dataMap;
}
public File getCardFront() {
	return cardFront;
}
public void setCardFront(File cardFront) {
	this.cardFront = cardFront;
}
public File getCardBack() {
	return cardBack;
}
public void setCardBack(File cardBack) {
	this.cardBack = cardBack;
}
public String getPicFlag() {
	return picFlag;
}
public void setPicFlag(String picFlag) {
	this.picFlag = picFlag;
}
public void setCode(String code) {
	this.code = code;
}
public String getMemName() {
	return memName;
}
public void setMemName(String memName) {
	this.memName = memName;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getCardFrontUrl() {
	return cardFrontUrl;
}
public void setCardFrontUrl(String cardFrontUrl) {
	this.cardFrontUrl = cardFrontUrl;
}
public String getCardBackUrl() {
	return cardBackUrl;
}
public void setCardBackUrl(String cardBackUrl) {
	this.cardBackUrl = cardBackUrl;
}
public SecUserMarkInfoBo getSecUserMarkInfoBo() {
	return secUserMarkInfoBo;
}
public void setSecUserMarkInfoBo(SecUserMarkInfoBo secUserMarkInfoBo) {
	this.secUserMarkInfoBo = secUserMarkInfoBo;
}

}
