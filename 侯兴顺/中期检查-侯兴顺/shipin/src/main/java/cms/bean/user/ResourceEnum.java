package cms.bean.user;

/**
 * 资源枚举
 *
 */
public enum ResourceEnum {
	/** 查看话题内容 **/
	_1001000("查看话题内容", 1000,1000000), 
	/** 发表话题 **/
	_1002000("发表话题", 2000,1000000), 
	/** 修改话题 **/
	_1003000("修改话题", 3000,1000000), 
	/** 话题免审核 **/
	_1006000("话题免审核", 6000,1000000), 
	/** 发表评论 **/
	_1007000("发表评论", 7000,1000000), 
	/** 修改评论 **/
//	_1008000("修改评论", 8000,1000000), 
	/** 删除评论 **/
//	_1009000("删除评论", 9000,1000000), 

	/** 评论免审核 **/
	_1012000("评论免审核", 12000,1000000), 
	/** 发表回复 **/
	_1013000("发表回复", 13000,1000000), 
	/** 修改回复 **/
//	_1014000("修改回复", 14000,1000000), 
	/** 删除回复 **/
//	_1015000("删除回复", 15000,1000000), 
	/**  **/
	_1016000("回复免审核", 16000,1000000), 
	
	/** 发表话题使用'输入密码可见'功能 **/
	_1020000("发表话题使用'输入密码可见'功能", 20000,1000000), 
	/** 发表话题使用'回复话题可见'功能 **/
	_1021000("发表话题使用'回复话题可见'功能", 21000,1000000), 
	/** 发表话题使用'达到等级可见'功能 **/
	_1022000("发表话题使用'达到等级可见'功能", 22000,1000000), 
	/** 发表话题使用'积分购买可见'功能 **/
	_1023000("发表话题使用'积分购买可见'功能", 23000,1000000), 
	/** 发表话题使用'余购购买可见'功能 **/
	_1024000("发表话题使用'余购购买可见'功能", 24000,1000000), 

	
	
	
	
	/** 提交问题 **/
	_10002000("提交问题", 2000,10000000),  
	/** 追加问题 **/
	_10003000("追加问题", 3000,10000000),  
	/** 问题免审核 **/
	_10006000("问题免审核", 6000,10000000), 
	/** 提交答案 **/
	_10007000("提交答案", 7000,10000000), 
	/** 答案免审核 **/
	_10012000("答案免审核", 12000,10000000), 
	/** 提交答案回复 **/
	_10013000("提交答案回复", 13000,10000000), 
	/** 答案回复免审核 **/
	_10016000("答案回复免审核", 16000,10000000), 
	
	
	
	
	
	
	/** 头像上传 **/
	_2001000("头像上传", 1000,2000000), 
	/** 图片上传 **/
	_2002000("图片上传", 2000,2000000), 
	/** 文件上传 **/
	_2003000("文件上传", 3000,2000000), 
	/** 视频上传 **/
	_2004000("视频上传", 4000,2000000), 
	
	/** 添加收藏 **/
	_3001000("添加收藏", 1000,3000000),
	/** 删除收藏 **/
	_3002000("删除收藏", 2000,3000000),
	/** 添加点赞 **/
	_4001000("添加点赞", 1000,4000000),
	/** 删除点赞 **/
	_4002000("删除点赞", 2000,4000000),
	/** 添加关注 **/
	_5001000("添加关注", 1000,5000000),
	/** 删除关注 **/
	_5002000("删除关注", 2000,5000000),
	/** 发送私信 **/
	_6001000("发送私信", 1000,6000000),
	/** 删除私信 **/
	_6002000("删除私信", 2000,6000000);
	
	
	/**
	 * 
	 * @param name 名称
	 * @param code 编号
	 * @param resourceGroupCode 资源组编号
	 */
    private ResourceEnum(String name, Integer code,Integer resourceGroupCode) {
        this.name = name;
        this.code = code;
        this.resourceGroupCode = resourceGroupCode;
    }
    /** 资源组名称 **/
    private String name;
    /** 编号 **/
    private Integer code;
    /** 资源组编号 **/
	private Integer resourceGroupCode;
    
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Integer getResourceGroupCode() {
		return resourceGroupCode;
	}
	public void setResourceGroupCode(Integer resourceGroupCode) {
		this.resourceGroupCode = resourceGroupCode;
	}
	
}
