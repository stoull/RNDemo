package com.rndemo.react

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ViewManager

class DomeReactPackage : ReactPackage {

    /**
     * 创建供RN调用原生的模块
     */
    override fun createNativeModules(context: ReactApplicationContext): MutableList<NativeModule> {
        val nativeModules: MutableList<NativeModule> = mutableListOf();
        nativeModules.add(DomeNativeModule(context))
        return nativeModules
    }

    /**
     * RN调用原生控件或自定义组件时可用到
     */
    override fun createViewManagers(p0: ReactApplicationContext): List<ViewManager<*, *>> {
        return emptyList<ViewManager<*, *>>()
    }
}