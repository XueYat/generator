package ${package}.service.impl;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import ${package}.model.Page;
import ${package}.dao.${className}Dao;
import ${package}.model.${className}Model;
import ${package}.service.${className}Service;
import com.lxmall.mainframe.utils.ParamValidateUtils;

/**
 * @author ${author}
 * @date ${date} ${time}
 */
@Service("${classNameLower}Service")
public class ${className}ServiceImpl implements ${className}Service {
	@Resource
	private ${className}Dao ${classNameLower}Dao;
	
	/**
	 * ${table.tableDesc}数据分页查询
	 * @param page ${table.tableDesc}数据分页条件
	 * @param ${classNameLower}Model ${table.tableDesc}数据查询条件
	 * @param queryFields ${table.tableDesc}数据查询字段
	 * @return List<${className}Model>分页数据
	 */
	@Override
	public List<${className}Model> queryPage${className}(Page page, ${className}Model ${classNameLower}Model, String queryFields){
		List<${className}Model> list${className} = new ArrayList<${className}Model>();
		try{
			//判断参数是否为空
			if(ParamValidateUtils.isEmpty(page)){
				return null;
			}else{
				List<String> lis = new ArrayList<String>();
				if(ParamValidateUtils.isEmpty(queryFields)){
					lis = null;
				}else{
					lis = Arrays.asList(queryFields.split(","));
				}
				list${className} = this.${classNameLower}Dao.queryPage${className}(page, ${classNameLower}Model,lis);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return list${className};
	}

	/**
	 * ${table.tableDesc}数据不分页查询
	 * @param ${classNameLower}Model ${table.tableDesc}数据查询条件
	 * @param queryFields ${table.tableDesc}数据查询字段
	 * @return List<${className}Model>数据
	 */
	@Override
	public List<${className}Model> queryList${className}(${className}Model ${classNameLower}Model, String queryFields){
		List<${className}Model> list${className} = new ArrayList<${className}Model>();
		try{
			List<String> lis = new ArrayList<String>();
			if(ParamValidateUtils.isEmpty(queryFields)){
				lis = null;
			}else{
				lis = Arrays.asList(queryFields.split(","));
			}
			list${className} = this.${classNameLower}Dao.queryList${className}(${classNameLower}Model, lis);
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return list${className};
	}

	/**
	 * ${table.tableDesc}数据查询总条数
	 * @param ${classNameLower}Model ${table.tableDesc}数据查询条件
	 * @return 查询条数
	 */
	@Override
	public Long queryCount${className}(${className}Model ${classNameLower}Model){
		Long count = (long)0;
		try{
			count = this.${classNameLower}Dao.queryCount${className}(${classNameLower}Model);
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return count;
	}
	
	/**
	 * 根据id查询${table.tableDesc}数据
	 * @param id ${table.tableDesc}数据id
	 * @return ${className}Model 单条数据
	 */
	@Override
	public ${className}Model query${className}ById(String id){
		${className}Model model = new ${className}Model();
		try{
			if(ParamValidateUtils.isEmpty(id)){
				return null;
			}else{
				model = this.${classNameLower}Dao.query${className}ById(id, null);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return model;
	}
	
	/**
	 * ${table.tableDesc}数据新增
	 * @param ${classNameLower}Model ${table.tableDesc}数据
	 * @return String 添加成功的id
	 */
	@Override
	public int save(${className}Model ${classNameLower}Model){
		int count = 0;
		try{
			if(ParamValidateUtils.isEmpty(${classNameLower}Model)){
				return 0;
			}else{
				count = this.${classNameLower}Dao.add${className}(${classNameLower}Model);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return count;
	}
	
	/**
	 * ${table.tableDesc}数据编辑
	 * @param ${classNameLower}Model ${table.tableDesc}数据
	 * @return 成功条数
	 */
	@Override
	public int edit(${className}Model ${classNameLower}Model){
		Integer count = 0;
		try{
			if(ParamValidateUtils.isEmpty(${classNameLower}Model) || ParamValidateUtils.isEmpty(${classNameLower}Model.get${modelIdFirstUpper}())){
				return 0;
			}else{
				count = this.${classNameLower}Dao.update${className}(${classNameLower}Model);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return count;
	}
	
	/**
	 * ${table.tableDesc}数据删除
	 * @param id ${table.tableDesc}数据id
	 * @return 成功条数
	 */
	@Override
	public int remove${className}ById(String id){
		Integer count = 0;
		try{
			if(ParamValidateUtils.isEmpty(id)){
				return 0;
			}else{
				count = this.${classNameLower}Dao.remove${className}ById(id);
			}		
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return count;
	}
	
	/**
	 * ${table.tableDesc}数据批量删除
	 * @param ids ${table.tableDesc}数据id的集合
	 * @return 成功条数
	 */
	@Override
	public int remove${className}ByIds(String ids){
		Integer count = 0;
		try{
			if(ParamValidateUtils.isEmpty(ids)){
				return 0;
			}else{
				List<String> lis = Arrays.asList(ids.split(","));
				count = this.${classNameLower}Dao.remove${className}ByIds(lis);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return count;
	}
}