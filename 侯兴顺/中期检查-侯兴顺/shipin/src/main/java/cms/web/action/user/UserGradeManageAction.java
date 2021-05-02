package cms.web.action.user;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cms.bean.user.UserGrade;
import cms.service.user.UserGradeService;
import cms.utils.RedirectPath;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户等级管理
 *
 */
@Controller
@RequestMapping("/control/userGrade/manage") 
public class UserGradeManageAction {
	
	@Resource UserGradeService userGradeService;
	@Resource(name = "gradeValidator") 
	private Validator validator; 
	/**
	 * 用户等级管理 添加界面显示
	 */
	@RequestMapping(params="method=add",method=RequestMethod.GET)
	public String addUI(ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		return "jsp/user/add_grade";
	}
	
	/**
	 * 添加 用户等级
	 */
	@RequestMapping(params="method=add",method=RequestMethod.POST)
	public String add(UserGrade formbean,BindingResult result,ModelMap model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {	
		
		//数据校验
		this.validator.validate(formbean, result); 
		if (result.hasErrors()) { 
			model.addAttribute("userGrade", formbean);
			return "jsp/user/add_grade";
		}
		UserGrade userGrade = new UserGrade();
		userGrade.setName(formbean.getName());
		userGrade.setNeedPoint(formbean.getNeedPoint());
		userGradeService.saveUserGrade(userGrade);
		
		request.setAttribute("message", "添加用户等级成功");
		request.setAttribute("urladdress", RedirectPath.readUrl("control.userGrade.list"));
		return "jsp/common/message";
	}
	/**
	 * 用户等级管理 修改界面显示
	 */
	@RequestMapping(params="method=edit",method=RequestMethod.GET)
	public String editUI(ModelMap model,Integer id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserGrade userGrade = userGradeService.findGradeById(id);
		model.addAttribute("userGrade", userGrade);
		return "jsp/user/edit_grade";
	}
	
	/**
	 * 修改 用户等级
	 */
	@RequestMapping(params="method=edit",method=RequestMethod.POST)
	public String edit(ModelMap model,UserGrade formbean,BindingResult result,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {	

		Map<String,String> error = new HashMap<String,String>();
		UserGrade userGrade = userGradeService.findGradeById(formbean.getId());
		if(userGrade == null){
			request.setAttribute("message", "用户等级不存在");
			request.setAttribute("urladdress", RedirectPath.readUrl("control.userGrade.list"));
			return "jsp/common/message";
		}
		//数据校验
		if(formbean.getName() != null && !"".equals(formbean.getName().trim())){
			if(formbean.getName().length() >50){
				error.put("name", "等级名称不能大于50个字符");
			}
		}else{
			error.put("name", "等级名称不能为空");
		}
		if(formbean.getNeedPoint() != null){
			if(formbean.getNeedPoint() <0L){
				error.put("needPoint", "需要积分不能小于0");
			}
			if(formbean.getNeedPoint() >999999999999999L){
				error.put("needPoint", "需要积分不能超过999999999999999");
			}
			UserGrade _userGrade = userGradeService.findGradeByNeedPoint(formbean.getNeedPoint());
			if(_userGrade != null){
				if(!userGrade.getId().equals(_userGrade.getId())){
					error.put("needPoint", "需要积分已存在");
				}
			}
		}else{
			error.put("needPoint", "需要积分不能为空");
		}
		if (error.size() >0) { 
			model.addAttribute("userGrade", formbean);
			model.addAttribute("error", error);
			return "jsp/user/edit_grade";
		}
		userGrade.setName(formbean.getName());
		userGrade.setNeedPoint(formbean.getNeedPoint());
		userGradeService.updateUserGrade(userGrade);
		
		request.setAttribute("message", "修改用户等级成功");
		request.setAttribute("urladdress", RedirectPath.readUrl("control.userGrade.list"));
		return "jsp/common/message";
	}
	
	/**
	 * 用户等级管理 删除
	 */
	@RequestMapping(params="method=delete",method=RequestMethod.POST)
	@ResponseBody//方式来做ajax,直接返回字符串
	public String delete(ModelMap model,Integer id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(id != null && id >0){
			userGradeService.deleteUserGrade(id);
			return "1";
		}
		return "0";
	}
}
