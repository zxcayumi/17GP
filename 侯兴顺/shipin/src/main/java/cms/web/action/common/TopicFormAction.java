package cms.web.action.common;



import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
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
import cms.bean.thumbnail.Thumbnail;
import cms.bean.topic.ImageInfo;
import cms.bean.topic.Tag;
import cms.bean.topic.Topic;
import cms.bean.topic.TopicIndex;
import cms.bean.user.AccessUser;
import cms.bean.user.PointLog;
import cms.bean.user.ResourceEnum;
import cms.bean.user.User;
import cms.bean.user.UserDynamic;
import cms.bean.user.UserGrade;
import cms.service.message.RemindService;
import cms.service.setting.SettingService;
import cms.service.template.TemplateService;
import cms.service.thumbnail.ThumbnailService;
import cms.service.topic.CommentService;
import cms.service.topic.TagService;
import cms.service.topic.TopicIndexService;
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
import cms.web.action.user.UserDynamicManage;
import cms.web.action.user.UserManage;
import cms.web.action.user.UserRoleManage;
import cms.web.taglib.Configuration;

/**
 * 话题接收表单
 *
 */
@Controller
@RequestMapping("user/control/topic") 
public class TopicFormAction {
	@Resource TemplateService templateService;
	
	@Resource CaptchaManage captchaManage;
	@Resource CommentService commentService;
	@Resource AccessSourceDeviceManage accessSourceDeviceManage;
	
	@Resource TextFilterManage textFilterManage;
	@Resource SettingManage settingManage;
	@Resource SettingService settingService;
	@Resource UserService userService;
	@Resource TopicService topicService;
	@Resource TagService tagService;

	@Resource TopicIndexService topicIndexService;

	@Resource CSRFTokenManage csrfTokenManage;
	@Resource TopicManage topicManage;
	@Resource SensitiveWordFilterManage sensitiveWordFilterManage;
	@Resource ThumbnailService thumbnailService;
	@Resource UserManage userManage;
	
	@Resource RemindService remindService;
	@Resource RemindManage remindManage;
	@Resource FileManage fileManage;
	@Resource UserDynamicManage userDynamicManage;
	@Resource FollowManage followManage;
	
	@Resource UserRoleManage userRoleManage;

	
	/**
	 * 话题  添加
	 * @param model
	 * @param tagId 标签Id
	 * @param title 标题
	 * @param content 内容
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(ModelMap model,Long tagId,String title,String content,
			String token,String captchaKey,String captchaValue,String jumpUrl,
			RedirectAttributes redirectAttrs,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		//获取登录用户
	  	AccessUser accessUser = AccessUserThreadLocal.get();
		
		boolean isAjax = WebUtil.submitDataMode(request);//是否以Ajax方式提交数据
		
		
		if(tagId != null){
			//是否有当前功能操作权限
			boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1002000,tagId);
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
		boolean isCaptcha = captchaManage.topic_isCaptcha(accessUser.getUserName());
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
		
		SystemSetting systemSetting = settingService.findSystemSetting_cache();
		
		
		//如果全局不允许提交话题
		if(systemSetting.isAllowTopic() == false){
			error.put("topic", ErrorView._110.name());//不允许提交话题
		}

		//前3张图片地址
		List<ImageInfo> beforeImageList = new ArrayList<ImageInfo>();
				
		
		Topic topic = new Topic();
		Date d = new Date();
		topic.setPostTime(d);
		topic.setLastReplyTime(d);
		
		
		List<String> imageNameList = null;
		boolean isImage = false;//是否含有图片
		List<String> flashNameList = null;
		boolean isFlash = false;//是否含有Flash
		List<String> mediaNameList = null;
		boolean isMedia = false;//是否含有音视频
		List<String> fileNameList = null;
		boolean isFile = false;//是否含有文件
		boolean isMap = false;//是否含有地图
		
		
		//前台发表话题审核状态
		if(systemSetting.getTopic_review().equals(10)){//10.全部审核 20.特权会员未触发敏感词免审核(未实现)  40.触发敏感词需审核(未实现) 50.无需审核
			topic.setStatus(10);//10.待审核 	
		}else{
			topic.setStatus(20);//20.已发布
		}
		
		
		if(tagId == null || tagId <=0L){
			error.put("tagId", "标签不能为空");
		}else{
			List<Tag> tagList = tagService.findAllTag_cache();
			if(tagList != null && tagList.size() >0){
				for(Tag tag : tagList){
					if(tag.getId().equals(tagId)){
						topic.setTagId(tag.getId());
						topic.setTagName(tag.getName());
						break;
					}
					
				}
				if(topic.getTagId() == null){
					error.put("tagId", "标签不存在");
				}
			}
		}
		if(title != null && !"".equals(title.trim())){
			if(systemSetting.isAllowFilterWord()){
				String wordReplace = "";
				if(systemSetting.getFilterWordReplace() != null){
					wordReplace = systemSetting.getFilterWordReplace();
				}
				title = sensitiveWordFilterManage.filterSensitiveWord(title, wordReplace);
			}
			
			topic.setTitle(title);
			if(title.length() >150){
				error.put("title", "不能大于150个字符");
			}
		}else{
			error.put("title", "标题不能为空");
		}
		
		
		if(content != null && !"".equals(content.trim())){
			
		//	content = "<div style=\"text-align: center; height: expression(alert('test &ss')); while: expression(alert('test xss'));\">fdfd</div>";
		//	content = "<img src=\"java script:alert(/XSS/)\" width = 100>";
		//	content = "<div style=\"background-image: url(javasc \n\t ript:alert('XSS'))\">";
		//	content = "<img src=\"java\nscript:alert(/XSS/)\" width = 100>";
			
		//	content = "<div style=\"background-color: #123456;color: expr\65ssion(alert('testss'));\"><a href=\"javascript:alert('XSS');\"><a href=\"http://127.0.0.1:8080/cms/javascript:alert('XSS');\"><a href=\"aaa/ggh.htm\">";
			
		//	content = "<div style=\"background-image: url(javascript:alert('XSS'));background-image: url(javascript&colon;alert('XSSW'));width: expression(alert&#40;'testxss'));\">";
		//	content = "<div style=\"background-image: url(javasc\n\tript:alert('XSS'))\">";
			
		//	content = "<div style=\"color:express/**/ion(eval('\\x69\\x66\\x28\\x77\\x69\\x6e\\x64\\x6f\\x77\\x2e\\x61\\x21\\x3d\\x31\\x29\\x7b\\x61\\x6c\\x65\\x72\\x74\\x28\\x2f\\x73\\x74\\x79\\x6c\\x65\\x5f\\x38\\x2f\\x29\\x3b\\x77\\x69\\x6e\\x64\\x6f\\x77\\x2e\\x61\\x3d\\x31\\x3b\\x7d'))\">";
			
