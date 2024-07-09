#!/bin/bash


#------------------------ functions ------------------------
function FuncUsage() {
	echo "#--------------------------------------------"
	echo "# `basename ${0}`: 使用: "
	echo "#		-i 打包iOS的包"
	echo "#		-a 打包Android的包"
	echo $'\n'
	echo "#----$0使用示例：----"
	echo $'\n'
	echo "1. 同时打安卓和iOS的包:"
	echo "$./autoPackage.sh -i -a 或者 $./autoPackage.sh"
	echo $'\n'
	echo "2. 只打iOS和安卓的包"
	echo "$./autoPackage.sh -i 和 $./autoPackage.sh -a "
	echo $'\n'
	echo "#--------------------------------------------"
}

#------------------------ 获取参数 ------------------------

#编译的configuration，默认为Release
isPackAndroid="YES"
isPackiOS="YES"

if [ $# -eq 0 ]; then
    isPackAndroid="YES"
    isPackiOS="YES"
else
    isPackAndroid="NO"
    isPackiOS="NO"
fi

while getopts "ai" optname
  do
    case "$optname" in
        "a") isPackAndroid="YES" ;;
        "i") isPackiOS="YES" ;;
        "?")
            echo "Error! Unknown option $OPTARG"
            FuncUsage
            exit 2
            ;;
        ":")
            echo "Error! No argument value for option $OPTARG"
            FuncUsage
            exit 2
            ;;
        *)
            # Should not occur
            echo "Error! Unknown error while processing options"
            FuncUsage
            exit 2
            ;;
    esac
  done

if [ "$isPackAndroid" = "YES" ];then
    npm run build:android:common
    npm run build:android:business

    # 自动压缩可用于版本更新上传的andriod zip文件
    appDisplayName=$(cat ./app.json | grep displayName | sed 's/.*"displayName": "\(.*\)",/\1/')
    cd "./bundle/android/${appDisplayName}/"
    zipName="${appDisplayName}.zip"
    zip -r "../${zipName}" ./*
    cd -
fi

if [ "$isPackiOS" = "YES" ];then
    npm run build:ios:common
    npm run build:ios:business

    # 自动压缩可用于版本更新上传的ios zip文件
    appDisplayName=$(cat ./app.json | grep displayName | sed 's/.*"displayName": "\(.*\)",/\1/')
    appVersionStr=$(cat ./app.json | grep versionNumStr | sed 's/.*"versionNumStr": "\(.*\)",/\1/')
    noSapce=$(echo ${appDisplayName} | sed 's/ //g')
    zipName="ios_${noSapce}_${appVersionStr}.zip"
    cd "./bundle/ios/${appDisplayName}/"
    zip -r "../${zipName}" ./*
    cd -
fi