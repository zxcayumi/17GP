package cms.web.action.common;



import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;

import cms.bean.ErrorView;
import cms.bean.message.Remind;
import cms.bean.setting.EditorTag;
import cms.bean.setting.SystemSetting;
import cms.bean.topic.Comment;
import cms.bean.topic.Quote;
import cms.bean.topic.Reply;
import cms.bean.topic.Topic;
import cms.bean.user.AccessUser;
import cms.bean.user.PointLog;
import cms.bean.user.ResourceEnum;
import cms.bean.user.User;
import cms.bean.user.UserDynamic;
import cms.service.message.RemindService;
import cms.service.setting.SettingService;
import cms.service.template.TemplateService;
import cms.service.topic.CommentService;
import cms.service.topic.TopicService;
import cms.service.user.UserService;
import cms.utils.Base64;
import cms.utils.FileUtil;
import cms.utils.IpAddress;
import cms.utils.JsonUtils;
import cms.utils.RefererCompare;
import cms.utils.UUIDUtil;
import cms.utils.WebUtil;
import cms.utils.threadLocal.AccessUserThreadLocal;
import cms.web.action.AccessSourceDeviceManage;
import cms.web.action.CSRFTokenManage;
import cms.web.action.TextFilterManage;
import cms.web.action.fileSystem.FileManage;
import cms.web.action.filterWord.SensitiveWordFilterManage;
import cms.web.action.follow.FollowManage;
import cms.web.action.message.RemindManage;
import cms.web.action.setting.SettingManage;
import cms.web.action.topic.TopicManage;
import cms.web.action.user.PointManage;
import cms.web.action.user.UserDynamicManage;
import cms.web.action.user.UserManage;
import cms.web.action.user.UserRoleManage;
import cms.web.taglib.Configuration;

/**
 * 评论接收表单
 *
 */
@Controller
@RequestMapping("user/control/comment") 
public class CommentFormAction {
	@Resource TemplateService templateService;
	
	@Resource CaptchaManage captchaManage;
	@Resource CommentService commentService;
	@Resource AccessSourceDeviceManage accessSourceDeviceManage;
	
	@Resource TextFilterManage textFilterManage;
	@Resource SettingManage settingManage;
	@Resource SettingService settingService;
	@Resource UserService userService;
	@Resource TopicService topicService;
	@Resource PointManage pointManage;
	
	@Resource CSRFTokenManage csrfTokenManage;
	
	@Resource TopicManage topicManage;
	@Resource SensitiveWordFilterManage sensitiveWordFilterManage;
	@Resource UserManage userManage;
	
	@Resource RemindManage remindManage;
	@Resource RemindService remindService;
	@Resource UserDynamicManage userDynamicManage;
	@Resource FollowManage followManage;
	@Resource FileManage fileManage;
	@Resource UserRoleManage userRoleManage;
	