			EditorTag editorTag = settingManage.readTopicEditorTag();
			//过滤标签
			content = textFilterManage.filterTag(request,content,editorTag);
			Object[] object = textFilterManage.filterHtml(request,content,"topic",editorTag);
			String value = (String)object[0];
			imageNameList = (List<String>)object[1];
			isImage = (Boolean)object[2];//是否含有图片
			flashNameList = (List<String>)object[3];
			isFlash = (Boolean)object[4];//是否含有Flash
			mediaNameList = (List<String>)object[5];
			isMedia = (Boolean)object[6];//是否含有音视频
			fileNameList = (List<String>)object[7];
			isFile = (Boolean)object[8];//是否含有文件
			isMap = (Boolean)object[9];//是否含有地图
			

			if(editorTag.isHideComment()){
				//是否有当前功能操作权限
				boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1021000,topic.getTagId());
			}


			//摘要

			//不含标签内容
			String source_text = textFilterManage.filterText(content);
			//清除空格&nbsp;
			String source_trimSpace = cms.utils.StringUtil.replaceSpace(source_text).trim();
			
			if(isImage == true || isFlash == true || isMedia == true || isFile==true ||isMap== true || (!"".equals(source_text.trim()) && !"".equals(source_trimSpace))){
				if(systemSetting.isAllowFilterWord()){
					String wordReplace = "";
					if(systemSetting.getFilterWordReplace() != null){
						wordReplace = systemSetting.getFilterWordReplace();
					}
				}
				
				
				
				
				topic.setIp(IpAddress.getClientIpAddress(request));
				topic.setUserName(accessUser.getUserName());
				topic.setIsStaff(false);
			}else{
				error.put("content", "话题内容不能为空");
			}	
			
			
			//非隐藏标签内图片
//			List<String> other_imageNameList = textFilterManage.readImageName(new_content,"topic");

