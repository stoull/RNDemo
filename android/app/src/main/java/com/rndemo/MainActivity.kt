package com.rndemo

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.facebook.react.bridge.Arguments
import com.rndemo.react.RNNativeTunnel
import com.rndemo.react.ReactContainerActivity
import com.rndemo.react.ReactManager
import com.rndemo.utils.BridgeUtils

class MainActivity : AppCompatActivity() {

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_dome)

        //加载建站插件包
        findViewById<Button>(R.id.btn_load_build).setOnClickListener {
            ReactManager.loadBundle("shinetoolskit.android.bundle")
        }

        //向RN发送事件
        findViewById<Button>(R.id.btn_send_event).setOnClickListener {
            val map = Arguments.createMap()
            val params= Arguments.createMap()
            map.putString("methodName", "setupStationSteps")
            params.putString("sn", "AAM0000000")
            map.putMap("params", params)
            RNNativeTunnel.instance.emitJS(map)
        }

        //加载业务页面
        findViewById<Button>(R.id.btn_load_business).setOnClickListener {
            startActivity(Intent(this, ReactContainerActivity::class.java))
        }
    }
}
