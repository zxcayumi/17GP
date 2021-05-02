package cms.web.action.template;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import cms.bean.PageView;
import cms.bean.template.CustomHTML;
import cms.bean.template.Forum;
import cms.bean.template.Layout;
import cms.bean.topic.Comment;
import cms.bean.topic.Tag;
import cms.bean.topic.Topic;
import cms.service.template.TemplateService;
import cms.utils.threadLocal.TemplateThreadLocal;
import cms.web.action.AccessSourceDeviceManage;
import cms.web.action.template.impl.CustomForum_TemplateManage;
import cms.web.action.template.impl.Favorite_TemplateManage;
import cms.web.action.template.impl.Feedback_TemplateManage;
import cms.web.action.template.impl.Follow_TemplateManage;
import cms.web.action.template.impl.Like_TemplateManage;
import cms.web.action.template.impl.System_TemplateManage;
import cms.web.action.template.impl.Tag_TemplateManage;
import cms.web.action.template.impl.Topic_TemplateManage;

import org.springframework.stereotype.Component;



/**
 * 模板管理入口
 * @author Administrator
 *
 */
@Component("templateMain")
public class TemplateMain {
	@Resource TemplateService templateService;
	@Resource AccessSourceDeviceManage accessSourceDeviceManage;
	
	@Resource Tag_TemplateManage tag_TemplateManage;//标签 -- 模板方法实现
	@Resource Topic_TemplateManage topic_TemplateManage;//话题 -- 模板方法实现
	@Resource Feedback_TemplateManage feedback_TemplateManage;

	@Resource Favorite_TemplateManage favorite_TemplateManage;//收藏夹 -- 模板方法实现
	@Resource Like_TemplateManage like_TemplateManage;//点赞 -- 模板方法实现
	@Resource Follow_TemplateManage follow_TemplateManage;//关注 -- 模板方法实现
	
	@Resource CustomForum_TemplateManage customForum_TemplateManage;//自定义版块 -- 模板方法实现
	@Resource System_TemplateManage system_TemplateManage;//系统部分 -- 模板方法实现
	
	
	
