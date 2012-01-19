#!/bin/sh

DEVICE=toro
MANUFACTURER=samsung

mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/app/BIP.apk -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/app/IMSFramework.apk -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/app/RTN.apk -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/app/SDM.apk -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/app/SPG.apk -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/app/SyncMLSvc.apk -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/fRom -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
chmod 755 ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/fRom
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libsecril-client.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libsyncml_core.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libsyncml_port.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/lib/lib_gsd4t.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/bin/pvrsrvinit -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
chmod 755 ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/pvrsrvinit
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/etc/sirfgps.conf -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/firmware/bcm4330.hcd -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/firmware/ducati-m3.bin -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/firmware/libpn544_fw.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/hw/gps.omap4.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/hw/gralloc.omap4.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libglslcompiler.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libIMGegl.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libims.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libims_jni.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libinvensense_mpl.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libpvr2d.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libpvrANDROID_WSEGL.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libPVRScopeServices.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libsec-ril_lte.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libsrv_init.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libsrv_um.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/vendor/lib/libusc.so -d ../../../vendor/$MANUFACTURER/$DEVICE/proprietary

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../vendor/$MANUFACTURER/$DEVICE/device-vendor-blobs.mk

# prebuilt libraries needed for toro
PRODUCT_COPY_FILES := \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsecril-client.so:obj/lib/libsecril-client.so

# system proprietaries needed for toro
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/fRom:system/bin/fRom \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsecril-client.so:system/lib/libsecril-client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsyncml_core.so:system/lib/libsyncml_core.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsyncml_port.so:system/lib/libsyncml_port.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib_gsd4t.so:system/lib/lib_gsd4t.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/pvrsrvinit:system/vendor/bin/pvrsrvinit \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/sirfgps.conf:system/vendor/etc/sirfgps.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bcm4330.hcd:system/vendor/firmware/bcm4330.hcd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/ducati-m3.bin:system/vendor/firmware/ducati-m3.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libEGL_POWERVR_SGX540_120.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLESv1_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLESv2_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gps.omap4.so:system/vendor/lib/hw/gps.omap4.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gralloc.omap4.so:system/vendor/lib/hw/gralloc.omap4.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libIMGegl.so:system/vendor/lib/libIMGegl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libims.so:system/vendor/lib/libims.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libims_jni.so:system/vendor/lib/libims_jni.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libinvensense_mpl.so:system/vendor/lib/libinvensense_mpl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvr2d.so:system/vendor/lib/libpvr2d.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsec-ril_lte.so:system/vendor/lib/libsec-ril_lte.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsrv_init.so:system/vendor/lib/libsrv_init.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsrv_um.so:system/vendor/lib/libsrv_um.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libusc.so:system/vendor/lib/libusc.so

# prebuilt packages needed for toro
PRODUCT_PACKAGES += \\
    BIP \\
    IMSFramework \\
    RTN \\
    SDM \\
    SPG \\
    SyncMLSvc

EOF

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/Android.mk

ifeq (\$(TARGET_DEVICE),toro)
LOCAL_PATH:=\$(call my-dir)

# BIP
include \$(CLEAR_VARS)

LOCAL_MODULE := BIP
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

# IMSFramework
include \$(CLEAR_VARS)

LOCAL_MODULE := IMSFramework
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

# RTN
include \$(CLEAR_VARS)

LOCAL_MODULE := RTN
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

# SDM

include \$(CLEAR_VARS)

LOCAL_MODULE := SDM
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

# SPG
include \$(CLEAR_VARS)

LOCAL_MODULE := SPG
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

# SyncMLSvc
include \$(CLEAR_VARS)

LOCAL_MODULE := SyncMLSvc
LOCAL_SRC_FILES := \$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
include \$(BUILD_PREBUILT)

endif
EOF

./setup-makefiles.sh
