package com.rndemo.react

import android.util.Log
import android.widget.Toast
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.WritableMap
import com.facebook.react.modules.core.DeviceEventManagerModule


open class DomeNativeModule(private val mContext: ReactApplicationContext) :
    BaseNativeModule(mContext) {

    companion object {
        const val REACT_NATIVE_CLASSNAME: String = "DomeNativeModule"
        const val EVENT_NAME: String = "action"
        lateinit var instance: DomeNativeModule
    }

    init {
        instance = this
    }

    override fun getName(): String {
        return REACT_NATIVE_CLASSNAME
    }

    /**
     * 发送事件给JS
     * @param writableMap 参数
     */
    fun emitJS(writableMap: WritableMap) {
        sendEvent(EVENT_NAME, writableMap)
    }

    /**
     * JS调用原生（原生接收JS传过来的数据）
     */
    @ReactMethod
    fun jsCallBackNative(result: String) {
        Toast.makeText(mContext, result, Toast.LENGTH_SHORT).show()
        Log.d("DomeNativeModule", "Received result from JS:" + result)
    }

}