//			if(other_imageNameList != null && other_imageNameList.size() >0){
//				for(int i=0; i<other_imageNameList.size(); i++){
//					ImageInfo imageInfo = new ImageInfo();
//					imageInfo.setName(FileUtil.getName(other_imageNameList.get(i)));
//					imageInfo.setPath(FileUtil.getFullPath(other_imageNameList.get(i)));
//
//					beforeImageList.add(imageInfo);
//
//					if(i ==2){//只添加3张图片
//						break;
//					}
//				}
//				topic.setImage(JsonUtils.toJSONString(beforeImageList));
//
//			}
		}else{
			error.put("content", "话题内容不能为空");
		}
		
		
		
			
		if(error.size() == 0){
			//保存评论
			topicService.saveTopic(topic);
			//更新索引
			topicIndexService.addTopicIndex(new TopicIndex(String.valueOf(topic.getId()),1));
			
			PointLog pointLog = new PointLog();
			pointLog.setModule(100);//100.话题
			pointLog.setParameterId(topic.getId());//参数Id 
			pointLog.setOperationUserType(2);//操作用户类型  0:系统  1: 员工  2:会员
			pointLog.setOperationUserName(accessUser.getUserName());//操作用户名称
			
			pointLog.setPoint(systemSetting.getTopic_rewardPoint());//积分
			pointLog.setUserName(accessUser.getUserName());//用户名称
			pointLog.setRemark("");
			//增加用户积分

			
			//用户动态
			UserDynamic userDynamic = new UserDynamic();
			userDynamic.setId(userDynamicManage.createUserDynamicId(accessUser.getUserId()));
			userDynamic.setUserName(accessUser.getUserName());
			userDynamic.setModule(100);//模块 100.话题
			userDynamic.setTopicId(topic.getId());
			userDynamic.setPostTime(topic.getPostTime());
			userDynamic.setStatus(topic.getStatus());
			userDynamic.setFunctionIdGroup(","+topic.getId()+",");
			Object new_userDynamic = userDynamicManage.createUserDynamicObject(userDynamic);
			userService.saveUserDynamic(new_userDynamic);

			
			//删除缓存
			userManage.delete_cache_findUserById(accessUser.getUserId());
			userManage.delete_cache_findUserByUserName(accessUser.getUserName());
			followManage.delete_cache_userUpdateFlag(accessUser.getUserName());
			topicManage.delete_cache_markUpdateTopicStatus(topic.getId());//删除 标记修改话题状态
			String fileNumber = "b"+ accessUser.getUserId();
			
			//删除图片锁
			if(imageNameList != null && imageNameList.size() >0){
				for(String imageName :imageNameList){
			
					 if(imageName != null && !"".equals(imageName.trim())){
						//如果验证不是当前用户上传的文件，则不删除锁
						 if(!topicManage.getFileNumber(FileUtil.getBaseName(imageName.trim())).equals(fileNumber)){
							 continue;
						 }
						 
						 
						 fileManage.deleteLock("file"+File.separator+"topic"+File.separator+"lock"+File.separator,imageName.replaceAll("/","_"));
					
					 }
				}
			}
			//falsh
			if(flashNameList != null && flashNameList.size() >0){
				for(String flashName :flashNameList){
					 if(flashName != null && !"".equals(flashName.trim())){
						//如果验证不是当前用户上传的文件，则不删除锁
						if(!topicManage.getFileNumber(FileUtil.getBaseName(flashName.trim())).equals(fileNumber)){
							continue;
						}
						fileManage.deleteLock("file"+File.separator+"topic"+File.separator+"lock"+File.separator,flashName.replaceAll("/","_"));
					
					 }
				}
			}
			//音视频
			if(mediaNameList != null && mediaNameList.size() >0){
				for(String mediaName :mediaNameList){
					if(mediaName != null && !"".equals(mediaName.trim())){
						//如果验证不是当前用户上传的文件，则不删除锁
						if(!topicManage.getFileNumber(FileUtil.getBaseName(mediaName.trim())).equals(fileNumber)){
							continue;
						}
						fileManage.deleteLock("file"+File.separator+"topic"+File.separator+"lock"+File.separator,mediaName.replaceAll("/","_"));
					
					}
				}
			}
			//文件
			if(fileNameList != null && fileNameList.size() >0){
				for(String fileName :fileNameList){
					if(fileName != null && !"".equals(fileName.trim())){
						//如果验证不是当前用户上传的文件，则不删除锁
						if(!topicManage.getFileNumber(FileUtil.getBaseName(fileName.trim())).equals(fileNumber)){
							continue;
						}
						fileManage.deleteLock("file"+File.separator+"topic"+File.separator+"lock"+File.separator,fileName.replaceAll("/","_"));
					
					}
				}
			}
			
			List<Thumbnail> thumbnailList = thumbnailService.findAllThumbnail_cache();
			if(thumbnailList != null && thumbnailList.size() >0){
				//异步增加缩略图
				if(beforeImageList != null && beforeImageList.size() >0){
					fileManage.addThumbnail(thumbnailList,beforeImageList);
				}
			}
			
			//统计每分钟原来提交次数
			Integer original = settingManage.getSubmitQuantity("topic", accessUser.getUserName());
    		if(original != null){
    			settingManage.addSubmitQuantity("topic", accessUser.getUserName(),original+1);//刷新每分钟原来提交次数
    		}else{
    			settingManage.addSubmitQuantity("topic", accessUser.getUserName(),1);//刷新每分钟原来提交次数
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
				redirectAttrs.addFlashAttribute("topic", topic);
				

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
				model.addAttribute("message", "保存话题成功");
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
	 * 话题  修改
	 * @param model
	 * @param topicId 话题Id
	 * @param title 标题
	 * @param content 内容
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(ModelMap model,Long topicId,String title,String content,
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
		boolean isCaptcha = captchaManage.topic_isCaptcha(accessUser.getUserName());
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
		SystemSetting systemSetting = settingService.findSystemSetting_cache();
		
		//旧前3张图片地址
		List<ImageInfo> oldBeforeImageList = new ArrayList<ImageInfo>();
		//前3张图片地址
		List<ImageInfo> beforeImageList = new ArrayList<ImageInfo>();

		List<String> oldPathFileList = new ArrayList<String>();//旧路径文件
		
		
		Topic topic = null;
		//旧状态
		Integer old_status = -1;
		
		String old_content = "";
		
		List<String> imageNameList = null;
		boolean isImage = false;//是否含有图片
		List<String> flashNameList = null;
		boolean isFlash = false;//是否含有Flash
		List<String> mediaNameList = null;
		boolean isMedia = false;//是否含有音视频
		List<String> fileNameList = null;
		boolean isFile = false;//是否含有文件
		boolean isMap = false;//是否含有地图
		
		
		if(topicId != null && topicId >0L){
			topic = topicService.findById(topicId);
			if(topic != null){
				if(!topic.getUserName().equals(accessUser.getUserName())){
					error.put("topic", ErrorView._113.name());//只允许修改自己发布的话题
				}
				if(topic.getStatus() > 100){
					error.put("topic", ErrorView._114.name());//话题已删除
				}
				
				//是否有当前功能操作权限
				boolean flag_permission = userRoleManage.isPermission(ResourceEnum._1003000,topic.getTagId());
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
				
				
				
				
				
				
				//如果全局不允许提交话题
				if(systemSetting.isAllowTopic() == false){
					error.put("topic", ErrorView._110.name());//不允许提交话题
				}
				
				//如果实名用户才允许提交话题
				if(systemSetting.isRealNameUserAllowTopic() == true){
					User _user = userManage.query_cache_findUserByUserName(accessUser.getUserName());
					if(_user.isRealNameAuthentication() == false){
						error.put("topic", ErrorView._109.name());//实名用户才允许提交话题
					}
					
				}
				
				old_status = topic.getStatus();
				old_content = topic.getContent();
				if(topic.getImage() != null && !"".equals(topic.getImage().trim())){
					oldBeforeImageList = JsonUtils.toGenericObject(topic.getImage().trim(),new TypeReference< List<ImageInfo> >(){});
				}
				
				
			}else{
				error.put("topic", ErrorView._112.name());//话题不存在
			}
		
		}else{
			error.put("topic", ErrorView._103.name());//话题Id不能为空
		}
		
		
		if(error.size() ==0){
			if(topic.getStatus().equals(20)){//如果已发布，则重新执行发贴审核逻辑
				//前台发表话题审核状态
				if(systemSetting.getTopic_review().equals(10)){//10.全部审核 20.特权会员未触发敏感词免审核(未实现) 30.特权会员免审核 40.触发敏感词需审核(未实现) 50.无需审核
					topic.setStatus(10);//10.待审核 	
				}else if(systemSetting.getTopic_review().equals(30)){
					if(topic.getTagId() != null && topic.getTagId() >0L){
						//是否有当前功能操作权限
						boolean _flag_permission = userRoleManage.isPermission(ResourceEnum._1006000,topic.getTagId());
						if(_flag_permission){
							topic.setStatus(20);//20.已发布
						}else{
							topic.setStatus(10);//10.待审核 
						}
					}
				}else{
					topic.setStatus(20);//20.已发布
				}
			}
			
			

			if(title != null && !"".equals(title.trim())){
				if(systemSetting.isAllowFilterWord()){
					String wordReplace = "";
					if(systemSetting.getFilterWordReplace() != null){
						wordReplace = systemSetting.getFilterWordReplace();
					}
					title = sensitiveWordFilterManage.filterSensitiveWord(title, wordReplace);
				}
				
				topic.setTitle(title);
				if(title.length() >150){
					error.put("title", "不能大于150个字符");
				}
			}else{
				error.put("title", "标题不能为空");
			}
			
			if(content != null && !"".equals(content.trim())){
				EditorTag editorTag = settingManage.readTopicEditorTag();
				//过滤标签
				content = textFilterManage.filterTag(request,content,editorTag);
				Object[] object = textFilterManage.filterHtml(request,content,"topic",editorTag);
				String value = (String)object[0];
				imageNameList = (List<String>)object[1];
				isImage = (Boolean)object[2];//是否含有图片
				flashNameList = (List<String>)object[3];
				isFlash = (Boolean)object[4];//是否含有Flash
				mediaNameList = (List<String>)object[5];
				isMedia = (Boolean)object[6];//是否含有音视频
				fileNameList = (List<String>)object[7];
				isFile = (Boolean)object[8];//是否含有文件
				isMap = (Boolean)object[9];//是否含有地图
				
//				List<UserGrade> userGradeList = userGradeService.findAllGrade_cache();
				//校正隐藏标签
//				String validValue =  textFilterManage.correctionHiddenTag(value,userGradeList);
				
				//允许使用的隐藏标签
//				List<Integer> allowHiddenTagList = new ArrayList<Integer>();
//				if(editorTag.isHidePassword()){
//					//是否有当前功能操作权限
//					boolean _flag_permission = userRoleManage.isPermission(ResourceEnum._1020000,topic.getTagId());
//					if(_flag_permission){
//						//输入密码可见
//						allowHiddenTagList.add(HideTagType.PASSWORD.getName());
//					}
//				}
//				if(editorTag.isHideComment()){
//					//是否有当前功能操作权限
//					boolean _flag_permission = userRoleManage.isPermission(ResourceEnum._1021000,topic.getTagId());
//					if(_flag_permission){
//						//评论话题可见
//						allowHiddenTagList.add(HideTagType.COMMENT.getName());
//					}
//				}
//				if(editorTag.isHideGrade()){
//					//是否有当前功能操作权限
//					boolean _flag_permission = userRoleManage.isPermission(ResourceEnum._1022000,topic.getTagId());
//					if(_flag_permission){
//						//达到等级可见
//						allowHiddenTagList.add(HideTagType.GRADE.getName());
//					}
//				}
//				if(editorTag.isHidePoint()){
//					//是否有当前功能操作权限
//					boolean _flag_permission = userRoleManage.isPermission(ResourceEnum._1023000,topic.getTagId());
//					if(_flag_permission){
//						//积分购买可见
//						allowHiddenTagList.add(HideTagType.POINT.getName());
//					}
//				}
//				if(editorTag.isHideAmount()){
//					//是否有当前功能操作权限
//					boolean _flag_permission = userRoleManage.isPermission(ResourceEnum._1024000,topic.getTagId());
//					if(_flag_permission){
//						//余额购买可见
//						allowHiddenTagList.add(HideTagType.AMOUNT.getName());
//					}
//
//
//				}

				//解析隐藏标签
//				Map<Integer,Object> analysisHiddenTagMap = textFilterManage.analysisHiddenTag(validValue);
//				for (Map.Entry<Integer,Object> entry : analysisHiddenTagMap.entrySet()) {
//					if(!allowHiddenTagList.contains(entry.getKey())){
//						error.put("content", "发表话题不允许使用 '"+HideTagName.getKey(entry.getKey())+"' 隐藏标签");//隐藏标签
//						break;
//					}
//				}
				
				//删除隐藏标签
				String new_content = textFilterManage.deleteHiddenTag(value);

				//不含标签内容
				String text = textFilterManage.filterText(new_content);
				//清除空格&nbsp;
				String trimSpace = cms.utils.StringUtil.replaceSpace(text).trim();
				//摘要
				if(trimSpace != null && !"".equals(trimSpace)){
					if(systemSetting.isAllowFilterWord()){
						String wordReplace = "";
						if(systemSetting.getFilterWordReplace() != null){
							wordReplace = systemSetting.getFilterWordReplace();
						}
						trimSpace = sensitiveWordFilterManage.filterSensitiveWord(trimSpace, wordReplace);
					}
					if(trimSpace.length() >180){
						topic.setSummary(trimSpace.substring(0, 180)+"..");
					}else{
						topic.setSummary(trimSpace+"..");
					}
				}
				
				//不含标签内容
				String source_text = textFilterManage.filterText(content);
				//清除空格&nbsp;
				String source_trimSpace = cms.utils.StringUtil.replaceSpace(source_text).trim();
				
				if(isImage == true || isFlash == true || isMedia == true || isFile==true ||isMap== true || (!"".equals(source_text.trim()) && !"".equals(source_trimSpace))){
					if(systemSetting.isAllowFilterWord()){
						String wordReplace = "";
						if(systemSetting.getFilterWordReplace() != null){
							wordReplace = systemSetting.getFilterWordReplace();
						}
//						validValue = sensitiveWordFilterManage.filterSensitiveWord(validValue, wordReplace);
					}
//					topic.setContent(validValue);
				}else{
					error.put("content", "话题内容不能为空");
				}	
				
				
				//非隐藏标签内图片
				List<String> other_imageNameList = textFilterManage.readImageName(new_content,"topic");
				
				if(other_imageNameList != null && other_imageNameList.size() >0){
					for(int i=0; i<other_imageNameList.size(); i++){
						ImageInfo imageInfo = new ImageInfo();
						imageInfo.setName(FileUtil.getName(other_imageNameList.get(i)));
						imageInfo.setPath(FileUtil.getFullPath(other_imageNameList.get(i)));
						
						beforeImageList.add(imageInfo);
						
						if(i ==2){//只添加3张图片
							break;
						}
					}
					topic.setImage(JsonUtils.toJSONString(beforeImageList));
					
				}
			}else{
				error.put("content", "话题内容不能为空");
			}
		}
		
		
		
		
		
		
		if(error.size() == 0){
			topic.setLastUpdateTime(new Date());//最后修改时间
			int i = topicService.updateTopic2(topic);
			//更新索引
			topicIndexService.addTopicIndex(new TopicIndex(String.valueOf(topic.getId()),2));
			
			if(i >0 && topic.getStatus() < 100 && !old_status.equals(topic.getStatus())){
				User user = userManage.query_cache_findUserByUserName(topic.getUserName());
				if(user != null){
					//修改用户动态话题状态
					userService.updateUserDynamicTopicStatus(user.getId(),topic.getUserName(),topic.getId(),topic.getStatus());
				}
				
			}
			 
			if(i >0){
				//删除缓存
				topicManage.deleteTopicCache(topic.getId());//删除话题缓存
//				topicManage.delete_cache_analysisHiddenTag(topic.getId());//删除解析隐藏标签缓存
				topicManage.delete_cache_analysisFullFileName(topic.getId());//删除 解析上传的文件完整路径名称缓存
				topicManage.delete_cache_markUpdateTopicStatus(topic.getId());//删除 标记修改话题状态
				Object[] obj = textFilterManage.readPathName(old_content,"topic");
				if(obj != null && obj.length >0){
					//旧图片
					List<String> old_imageNameList = (List<String>)obj[0];
					
					if(old_imageNameList != null && old_imageNameList.size() >0){
						
				        Iterator<String> iter = old_imageNameList.iterator();
				        while (iter.hasNext()) {
				        	String imageName = iter.next();  
				        	
							for(String new_imageName : imageNameList){
								if(imageName.equals("file/topic/"+new_imageName)){
									iter.remove();
									break;
								}
							}
						}
						if(old_imageNameList != null && old_imageNameList.size() >0){
							for(String imageName : old_imageNameList){
								
								oldPathFileList.add(FileUtil.toSystemPath(imageName));
		
							}
							
						}
					}
					
					//旧Flash
					List<String> old_flashNameList = (List<String>)obj[1];		
					if(old_flashNameList != null && old_flashNameList.size() >0){		
				        Iterator<String> iter = old_flashNameList.iterator();
				        while (iter.hasNext()) {
				        	String flashName = iter.next();  
							for(String new_flashName : flashNameList){
								if(flashName.equals("file/topic/"+new_flashName)){
									iter.remove();
									break;
								}
							}
						}
						if(old_flashNameList != null && old_flashNameList.size() >0){
							for(String flashName : old_flashNameList){
								oldPathFileList.add(FileUtil.toSystemPath(flashName));
								
							}
							
						}
					}

					//旧影音
					List<String> old_mediaNameList = (List<String>)obj[2];	
					if(old_mediaNameList != null && old_mediaNameList.size() >0){		
				        Iterator<String> iter = old_mediaNameList.iterator();
				        while (iter.hasNext()) {
				        	String mediaName = iter.next();  
							for(String new_mediaName : mediaNameList){
								if(mediaName.equals("file/topic/"+new_mediaName)){
									iter.remove();
									break;
								}
							}
						}
						if(old_mediaNameList != null && old_mediaNameList.size() >0){
							for(String mediaName : old_mediaNameList){
								oldPathFileList.add(FileUtil.toSystemPath(mediaName));
								
							}
							
						}
					}
					
					//旧文件
					List<String> old_fileNameList = (List<String>)obj[3];		
					if(old_fileNameList != null && old_fileNameList.size() >0){		
				        Iterator<String> iter = old_fileNameList.iterator();
				        while (iter.hasNext()) {
				        	String fileName = iter.next();  
							for(String new_fileName : fileNameList){
								if(fileName.equals("file/topic/"+new_fileName)){
									iter.remove();
									break;
								}
							}
						}
						if(old_fileNameList != null && old_fileNameList.size() >0){
							for(String fileName : old_fileNameList){
								oldPathFileList.add(FileUtil.toSystemPath(fileName));
								
							}
							
						}
					}
				}
				
				
				List<Thumbnail> thumbnailList = thumbnailService.findAllThumbnail_cache();
				if(thumbnailList != null && thumbnailList.size() >0){
					
					
					if(oldBeforeImageList != null && oldBeforeImageList.size() >0){
						List<ImageInfo> deleteBeforeImageList = new ArrayList<ImageInfo>();
						A:for(ImageInfo oldImageInfo : oldBeforeImageList){
							if(beforeImageList != null && beforeImageList.size() >0){
								for(ImageInfo imageInfo : beforeImageList){
									if(oldImageInfo.getName().equals(imageInfo.getName())){
										continue A;
									}
								}
							}
							deleteBeforeImageList.add(oldImageInfo);
						}
						if(deleteBeforeImageList != null && deleteBeforeImageList.size() >0){
							//删除旧缩略图
							fileManage.deleteThumbnail(thumbnailList,oldBeforeImageList);
						}
					}
					
					//异步增加缩略图
					if(beforeImageList != null && beforeImageList.size() >0){
						fileManage.addThumbnail(thumbnailList,beforeImageList);
					}
				}
				
				//上传文件编号
				String fileNumber = topicManage.generateFileNumber(topic.getUserName(), topic.getIsStaff());
				
				//删除图片锁
				if(imageNameList != null && imageNameList.size() >0){
					for(String imageName :imageNameList){
				
						 if(imageName != null && !"".equals(imageName.trim())){
							 //如果验证不是当前用户上传的文件，则不删除
							 if(!topicManage.getFileNumber(FileUtil.getBaseName(imageName.trim())).equals(fileNumber)){
									continue;
							 }
							 fileManage.deleteLock("file"+File.separator+"topic"+File.separator+"lock"+File.separator,imageName.replaceAll("/","_"));
		
						 }
					}
				}
				//删除Falsh锁
				if(flashNameList != null && flashNameList.size() >0){
					for(String flashName :flashNameList){
						 
						 if(flashName != null && !"".equals(flashName.trim())){
							 //如果验证不是当前用户上传的文件，则不删除
							 if(!topicManage.getFileNumber(FileUtil.getBaseName(flashName.trim())).equals(fileNumber)){
									continue;
							 }
							 fileManage.deleteLock("file"+File.separator+"topic"+File.separator+"lock"+File.separator,flashName.replaceAll("/","_"));
			
						 }
					}
				}
				//删除音视频锁
				if(mediaNameList != null && mediaNameList.size() >0){
					for(String mediaName :mediaNameList){
						if(mediaName != null && !"".equals(mediaName.trim())){
							//如果验证不是当前用户上传的文件，则不删除
							if(!topicManage.getFileNumber(FileUtil.getBaseName(mediaName.trim())).equals(fileNumber)){
								continue;
							}
							fileManage.deleteLock("file"+File.separator+"topic"+File.separator+"lock"+File.separator,mediaName.replaceAll("/","_"));
						
						}
					}
				}
				//删除文件锁
				if(fileNameList != null && fileNameList.size() >0){
					for(String fileName :fileNameList){
						if(fileName != null && !"".equals(fileName.trim())){
							//如果验证不是当前用户上传的文件，则不删除
							if(!topicManage.getFileNumber(FileUtil.getBaseName(fileName.trim())).equals(fileNumber)){
								continue;
							}
							fileManage.deleteLock("file"+File.separator+"topic"+File.separator+"lock"+File.separator,fileName.replaceAll("/","_"));
						
						}
					}
				}
				
				//删除旧路径文件
				if(oldPathFileList != null && oldPathFileList.size() >0){
					for(String oldPathFile :oldPathFileList){
						
						//如果验证不是当前用户上传的文件，则不删除
						if(!topicManage.getFileNumber(FileUtil.getBaseName(oldPathFile.trim())).equals(fileNumber)){
							continue;
						}
						
						
						//替换路径中的..号
						oldPathFile = FileUtil.toRelativePath(oldPathFile);
						
						//删除旧路径文件
						Boolean state = fileManage.deleteFile(oldPathFile);
						if(state != null && state == false){

							//替换指定的字符，只替换第一次出现的
							oldPathFile = StringUtils.replaceOnce(oldPathFile, "file"+File.separator+"topic"+File.separator, "");
							oldPathFile = StringUtils.replace(oldPathFile, File.separator, "_");//替换所有出现过的字符
							
							//创建删除失败文件
							fileManage.failedStateFile("file"+File.separator+"topic"+File.separator+"lock"+File.separator+oldPathFile);
						}
					}
				}

			}else{
				error.put("topic", ErrorView._115.name());//修改话题失败
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
				redirectAttrs.addFlashAttribute("topic", topic);
				

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
				model.addAttribute("message", "修改话题成功");
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
	 * 文件上传
	 * dir: 上传类型，分别为image、file、media
	 * 
	 * 员工发话题 上传文件名为UUID + a + 员工Id
	 * 用户发话题 上传文件名为UUID + b + 用户Id
	 */
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	@ResponseBody//方式来做ajax,直接返回字符串
	public String upload(ModelMap model,String dir,
			MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String,Object> returnJson = new HashMap<String,Object>();
		SystemSetting systemSetting = settingService.findSystemSetting_cache();
		String errorMessage  = "";
		
		//获取登录用户
	  	AccessUser accessUser = AccessUserThreadLocal.get();
		boolean flag = true;
		
		//如果全局不允许提交话题
		if(systemSetting.isAllowTopic() == false){
			flag = false;
		}
		
		//如果实名用户才允许提交话题
		if(systemSetting.isRealNameUserAllowTopic() == true){
			User _user = userManage.query_cache_findUserByUserName(accessUser.getUserName());
			if(_user.isRealNameAuthentication() == false){
				flag = false;
			}
		}
		
		if(flag){
			DateTime dateTime = new DateTime();     
			String date = dateTime.toString("yyyy-MM-dd");

			if(file != null && !file.isEmpty()){
				EditorTag editorSiteObject = settingManage.readTopicEditorTag();
				if(editorSiteObject != null){
					if(dir.equals("image")){
						//是否有当前功能操作权限
						boolean flag_permission = userRoleManage.isPermission(ResourceEnum._2002000,null);
						if(flag_permission){
							if(editorSiteObject.isImage()){//允许上传图片
								//上传文件编号
								String fileNumber = "b"+accessUser.getUserId();
								
								//当前文件名称
								String fileName = file.getOriginalFilename();
								
								//文件大小
								Long size = file.getSize();
								//取得文件后缀
								String suffix = FileUtil.getExtension(fileName).toLowerCase();
								
								//允许上传图片格式
								List<String> imageFormat = editorSiteObject.getImageFormat();
								//允许上传图片大小
								long imageSize = editorSiteObject.getImageSize();
								
								//验证文件类型
								boolean authentication = FileUtil.validateFileSuffix(file.getOriginalFilename(),imageFormat);
								
								if(authentication ){
									if(size/1024 <= imageSize){
										//文件保存目录;分多目录主要是为了分散图片目录,提高检索速度
										String pathDir = "file"+File.separator+"topic"+File.separator + date +File.separator +"image"+ File.separator;
										//文件锁目录
										String lockPathDir = "file"+File.separator+"topic"+File.separator+"lock"+File.separator;
										//构建文件名称
										String newFileName = UUIDUtil.getUUID32()+ fileNumber+"." + suffix;
										
										//生成文件保存目录
										fileManage.createFolder(pathDir);
										//生成锁文件保存目录
										fileManage.createFolder(lockPathDir);
										//生成锁文件
										fileManage.addLock(lockPathDir,date +"_image_"+newFileName);
										//保存文件
										fileManage.writeFile(pathDir, newFileName,file.getBytes());
										//上传成功
										returnJson.put("error", 0);//0成功  1错误
										returnJson.put("url", "file/topic/"+date+"/image/"+newFileName);
										return JsonUtils.toJSONString(returnJson);
									}else{
										errorMessage = "文件超出允许上传大小";
									}
								}else{
									errorMessage = "当前文件类型不允许上传";
								}
							}else{
								errorMessage = "不允许上传文件";
							}
						}else{
							errorMessage = "权限不足";
						}
						
						
						
					}else if(dir.equals("file")){
						//是否有当前功能操作权限
						boolean flag_permission = userRoleManage.isPermission(ResourceEnum._2003000,null);
						if(flag_permission){
							if(editorSiteObject.isFile()){//允许上传文件
								//上传文件编号
								String fileNumber = "b"+accessUser.getUserId();
								
								//当前文件名称
								String fileName = file.getOriginalFilename();
								
								//文件大小
								Long size = file.getSize();
								//取得文件后缀
								String suffix = FileUtil.getExtension(fileName).toLowerCase();
								
								//允许上传文件格式
								List<String> imageFormat = editorSiteObject.getFileFormat();
								//允许上传文件大小
								long fileSize = editorSiteObject.getFileSize();
								
								//验证文件类型
								boolean authentication = FileUtil.validateFileSuffix(file.getOriginalFilename(),imageFormat);
								
								if(authentication ){
									if(size/1024 <= fileSize){
										//文件保存目录;分多目录主要是为了分散图片目录,提高检索速度
										String pathDir = "file"+File.separator+"topic"+File.separator + date +File.separator +"file"+ File.separator;
										//文件锁目录
										String lockPathDir = "file"+File.separator+"topic"+File.separator+"lock"+File.separator;
										//构建文件名称
										String newFileName = UUIDUtil.getUUID32()+ fileNumber+"." + suffix;
										
										//生成文件保存目录
										fileManage.createFolder(pathDir);
										//生成锁文件保存目录
										fileManage.createFolder(lockPathDir);
										//生成锁文件
										fileManage.addLock(lockPathDir,date +"_file_"+newFileName);
										//保存文件
										fileManage.writeFile(pathDir, newFileName,file.getBytes());
										//上传成功
										returnJson.put("error", 0);//0成功  1错误
										returnJson.put("url", "file/topic/"+date+"/file/"+newFileName);
										returnJson.put("title", file.getOriginalFilename());//旧文件名称
										return JsonUtils.toJSONString(returnJson);
									}else{
										errorMessage = "文件超出允许上传大小";
									}
								}else{
									errorMessage = "当前文件类型不允许上传";
								}
							}else{
								errorMessage = "不允许上传文件";
							}
						}else{
							errorMessage = "权限不足";
						}
						
					}else if(dir.equals("media")){	
						//是否有当前功能操作权限
						boolean flag_permission = userRoleManage.isPermission(ResourceEnum._2004000,null);
						if(flag_permission){
							if(editorSiteObject.isUploadVideo()){//允许上传视频
								//上传文件编号
								String fileNumber = "b"+accessUser.getUserId();
								
								//当前文件名称
								String fileName = file.getOriginalFilename();
								
								//文件大小
								Long size = file.getSize();
								//取得文件后缀
								String suffix = FileUtil.getExtension(fileName).toLowerCase();
								
								//允许上传视频格式
								List<String> imageFormat = editorSiteObject.getVideoFormat();
								//允许上传视频大小
								long fileSize = editorSiteObject.getVideoSize();
								
								//验证视频类型
								boolean authentication = FileUtil.validateFileSuffix(file.getOriginalFilename(),imageFormat);
								
								if(authentication ){
									if(size/1024 <= fileSize){
										//文件保存目录;分多目录主要是为了分散文件目录,提高检索速度
										String pathDir = "file"+File.separator+"topic"+File.separator + date +File.separator +"media"+ File.separator;
										//文件锁目录
										String lockPathDir = "file"+File.separator+"topic"+File.separator+"lock"+File.separator;
										//构建文件名称
										String newFileName = UUIDUtil.getUUID32()+ fileNumber+"." + suffix;
										
										//生成文件保存目录
										fileManage.createFolder(pathDir);
										//生成锁文件保存目录
										fileManage.createFolder(lockPathDir);
										//生成锁文件
										fileManage.addLock(lockPathDir,date +"_media_"+newFileName);
										//保存文件
										fileManage.writeFile(pathDir, newFileName,file.getBytes());
										//上传成功
										returnJson.put("error", 0);//0成功  1错误
										returnJson.put("url", "file/topic/"+date+"/media/"+newFileName);
										returnJson.put("title", file.getOriginalFilename());//旧文件名称
										return JsonUtils.toJSONString(returnJson);
									}else{
										errorMessage = "文件超出允许上传大小";
									}
								}else{
									errorMessage = "当前视频类型不允许上传";
								}
							}else{
								errorMessage = "不允许上传文件";
							}
						}else{
							errorMessage = "权限不足";
						}
						
					}else{
						errorMessage = "缺少dir参数";
					}
				}else{
					errorMessage = "读取话题编辑器允许使用标签失败";
				}	
			}else{
				errorMessage = "文件内容不能为空";
			}
		}else{
			errorMessage = "不允许发表话题";
		}
		

		
		//上传失败
		returnJson.put("error", 1);
		returnJson.put("message", errorMessage);
		return JsonUtils.toJSONString(returnJson);
	}
	
	
	/**
	 * 话题  取消隐藏
	 * @param model
	 * @param topicId 话题Id
	 * @param hideType 隐藏类型
	 * @param password 密码
	 * @param token
	 * @param jumpUrl
	 * @param redirectAttrs
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
//	@RequestMapping(value="/unhide", method=RequestMethod.POST)
//	public String topicUnhide(ModelMap model,Long topicId,Integer hideType, String password,
//			String token,String jumpUrl,
//			RedirectAttributes redirectAttrs,
//			HttpServletRequest request, HttpServletResponse response) throws Exception {
//		//获取登录用户
//	  	AccessUser accessUser = AccessUserThreadLocal.get();
//
//		boolean isAjax = WebUtil.submitDataMode(request);//是否以Ajax方式提交数据
//
//
//		Map<String,String> error = new HashMap<String,String>();
//
//
//
//		//判断令牌
//		if(token != null && !"".equals(token.trim())){
//			String token_sessionid = csrfTokenManage.getToken(request);//获取令牌
//			if(token_sessionid != null && !"".equals(token_sessionid.trim())){
//				if(!token_sessionid.equals(token)){
//					error.put("token", ErrorView._13.name());//令牌错误
//				}
//			}else{
//				error.put("token", ErrorView._12.name());//令牌过期
//			}
//		}else{
//			error.put("token", ErrorView._11.name());//令牌为空
//		}
//
//		//统计每分钟原来提交次数
//		Integer quantity = settingManage.getSubmitQuantity("topicUnhide", accessUser.getUserName());
//    	if(quantity != null && quantity >30){//如果每分钟提交超过30次，则一分钟内不允许'取消隐藏'
//    		error.put("topicUnhide", ErrorView._1640.name());//提交过于频繁，请稍后再提交
//    	}
//
//    	Topic topic = null;
//    	if(error.size() == 0){
//    		if(topicId != null && topicId >0L){
//
//    	  		topic = topicManage.queryTopicCache(topicId);//查询缓存
//
//
//    	  	}else{
//    	  		error.put("topicUnhide", ErrorView._103.name());//话题Id不能为空
//    	  	}
//
//    		if(topic.getUserName().equals(accessUser.getUserName())){
//    			error.put("topicUnhide", ErrorView._1690.name());//不允许解锁自已发表的话题
//    		}
//
//    	  	if(topic != null){
//    	  		//话题取消隐藏Id
//    		  	String topicUnhideId = topicManage.createTopicUnhideId(accessUser.getUserId(), hideType, topicId);
//
//
//    		}
//    	}
//
//    	//消费积分
//		Long point = null;
//		//消费金额
//		BigDecimal amount = null;
//
//		List<Integer> hideTypeList = new ArrayList<Integer>();
//		hideTypeList.add(HideTagType.PASSWORD.getName());
//		hideTypeList.add(HideTagType.POINT.getName());
//		hideTypeList.add(HideTagType.AMOUNT.getName());
//
//		if(!hideTypeList.contains(hideType)){
//			error.put("topicUnhide", ErrorView._1620.name());//隐藏标签不存在
//		}
//
//
//		if(error.size() == 0){
//			//解析隐藏标签
//			Map<Integer,Object> analysisHiddenTagMap = textFilterManage.analysisHiddenTag(topic.getContent());
//			if(!analysisHiddenTagMap.containsKey(hideType)){
//				error.put("topicUnhide", ErrorView._1660.name());//话题内容不含当前标签
//			}
//
//			for (Map.Entry<Integer,Object> entry : analysisHiddenTagMap.entrySet()) {
//				if(entry.getKey().equals(HideTagType.PASSWORD.getName()) && HideTagType.PASSWORD.getName().equals(hideType)){//输入密码可见
//					if(password == null || "".equals(password.trim())){
//						error.put("password", ErrorView._1650.name());//密码不能为空
//						break;
//					}
//
//
//					if(!entry.getValue().equals(password)){
//						error.put("topicUnhide", ErrorView._1630.name());//密码错误
//					}
//					break;
//				}
//
//				if(entry.getKey().equals(HideTagType.POINT.getName()) && HideTagType.POINT.getName().equals(hideType)){//积分购买可见
//					//获取登录用户
//			  		User _user = userService.findUserByUserName(accessUser.getUserName());
//			  		if(_user != null){
//			  			if(_user.getPoint() < (Long)entry.getValue()){
//			  				error.put("topicUnhide", ErrorView._1680.name());//用户积分不足
//			  			}else{
//			  				point = (Long)entry.getValue();
//			  			}
//			  		}else{
//			  			error.put("topicUnhide", ErrorView._1670.name());//用户不存在
//			  		}
//
//				}
//
//				if(entry.getKey().equals(HideTagType.AMOUNT.getName()) && HideTagType.AMOUNT.getName().equals(hideType)){//余额购买可见
//					//获取登录用户
//			  		User _user = userService.findUserByUserName(accessUser.getUserName());
//			  		if(_user != null){
//			  			if(_user.getDeposit().compareTo((BigDecimal)entry.getValue()) <0){
//			  				error.put("topicUnhide", ErrorView._1685.name());//用户余额不足
//			  			}else{
//			  				amount = (BigDecimal)entry.getValue();
//			  			}
//			  		}else{
//			  			error.put("topicUnhide", ErrorView._1670.name());//用户不存在
//			  		}
//
//
//				}
//
//			}
//		}
//
//		//统计每分钟原来提交次数
//		Integer original = settingManage.getSubmitQuantity("topicUnhide", accessUser.getUserName());
//		if(original != null){
//			settingManage.addSubmitQuantity("topicUnhide", accessUser.getUserName(),original+1);//刷新每分钟原来提交次数
//		}else{
//			settingManage.addSubmitQuantity("topicUnhide", accessUser.getUserName(),1);//刷新每分钟原来提交次数
//		}
//
//
//
//
//		if(error.size() == 0){
//			Date time = new Date();
//			TopicUnhide topicUnhide = new TopicUnhide();
//			String topicUnhideId = topicManage.createTopicUnhideId(accessUser.getUserId(), hideType, topicId);
//			topicUnhide.setId(topicUnhideId);
//			topicUnhide.setUserName(accessUser.getUserName());
//			topicUnhide.setCancelTime(new Date());
//			topicUnhide.setHideTagType(hideType);
//			topicUnhide.setPostUserName(topic.getUserName());//发布话题的用户名称
//			topicUnhide.setTopicId(topicId);
//
//			//用户消费积分日志
//			Object consumption_pointLogObject = null;
//			//用户收入积分日志
//			Object income_pointLogObject = null;
//			if(point != null){
//				topicUnhide.setPoint(point);
//
//				PointLog pointLog = new PointLog();
//				pointLog.setId(pointManage.createPointLogId(accessUser.getUserId()));
//				pointLog.setModule(400);//400.积分购买隐藏话题
//				pointLog.setParameterId(topic.getId());//参数Id
//				pointLog.setOperationUserType(2);//操作用户类型  0:系统  1: 员工  2:会员
//				pointLog.setOperationUserName(accessUser.getUserName());//操作用户名称
//				pointLog.setPointState(2);//2:账户支出
//				pointLog.setPoint(point);//积分
//				pointLog.setUserName(accessUser.getUserName());//用户名称
//				pointLog.setRemark("");
//				pointLog.setTimes(time);
//				consumption_pointLogObject = pointManage.createPointLogObject(pointLog);
//
//				if(!topic.getIsStaff()){//如果是用户
//					User _user = userManage.query_cache_findUserByUserName(topic.getUserName());
//					PointLog income_pointLog = new PointLog();
//					income_pointLog.setId(pointManage.createPointLogId(_user.getId()));
//					income_pointLog.setModule(400);//400.积分购买隐藏话题
//					income_pointLog.setParameterId(topic.getId());//参数Id
//					income_pointLog.setOperationUserType(2);//操作用户类型  0:系统  1: 员工  2:会员
//					income_pointLog.setOperationUserName(accessUser.getUserName());//操作用户名称
//					income_pointLog.setPointState(1);//1:账户存入
//					income_pointLog.setPoint(point);//积分
//					income_pointLog.setUserName(topic.getUserName());//用户名称
//					income_pointLog.setRemark("");
//					income_pointLog.setTimes(time);
//					income_pointLogObject = pointManage.createPointLogObject(income_pointLog);
//
//					//删除用户缓存
//					userManage.delete_cache_findUserById(_user.getId());
//					userManage.delete_cache_findUserByUserName(topic.getUserName());
//
//				}
//
//			}
//
//			//平台分成
//
//			//发布话题用户分成金额
//			BigDecimal postUserNameShareAmount = new BigDecimal("0");
//			//平台分成金额
//			BigDecimal platformShareAmount = new BigDecimal("0");
//			if(amount != null){
//				topicUnhide.setAmount(amount);
//
//
//
//				Integer topicUnhidePlatformShareProportion = settingService.findSystemSetting().getTopicUnhidePlatformShareProportion();//平台分成比例
//
//				if(topicUnhidePlatformShareProportion >0){
//					//平台分成金额 = 总金额 * (平台分成比例 /100)
//					platformShareAmount = amount.multiply(new BigDecimal(String.valueOf(topicUnhidePlatformShareProportion)).divide(new BigDecimal("100")));
//
//					postUserNameShareAmount = amount.subtract(platformShareAmount);
//				}else{
//					postUserNameShareAmount = amount;
//				}
//			}
//
//			try {
//
//				//删除'话题取消隐藏'缓存;
//				topicManage.delete_cache_findTopicUnhideById(topicUnhideId);
//
//				//删除用户缓存
//				userManage.delete_cache_findUserById(accessUser.getUserId());
//				userManage.delete_cache_findUserByUserName(accessUser.getUserName());
//
//
//
//				User _user = userManage.query_cache_findUserByUserName(topic.getUserName());
//
//				//别人解锁了我的话题  只对(隐藏标签类型 10:输入密码可见  40:积分购买可见  50:余额购买可见)发提醒
//				if(!topic.getIsStaff() && _user != null && !topic.getUserName().equals(accessUser.getUserName())){//不发提醒给自己
//
//					//提醒楼主
//					Remind remind = new Remind();
//					remind.setId(remindManage.createRemindId(_user.getId()));
//					remind.setReceiverUserId(_user.getId());//接收提醒用户Id
//					remind.setSenderUserId(accessUser.getUserId());//发送用户Id
//					remind.setTypeCode(60);//60:别人解锁了我的话题
//					remind.setSendTimeFormat(new Date().getTime());//发送时间格式化
//					remind.setTopicId(topic.getId());//话题Id
//
//					Object remind_object = remindManage.createRemindObject(remind);
//					remindService.saveRemind(remind_object);
//
//					//删除提醒缓存
//					remindManage.delete_cache_findUnreadRemindByUserId(_user.getId());
//
//
//				}
//
//
//
//
//
//
//
//			} catch (org.springframework.orm.jpa.JpaSystemException e) {
//				error.put("topicUnhide", ErrorView._1600.name());//话题重复取消隐藏
//
//			}
//
//		}
//
//
//
//
//
//		Map<String,String> returnError = new HashMap<String,String>();//错误
//		if(error.size() >0){
//			//将枚举数据转为错误提示字符
//    		for (Map.Entry<String,String> entry : error.entrySet()) {
//    			if(ErrorView.get(entry.getValue()) != null){
//    				returnError.put(entry.getKey(),  ErrorView.get(entry.getValue()));
//    			}else{
//    				returnError.put(entry.getKey(),  entry.getValue());
//    			}
//			}
//		}
//		if(isAjax == true){
//
//    		Map<String,Object> returnValue = new HashMap<String,Object>();//返回值
//
//    		if(error != null && error.size() >0){
//    			returnValue.put("success", "false");
//    			returnValue.put("error", returnError);
//
//    		}else{
//    			returnValue.put("success", "true");
//    		}
//    		WebUtil.writeToWeb(JsonUtils.toJSONString(returnValue), "json", response);
//			return null;
//		}else{
//
//
//			if(error != null && error.size() >0){//如果有错误
//				redirectAttrs.addFlashAttribute("error", returnError);//重定向传参
//				redirectAttrs.addFlashAttribute("hideType", hideType);
//
//
//				String referer = request.getHeader("referer");
//
//
//				referer = StringUtils.removeStartIgnoreCase(referer,Configuration.getUrl(request));//移除开始部分的相同的字符,不区分大小写
//				referer = StringUtils.substringBefore(referer, ".");//截取到等于第二个参数的字符串为止
//				referer = StringUtils.substringBefore(referer, "?");//截取到等于第二个参数的字符串为止
//
//				String queryString = request.getQueryString() != null && !"".equals(request.getQueryString().trim()) ? "?"+request.getQueryString() :"";
//
//				return "redirect:/"+referer+queryString;
//
//			}
//
//
//			if(jumpUrl != null && !"".equals(jumpUrl.trim())){
//				String url = Base64.decodeBase64URL(jumpUrl.trim());
//
//				return "redirect:"+url;
//			}else{//默认跳转
//				model.addAttribute("message", "话题取消隐藏成功");
//				String referer = request.getHeader("referer");
//				if(RefererCompare.compare(request, "login")){//如果是登录页面则跳转到首页
//					referer = Configuration.getUrl(request);
//				}
//				model.addAttribute("urlAddress", referer);
//
//				String dirName = templateService.findTemplateDir_cache();
//
//
//				return "templates/"+dirName+"/"+accessSourceDeviceManage.accessDevices(request)+"/jump";
//			}
//		}
//	}
	
	
}
