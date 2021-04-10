# NewGreenDao
基于 https://github.com/greenrobot/greenDAO 项目重新增加了 DaoGenerator 引用里面的模板。

原有的基础上增加了一个单例的，数据库操作类，并且实现了不删除数据升级表。

dao-base.ftl 基础的泛型常用的数据库操作
dao-entityservice.ftl
dao-helper.ftl  数据库升级辅助类，保证原有数据
dao-manager.ftl  框架-核心管理类
dao-openhelper.ftl 
dao-util.ftl 数据增删改查