	/**
	 * 公共模板处理
	 * @param type 布局类型
	 * @param layoutFile 布局文件
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> list(Integer type,String layoutFile,HttpServletRequest request)throws Exception{
		Map<String,Object> root = new HashMap<String,Object>();
		String dirName = templateService.findTemplateDir_cache();//当前模板使用的目录

		//如果引用代码相同，只运行一次
		List<String> referenceCode = new ArrayList<String>();
		
		
		List<Forum> list = templateService.findForum_cache(dirName, type,layoutFile);
		for(Forum forum : list){
			if(!referenceCode.contains(forum.getReferenceCode())){
				//结构   由|线作分割符 " 引用名称 | 引用路径"组成
				root.put(forum.getReferenceCode(), forum.getReferenceCode()+"|templates/"+dirName+"/"+accessSourceDeviceManage.accessDevices(request)+"/forum/"+forum.getModule()+".html");
				
			}
		
			referenceCode.add(forum.getModule());
		}
		return root;
	}
	/**
	 * 版块对应的模板对象
	 * @param forum
	 * @param submitParameter 提交参数
	 * @param runtimeParameter 运行时参数
	 * @return
	 */
	public Object templateObject(Forum forum,Map<String,Object> submitParameter,Map<String,Object> runtimeParameter){
		if(forum.getForumChildType().equals("标签列表")){
			if(forum.getDisplayType().equals("collection")){//集合
				
				List<Tag> value = tag_TemplateManage.tag_collection(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("话题列表")){
			if(forum.getDisplayType().equals("page")){//分页
				
				PageView<Topic> value = topic_TemplateManage.topic_page(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("相似话题")){
			if(forum.getDisplayType().equals("collection")){//集合
				
				List<Topic> value = topic_TemplateManage.topic_like_collection(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("话题内容")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				Topic value = topic_TemplateManage.content_entityBean(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("添加话题")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = topic_TemplateManage.addTopic_collection(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("修改话题")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = topic_TemplateManage.editTopic_collection(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("评论列表")){
			if(forum.getDisplayType().equals("page")){//分页
				PageView<Comment> value = topic_TemplateManage.comment_page(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("添加评论")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = topic_TemplateManage.addComment_collection(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("引用评论")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = topic_TemplateManage.quoteComment_collection(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("回复评论")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = topic_TemplateManage.replyComment_collection(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("加入收藏夹")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = favorite_TemplateManage.addFavorite_collection(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("话题会员收藏总数")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				Long value = favorite_TemplateManage.favoriteCount_entityBean(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("用户是否已经收藏话题")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				Boolean value = favorite_TemplateManage.alreadyCollected_entityBean(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("给话题点赞")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = like_TemplateManage.addLike_collection(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("话题点赞总数")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				Long value = like_TemplateManage.likeCount_entityBean(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("用户是否已经点赞该话题")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				Boolean value = like_TemplateManage.alreadyLiked_entityBean(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("关注用户")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = follow_TemplateManage.addFollow_collection(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("关注总数")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				Long value = follow_TemplateManage.followCount_entityBean(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("粉丝总数")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				Long value = follow_TemplateManage.followerCount_entityBean(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("是否已经关注该用户")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				Boolean value = follow_TemplateManage.following_entityBean(forum, submitParameter, runtimeParameter);
				return value;
			}
			
		}else if(forum.getForumChildType().equals("添加在线留言")){
			if(forum.getDisplayType().equals("collection")){//集合
				Map<String,Object> value = feedback_TemplateManage.addFeedback_collection(forum, submitParameter,runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("用户自定义HTML")){
			if(forum.getDisplayType().equals("entityBean")){//实体对象
				CustomHTML value = customForum_TemplateManage.customHTML_entityBean(forum, submitParameter, runtimeParameter);
				return value;
			}
		}else if(forum.getForumChildType().equals("热门搜索词")){
			if(forum.getDisplayType().equals("collection")){//集合
				List<String> value = system_TemplateManage.searchWord_collection(forum, submitParameter,runtimeParameter);
				return value;
			}	
		}
		
		return null;	
	}
	
	
	/**
	 * 公共页(引用版块值)[根据页面是否有标签智能调用]
	 * @param quoteTemplate 显示在某个页面上
	 * @throws Exception
	 */
	public Map<String,Object> publicQuoteCall(String quoteTemplate,HttpServletRequest request)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		//当前模板使用的目录
		String dirName = templateService.findTemplateDir_cache();
		List<Layout> layoutList = templateService.findLayout_cache(dirName, 6);//公共页(引用版块值)
	
		for(Layout layout : layoutList){
			//每个引用代码只含有一个版块
			Forum forum = templateService.findForum_cache(dirName, layout.getReferenceCode());
			if(forum != null){
				//结构   由|线作分割符 " 引用名称 | 引用路径"组成
				map.put(forum.getReferenceCode(), forum.getReferenceCode()+"|templates/"+dirName+"/"+accessSourceDeviceManage.accessDevices(request)+"/forum/"+forum.getModule()+".html");  
			}
		}
		return map;
	}

	/**
	 * 公共页(生成新引用页)[根据页面是否有标签智能调用]
	 * @param quoteTemplate 当前引用模板
	 * @throws Exception
	 */
	public Map<String,Object> newPublic(String quoteTemplate,HttpServletRequest request)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
	
		
		//当前模板使用的目录
		String dirName = templateService.findTemplateDir_cache();
		//检查所有的公共页(生成新引用页)
		List<Layout> publics = templateService.findLayout_cache(dirName, 5);//公共页(生成新引用页)
		for(Layout layout : publics){
			map.put(layout.getReferenceCode(), layout.getReferenceCode()+"|templates/"+dirName+"/"+accessSourceDeviceManage.accessDevices(request)+"/public/"+layout.getLayoutFile()); 
			List<Forum> forumList = templateService.findForumByLayoutId_cache(dirName,layout.getId());
			for(Forum forum : forumList){
				map.put(forum.getReferenceCode(), forum.getReferenceCode()+"|templates/"+dirName+"/"+accessSourceDeviceManage.accessDevices(request)+"/forum/"+forum.getModule()+".html");  
			}
			//添加到模板参数线程变量
			TemplateThreadLocal.setLayoutFile(layout.getLayoutFile());
		}
		return map;
	}
}
