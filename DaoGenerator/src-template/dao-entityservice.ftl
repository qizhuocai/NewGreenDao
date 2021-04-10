<#--


-->
package ${schema.defaultJavaPackageDao};

import org.greenrobot.greendao.AbstractDao;

<#list schema.entities as entity>
import ${entity.javaPackage}.${entity.className};
</#list>

<#list schema.entities as entity>
import ${entity.javaPackageDao}.${entity.classNameDao};
</#list>
/**
 * Created by qzc
 */
public class ${entity.className}Service extends BaseServiceDao<${entity.className}, Long> {
    public ${entity.className}Service(AbstractDao dao) {
        super(dao);
    }
}


