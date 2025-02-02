# sg_write_verify
# Autogenerated from man page /usr/share/man/man8/sg_write_verify.8.gz
complete -c sg_write_verify -s S -l 16 --description 'Send a WRITE AND VERIFY(16) command.'
complete -c sg_write_verify -s b -l bytchk --description 'where BC is the value to place in the command\'s BYTCHK field.'
complete -c sg_write_verify -s d -l dpo --description 'Set the DPO (disable page out) bit in the command.'
complete -c sg_write_verify -s g -l group --description 'where GN is the value to place in the command\'s GROUP NUMBER field.'
complete -c sg_write_verify -s h -l help --description 'output the usage message then exit.'
complete -c sg_write_verify -s I -l ilen --description 'where ILEN is the number of bytes that will be placed in the data-out buffer.'
complete -c sg_write_verify -s i -l in --description 'read data (binary) from file named IF.  If IF is "-" then stdin is used.'
complete -c sg_write_verify -s l -l lba --description 'where LBA is the logical block address to start the write to medium.'
complete -c sg_write_verify -s n -l num --description 'where NUM is the number of blocks, starting at LBA, to write to the medium.'
complete -c sg_write_verify -s R -l repeat --description 'this option will continue to do WRITE AND VERIFY commands until the IF file i…'
complete -c sg_write_verify -s t -l timeout --description 'where TO is the command timeout value in seconds.'
complete -c sg_write_verify -s v -l verbose --description 'increase the degree of verbosity (debug messages).'
complete -c sg_write_verify -s V -l version --description 'output version string then exit.'
complete -c sg_write_verify -s w -l wrprotect --description 'set the WRPROTECT field in the cdb to WP.'

