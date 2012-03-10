
#if we do this after the full_base_telephony is included some of these don't get picked up..
PRODUCT_COPY_FILES += \
    device/samsung/toro/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/samsung/toro/apns-conf_verizon.xml:system/etc/apns-conf.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from toro device
$(call inherit-product, device/samsung/toro/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_toro
PRODUCT_DEVICE := toro
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full AOSP on Toro
