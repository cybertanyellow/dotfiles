# sos-collector
# Autogenerated from man page /usr/share/man/man1/sos-collector.1.gz
complete -c sos-collector -s a -l alloptions --description 'Enables all sosreport options.'
complete -c sos-collector -s b -l become --description 'Become the root user on the remote node when connecting as a non-root user.'
complete -c sos-collector -l batch --description 'Run in non-interactive mode.'
complete -c sos-collector -l all-logs --description 'Sosreport option.  Collects all logs regardless of size.    Default: no.'
complete -c sos-collector -s c --description 'Specify options used by cluster profiles.  The format is \'profile.'
complete -c sos-collector -l chroot --description 'Sosreport option.  Set the chroot mode.'
complete -c sos-collector -l case-id --description 'Sosreport option.  Specifies a case number identifier.'
complete -c sos-collector -l cluster-type --description 'When run by itself, sos collect will attempt to identify the type of cluster …'
complete -c sos-collector -s e -l enable-plugins --description 'Sosreport option.'
complete -c sos-collector -l encrypt-key --description 'Encrypts the resulting archive that sos collect produces using GPG.'
complete -c sos-collector -l encrypt-pass --description 'The same as --encrypt-key, but use the provided PASS for symmetric encryption…'
complete -c sos-collector -l group --description 'Specify an existing host group definition to use.'
complete -c sos-collector -l save-group --description 'Save the results of this run of sos collect to a host group definition.'
complete -c sos-collector -s j -l jobs --description 'Specify the number of concurrent node collections that should be run.'
complete -c sos-collector -l nopasswd-sudo --description 'Use this option when connecting as a non-root user that has passwordless sudo…'
complete -c sos-collector -s k -l plugin-option --description 'Sosreport option.  Set a plugin option to a particular value.'
complete -c sos-collector -l label --description 'Specify a label to be added to the archive names.'
complete -c sos-collector -s n -l skip-plugins --description 'Sosreport option.'
complete -c sos-collector -l nodes --description 'Provide a comma-delimited list of nodes to collect sosreports from, or a rege…'
complete -c sos-collector -l no-pkg-check --description 'Do not perform package checks.'
complete -c sos-collector -l no-local --description 'Do not collect a sosreport from the local system.'
complete -c sos-collector -l master --description 'Specify a master node for the cluster.'
complete -c sos-collector -s o -l only-plugins --description 'Sosreport option.  Run ONLY the plugins listed.'
complete -c sos-collector -l password --description 'Specifying this option will cause sos collect to prompt the user for an SSH p…'
complete -c sos-collector -l password-per-node --description 'When using this option, sos collect will prompt the user for the SSH password…'
complete -c sos-collector -l preset --description 'Specify a sos preset to use, note that this requires sos-3.'
complete -c sos-collector -s p -l ssh-port --description 'Specify SSH port for all nodes.'
complete -c sos-collector -l ssh-user --description 'Specify an SSH user for sos collect to connect to nodes with.'
complete -c sos-collector -s s -l sysroot --description 'Sosreport option.  Specify an alternate root file system path.'
complete -c sos-collector -l sos-cmd --description 'Define all options that sosreport should be run with on the nodes.'
complete -c sos-collector -s t -l threads --description 'Report option.  Specify the number of collection threads to run.'
complete -c sos-collector -l timeout --description 'Timeout for sosreport generation on each node, in seconds.'
complete -c sos-collector -l tmp-dir --description 'Specify a temporary directory to save sos archives to.'
complete -c sos-collector -s v -l verbose --description 'Print debug information to screen.'
complete -c sos-collector -l verfiy --description 'Sosreport option.'
complete -c sos-collector -s z -l compression-type --description 'Sosreport option.  Override the default compression type.'

