package com.rndemo.react

import android.util.Log
import android.widget.Toast
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.WritableMap


open class RNNativeTunnel(private val mContext: ReactApplicationContext) :
    BaseNativeModule(mContext) {

    companion object {
        const val REACT_NATIVE_CLASSNAME: String = "RNNativeTunnel"
        const val EVENT_NAME: String = "STATIONSETUP"
        lateinit var instance: RNNativeTunnel
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
    fun processResult(readableMap: ReadableMap) {
        Log.d(REACT_NATIVE_CLASSNAME, "processResult Received result from JS:")
        // 将 ReadableMap 转换为 Kotlin Map
        val map: Map<String, Any> = readableMap.toHashMap()
        Toast.makeText(mContext, map.toString(), Toast.LENGTH_SHORT).show()
    }

}