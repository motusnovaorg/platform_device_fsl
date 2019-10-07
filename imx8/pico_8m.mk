# This is a FSL Android Reference Design platform based on i.MX8QP ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

-include device/fsl/common/imx_path/ImxPathConfig.mk
$(call inherit-product, device/fsl/imx8/imx8.mk)

ifneq ($(wildcard device/fsl/pico_8m/fstab_nand.freescale),)
$(shell touch device/fsl/pico_8m/fstab_nand.freescale)
endif

ifneq ($(wildcard device/fsl/pico_8m/fstab.freescale),)
$(shell touch device/fsl/pico_8m/fstab.freescale)
endif

# Device does not have firmware by default
BOARD_HAS_ATH10K_WLAN_FIRMWARE := false

# Overrides
PRODUCT_NAME := pico_8m
PRODUCT_DEVICE := pico_8m

PRODUCT_FULL_TREBLE_OVERRIDE := true

PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/init.rc:root/init.freescale.rc \
	device/fsl/pico_8m/init.linux.rc:root/init.linux.rc \
	device/fsl/pico_8m/init.imx8mq.rc:root/init.freescale.imx8mq.rc \
	device/fsl/pico_8m/init.usb.rc:root/init.freescale.usb.rc

# Audio
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
	device/fsl/pico_8m/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \

# GPU files

PRODUCT_COPY_FILES += device/fsl/pico_8m/init.freescale.sd.rc:root/init.freescale.sd.rc
PRODUCT_COPY_FILES += device/fsl/pico_8m/init.freescale.emmc.rc:root/init.freescale.emmc.rc

DEVICE_PACKAGE_OVERLAYS := device/fsl/pico_8m/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi xhdpi

# Ubuntu chroot file
PRODUCT_COPY_FILES += \
        external/ubuntu-image/ubuntu-bionic-chroot.img.gz:system/ubuntu/ubuntu-bionic-chroot.img.gz \
	external/ubuntu-image/install-chroot.sh:system/bin/install-chroot.sh \
	external/ubuntu-image/mount-chroot.sh:system/bin/mount-chroot.sh \
	external/ubuntu-image/stage2.sh:system/bin/stage2.sh \
	external/ubuntu-image/stage3.sh:system/bin/stage3.sh 

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.output.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.screen.portrait.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.portrait.xml \
	frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml \
	frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/android.software.voice_recognizers.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.voice_recognizers.xml \
	frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
	frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml \
	frameworks/native/data/etc/android.software.device_admin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_admin.xml \
	frameworks/native/data/etc/android.software.managed_users.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.managed_users.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
	device/fsl/pico_8m/required_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/required_hardware.xml \

PRODUCT_COPY_FILES += \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/gpu-viv/lib64/egl/egl.cfg:$(TARGET_COPY_OUT_VENDOR)/lib64/egl/egl.cfg \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/gpu-viv/lib/egl/egl.cfg:$(TARGET_COPY_OUT_VENDOR)/lib/egl/egl.cfg

# HWC2 HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service

# Gralloc HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

BOARD_CUSTOM_BT_CONFIG := device/fsl/pico_8m/bluetooth/libbt_vnd.conf

PRODUCT_PACKAGES += \
        libEGL_VIVANTE \
        libGLESv1_CM_VIVANTE \
        libGLESv2_VIVANTE \
        gralloc_viv.imx8 \
        libGAL \
        libGLSLC \
        libVSC \
        libg2d \
        libgpuhelper \
        libSPIRV_viv \
        libvulkan_VIVANTE \
        vulkan.imx8 \
        gatekeeper.imx8

PRODUCT_PACKAGES += \
    Launcher3

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Usb HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.imx

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# WiFi HAL
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    wifilogd \
    wificond

# Qcom WiFi Firmware
PRODUCT_COPY_FILES += \
    external/qca-linux/1CQ/nvm_tlv_3.2.bin:vendor/firmware/nvm_tlv_3.2.bin \
    external/qca-linux/1CQ/board.bin:vendor/firmware/ath10k/QCA6174/hw3.0/board.bin \
    external/linux-firmware/qca/rampatch_00130302.bin:vendor/firmware/rampatch_tlv_3.2.tlv \
    external/linux-firmware/ath10k/QCA6174/hw3.0/board.bin:vendor/firmware/ath10k/QCA6174/hw3.0/board.bin \
    external/linux-firmware/ath10k/QCA6174/hw3.0/board-2.bin:vendor/firmware/ath10k/QCA6174/hw3.0/board-2.bin \
    external/linux-firmware/ath10k/QCA6174/hw3.0/firmware-4.bin:vendor/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin

