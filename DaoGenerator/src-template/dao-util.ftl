<#--

-->
package ${schema.defaultJavaPackageDao};

import java.util.List;
import android.util.Log;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.AbstractDaoSession;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.identityscope.IdentityScopeType;
import org.greenrobot.greendao.internal.DaoConfig;

<#list schema.entities as entity>
import ${entity.javaPackage}.${entity.className};
</#list>

<#list schema.entities as entity>
import ${entity.javaPackageDao}.${entity.classNameDao};
</#list>

/**
 * Created by qzc
 * 数据保存和获取工具类
 */
public class DbUtil {

  private static DbUtil dbUtil;
  private static String TAG="DbUtil";
  private DbUtil() {}

   public static synchronized DbUtil getInstance() {
        if (dbUtil == null) {
            synchronized (DbUtil.class) {
                if (dbUtil == null) {
                    dbUtil = new DbUtil();
                }
            }
        }
        return dbUtil;
    }

     <#list schema.entities as entity>

     //region   ${entity.classNameDao}  管理 操作
    private ${entity.className}Service ${entity.className}_Service;

    private static  ${entity.classNameDao} Get${entity.classNameDao}() {
            return DbManager.getDaoSession().get${entity.classNameDao}();
        }
      public ${entity.className}Service Get${entity.className}Service() {
          if (${entity.className}_Service == null) {
              ${entity.className}_Service = new ${entity.className}Service(Get${entity.classNameDao}());
          }
          return  ${entity.className}_Service;
      }

    /**
     * ${entity.className}保存单个dev
     */
    public void set${entity.className}(${entity.className} item) {
        if (null == item) {
            return;
        }
        try {
            ${entity.className}  ${entity.className}_entity =Get${entity.className}Service().queryBuilder().where( ${entity.classNameDao}.Properties.Id.eq(item.getId())).unique();
            if (${entity.className}_entity != null) {
               //替换主键
                item.setId(${entity.className}_entity.getId());
                //更新
               Get${entity.className}Service().update(item);
             } else {
               Get${entity.className}Service().saveOrUpdate(item);
            }
         } catch (Exception e) {
                   e.printStackTrace();
               }
    }
    /**
     * ${entity.className}批量保存 dev
     */
    public void set${entity.className}List(List<${entity.className}> list) {
        if (null == list || list.size() <= 0) {
            return;
        }
        try {
            for (${entity.className} item : list) {
             ${entity.className}  ${entity.className}_entity =Get${entity.className}Service().queryBuilder().where( ${entity.classNameDao}.Properties.Id.eq(item.getId())).unique();
                        if (${entity.className}_entity != null) {
                            //替换主键
                            item.setId(${entity.className}_entity.getId());
                            //更新
                            Get${entity.className}Service().update(item);
                         } else {
                           Get${entity.className}Service().saveOrUpdate(item);
                        }
            }
         } catch (Exception e) {
                   e.printStackTrace();
               }
    }
    /**
     * ${entity.className}删除单个dev
     */
    public void delete${entity.className} (${entity.className}  item) {
        if (null == item) {
            return;
        }
        try {
            Get${entity.className}Service().delete(item);
        } catch (Exception e) {
                  e.printStackTrace();
              }
    }
    /**
     * ${entity.className}删除单个dev
     */
    public void delete${entity.className}By(long item) {
        try {
             Get${entity.className}Service().deleteByKey(item);
          } catch (Exception e) {
                    e.printStackTrace();
                }
    }
    /**
     * ${entity.className}获取保存的dev数据集合
     */
    public List<${entity.className}> Get${entity.className}List() {
        List<${entity.className}> list${entity.className} = null;
        try {
             list${entity.className}  =Get${entity.classNameDao}() .queryBuilder().list();
         } catch (Exception e)
         {
            e.printStackTrace();
          }
        return  list${entity.className} ;
    }
    //endregion
  </#list>



}