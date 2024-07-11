package com.rndemo.react

import android.annotation.SuppressLint
import android.app.Application
import com.facebook.hermes.reactexecutor.HermesExecutorFactory
import com.facebook.react.PackageList
import com.facebook.react.ReactInstanceManager
import com.facebook.react.ReactPackage
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContext
import com.facebook.react.common.LifecycleState

class ReactManager {

    companion object InnerClass {

        const val COMMON_FILE_NAME = "common.android.bundle"

        @SuppressLint("StaticFieldLeak")
        @JvmStatic
        private var reactInstanceManager: ReactInstanceManager? = null

        /**
         * 是否加载了基础包
         */
        @JvmStatic
        var isCommonLoad: Boolean = false

        /**
         * 获取React实例管理器
         */
        @JvmStatic
        fun getReactInstanceManager(): ReactInstanceManager? {
            return reactInstanceManager
        }

        @JvmStatic
        fun destroyReactInstanceManager() {
            if (reactInstanceManager == null) {
                return
            }
            isCommonLoad = false
            reactInstanceManager?.destroy()
            reactInstanceManager = null
        }

        /**
         * 初始化react上下文初始化
         */
        @JvmStatic
        fun initReactInstanceManager(application: Application) {
            val reactPackageList: MutableList<ReactPackage> = PackageList(application).packages
            reactPackageList.add(DomeReactPackage())

            reactInstanceManager = ReactInstanceManager.builder().setApplication(application)
                .addPackages(reactPackageList).setBundleAssetName(COMMON_FILE_NAME)
                .setJavaScriptExecutorFactory(HermesExecutorFactory())
                .setInitialLifecycleState(LifecycleState.BEFORE_CREATE).build()

            //添加基础包监听加载
            getReactInstanceManager()?.addReactInstanceEventListener(object :
                ReactInstanceManager.ReactInstanceEventListener {
                override fun onReactContextInitialized(context: ReactContext) {
                    isCommonLoad = true
                }
            })

            //加载基础包(可先不加载用到再加载)
            getReactInstanceManager()?.createReactContextInBackground()
        }

    }
}