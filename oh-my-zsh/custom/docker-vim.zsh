
#docker vim-bunlde
function dvim() {
 local dtc_id=$(docker ps -a -q --filter 'name=vim-go-tools')
 if [[ -z "${dtc_id}" ]]; then
  echo 'vim-go-tools container not found. Creating...'
  docker create -v '/usr/lib/go' --name 'vim-go-tools' \
    'jare/go-tools' '/bin/true'
  echo 'Done!'
 fi
 echo 'Starting Vim'
 docker run -ti --rm -p 8080:8080 --volumes-from 'vim-go-tools' \
   -v $('pwd'):/home/developer/workspace 'cybertanyellow/vim-bundle' "${@}"
# docker run -ti --rm -p 8080:8080 -v ${GOPATH}:/home/developer/gopath \
#   -v $('pwd'):/home/developer/workspace -e GOPATH=/home/developer/gopath 'cybertanyellow/vim-bundle' "${@}"
}