	/**
	 * 评论   添加
	 * @param model
	 * @param topicId 话题Id
	 * @param content 评论内容
	 * @param jumpUrl 跳转地址
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(ModelMap model,Long topicId,String content,
			String token,String captchaKey,String captchaValue,String jumpUrl,
			RedirectAttributes redirectAttrs,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//获取登录用户
	  	AccessUser accessUser = AccessUserThreadLocal.get();
		
		boolean isAjax = WebUtil.submitDataMode(request);//是否以Ajax方式提交数据
		

		
		Map<String,String> error = new HashMap<String,String>();
		
			
		
		//判断令牌
		if(token != null && !"".equals(token.trim())){	
			String token_sessionid = csrfTokenManage.getToken(request);//获取令牌
			if(token_sessionid != null && !"".equals(token_sessionid.trim())){
				if(!token_sessionid.equals(token)){
					error.put("token", ErrorView._13.name());//令牌错误
				}
			}else{
				error.put("token", ErrorView._12.name());//令牌过期
			}
		}else{
			error.put("token", ErrorView._11.name());//令牌为空
		}
		
		//验证码
		boolean isCaptcha = captchaManage.comment_isCaptcha(accessUser.getUserName());
		if(isCaptcha){//如果需要验证码
			//验证验证码
			if(captchaKey != null && !"".equals(captchaKey.trim())){
				//增加验证码重试次数
				//统计每分钟原来提交次数
				Integer original = settingManage.getSubmitQuantity("captcha", captchaKey.trim());
	    		if(original != null){
	    			settingManage.addSubmitQuantity("captcha", captchaKey.trim(),original+1);//刷新每分钟原来提交次数
	    		}else{
	    			settingManage.addSubmitQuantity("captcha", captchaKey.trim(),1);//刷新每分钟原来提交次数
	    		}
				
				String _captcha = captchaManage.captcha_generate(captchaKey.trim(),"");
				if(captchaValue != null && !"".equals(captchaValue.trim())){
					if(_captcha != null && !"".equals(_captcha.trim())){
						if(!_captcha.equalsIgnoreCase(captchaValue)){
							error.put("captchaValue",ErrorView._15.name());//验证码错误
						}
					}else{
						error.put("captchaValue",ErrorView._17.name());//验证码过期
					}
				}else{
					error.put("captchaValue",ErrorView._16.name());//请输入验证码
				}
				//删除验证码
				captchaManage.captcha_delete(captchaKey.trim());	
			}else{
				error.put("captchaValue", ErrorView._14.name());//验证码参数错误
			}
			
		}
		
		Comment comment = new Comment();
		Date postTime = new Date();
		comment.setPostTime(postTime);
		List<String> imageNameList = null;
		
		SystemSetting systemSetting = settingService.findSystemSetting_cache();

		
		Topic topic = null;
		if(topicId != null && topicId >0L){
			topic = topicManage.queryTopicCache(topicId);
			if(topic != null){
				comment.setTopicId(topicId);
				//是否全局允许评论
				if(systemSetting.isAllowComment() == false){
					error.put("comment", ErrorView._106.name());//禁止评论
				}
				if(topic.isAllow() == false){
					error.put("comment", ErrorView._106.name());//禁止评论	
				}
				if(!topic.getStatus().equals(20)){//已发布
					error.put("comment", ErrorView._111.name());//已发布话题才允许评论	
				}
			}else{
				error.put("comment",ErrorView._107.name());//话题不存在
				
			}
		}else{
			error.put("comment",ErrorView._103.name());//话题Id不能为空
		}
		
		
		
		
		
		if(topic != null){
			//前台发表评论审核状态
			if(systemSetting.getComment_review().equals(10)){//10.全部审核 20.特权会员未触发敏感词免审核(未实现) 30.特权会员免审核 40.触发敏感词需审核(未实现) 50.无需审核
				comment.setStatus(10);//10.待审核 	
			}else if(systemSetting.getComment_review().equals(30)){
				if(topic != null){
					//是否有当前功能操作权限
					boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1012000,topic.getTagId());
					if(flag_permission){
						comment.setStatus(20);//20.已发布
					}else{
						comment.setStatus(10);//10.待审核 
					}
				}
			}else{
				comment.setStatus(20);//20.已发布
			}
			
			
			
			
			//是否有当前功能操作权限
			boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1007000,topic.getTagId());
			if(flag_permission == false){
				if(isAjax == true){
					response.setStatus(403);//设置状态码
		    		
					WebUtil.writeToWeb("", "json", response);
					return null;
				}else{ 
					String dirName = templateService.findTemplateDir_cache();
						
					String accessPath = accessSourceDeviceManage.accessDevices(request);	
					request.setAttribute("message","权限不足"); 	
					return "templates/"+dirName+"/"+accessPath+"/message";
				}
			}
		}
		
		
		
		
		//如果实名用户才允许评论
		if(systemSetting.isRealNameUserAllowComment() == true){
			User _user = userManage.query_cache_findUserByUserName(accessUser.getUserName());
			if(_user.isRealNameAuthentication() == false){
				error.put("comment", ErrorView._108.name());//实名用户才允许评论
			}
			
		}
		
		
		
		if(content != null && !"".equals(content.trim())){
			//过滤标签
			content = textFilterManage.filterTag(request,content,settingManage.readEditorTag());
			Object[] object = textFilterManage.filterHtml(request,content,"comment",settingManage.readEditorTag());
			String value = (String)object[0];
			imageNameList = (List<String>)object[1];
			boolean isImage = (Boolean)object[2];//是否含有图片
			//不含标签内容
			String text = textFilterManage.filterText(content);
			//清除空格&nbsp;
			String trimSpace = cms.utils.StringUtil.replaceSpace(text).trim();
			
			if(isImage == true || (!"".equals(text.trim()) && !"".equals(trimSpace))){
				if(systemSetting.isAllowFilterWord()){
					String wordReplace = "";
					if(systemSetting.getFilterWordReplace() != null){
						wordReplace = systemSetting.getFilterWordReplace();
					}
					value = sensitiveWordFilterManage.filterSensitiveWord(value, wordReplace);
				}
				comment.setContent(value);
				comment.setIsStaff(false);
				comment.setUserName(accessUser.getUserName());
			}else{
				error.put("content",ErrorView._101.name());//内容不能为空
			}
		}else{
			error.put("content",ErrorView._101.name());//内容不能为空
		}

		if(error.size() == 0){
			comment.setIp(IpAddress.getClientIpAddress(request));
			//保存评论
			commentService.saveComment(comment);
			
			
			PointLog pointLog = new PointLog();
			pointLog.setId(pointManage.createPointLogId(accessUser.getUserId()));
			pointLog.setModule(200);//200.评论
			pointLog.setParameterId(comment.getId());//参数Id 
			pointLog.setOperationUserType(2);//操作用户类型  0:系统  1: 员工  2:会员
			pointLog.setOperationUserName(accessUser.getUserName());//操作用户名称
			
			pointLog.setPoint(systemSetting.getComment_rewardPoint());//积分
			pointLog.setUserName(accessUser.getUserName());//用户名称
			pointLog.setRemark("");
			
			//增加用户积分
			userService.addUserPoint(accessUser.getUserName(),systemSetting.getComment_rewardPoint(), pointManage.createPointLogObject(pointLog));
			
			//用户动态
			UserDynamic userDynamic = new UserDynamic();
			userDynamic.setId(userDynamicManage.createUserDynamicId(accessUser.getUserId()));
			userDynamic.setUserName(accessUser.getUserName());
			userDynamic.setModule(200);//模块 200.评论
			userDynamic.setTopicId(topic.getId());
			userDynamic.setCommentId(comment.getId());
			userDynamic.setPostTime(postTime);
			userDynamic.setStatus(comment.getStatus());
			userDynamic.setFunctionIdGroup(","+topic.getId()+","+comment.getId()+",");
			Object new_userDynamic = userDynamicManage.createUserDynamicObject(userDynamic);
			userService.saveUserDynamic(new_userDynamic);

			
			//删除缓存
			userManage.delete_cache_findUserById(accessUser.getUserId());
			userManage.delete_cache_findUserByUserName(accessUser.getUserName());
			topicManage.delete_cache_findWhetherCommentTopic(comment.getTopicId(),accessUser.getUserName());
			topicManage.deleteTopicCache(topicId);
			
			followManage.delete_cache_userUpdateFlag(accessUser.getUserName());
			
			//修改话题最后回复时间
			topicService.updateTopicReplyTime(topicId,new Date());
			
			
			if(!topic.getIsStaff()){
				User _user = userManage.query_cache_findUserByUserName(topic.getUserName());
				if(_user != null && !_user.getId().equals(accessUser.getUserId())){//楼主评论不发提醒给自己
					
					//提醒楼主
					Remind remind = new Remind();
					remind.setId(remindManage.createRemindId(_user.getId()));
					remind.setReceiverUserId(_user.getId());//接收提醒用户Id
					remind.setSenderUserId(accessUser.getUserId());//发送用户Id
					remind.setTypeCode(10);//10:别人评论了我的话题
					remind.setSendTimeFormat(postTime.getTime());//发送时间格式化
					remind.setTopicId(topic.getId());//话题Id
					remind.setFriendTopicCommentId(comment.getId());//对方的话题评论Id
					
					Object remind_object = remindManage.createRemindObject(remind);
					remindService.saveRemind(remind_object);
					
					//删除提醒缓存
					remindManage.delete_cache_findUnreadRemindByUserId(_user.getId());
				}
			}
			
			
			
			
			
			
			String fileNumber = "b"+ accessUser.getUserId();
			
			//删除图片锁
			if(imageNameList != null && imageNameList.size() >0){
				for(String imageName :imageNameList){
					if(imageName != null && !"".equals(imageName.trim())){
						//如果验证不是当前用户上传的文件，则不删除锁
						 if(!topicManage.getFileNumber(FileUtil.getBaseName(imageName.trim())).equals(fileNumber)){
							 continue;
						 }
						 fileManage.deleteLock("file"+File.separator+"comment"+File.separator+"lock"+File.separator,imageName.replaceAll("/","_"));
					 }
				}
			}	
			//统计每分钟原来提交次数
			Integer original = settingManage.getSubmitQuantity("comment", accessUser.getUserName());
    		if(original != null){
    			settingManage.addSubmitQuantity("comment", accessUser.getUserName(),original+1);//刷新每分钟原来提交次数
    		}else{
    			settingManage.addSubmitQuantity("comment", accessUser.getUserName(),1);//刷新每分钟原来提交次数
    		}
			
		}

		Map<String,String> returnError = new HashMap<String,String>();//错误
		if(error.size() >0){
			//将枚举数据转为错误提示字符
    		for (Map.Entry<String,String> entry : error.entrySet()) {		 
    			if(ErrorView.get(entry.getValue()) != null){
    				returnError.put(entry.getKey(),  ErrorView.get(entry.getValue()));
    			}else{
    				returnError.put(entry.getKey(),  entry.getValue());
    			}
			}
		}
		if(isAjax == true){
			
    		Map<String,Object> returnValue = new HashMap<String,Object>();//返回值
    		
    		if(error != null && error.size() >0){
    			returnValue.put("success", "false");
    			returnValue.put("error", returnError);
    			if(isCaptcha){
    				returnValue.put("captchaKey", UUIDUtil.getUUID32());
    			}
    			
    		}else{
    			returnValue.put("success", "true");
    		}
    		WebUtil.writeToWeb(JsonUtils.toJSONString(returnValue), "json", response);
			return null;
		}else{
			
			
			if(error != null && error.size() >0){//如果有错误
				redirectAttrs.addFlashAttribute("error", returnError);//重定向传参
				redirectAttrs.addFlashAttribute("comment", comment);
				

				String referer = request.getHeader("referer");	
				
				
				referer = StringUtils.removeStartIgnoreCase(referer,Configuration.getUrl(request));//移除开始部分的相同的字符,不区分大小写
				referer = StringUtils.substringBefore(referer, ".");//截取到等于第二个参数的字符串为止
				referer = StringUtils.substringBefore(referer, "?");//截取到等于第二个参数的字符串为止
				
				String queryString = request.getQueryString() != null && !"".equals(request.getQueryString().trim()) ? "?"+request.getQueryString() :"";

				return "redirect:/"+referer+queryString;
	
			}
			
			
			if(jumpUrl != null && !"".equals(jumpUrl.trim())){
				String url = Base64.decodeBase64URL(jumpUrl.trim());
				
				return "redirect:"+url;
			}else{//默认跳转
				model.addAttribute("message", "保存评论成功");
				String referer = request.getHeader("referer");
				if(RefererCompare.compare(request, "login")){//如果是登录页面则跳转到首页
					referer = Configuration.getUrl(request);
				}
				model.addAttribute("urlAddress", referer);
				
				String dirName = templateService.findTemplateDir_cache();
				
				
				return "templates/"+dirName+"/"+accessSourceDeviceManage.accessDevices(request)+"/jump";	
			}
		}
	}
	
	

	/**
	 * 评论  图片上传
	 * @param model
	 * @param topicId 话题Id
	 * @param imgFile
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/uploadImage", method=RequestMethod.POST)
	@ResponseBody//方式来做ajax,直接返回字符串
	public String uploadImage(ModelMap model,Long topicId,
			MultipartFile file, HttpServletRequest request,HttpServletResponse response) throws Exception {

		Map<String,Object> returnJson = new HashMap<String,Object>();
		String errorMessage  = "";
		
		SystemSetting systemSetting = settingService.findSystemSetting_cache();
		
		//获取登录用户
	  	AccessUser accessUser = AccessUserThreadLocal.get();
		boolean flag = true;
		
		//如果全局不允许提交评论
		if(systemSetting.isAllowComment() == false){
			flag = false;
		}
		
		//如果实名用户才允许提交话题
		if(systemSetting.isRealNameUserAllowComment() == true){
			User _user = userManage.query_cache_findUserByUserName(accessUser.getUserName());
			if(_user.isRealNameAuthentication() == false){
				flag = false;
			}
		}
		if(flag){
			//是否有当前功能操作权限
			boolean flag_permission = userRoleManage.isPermission(ResourceEnum._2002000,null);
			if(flag_permission == false){
				errorMessage = "权限不足";
			}else{
				//文件上传
				if(flag_permission && file != null && !file.isEmpty()){
					if(topicId != null && topicId >0L){
						
						
						
						EditorTag editorSiteObject = settingManage.readEditorTag();
						if(editorSiteObject != null && systemSetting.isAllowComment()){//是否全局允许评论
							if(editorSiteObject.isImage()){//允许上传图片
								
								//上传文件编号
								String fileNumber = "b"+accessUser.getUserId();
								
								
								//当前图片文件名称
								String fileName = file.getOriginalFilename();
								//当前图片类型
							//	String imgType = file.getContentType();
								//文件大小
								Long size = file.getSize();
								//取得文件后缀
								String suffix = fileName.substring(fileName.lastIndexOf('.')+1).toLowerCase();
								
								
								//允许上传图片格式
								List<String> imageFormat = editorSiteObject.getImageFormat();
								//允许上传图片大小
								long imageSize = editorSiteObject.getImageSize();

								//验证文件类型
								boolean authentication = FileUtil.validateFileSuffix(file.getOriginalFilename(),imageFormat);
								
								if(authentication ){
									if(size/1024 <= imageSize){
										//文件保存目录;分多目录主要是为了分散图片目录,提高检索速度
										String pathDir = "file"+File.separator+"comment"+File.separator + topicId + File.separator;
										//文件锁目录
										String lockPathDir = "file"+File.separator+"comment"+File.separator+"lock"+File.separator;
										//构建文件名称
										String newFileName = UUIDUtil.getUUID32()+fileNumber+ "." + suffix;
										
										//生成文件保存目录
										fileManage.createFolder(pathDir);
										//生成锁文件保存目录
										fileManage.createFolder(lockPathDir);
										//生成锁文件
										fileManage.addLock(lockPathDir,topicId+"_"+newFileName);
										//保存文件
										fileManage.writeFile(pathDir, newFileName,file.getBytes());
										
										//上传成功
										returnJson.put("error", 0);//0成功  1错误
										returnJson.put("url", "file/comment/"+topicId+"/"+newFileName);
										
										return JsonUtils.toJSONString(returnJson);
									}else{
										errorMessage = "文件超出允许上传大小";
									}
									
								}else{
									errorMessage = "当前文件类型不允许上传";
								}
							}else{
								errorMessage = "不允许上传图片";
							}
						}else{
							errorMessage = "不允许评论";
						}
					}else{
						errorMessage = "话题Id不能为空";
					}
				}else{
					errorMessage = "文件内容不能为空";
				}
			}
		}else{
			errorMessage = "不允许发表评论";
		}
		
		

		//上传失败
		returnJson.put("error", 1);
		returnJson.put("message", errorMessage);
		return JsonUtils.toJSONString(returnJson);
	}
	
	
	
	/**
	 * 引用  添加
	 * @param pageForm
	 * @param model
	 * @param commentId 评论Id
	 */
	@RequestMapping(value="/addQuote", method=RequestMethod.POST)
	public String addQuote(ModelMap model,Long commentId,String content,
			String token,String captchaKey,String captchaValue,String jumpUrl,
			RedirectAttributes redirectAttrs,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//获取登录用户
	  	AccessUser accessUser = AccessUserThreadLocal.get();
		
		boolean isAjax = WebUtil.submitDataMode(request);//是否以Ajax方式提交数据
		
		Map<String,String> error = new HashMap<String,String>();
		
		//判断令牌
		if(token != null && !"".equals(token.trim())){	
			String token_sessionid = csrfTokenManage.getToken(request);//获取令牌
			if(token_sessionid != null && !"".equals(token_sessionid.trim())){
				if(!token_sessionid.equals(token)){
					error.put("token", ErrorView._13.name());//令牌错误
				}
			}else{
				error.put("token", ErrorView._12.name());//令牌过期
			}
		}else{
			error.put("token", ErrorView._11.name());//令牌为空
		}
		//验证码
		boolean isCaptcha = captchaManage.comment_isCaptcha(accessUser.getUserName());
		if(isCaptcha){//如果需要验证码
			//验证验证码
			if(captchaKey != null && !"".equals(captchaKey.trim())){
				//增加验证码重试次数
				//统计每分钟原来提交次数
				Integer original = settingManage.getSubmitQuantity("captcha", captchaKey.trim());
	    		if(original != null){
	    			settingManage.addSubmitQuantity("captcha", captchaKey.trim(),original+1);//刷新每分钟原来提交次数
	    		}else{
	    			settingManage.addSubmitQuantity("captcha", captchaKey.trim(),1);//刷新每分钟原来提交次数
	    		}
				
				String _captcha = captchaManage.captcha_generate(captchaKey.trim(),"");
				if(captchaValue != null && !"".equals(captchaValue.trim())){
					if(_captcha != null && !"".equals(_captcha.trim())){
						if(!_captcha.equalsIgnoreCase(captchaValue)){
							error.put("captchaValue",ErrorView._15.name());//验证码错误
						}
					}else{
						error.put("captchaValue",ErrorView._17.name());//验证码过期
					}
				}else{
					error.put("captchaValue",ErrorView._16.name());//请输入验证码
				}
				//删除验证码
				captchaManage.captcha_delete(captchaKey.trim());
			}else{
				error.put("captchaValue", ErrorView._14.name());//验证码参数错误
			}
				
		}
		
		
		Comment comment = null;
		
		if(commentId == null || commentId <=0){
			error.put("comment", ErrorView._14.name());//引用评论不能为空
		}else{
			comment = commentService.findByCommentId(commentId);
		}
		
		Topic topic = null;
		if(comment != null){
			topic = topicService.findById(comment.getTopicId());
			if(topic != null){
				SystemSetting systemSetting = settingService.findSystemSetting_cache();
				//是否全局允许评论
				if(systemSetting.isAllowComment() == false){
					error.put("comment", ErrorView._106.name());//禁止评论
				}
				if(topic.isAllow() == false){
					error.put("comment", ErrorView._106.name());//禁止评论	
				}
				if(!topic.getStatus().equals(20)){//已发布
					error.put("comment", ErrorView._111.name());//已发布话题才允许评论	
				}
			}else{
				error.put("comment",ErrorView._107.name());//话题不存在
				
			}
			
		}else{
			error.put("comment", ErrorView._14.name());//引用评论不能为空
		}
		
		
		if(topic != null){
			//是否有当前功能操作权限
			boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1007000,topic.getTagId());
			if(flag_permission == false){
				if(isAjax == true){
					response.setStatus(403);//设置状态码
		    		
					WebUtil.writeToWeb("", "json", response);
					return null;
				}else{ 
					String dirName = templateService.findTemplateDir_cache();
						
					String accessPath = accessSourceDeviceManage.accessDevices(request);	
					request.setAttribute("message","权限不足"); 	
					return "templates/"+dirName+"/"+accessPath+"/message";
				}
			}
		}
		
		
		
