// 基础模块-共用的 的内容
require("react");
require("react-native");

import { NativeModules, NativeEventEmitter} from 'react-native';
const data = new NativeEventEmitter(NativeModules.DomeNativeModule);

// 引入person.js中的Person类
const Person = require('./person');


data.addListener(
  'action',data=> {
    console.log("native event:", data);
    const john=new Person('朱刘斌',26)
    NativeModules.DomeNativeModule.jsCallBackNative(JSON.stringify(john))
  }
);

console.log("加载基础包");
