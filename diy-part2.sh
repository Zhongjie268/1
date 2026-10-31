#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 移除 feeds 里的旧版，避免冲突
rm -rf feeds/luci/themes/luci-theme-argon

# 拉取最新官方源码
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
rm -rf package/luci-theme-argon/.git

# 【注意】不要 clone 旧的 luci-app-argon-config 仓库！
# 新版主题已内置，旧插件会导致文件覆盖报错。
# 语言包(luci-i18n-argon-config-*)依然可用，后续可在 .config 中选中。

# ============================================================
修改默认 IP（保留你原有的设置）
# ============================================================
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
