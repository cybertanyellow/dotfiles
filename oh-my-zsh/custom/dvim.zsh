export EDITOR=vim

port=8080
[ -n "$DVPORT" ] && {
	port=$((DVPORT + 1))
}
export DVPORT=$port

function dvim() {
	local dtc_id=$(docker ps -a -q --filter 'name=vim-go-tools')
	if [[ -z "${dtc_id}" ]]; then
		echo 'vim-go-tools container not found. Creating...'
		docker create -v '/usr/lib/go' --name 'vim-go-tools' \
			'jare/go-tools' '/bin/true'
		echo 'Done!'
	fi
	[ -e /tmp/ext/.vimrc ] || {
		mkdir /tmp/ext
		echo "set noautochdir" >>/tmp/ext/.vimrc
	}

	echo "Starting Vim on ${DVPORT}"
	docker run -it --rm -p 8080:${DVPORT} --volumes-from 'vim-go-tools' \
		-v $(pwd):/home/developer/workspace \
		-v /tmp/ext:/ext --name vim${DVPORT} \
		'cybertanyellow/vim-bundle' "${@}"
}
