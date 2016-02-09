#!/bin/sh

## FUNC 检查上一次执行命令的返回状态，如果错误则执行退出操作
checkfail()
{
    #$0: shell或shell脚本的名字
    #$*:以一对双引号给出参数列表
    #$@:将各个参数分别加双引号返回
    #$#:参数的个数
    #$_:代表上一个命令的最后一个参数
    #$$:代表所在命令的PID
    #$!:代表最后执行的后台命令的PID
    #$?:代表上一个命令执行后的退出状态

    if [ ! $? -eq 0 ];then
        echo "$1"
        exit 1
    fi

}

## FUNC 输出错误信息
error()
{
    echo "$1"
    exit 1;
}

## --> Check CrossApp exist
if [ ! -d "../CrossApp" ]; then
    error "请确认存在文件夹../CrossApppp"
fi

echo "Check Ok --> ../CrossApp"
#xmake f -c -p iphoneos
#xmake p -o libs -a "armv7,armv7s,arm64"

#xmake f -c -p android --ndk=~/Desktop/android-ndk-r10b/
#xmake p -o libs -a "armv5te,armv7-a"

#xmake f -c -p macosx
#xmake p -o libs
