package com.rndemo.utils

import android.content.Context
import com.facebook.react.bridge.CatalystInstance
import com.facebook.react.bridge.CatalystInstanceImpl

object BridgeUtils {

    /**
     * 从Asset中加载bundle
     */
    fun loadScriptFromAsset(context: Context, instance: CatalystInstance, assetName: String, loadSynchronously: Boolean) {
        var source = assetName
        if (!assetName.startsWith("assets://")) {
            source = "assets://$assetName"
        }
        (instance as CatalystInstanceImpl).loadScriptFromAssets(
            context.assets,
            source,
            loadSynchronously
        )
    }


    /**
     * 从File中加载bundle
     */
    fun loadScriptFromFile(fileName: String?, instance: CatalystInstance, sourceUrl: String?, loadSynchronously: Boolean) {
        (instance as CatalystInstanceImpl).loadScriptFromFile(
            fileName,
            sourceUrl,
            loadSynchronously
        )
    }
}
