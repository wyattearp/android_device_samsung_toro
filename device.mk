DEVICE_PACKAGE_OVERLAYS := device/samsung/toro/overlay

PRODUCT_COPY_FILES += \
	device/samsung/toro/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
	device/samsung/toro/apns-conf_verizon.xml:system/etc/apns-conf.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.vc_call_vol_steps=7 \
    ro.com.google.clientidbase=android-verizon \
    ro.com.google.locationfeatures=1 \
    ro.com.android.dataroaming=false \
    ro.setupwizard.mode=OPTIONAL \
    ro.cdma.home.operator.numeric=310004 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
    ro.gsm.2nd_data_retry_config=max_retries=infinite,default_randomization=2000,0,0,80000,125000,485000,905000 \
    ro.cdma.otaspnumschema=SELC,1,80,99

PRODUCT_COPY_FILES += \
    vendor/samsung/toro/proprietary/com.vzw.hardware.ehrpd.xml:system/etc/permissions/com.vzw.hardware.ehrpd.xml \
    vendor/samsung/toro/proprietary/com.vzw.hardware.lte.xml:system/etc/permissions/com.vzw.hardware.lte.xml \
    vendor/samsung/toro/proprietary/com.vzw.vzwapnlib.xml:system/etc/permissions/com.vzw.vzwapnlib.xml

$(call inherit-product, device/samsung/toro/tuna/device.mk)
$(call inherit-product-if-exists, vendor/samsung/toro/device-vendor.mk)
