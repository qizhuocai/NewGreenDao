# NewGreenDao
基于 https://github.com/greenrobot/greenDAO 项目重新增加了 DaoGenerator 引用里面的模板。

原有的基础上增加了一个单例的，数据库操作类，并且实现了不删除数据升级表。

dao-base.ftl 基础的泛型常用的数据库操作

dao-entityservice.ftl

dao-helper.ftl  数据库升级辅助类，保证原有数据

dao-manager.ftl  框架-核心管理类

dao-openhelper.ftl 

dao-util.ftl 数据增删改查

1.修改greenDAO 代码生成模板 介绍。

2.下载该项目的DaoGenerator，找到src-template目录，ftl文件进行对应的添加修改。

3.找到项目类 DaoGenerator 对应的声明Template文件 ，在DaoGenerator()添加加载模板文件，找到 generateAll()方法，添加生成规则。
.
4.构建项目，没有问题的话build 会有生成好的 greendao-generator-3.3.2.jar 包（可以自行修改生成包的版本号）
.
5.复制生成好的包到项目里面classpath下来的路径 
.
![image](https://user-images.githubusercontent.com/20677983/114266344-6c395c80-9a28-11eb-8337-dba141c20f6c.png)

![image](https://user-images.githubusercontent.com/20677983/114266401-c5a18b80-9a28-11eb-9679-43b449fa6875.png)

![image](https://user-images.githubusercontent.com/20677983/114266410-d94cf200-9a28-11eb-831f-b98ce177c938.png)

关闭AS删除原来的包 粘贴进去生成好的包修改成你项目的greenDAO版本号

修改schemaVersion 版本号重新生成你的项目，模板就会根据你的规则生成对应代码。
