package cms.bean.user;

import java.io.Serializable;


/**
 * 访问用户
 *
 */
public class AccessUser implements Serializable{
	private static final long serialVersionUID = -3642575642338311674L;

	/** ID **/
	private Long userId;
	/** 会员用户名 **/
	private String userName;
	/** 呢称 **/
	private String nickname;
	/** 头像路径 **/
	private String avatarPath;
	/** 头像名称 **/
	private String avatarName;
	
	
	/** 安全摘要 **/
	private Long securityDigest;
	/** 记住密码 **/
	private boolean rememberMe = false;
	
	
	public AccessUser() {}
	public AccessUser(Long userId, String userName, String nickname, String avatarPath, String avatarName,
			Long securityDigest, boolean rememberMe) {
		this.userId = userId;
		this.userName = userName;
		this.nickname = nickname;
		this.avatarPath = avatarPath;
		this.avatarName = avatarName;
		this.securityDigest = securityDigest;
		this.rememberMe = rememberMe;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Long getSecurityDigest() {
		return securityDigest;
	}
	public void setSecurityDigest(Long securityDigest) {
		this.securityDigest = securityDigest;
	}
	public boolean isRememberMe() {
		return rememberMe;
	}
	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}
	public String getAvatarPath() {
		return avatarPath;
	}
	public void setAvatarPath(String avatarPath) {
		this.avatarPath = avatarPath;
	}
	public String getAvatarName() {
		return avatarName;
	}
	public void setAvatarName(String avatarName) {
		this.avatarName = avatarName;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}
