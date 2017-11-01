package com.yang.ssm.util.json;

import com.yang.common.tools.json.GsonUtils;

public class TestVo {

	private String userId;
	private String userName;
	private Integer age;
	
	public String getUserId() {
		return userId;
	}
	public String getUserIdFmt() {
		return "ID"+ userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "TestVo [userId=" + userId + ", userName=" + userName + ", age="
				+ age + ", getUserId()=" + getUserId() + ", getUserIdFmt()="
				+ getUserIdFmt() + ", getUserName()=" + getUserName()
				+ ", getAge()=" + getAge() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
