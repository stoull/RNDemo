
import { View } from 'react-native';
import { NativeModules, NativeEventEmitter, Platform } from 'react-native';
const { RNNativeTunnel } = NativeModules;
const nativeTunnel = new NativeEventEmitter(RNNativeTunnel);

const StationSetupOp = require('./station_setup_op');

const ShineToolsKit = () => {
    return (<></>);
}

// 开始监听原生调起的方法
function startListening() {
  nativeTunnel.addListener('STATIONSETUP', cmd => {
    console.log("RN ShineToolsKit模块收到: ", cmd);
    /**
     * deivceInfoForSN
      setupStationSteps
      settingsForStepId
     */

    const cmdObj = parserCmd(cmd)
    const methodName = cmdObj.methodName
    const params = cmdObj.params

    if (methodName === "deivceInfoForSN") {
      const sn = params.sn;
      const info = StationSetupOp.deivceInfoForSN(sn);
      responseToNative(methodName, params, info, true);
    } else if (methodName === "setupStationSteps") {
      const sn = params.sn;
      const info = StationSetupOp.setupStationSteps(sn);
      responseToNative(methodName, params, info, true);
    } else if (methodName === "settingsForStepId") {
      const id = cmd['id'];
      const stepInfo = StationSetupOp.settingsForStepId(id);
      responseToNative(methodName, params, stepInfo, true);
    }
  });
}

function parserCmd(obj) {
  // return JSON(obj);
  return obj;
}

function responseToNative(methodName, params, result, isSuccess) {
  const res = {
    "methodName": methodName,
    "params": params,
    "result": result,
    "isSuccess": isSuccess,
    "message": "" 
  }
  RNNativeTunnel.processResult(res)
}

module.exports = {
  ShineToolsKit: ShineToolsKit,
  startListening: startListening
};