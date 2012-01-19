
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/toro/tuna/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/samsung/toro/tuna/overlay
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PACKAGES := \
	lights.tuna \
	charger \
	charger_res_images

PRODUCT_PACKAGES += \
	sensors.tuna \
	libinvensense_mpl

PRODUCT_PACKAGES += \
	nfc.tuna

PRODUCT_PACKAGES += \
	audio.primary.tuna \
	audio.a2dp.default \
	libaudioutils

PRODUCT_PACKAGES += \
	tuna_hdcp_keys

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/samsung/toro/tuna/init.tuna.rc:root/init.tuna.rc \
	device/samsung/toro/tuna/ueventd.tuna.rc:root/ueventd.tuna.rc \
    device/samsung/toro/tuna/init.tuna.usb.rc:root/init.tuna.usb.rc \
	device/samsung/toro/tuna/media_profiles.xml:system/etc/media_profiles.xml

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcmdhd.ko
endif

PRODUCT_COPY_FILES += \
	device/samsung/toro/tuna/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

# Build properties
PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=180 \
	drm.service.enabled=true \
	ro.com.google.mcc_fallback=262

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# NFC
PRODUCT_PACKAGES += \
        libnfc \
        libnfc_jni \
        Nfc \
        Tag

# Key maps
PRODUCT_COPY_FILES += \
	device/samsung/toro/tuna/tuna-gpio-keypad.kl:system/usr/keylayout/tuna-gpio-keypad.kl \
	device/samsung/toro/tuna/tuna-gpio-keypad.kcm:system/usr/keychars/tuna-gpio-keypad.kcm

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/samsung/toro/tuna/Melfas_MMSxxx_Touchscreen.idc:system/usr/idc/Melfas_MMSxxx_Touchscreen.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# HACK: copy panda init for now to boot on both boards
PRODUCT_COPY_FILES += \
	device/samsung/toro/tuna/panda/init.omap4pandaboard.rc:root/init.omap4pandaboard.rc

# Melfas touchscreen firmware
PRODUCT_COPY_FILES += \
    device/samsung/toro/tuna/mms144_ts_rev31.fw:system/vendor/firmware/mms144_ts_rev31.fw \
    device/samsung/toro/tuna/mms144_ts_rev32.fw:system/vendor/firmware/mms144_ts_rev32.fw

# Portrait dock image
PRODUCT_COPY_FILES += \
    device/samsung/toro/tuna/dock.png:system/vendor/res/images/dock/dock.png

# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += \
	packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# file that declares the MIFARE NFC constant
PRODUCT_COPY_FILES += \
	device/samsung/toro/tuna/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
	com.android.nfc_extras

PRODUCT_COPY_FILES += \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/samsung/toro/tuna/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/samsung/toro/tuna/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product-if-exists, vendor/nxp/pn544/nxp-pn544-fw-vendor.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)
$(call inherit-product-if-exists, vendor/samsung/toro/tuna/device-vendor.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
