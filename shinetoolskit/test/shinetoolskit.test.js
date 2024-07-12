const stepsJson = require('../source/station_setup_steps.json');
const deviceModelList = require('../source/device_model_list.json');

// console.log("DeviceSteps: ", stepsJson.deviceSteps);
// console.log("Steps: ", stepsJson.steps);
// console.log("deviceModelList: ", deviceModelList.deviceModelList);

function setupStationSteps(deviceSn) {
    const pre3_sn = deviceSn.slice(0,3);
    const device_steps = stepsJson.deviceSteps[pre3_sn];
    const all_steps = stepsJson.steps;
    const device_steps_json = all_steps.filter(step => device_steps.includes(step.id));
    return device_steps_json;
}

test("根据SN号获取建站流程-SN:AAM0000000", () => {
    const devSteps = setupStationSteps("AAM0000000");
    console.log("SN为:AAM0000000的设备建站流程为: ", devSteps)
    expect(devSteps.length).toBe(5);
})

const setupOp = require('../station_setup_op');

test("根据SN号获取建站流程-SN:AAM0000000", () => {
    let device = setupOp.deivceInfoForSN("AAM0000000");
    expect(device.supportedConnectType).toBe(3);
})