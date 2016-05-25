package com.feng.common;

import com.jfinal.core.Controller;

/**
 * Created by Feng on 2016-5-25.
 */
public class IndexController extends Controller {
    /**
     * 默认跳转
     */
    public void index() {
//        renderText("hello,Yes");
        render("index.ftl");
    }
}