		SystemSetting systemSetting = settingService.findSystemSetting_cache();
		
		//如果实名用户才允许评论
		if(systemSetting.isRealNameUserAllowComment() == true){
			User _user = userManage.query_cache_findUserByUserName(accessUser.getUserName());
			if(_user.isRealNameAuthentication() == false){
				error.put("comment", ErrorView._108.name());//实名用户才允许评论
			}
			
		}
		
		Comment newComment = new Comment();
		Date postTime = new Date();
		newComment.setPostTime(postTime);
		List<String> imageNameList = null;
		
		
		//前台发表评论审核状态
		if(systemSetting.getComment_review().equals(10)){//10.全部审核 20.特权会员未触发敏感词免审核(未实现) 30.特权会员免审核 40.触发敏感词需审核(未实现) 50.无需审核
			newComment.setStatus(10);//10.待审核 	
		}else if(systemSetting.getComment_review().equals(30)){
			if(topic != null){
				//是否有当前功能操作权限
				boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1012000,topic.getTagId());
				if(flag_permission){
					newComment.setStatus(20);//20.已发布
				}else{
					newComment.setStatus(10);//10.待审核 
				}
			}
		}else{
			newComment.setStatus(20);//20.已发布
		}
		
		
		if(content != null && !"".equals(content.trim())){ 
			if(comment != null){
				//过滤标签
				content = textFilterManage.filterTag(request,content,settingManage.readEditorTag());
				
				Object[] object = textFilterManage.filterHtml(request,content,"comment",settingManage.readEditorTag());
				String value = (String)object[0];
				imageNameList = (List<String>)object[1];
				boolean isImage = (Boolean)object[2];//是否含有图片
				//不含标签内容
				String text = textFilterManage.filterText(content);
				//清除空格&nbsp;
				String trimSpace = cms.utils.StringUtil.replaceSpace(text).trim();
				
				if(isImage == true || (!"".equals(text.trim()) && !"".equals(trimSpace))){
					
					//旧引用
					List<Quote> old_customQuoteList = new ArrayList<Quote>();
					//旧引用Id组
					String old_customQuoteId = ","+comment.getId()+comment.getQuoteIdGroup();
					if(comment.getQuote() != null && !"".equals(comment.getQuote().trim())){
						//旧引用
						old_customQuoteList = JsonUtils.toGenericObject(comment.getQuote(), new TypeReference< List<Quote> >(){});
					}
					
					
					//自定义引用
					Quote customQuote = new Quote();
					customQuote.setCommentId(comment.getId());
					customQuote.setIsStaff(comment.getIsStaff());
					customQuote.setUserName(comment.getUserName());
					customQuote.setContent(textFilterManage.filterText(comment.getContent()));
					old_customQuoteList.add(customQuote);
					
					//评论
					newComment.setTopicId(comment.getTopicId());
					newComment.setIp(IpAddress.getClientIpAddress(request));
					if(systemSetting.isAllowFilterWord()){
						String wordReplace = "";
						if(systemSetting.getFilterWordReplace() != null){
							wordReplace = systemSetting.getFilterWordReplace();
						}
						value = sensitiveWordFilterManage.filterSensitiveWord(value, wordReplace);
					}
					newComment.setContent(value);
					newComment.setIsStaff(false);
					newComment.setQuoteIdGroup(old_customQuoteId);
					newComment.setUserName(accessUser.getUserName());
					newComment.setQuote(JsonUtils.toJSONString(old_customQuoteList));
					
					

				}else{	
					error.put("content", ErrorView._101.name());//内容不能为空
				}	
			}else{
				error.put("comment", ErrorView._104.name());//引用评论不能为空
			}
		}else{
			error.put("content", ErrorView._101.name());//内容不能为空
		}

		//保存
		if(error.size() ==0){
			//保存评论
			commentService.saveComment(newComment);
			
			PointLog pointLog = new PointLog();
			pointLog.setId(pointManage.createPointLogId(accessUser.getUserId()));
			pointLog.setModule(200);//200.评论
			pointLog.setParameterId(comment.getId());//参数Id 
			pointLog.setOperationUserType(2);//操作用户类型  0:系统  1: 员工  2:会员
			pointLog.setOperationUserName(accessUser.getUserName());//操作用户名称
			
			pointLog.setPoint(systemSetting.getComment_rewardPoint());//积分
			pointLog.setUserName(accessUser.getUserName());//用户名称
			pointLog.setRemark("");
			
			//增加用户积分
			userService.addUserPoint(accessUser.getUserName(),systemSetting.getComment_rewardPoint(), pointManage.createPointLogObject(pointLog));
			
			
			//用户动态
			UserDynamic userDynamic = new UserDynamic();
			userDynamic.setId(userDynamicManage.createUserDynamicId(accessUser.getUserId()));
			userDynamic.setUserName(accessUser.getUserName());
			userDynamic.setModule(300);//模块 300.引用评论
			userDynamic.setTopicId(topic.getId());
			userDynamic.setCommentId(newComment.getId());
			userDynamic.setQuoteCommentId(comment.getId());
			userDynamic.setPostTime(newComment.getPostTime());
			userDynamic.setStatus(newComment.getStatus());
			userDynamic.setFunctionIdGroup(","+topic.getId()+","+newComment.getId()+",");
			Object new_userDynamic = userDynamicManage.createUserDynamicObject(userDynamic);
			userService.saveUserDynamic(new_userDynamic);
			
			
			
			
			
			//删除缓存
			userManage.delete_cache_findUserById(accessUser.getUserId());
			userManage.delete_cache_findUserByUserName(accessUser.getUserName());
			
			followManage.delete_cache_userUpdateFlag(accessUser.getUserName());
			
			//修改话题最后回复时间
			topicService.updateTopicReplyTime(newComment.getTopicId(),new Date());
			
			
			User _user = userManage.query_cache_findUserByUserName(topic.getUserName());
			//别人评论了我的话题
			if(!topic.getIsStaff() && _user != null && !_user.getId().equals(accessUser.getUserId())){//楼主评论不发提醒给自己
				//如果别人引用话题发布者的评论,则不发本类型提醒给话题发布者
				if(!comment.getUserName().equals(topic.getUserName())){
					//提醒楼主
					Remind remind = new Remind();
					remind.setId(remindManage.createRemindId(_user.getId()));
					remind.setReceiverUserId(_user.getId());//接收提醒用户Id
					remind.setSenderUserId(accessUser.getUserId());//发送用户Id
					remind.setTypeCode(10);//10:别人评论了我的话题
					remind.setSendTimeFormat(postTime.getTime());//发送时间格式化
					remind.setTopicId(comment.getTopicId());//话题Id
					remind.setFriendTopicCommentId(newComment.getId());//对方的话题评论Id
					
					Object remind_object = remindManage.createRemindObject(remind);
					remindService.saveRemind(remind_object);
					
					//删除提醒缓存
					remindManage.delete_cache_findUnreadRemindByUserId(_user.getId());
					
				}	
			}
			
			
			_user = userManage.query_cache_findUserByUserName(comment.getUserName());
			//别人引用了我的评论
			if(!comment.getIsStaff() && _user != null && !_user.getId().equals(accessUser.getUserId())){//引用自已的评论不发提醒给自己
				
				//提醒楼主
				Remind remind = new Remind();
				remind.setId(remindManage.createRemindId(_user.getId()));
				remind.setReceiverUserId(_user.getId());//接收提醒用户Id
				remind.setSenderUserId(accessUser.getUserId());//发送用户Id
				remind.setTypeCode(30);//30:别人引用了我的评论
				remind.setSendTimeFormat(postTime.getTime());//发送时间格式化
				remind.setTopicId(comment.getTopicId());//话题Id
				remind.setTopicCommentId(comment.getId());//我的话题评论Id
				remind.setFriendTopicCommentId(newComment.getId());//对方的话题评论Id
				
				Object remind_object = remindManage.createRemindObject(remind);
				remindService.saveRemind(remind_object);
				
				//删除提醒缓存
				remindManage.delete_cache_findUnreadRemindByUserId(_user.getId());
			}
			
			
			
			
			
			String fileNumber = "b"+ accessUser.getUserId();
				
			if(imageNameList != null && imageNameList.size() >0){
				for(String imageName :imageNameList){
					if(imageName != null && !"".equals(imageName.trim())){
						//如果验证不是当前用户上传的文件，则不删除锁
						 if(!topicManage.getFileNumber(FileUtil.getBaseName(imageName.trim())).equals(fileNumber)){
							 continue;
						 }
						 fileManage.deleteLock("file"+File.separator+"comment"+File.separator+"lock"+File.separator,imageName.replaceAll("/","_"));
					 }
				
				}
			}
			
			//统计每分钟原来提交次数
			Integer original = settingManage.getSubmitQuantity("comment", accessUser.getUserName());
    		if(original != null){
    			settingManage.addSubmitQuantity("comment", accessUser.getUserName(),original+1);//刷新每分钟原来提交次数
    		}else{
    			settingManage.addSubmitQuantity("comment", accessUser.getUserName(),1);//刷新每分钟原来提交次数
    		}
		}
		
		
		Map<String,String> returnError = new HashMap<String,String>();//错误
		if(error.size() >0){
			//将枚举数据转为错误提示字符
    		for (Map.Entry<String,String> entry : error.entrySet()) {		 
    			if(ErrorView.get(entry.getValue()) != null){
    				returnError.put(entry.getKey(),  ErrorView.get(entry.getValue()));
    			}else{
    				returnError.put(entry.getKey(),  entry.getValue());
    			}
			}
		}
		if(isAjax == true){
    		Map<String,Object> returnValue = new HashMap<String,Object>();//返回值
    		
    		if(error != null && error.size() >0){
    			returnValue.put("success", "false");
    			returnValue.put("error", returnError);
    			if(isCaptcha){
    				returnValue.put("captchaKey", UUIDUtil.getUUID32());
    			}
    		}else{
    			returnValue.put("success", "true");
    		}
    		WebUtil.writeToWeb(JsonUtils.toJSONString(returnValue), "json", response);
			return null;
		}else{
			if(error != null && error.size() >0){//如果有错误
				redirectAttrs.addFlashAttribute("error", returnError);//重定向传参
				redirectAttrs.addFlashAttribute("comment", newComment);
				

				String referer = request.getHeader("referer");	
				
				
				referer = StringUtils.removeStartIgnoreCase(referer,Configuration.getUrl(request));//移除开始部分的相同的字符,不区分大小写
				referer = StringUtils.substringBefore(referer, ".");//截取到等于第二个参数的字符串为止
				referer = StringUtils.substringBefore(referer, "?");//截取到等于第二个参数的字符串为止
				
				String queryString = request.getQueryString() != null && !"".equals(request.getQueryString().trim()) ? "?"+request.getQueryString() :"";
				return "redirect:/"+referer+queryString;
	
			}
			
			
			if(jumpUrl != null && !"".equals(jumpUrl.trim())){
				String url = Base64.decodeBase64URL(jumpUrl.trim());
				
				return "redirect:"+url;
			}else{//默认跳转
				model.addAttribute("message", "保存评论成功");
				String referer = request.getHeader("referer");
				if(RefererCompare.compare(request, "login")){//如果是登录页面则跳转到首页
					referer = Configuration.getUrl(request);
				}
				model.addAttribute("urlAddress", referer);
				String dirName = templateService.findTemplateDir_cache();
				
				return "templates/"+dirName+"/"+accessSourceDeviceManage.accessDevices(request)+"/jump";	
			}
		}
	 }
	

	/**
	 * 回复  添加
	 * @param model
	 * @param commentId 评论Id
	 * @param content
	 * @param token
	 * @param captchaKey
	 * @param captchaValue
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addReply", method=RequestMethod.POST)
	public String addReply(ModelMap model,Long commentId,String content,
			String token,String captchaKey,String captchaValue,String jumpUrl,
			RedirectAttributes redirectAttrs,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		//获取登录用户
		AccessUser accessUser = AccessUserThreadLocal.get();
		
		boolean isAjax = WebUtil.submitDataMode(request);//是否以Ajax方式提交数据
		
		Map<String,String> error = new HashMap<String,String>();
		
		//判断令牌
		if(token != null && !"".equals(token.trim())){	
			String token_sessionid = csrfTokenManage.getToken(request);//获取令牌
			if(token_sessionid != null && !"".equals(token_sessionid.trim())){
				if(!token_sessionid.equals(token)){
					error.put("token", ErrorView._13.name());//令牌错误
				}
			}else{
				error.put("token", ErrorView._12.name());//令牌过期
			}
		}else{
			error.put("token", ErrorView._11.name());//令牌为空
		}
		//验证码
		boolean isCaptcha = captchaManage.comment_isCaptcha(accessUser.getUserName());
		if(isCaptcha){//如果需要验证码
			//验证验证码
			if(captchaKey != null && !"".equals(captchaKey.trim())){
				//增加验证码重试次数
				//统计每分钟原来提交次数
				Integer original = settingManage.getSubmitQuantity("captcha", captchaKey.trim());
	    		if(original != null){
	    			settingManage.addSubmitQuantity("captcha", captchaKey.trim(),original+1);//刷新每分钟原来提交次数
	    		}else{
	    			settingManage.addSubmitQuantity("captcha", captchaKey.trim(),1);//刷新每分钟原来提交次数
	    		}
				
				String _captcha = captchaManage.captcha_generate(captchaKey.trim(),"");
				if(captchaValue != null && !"".equals(captchaValue.trim())){
					if(_captcha != null && !"".equals(_captcha.trim())){
						if(!_captcha.equalsIgnoreCase(captchaValue)){
							error.put("captchaValue",ErrorView._15.name());//验证码错误
						}
					}else{
						error.put("captchaValue",ErrorView._17.name());//验证码过期
					}
				}else{
					error.put("captchaValue",ErrorView._16.name());//请输入验证码
				}
				//删除验证码
				captchaManage.captcha_delete(captchaKey.trim());	
			}else{
				error.put("captchaValue", ErrorView._14.name());//验证码参数错误
			}
			
		}
		
		Comment comment = null;
		Topic topic = null;
		if(commentId == null || commentId <=0){
			error.put("reply", ErrorView._105.name());//评论不存在
		}else{
			comment = commentService.findByCommentId(commentId);
			
			if(comment != null){
				
				topic = topicService.findById(comment.getTopicId());
				if(topic != null){
					SystemSetting systemSetting = settingService.findSystemSetting_cache();
					//是否全局允许评论
					if(systemSetting.isAllowComment() == false){
						error.put("reply", ErrorView._106.name());//禁止评论
					}
					if(topic.isAllow() == false){
						error.put("reply", ErrorView._106.name());//禁止评论	
					}
					if(!topic.getStatus().equals(20)){//已发布
						error.put("reply", ErrorView._111.name());//已发布话题才允许回复
					}
				}else{
					error.put("reply",ErrorView._107.name());//话题不存在
					
				}
			}else{
				error.put("reply", ErrorView._105.name());//评论不存在
			}
			
			
		}
		
		if(topic != null){
			//是否有当前功能操作权限
			boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1013000,topic.getTagId());
			if(flag_permission == false){
				if(isAjax == true){
					response.setStatus(403);//设置状态码
		    		
					WebUtil.writeToWeb("", "json", response);
					return null;
				}else{ 
					String dirName = templateService.findTemplateDir_cache();
						
					String accessPath = accessSourceDeviceManage.accessDevices(request);	
					request.setAttribute("message","权限不足"); 	
					return "templates/"+dirName+"/"+accessPath+"/message";
				}
			}
		}
		
		
		SystemSetting systemSetting = settingService.findSystemSetting_cache();
		
		//如果实名用户才允许评论
		if(systemSetting.isRealNameUserAllowComment() == true){
			User _user = userManage.query_cache_findUserByUserName(accessUser.getUserName());
			if(_user.isRealNameAuthentication() == false){
				error.put("reply", ErrorView._108.name());//实名用户才允许评论
			}
			
		}

		//回复
		Reply reply = new Reply();
		Date postTime = new Date();
		reply.setPostTime(postTime);
		
		//前台发表评论审核状态
		if(systemSetting.getReply_review().equals(10)){//10.全部审核 20.特权会员未触发敏感词免审核(未实现) 30.特权会员免审核 40.触发敏感词需审核(未实现) 50.无需审核
			reply.setStatus(10);//10.待审核 	
		}else if(systemSetting.getReply_review().equals(30)){
			if(topic != null){
				//是否有当前功能操作权限
				boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1016000,topic.getTagId());
				if(flag_permission){
					reply.setStatus(20);//20.已发布
				}else{
					reply.setStatus(10);//10.待审核 
				}
			}
		}else{
			reply.setStatus(20);//20.已发布
		}
		
		
		if(error != null && error.size() ==0){
			if(content != null && !"".equals(content.trim())){
				if(comment != null){
					//不含标签内容
					String text = textFilterManage.filterText(content);
					//清除空格&nbsp;
					String trimSpace = cms.utils.StringUtil.replaceSpace(text).trim();
					
					if((!"".equals(text.trim()) && !"".equals(trimSpace))){
						
						if(systemSetting.isAllowFilterWord()){
							String wordReplace = "";
							if(systemSetting.getFilterWordReplace() != null){
								wordReplace = systemSetting.getFilterWordReplace();
							}
							text = sensitiveWordFilterManage.filterSensitiveWord(text, wordReplace);
						}
						
						reply.setCommentId(comment.getId());
						reply.setIsStaff(false);
						reply.setUserName(accessUser.getUserName());
						reply.setIp(IpAddress.getClientIpAddress(request));
						reply.setContent(text);
						reply.setTopicId(comment.getTopicId());
						
						

					}else{	
						error.put("content", ErrorView._101.name());//内容不能为空
						
					}	
				}else{
					error.put("reply", ErrorView._105.name());//评论不存在
				}
			}else{
				error.put("content", ErrorView._101.name());//内容不能为空
			}
			
		}
		//保存
		if(error.size() ==0){
			//保存回复
			commentService.saveReply(reply);
			
			PointLog pointLog = new PointLog();
			pointLog.setId(pointManage.createPointLogId(accessUser.getUserId()));
			pointLog.setModule(300);//300.回复
			pointLog.setParameterId(comment.getId());//参数Id 
			pointLog.setOperationUserType(2);//操作用户类型  0:系统  1: 员工  2:会员
			pointLog.setOperationUserName(accessUser.getUserName());//操作用户名称
			
			pointLog.setPoint(systemSetting.getReply_rewardPoint());//积分
			pointLog.setUserName(accessUser.getUserName());//用户名称
			pointLog.setRemark("");
			
			//增加用户积分
			userService.addUserPoint(accessUser.getUserName(),systemSetting.getReply_rewardPoint(), pointManage.createPointLogObject(pointLog));
			
			
			//用户动态
			UserDynamic userDynamic = new UserDynamic();
			userDynamic.setId(userDynamicManage.createUserDynamicId(accessUser.getUserId()));
			userDynamic.setUserName(accessUser.getUserName());
			userDynamic.setModule(400);//模块 400.回复
			userDynamic.setTopicId(reply.getTopicId());
			userDynamic.setCommentId(reply.getCommentId());
			userDynamic.setReplyId(reply.getId());
			userDynamic.setPostTime(reply.getPostTime());
			userDynamic.setStatus(reply.getStatus());
			userDynamic.setFunctionIdGroup(","+reply.getTopicId()+","+reply.getCommentId()+","+reply.getId()+",");
			Object new_userDynamic = userDynamicManage.createUserDynamicObject(userDynamic);
			userService.saveUserDynamic(new_userDynamic);
			
			//删除缓存
			userManage.delete_cache_findUserById(accessUser.getUserId());
			userManage.delete_cache_findUserByUserName(accessUser.getUserName());
			followManage.delete_cache_userUpdateFlag(accessUser.getUserName());
			
			//修改话题最后回复时间
			topicService.updateTopicReplyTime(comment.getTopicId(),new Date());
			
			if(topic != null && !topic.getIsStaff()){
				User _user = userManage.query_cache_findUserByUserName(topic.getUserName());
				//别人回复了我的话题
				if(_user != null && !_user.getId().equals(accessUser.getUserId())){//楼主回复不发提醒给自己
					//如果别人回复了话题发布者的评论，则不发本类型提醒给话题发布者
					if(!comment.getUserName().equals(topic.getUserName())){
						Remind remind = new Remind();
						remind.setId(remindManage.createRemindId(_user.getId()));
						remind.setReceiverUserId(_user.getId());//接收提醒用户Id
						remind.setSenderUserId(accessUser.getUserId());//发送用户Id
						remind.setTypeCode(20);//20:别人回复了我的话题
						remind.setSendTimeFormat(postTime.getTime());//发送时间格式化
						remind.setTopicId(comment.getTopicId());//话题Id
						remind.setFriendTopicCommentId(comment.getId());//对方的话题评论Id
						remind.setFriendTopicReplyId(reply.getId());//对方的话题回复Id
						
						Object remind_object = remindManage.createRemindObject(remind);
						remindService.saveRemind(remind_object);
						
						//删除提醒缓存
						remindManage.delete_cache_findUnreadRemindByUserId(_user.getId());
						
					}		
				}
			}
			
			User _user = userManage.query_cache_findUserByUserName(comment.getUserName());
			//别人回复了我的评论
			if(!comment.getIsStaff() && _user != null && !_user.getId().equals(accessUser.getUserId())){//不发提醒给自己

				Remind remind = new Remind();
				remind.setId(remindManage.createRemindId(_user.getId()));
				remind.setReceiverUserId(_user.getId());//接收提醒用户Id
				remind.setSenderUserId(accessUser.getUserId());//发送用户Id
				remind.setTypeCode(40);//40:别人回复了我的评论
				remind.setSendTimeFormat(postTime.getTime());//发送时间格式化
				remind.setTopicId(comment.getTopicId());//话题Id
				remind.setTopicCommentId(comment.getId());//我的话题评论Id
				remind.setFriendTopicReplyId(reply.getId());//对方的话题回复Id
				
				
				Object remind_object = remindManage.createRemindObject(remind);
				remindService.saveRemind(remind_object);
				
				//删除提醒缓存
				remindManage.delete_cache_findUnreadRemindByUserId(_user.getId());
			}
			
			Set<String> userNameList = new HashSet<String>();
			List<Reply> replyList = commentService.findReplyByCommentId(comment.getId());
			if(replyList != null && replyList.size() >0){
				for(Reply _reply : replyList){
					//如果是话题发布者的回复，则不发本类型提醒给话题的发布者
					if(topic != null && !topic.getIsStaff() && _reply.getUserName().equals(topic.getUserName())){
						continue;
					}
					//如果是评论发布者的回复，则不发本类型提醒给评论的发布者
					if(!comment.getIsStaff() && _reply.getUserName().equals(comment.getUserName())){
						continue;
					}
					//员工的回复不发提醒
					if(_reply.getIsStaff()){
						continue;
					}
					
					//如果是自己的回复，则不发本类型提醒给自己
					if(_reply.getUserName().equals(accessUser.getUserName())){
						continue;
					}

					//如果同一个用户有多条回复,只发一条提醒
					if(userNameList.contains(_reply.getUserName())){
						continue;
					}
					
					
					userNameList.add(_reply.getUserName());
					
					_user = userManage.query_cache_findUserByUserName(_reply.getUserName());
					
					//提醒
					Remind remind = new Remind();
					remind.setId(remindManage.createRemindId(_user.getId()));
					remind.setReceiverUserId(_user.getId());//接收提醒用户Id
					remind.setSenderUserId(accessUser.getUserId());//发送用户Id
					remind.setTypeCode(50);//50:别人回复了我回复过的评论
					remind.setSendTimeFormat(postTime.getTime());//发送时间格式化
					remind.setTopicId(_reply.getTopicId());//话题Id
					remind.setTopicReplyId(_reply.getId());//我的话题回复Id
					
					
					remind.setFriendTopicCommentId(comment.getId());//对方的话题评论Id
					remind.setFriendTopicReplyId(reply.getId());//对方的话题回复Id
					
					
					Object remind_object = remindManage.createRemindObject(remind);
					remindService.saveRemind(remind_object);
					
					//删除提醒缓存
					remindManage.delete_cache_findUnreadRemindByUserId(_user.getId());
				}
			}
			
			
			
			
			//统计每分钟原来提交次数
			Integer original = settingManage.getSubmitQuantity("comment", accessUser.getUserName());
    		if(original != null){
    			settingManage.addSubmitQuantity("comment", accessUser.getUserName(),original+1);//刷新每分钟原来提交次数
    		}else{
    			settingManage.addSubmitQuantity("comment", accessUser.getUserName(),1);//刷新每分钟原来提交次数
    		}
		}
		
		
		Map<String,String> returnError = new HashMap<String,String>();//错误
		if(error.size() >0){
			//将枚举数据转为错误提示字符
    		for (Map.Entry<String,String> entry : error.entrySet()) {		 
    			if(ErrorView.get(entry.getValue()) != null){
    				returnError.put(entry.getKey(),  ErrorView.get(entry.getValue()));
    			}else{
    				returnError.put(entry.getKey(),  entry.getValue());
    			}
			}
		}
		if(isAjax == true){
    		Map<String,Object> returnValue = new HashMap<String,Object>();//返回值
    		
    		if(error != null && error.size() >0){
    			returnValue.put("success", "false");
    			returnValue.put("error", returnError);
    			if(isCaptcha){
    				returnValue.put("captchaKey", UUIDUtil.getUUID32());
    			}
    		}else{
    			returnValue.put("success", "true");
    		}
    		WebUtil.writeToWeb(JsonUtils.toJSONString(returnValue), "json", response);
			return null;
		}else{
			if(error != null && error.size() >0){//如果有错误
				redirectAttrs.addFlashAttribute("error", returnError);//重定向传参
				redirectAttrs.addFlashAttribute("reply", reply);
				

				String referer = request.getHeader("referer");	
				
				
				referer = StringUtils.removeStartIgnoreCase(referer,Configuration.getUrl(request));//移除开始部分的相同的字符,不区分大小写
				referer = StringUtils.substringBefore(referer, ".");//截取到等于第二个参数的字符串为止
				referer = StringUtils.substringBefore(referer, "?");//截取到等于第二个参数的字符串为止
				
				String queryString = request.getQueryString() != null && !"".equals(request.getQueryString().trim()) ? "?"+request.getQueryString() :"";
				return "redirect:/"+referer+queryString;
	
			}
			
			
			if(jumpUrl != null && !"".equals(jumpUrl.trim())){
				String url = Base64.decodeBase64URL(jumpUrl.trim());
				
				return "redirect:"+url;
			}else{//默认跳转
				model.addAttribute("message", "保存回复成功");
				String referer = request.getHeader("referer");
				if(RefererCompare.compare(request, "login")){//如果是登录页面则跳转到首页
					referer = Configuration.getUrl(request);
				}
				model.addAttribute("urlAddress", referer);
				String dirName = templateService.findTemplateDir_cache();
				
				return "templates/"+dirName+"/"+accessSourceDeviceManage.accessDevices(request)+"/jump";	
			}
		}
	}
	
}
