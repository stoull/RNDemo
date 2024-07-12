// 设备机型表
const DeviceType = Object.freeze({
    inverter: 0,            // 逆变器
    storage_inverter: 1,    // 储能机
    battery: 2,             // 电池
    data_logger: 3,         // 采集器
    other: 4                // 其他设备
})

// 设备支持的连接方式
const SupportedConnectType = Object.freeze({
    none: 0,        // 不支持连接
    bluetooth: 1,   // 只支持蓝牙
    wifi: 2,        // 只支持Wi-Fi
    bluetoothAndWifi: 3 // 支持 蓝牙、Wi-Fi
})

// 设备支持的连接方式
const DevicePosition = Object.freeze({
    in: 0,      // 内置采集器
    out: 1,     // 外置采集器
    unknow: 2   // 都不是
})

module.exports.DeviceType = DeviceType;
module.exports.SupportedConnectType = SupportedConnectType;
module.exports.DevicePosition = DevicePosition;