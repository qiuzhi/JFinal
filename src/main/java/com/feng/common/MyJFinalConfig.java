package com.feng.common;

import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.render.FreeMarkerRender;

import java.util.Properties;

/**
 * Created by Feng on 2016-5-25.
 */
public class MyJFinalConfig extends JFinalConfig {
    /**
     * Config constant
     *
     * @param me
     */
    public void configConstant(Constants me) {
        me.setDevMode(true);//开发模式设置
        me.setBaseViewPath("META-NIF/template");//页面模板根路径
        me.setFreeMarkerViewExtension(".ftl");//freemarker 模板后缀名
    }

    /**
     * Config route
     *
     * @param me
     */
    public void configRoute(Routes me) {

    }

    /**
     * Config plugin
     *
     * @param me
     */
    public void configPlugin(Plugins me) {

    }

    /**
     * Config interceptor applied to all actions.
     *
     * @param me
     */
    public void configInterceptor(Interceptors me) {

    }

    /**
     * Config handler
     *
     * @param me
     */
    public void configHandler(Handlers me) {
        me.add(new ContextPathHandler("base"));//添加项目contextPath,以便在页面直接获取该值 ${base?if_exists}
    }

    public void afterJFinalStart() {
        Properties p = loadPropertyFile("freemarker.properties");//由于我们用到freemarker，所以在此进行freemarker配置文件的装载
        FreeMarkerRender.setProperties(p);
    }

    /**
     * 建议使用 JFinal 手册推荐的方式启动项目
     * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
     */
//    public static void main(String[] args) {
//        JFinal.start("src/main/webapp", 8080, "/", 5);
//    }
}
