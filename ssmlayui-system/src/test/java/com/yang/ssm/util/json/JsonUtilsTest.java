package com.yang.ssm.util.json;

import com.alibaba.fastjson.JSON;
import com.yang.common.tools.json.GsonUtils;

public class JsonUtilsTest {

	public static void main(String[] args) {
		TestVo vo = new TestVo();
		vo.setUserId("001");
		vo.setUserName("张三");
		vo.setAge(10);
		String gsonStr1 = GsonUtils.toJsonString(vo);
		System.out.println(gsonStr1);
		
		String jsonStr1 = JSON.toJSONString(vo);
		System.out.println(jsonStr1);
		
		TestVo bean = GsonUtils.toBean(gsonStr1, TestVo.class);
		System.out.println(bean.toString());
		
		
		TestVo parseObject = JSON.parseObject(jsonStr1, TestVo.class);
		System.out.println(parseObject.toString());
		
	}

	
}
