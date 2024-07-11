package com.rndemo.react

import android.os.Bundle
import android.view.KeyEvent
import androidx.appcompat.app.AppCompatActivity
import com.facebook.react.ReactInstanceEventListener
import com.facebook.react.ReactInstanceManager
import com.facebook.react.ReactRootView
import com.facebook.react.bridge.ReactContext
import com.facebook.react.modules.core.DefaultHardwareBackBtnHandler
import com.facebook.soloader.SoLoader
import com.rndemo.utils.BridgeUtils

open class BaseReactActivity : AppCompatActivity(), DefaultHardwareBackBtnHandler {

    private var mReactInstanceManager: ReactInstanceManager? = null
    private var mReactRootView: ReactRootView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        SoLoader.init(this, false)
        handleBusiness()
    }

    /**
     * 分包加载业务包
     */
    private fun handleBusiness() {
        mReactInstanceManager = ReactManager.getReactInstanceManager()
        mReactInstanceManager!!.onHostResume(this, this)
        mReactRootView = ReactRootView(this)

        //已经加载基础包直接加载业务包
        if (ReactManager.isCommonLoad) {
            loadBusiness()
            return
        }

        //添加基础包加载监听
        addReactInstanceEventListener()
        //加载基础包
        mReactInstanceManager!!.createReactContextInBackground()
    }

    /**
     * 添加基础包加载监听器
     */
    private fun addReactInstanceEventListener() {
        mReactInstanceManager!!.addReactInstanceEventListener(object : ReactInstanceEventListener {
            override fun onReactContextInitialized(context: ReactContext) {
                ReactManager.isCommonLoad = true
                mReactInstanceManager!!.removeReactInstanceEventListener(this)
                loadBusiness()
            }
        })
    }

    /**
     * 业务加载
     */
    private fun loadBusiness() {
        try {
            val mContext = mReactInstanceManager!!.currentReactContext
            val instance = mContext!!.catalystInstance
            BridgeUtils.loadScriptFromAsset(
                mContext, instance, "assets://" + "index.android.bundle", false
            )
            mReactRootView!!.startReactApplication(mReactInstanceManager, "RNDemo", null)
            setContentView(mReactRootView)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    override fun onPause() {
        super.onPause()

        if (mReactInstanceManager != null) {
            mReactInstanceManager!!.onHostPause(this)
        }
    }

    override fun onResume() {
        super.onResume()

        if (mReactInstanceManager != null) {
            mReactInstanceManager!!.onHostResume(this, this)
        }
    }

    override fun onDestroy() {
        super.onDestroy()

        if (mReactInstanceManager != null) {
            mReactInstanceManager!!.onHostDestroy(this)
        }
        if (mReactRootView != null) {
            mReactRootView!!.unmountReactApplication()
        }
    }

    override fun invokeDefaultOnBackPressed() {
        super.onBackPressed()
    }

    override fun onKeyUp(keyCode: Int, event: KeyEvent): Boolean {
        if (keyCode == KeyEvent.KEYCODE_MENU) {
            mReactInstanceManager!!.showDevOptionsDialog()
            return true
        }
        return super.onKeyUp(keyCode, event)
    }


}