/**
 * @format
 */

import {AppRegistry} from 'react-native';
import {name as appName} from './app.json';

const { ShineToolsKit } = require("./shinetoolskit");
AppRegistry.registerComponent(appName, () => ShineToolsKit);


import { NativeModules, NativeEventEmitter, Platform } from 'react-native';
const { RNNativeTunnel } = NativeModules;

const nativeTunnel = new NativeEventEmitter(RNNativeTunnel);
nativeTunnel.addListener('STATIONSETUP', msg => {
    console.log("RN ShineToolsKit模块收到: ", msg);
    RNNativeTunnel.processResult("建站需要的步骤: Step1 Step2 Step3 Step4 Step5 Step8")
  });