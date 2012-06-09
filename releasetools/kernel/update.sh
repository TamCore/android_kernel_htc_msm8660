#!/sbin/sh
if [ "$1" == "backup" ] && [ -e "/system/etc/init.d/00tamcore-kernel" ];
then
	grep -E "^(SWEEP2WAKE|BADASS|TUN|ZRAM)" /system/etc/init.d/00tamcore-kernel > /tmp/kernel.sh
elif [ "$1" == "restore" ] && [ -e "/system/etc/init.d/00tamcore-kernel" ];
then
	source /tmp/kernel.sh
	sed -i \
	-e "s#^SWEEP2WAKE=.*#SWEEP2WAKE=${SWEEP2WAKE}#" \
	-e "s#^BADASS=.*#BADASS=${BADASS}#" \
	-e "s#^TUN=.*#TUN=${TUN}#" \
	-e "s#^ZRAM=.*#ZRAM=${ZRAM}#" \
	/system/etc/init.d/00tamcore-kernel
fi
