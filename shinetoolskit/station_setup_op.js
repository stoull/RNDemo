
import {steps, deviceSteps} from './source/station_setup_steps.json';
import {deviceModelList} from './source/device_model_list.json';

const enums = require('./enum');
const getdeivceInfoWithSN = require('./device');

// const enums = require("./enum");
// const StepsJson = require("./source/station_setup_steps.json");
// const ModelListJson = require("./source/device_model_list.json");
// const Device = require("./device");

// 根据SN获取设备信息
function deivceInfoForSN(sn) {
    let deviceInfo = getdeivceInfoWithSN(sn)
    return deviceInfo
}

// 根据设备SN获取建站流程
function setupStationSteps(deviceSn) {
    const pre3_sn = deviceSn.slice(0,3);
    const device_steps = deviceSteps[pre3_sn];
    const all_steps = steps;
    const steps_for_device = all_steps.filter(step => device_steps.includes(step.id));
    return steps_for_device;
}

// 根据步骤id获取设置项
function settingsForStepId(stepId) {
    
}

module.exports = {
    deivceInfoForSN: deivceInfoForSN,
    setupStationSteps: setupStationSteps,
    settingsForStepId: settingsForStepId
};