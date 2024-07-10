package com.rndemo.react

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.modules.core.DeviceEventManagerModule

abstract class BaseNativeModule(private val mContext: ReactApplicationContext) : ReactContextBaseJavaModule(mContext) {

    /**
     * 发送事件
     *
     * @param eventName
     * @param params
     */
    fun sendEvent(eventName: String, params: Any) {
        mContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java).emit(eventName, params)
    }

}