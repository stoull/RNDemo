
import { NativeModules, NativeEventEmitter, Platform } from 'react-native';

const { RNNativeTunnel } = NativeModules;

const nativeTunnel = new NativeEventEmitter(RNNativeTunnel);

// nativeTunnel.addListener('STATIONSETUP', msg => {
//     let msgStr = JSON.parse(msg);
//   });

const ShineToolsKit = () => {
    return (
        <View></View>
    );
}

export default ShineToolsKit;