
import {deviceModelList} from './source/device_model_list.json';

const enums = require("./enum");

function getdeivceInfoWithSN(sn) {
    // const type  = deviceModelList[sn]
    // 这里暂时写死测试
    return {
        "sn": "sn",
        "type": enums.DeviceType.inverter,
        "supportedConnectType": enums.SupportedConnectType.bluetoothAndWifi,
        "devicePosition": enums.DevicePosition.in
    }
}

module.exports = getdeivceInfoWithSN;