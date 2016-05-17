##Android-JNI

Studio_Android-JNI  

1.開新Project ( 簡略... )

2.首先,先安裝模擬器

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/1.PNG)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/2.PNG)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/3.png)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/4.png)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/5.png)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/6.png)

3.接下來,設定一些動態的編制模式

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/0.png)

JAVAH <br>

	$JDKPath$/bin/javah.exe
	
	-v -jni -d $ModuleFileDir$/src/main/jni $FileClass$
	
	$SourcepathEntry$

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/0-1.png)

	C:\Users\Nian\AppData\Local\Android\Sdk\ndk-bundle\ndk-build.cmd

	$ProjectFileDir$\app\src\main

NDK-Build <br>
![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/0-2.png)

4.接下來, 新建 JNI 的 File 

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/7.PNG)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/8.png)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/9.PNG)

	 ndk{
            moduleName "MyLibrary"
        }
        sourceSets.main{
            jni.srcDirs = []
            jniLibs.srcDir "src/main/libs"
        }

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/10.png)

5.接下來,新建JAVA Class

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/11.PNG)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/12.png)

	public class MyNdk {
    static {
        System.loadLibrary("MyLibrary");
    }
    public native String getString();
	}

6.利用JAVAH執行,且自動編輯

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/13.PNG)

7.如完成第六項,可再JNI中獲得XXXX.h檔

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/14.PNG)

8.建立文件

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/15.PNG)

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/16.PNG)

8-1.create cpp檔,下圖的紅線是要換成剛剛動態創造的H檔名稱


![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/17.PNG) 

	#include "com_ndk_nian_myjni_MyNdk.h"
	JNIEXPORT jstring JNICALL Java_com_ndk_nian_myjni_MyNdk_getString
  	(JNIEnv * env, jobject obj){
   	return (*env).NewStringUTF("This is EEEEE !!!");
  	}

8-2.create Android.mk 

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/18.PNG) 

	LOCAL_PATH := $(call my-dir)
	include $(CLEAR_VARS)
	LOCAL_MODULE := MyLibrary
	LOCAL_SRC_FILES =: MyLibrary.cpp
	include $(BUILD_SHARED_LIBRARY)


8-3.create Application.mk

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/19.PNG)
	
	APP_MODULES := MyLibrary
	APP_ABI := all

9.完成以上,接下來利用動態方是執行NDK-build的配置

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/24.PNG)

10.撰寫JNI顯示在TextView

	  TextView tv = (TextView) findViewById(R.id.tv);
      tv.setText(new MyNdk().getString());

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/20.PNG)

11.更換TextBox名稱,叫做tv

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/21.PNG)

12.執行程式

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/22.PNG)

13.選擇模擬器

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/23.png)

14.結果

![](https://github.com/nexstar/Parrot/raw/master/Android/Android-JNI/JNI-Picture/25.png)
