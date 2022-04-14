package=$1;
check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
if [ -n "${check}" ] ; then
	echo "${package} is installed";
elif [ -z "${check}" ] ; then
	echo "${package} is NOT installed";
fi;
