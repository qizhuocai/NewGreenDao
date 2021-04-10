<#--

-->
package ${schema.defaultJavaPackageDao};

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;

import ${schema.defaultJavaPackageDao}.DaoMaster;

<#list schema.entities as entity>
import ${entity.javaPackageDao}.${entity.classNameDao};
</#list>

/**
 * 自定义一个OpenHelper类，为以后数据库升级时使用
 * Created by qzc
 */
public class MySQLiteOpenHelper extends DaoMaster.OpenHelper {
    public MySQLiteOpenHelper(Context context, String name, SQLiteDatabase.CursorFactory factory) {
        super(context, name, factory);
    }
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    // MigrationHelper.migrate(db,“所有的Dao类”);//数据版本变更才会执行
     <#list schema.entities as entity>
     MigrationHelper.migrate(db,${entity.classNameDao}.class);
          </#list>
    }
}