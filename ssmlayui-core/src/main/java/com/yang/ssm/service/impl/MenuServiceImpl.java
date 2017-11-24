package com.yang.ssm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.common.tools.json.GsonUtils;
import com.yang.ssm.dao.MenuMapper;
import com.yang.ssm.dao.RoleMenuMapper;
import com.yang.ssm.domain.Menu;
import com.yang.ssm.domain.MenuVo;
import com.yang.ssm.service.MenuService;
import com.yang.ssm.util.SysWebUtils;

/**
 * 
 * @author yanglei
 * 2017年6月27日 下午2:20:50
 */
@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	@Autowired
	private SysWebUtils sysWebUtils;
	
	@Override
	public List<MenuVo> selectLeftMenuList(String userId) {
		List<Menu> menuList = menuMapper.selectTreeMenuList(userId);
		//List<Menu> leftMenuList = this.getLeftMenuList(menuList);
		return this.getLeftMenuVo(menuList);
	}
	
	private List<MenuVo> getLeftMenuVo(List<Menu> menuList){
		List<MenuVo> resultList = null;
		if(menuList != null && menuList.size() > 0){
			Map<String, MenuVo> parentMenuMap = new LinkedHashMap<String, MenuVo>();
			Map<String, List<MenuVo>> childrenMenuMap = new LinkedHashMap<String, List<MenuVo>>();
			for(Menu menu : menuList){
				MenuVo menuVo = new MenuVo();
				menuVo.setTitle(menu.getMenuName());
				menuVo.setIcon("");
				menuVo.setHref(StringUtils.isBlank(menu.getReqUrl()) ? "" : menu.getReqUrl());
				menuVo.setSpread(false);
				if(menu.getMenuLevel() == 1){
					parentMenuMap.put(menu.getMenuId(), menuVo);
				}
				if(menu.getMenuLevel() == 2){
					List<MenuVo> tmpList = childrenMenuMap.get(menu.getParentId());
					if(tmpList == null || tmpList.size() <= 0){
						tmpList = new LinkedList<MenuVo>();
					}
					tmpList.add(menuVo);
					childrenMenuMap.put(menu.getParentId(), tmpList);
				}
			}
			
			resultList = new ArrayList<MenuVo>();
			
			for(Entry<String, MenuVo> entry : parentMenuMap.entrySet()){
				List<MenuVo> list = childrenMenuMap.get(entry.getKey());
				if(list != null && list.size() > 0){
					entry.getValue().setChildren(list);
				}
				resultList.add(entry.getValue());
			}
		}
		return resultList;
	}

	@Override
	public String getTreeData() {
		String resultTreeData = "";
		List<Menu> menuList = menuMapper.selectMenuList();
		if(null != menuList && menuList.size() > 0){
			Map<String, String> map = null;
			List<Map<String, String>> treeList = new ArrayList<Map<String,String>>();
			for(Menu menu : menuList){
				map = new HashMap<String, String>();
				if(StringUtils.isNotEmpty(menu.getMenuId()) && StringUtils.isNotEmpty(menu.getParentId())){
					map.put("id", menu.getMenuId());
					map.put("pId", menu.getParentId());
					map.put("name", menu.getMenuName());
					if("0".equals(menu.getParentId())){
						map.put("open", "true");
					}
					treeList.add(map);
				}
			}
			resultTreeData = GsonUtils.toJsonString(treeList);
		}
		return resultTreeData;
	}

	@Override
	public Menu selectOneMenu(String menuId) {
		return menuMapper.selectOneMenu(menuId);
	}
	
	@Override
	public void batchDeleteMenu(String menuIds) {
		List<String> menuIdList = new ArrayList<String>();
		String[] menuIdArr = menuIds.split(",");
		for(String menuId : menuIdArr){
			menuIdList.add(menuId);
		}
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("menuIdList", menuIdList);
		menuMapper.deleteMenuByMenuIds(paramMap);
		
		roleMenuMapper.deleteRoleMenuByMenuIds(paramMap);
		
		sysWebUtils.refreshAuth();
	}
	
	@Override
	public void insert(Menu menu) {
		menuMapper.insert(menu);
		
		sysWebUtils.refreshAuth();
	}
	
	@Override
	public void update(Menu menu) {
		menuMapper.updateByMenuId(menu);
		
		sysWebUtils.refreshAuth();
	}
	
	@Override
	public List<Menu> selectMenuByUserId(String userId) {
		return menuMapper.selectMenuByUserId(userId);
	}
}
