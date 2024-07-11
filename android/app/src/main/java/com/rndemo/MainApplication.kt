package com.rndemo

import android.app.Application
import com.rndemo.react.ReactManager

class MainApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        ReactManager.initReactInstanceManager(this)
    }
}