ifeq ($(BOARD_HAS_ATH10K_WLAN_FIRMWARE),true)
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/wifi-firmware/QCA9377/hw1.0/board.bin:vendor/lib/firmware/ath10k/QCA9377/hw1.0/board.bin \
	device/fsl/pico_8m/wifi-firmware/QCA9377/hw1.0/board-2.bin:vendor/lib/firmware/ath10k/QCA9377/hw1.0/board-2.bin \
	device/fsl/pico_8m/wifi-firmware/QCA9377/hw1.0/board-sdio.bin:vendor/lib/firmware/ath10k/QCA9377/hw1.0/board-sdio.bin \
	device/fsl/pico_8m/wifi-firmware/QCA9377/hw1.0/firmware-sdio-5.bin:vendor/lib/firmware/ath10k/QCA9377/hw1.0/firmware-sdio-5.bin
endif

# QCA9377 Bluetooth Firmware
ifneq (,$(wildcard device/fsl/pico_8m/bluetooth/rampatch_tlv_3.2.tlv))
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/bluetooth/rampatch_tlv_3.2.tlv:$(TARGET_COPY_OUT_VENDOR)/firmware/qca/rampatch_tlv_tf_1.0.tlv \
	device/fsl/pico_8m/bluetooth/rampatch_tlv_3.2.tlv:$(TARGET_COPY_OUT_VENDOR)/firmware/qca/tfbtfw11.tlv
endif
ifneq (,$(wildcard device/fsl/pico_8m/bluetooth/rampatch_tlv_3.2.tlv))
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/bluetooth/nvm_tlv_3.2.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/qca/nvm_tlv_tf_1.0.bin \
	device/fsl/pico_8m/bluetooth/nvm_tlv_3.2.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/qca/tfbtnv11.bin
endif

# QCA9377 WiFi Firmware
ifneq (,$(wildcard device/fsl/pico_8m/wifi-firmware/QCA9377/wlan/cfg.dat))
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/wifi-firmware/QCA9377/wlan/cfg.dat:vendor/lib/firmware/wlan/cfg.dat
endif
ifneq (,$(wildcard device/fsl/pico_8m/wifi-firmware/QCA9377/wlan/qcom_cfg.ini))
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/wifi-firmware/QCA9377/wlan/qcom_cfg.ini:vendor/lib/firmware/wlan/qcom_cfg.ini
endif
ifneq (,$(wildcard device/fsl/pico_8m/wifi-firmware/QCA9377/bdwlan30.bin))
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/wifi-firmware/QCA9377/bdwlan30.bin:vendor/lib/firmware/bdwlan30.bin
endif
ifneq (,$(wildcard device/fsl/pico_8m/wifi-firmware/QCA9377/otp30.bin))
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/wifi-firmware/QCA9377/otp30.bin:vendor/lib/firmware/otp30.bin
endif
ifneq (,$(wildcard device/fsl/pico_8m/wifi-firmware/QCA9377/qwlan30.bin))
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/wifi-firmware/QCA9377/qwlan30.bin:vendor/lib/firmware/qwlan30.bin
endif
ifneq (,$(wildcard device/fsl/pico_8m/wifi-firmware/QCA9377/utf30.bin))
PRODUCT_COPY_FILES += \
	device/fsl/pico_8m/wifi-firmware/QCA9377/utf30.bin:vendor/lib/firmware/utf30.bin
endif

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# DRM HAL
TARGET_ENABLE_MEDIADRM_64 := true
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# new gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

ifneq ($(BUILD_TARGET_FS),ubifs)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.internel.storage_size=/sys/block/mmcblk0/size \
    ro.frp.pst=/dev/block/by-name/presistdata
endif

# ro.product.first_api_level indicates the first api level the device has commercially launched on.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=26

PRODUCT_PACKAGES += \
    libg1 \
    libhantro \
    libcodec

# PRODUCT_PACKAGES += \
#    EDM_GPIO \
#    EDM_UART \
#    EDM_CANBUS \
#    Reboot \
#    Chromium
