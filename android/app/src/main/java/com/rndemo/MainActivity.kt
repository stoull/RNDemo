package com.rndemo

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.facebook.react.bridge.Arguments
import com.rndemo.react.DomeNativeModule
import com.rndemo.react.ReactContainerActivity

class MainActivity : AppCompatActivity() {

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_dome)

        //向RN发送事件
        findViewById<Button>(R.id.btn_send_event).setOnClickListener{
            val map = Arguments.createMap()
            map.putString("content", "Hello from Android")
            DomeNativeModule.instance.emitJS(map)
        }

        //加载业务页面
        findViewById<Button>(R.id.btn_load_business).setOnClickListener {
            startActivity(Intent(this, ReactContainerActivity::class.java))
        }
    }
}
