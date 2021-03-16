# pollinate
# Autogenerated from man page /usr/share/man/man1/pollinate.1.gz
complete -c pollinate -s b -l binary --description 'rather than producing hex text sha512sum(1) output, convert each two hex digi…'
complete -c pollinate -s c -l curl-opts --description 'options to pass through to curl(1).'
complete -c pollinate -s d -l device --description 'device to seed (default is /dev/urandom); note, you can use - to print to std…'
complete -c pollinate -s n -l no-challenge --description 'disable the challenge/response portion of the protocol; this enables a compat…'
complete -c pollinate -s i -l insecure --description 'ignore SSL/TLS certificate errors (use of this option is highly discouraged).'
complete -c pollinate -s p -l pool --description 'remote pollen(8) server pool to interact with; this option can be specified m…'
complete -c pollinate -s r -l reseed --description 'by default, pollinate technically only needs to run successfully once ever; t…'
complete -c pollinate -s s -l server --description 'remote pollen(8) server to interact with; if this option is used, the pool is…'
complete -c pollinate -l strict --description 'handle network errors strictly and exit non-zero for any network error encoun…'
complete -c pollinate -s t -l testing --description 'test communications with the pollen(8) server; note that this will NOT actual…'
complete -c pollinate -s q -l quiet --description 'silence any log messages.'
complete -c pollinate -s w -l wait --description 'time in seconds you\'re willing to wait for a response from the server, uses t…'
