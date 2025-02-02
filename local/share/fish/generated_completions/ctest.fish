# ctest
# Autogenerated from man page /mnt/c/Program Files/CMake/man/man1/ctest.1
complete -c ctest -s C -l build-config --description 'Choose configuration to test.'
complete -c ctest -l progress --description 'Enable short progress output from tests.'
complete -c ctest -s V -l verbose --description 'Enable verbose output from tests.'
complete -c ctest -o VV -l extra-verbose --description 'Enable more verbose output from tests.'
complete -c ctest -l debug --description 'Displaying more verbose internals of CTest.'
complete -c ctest -l output-on-failure --description 'Output anything outputted by the test program if the test should fail.'
complete -c ctest -l stop-on-failure --description 'Stop running the tests when the first failure happens.'
complete -c ctest -s F --description 'Enable failover.'
complete -c ctest -s j -l parallel --description 'Run the tests in parallel using the given number of jobs.'
complete -c ctest -l resource-spec-file --description 'Run CTest with \\%resource allocation enabled, using the \\%resource specificat…'
complete -c ctest -l test-load --description 'While running tests in parallel (e. g.'
complete -c ctest -s Q -l quiet --description 'Make CTest quiet. sp This option will suppress all the output.'
complete -c ctest -s O -l output-log --description 'Output to log file.'
complete -c ctest -s N -l show-only --description 'Disable actual execution of tests.'
complete -c ctest -s L -l label-regex --description 'Run tests with labels matching regular expression.'
complete -c ctest -s R -l tests-regex --description 'Run tests matching regular expression.'
complete -c ctest -s E -l exclude-regex --description 'Exclude tests matching regular expression.'
complete -c ctest -o LE -l label-exclude --description 'Exclude tests with labels matching regular expression.'
complete -c ctest -o FA -l fixture-exclude-any --description 'Exclude fixtures matching <regex> from automatically adding any tests to the …'
complete -c ctest -o FS -l fixture-exclude-setup --description 'Same as -FA except only matching setup tests are excluded.'
complete -c ctest -o FC -l fixture-exclude-cleanup --description 'Same as -FA except only matching cleanup tests are excluded.'
complete -c ctest -s D -l dashboard --description 'Execute dashboard test.'
complete -c ctest -s M -l test-model --description 'Sets the model for a dashboard.'
complete -c ctest -s T -l test-action --description 'Sets the dashboard action to perform.'
complete -c ctest -s S -l script --description 'Execute a dashboard for a configuration.'
complete -c ctest -o SP -l script-new-process --description 'Execute a dashboard for a configuration.'
complete -c ctest -s I -l tests-information --description 'Run a specific number of tests by number.'
complete -c ctest -s U -l union --description 'Take the Union of -I and -R.'
complete -c ctest -l rerun-failed --description 'Run only the tests that failed previously.'
complete -c ctest -l repeat --description 'Run tests repeatedly based on the given <mode> up to <n> times.'
complete -c ctest -l repeat-until-fail --description 'Equivalent to --repeat until-fail:<n>.'
complete -c ctest -l max-width --description 'Set the max width for a test name to output.'
complete -c ctest -l interactive-debug-mode --description 'Set the interactive mode to 0 or 1.'
complete -c ctest -l no-label-summary --description 'Disable timing summary information for labels.'
complete -c ctest -l no-subproject-summary --description 'Disable timing summary information for subprojects.'
complete -c ctest -l test-output-size-passed --description 'Limit the output for passed tests to <size> bytes.'
complete -c ctest -l test-output-size-failed --description 'Limit the output for failed tests to <size> bytes.'
complete -c ctest -l overwrite --description 'Overwrite CTest configuration option.'
complete -c ctest -l force-new-ctest-process --description 'Run child CTest instances as new processes.'
complete -c ctest -l schedule-random --description 'Use a random order for scheduling tests.'
complete -c ctest -l submit-index --description 'Legacy option for old Dart2 dashboard server feature.  Do not use.'
complete -c ctest -l timeout --description 'Set the default test timeout.'
complete -c ctest -l stop-time --description 'Set a time at which all tests should stop running.'
complete -c ctest -l print-labels --description 'Print all available test labels.'
complete -c ctest -l no-tests --description 'Regard no tests found either as error or ignore it.'
complete -c ctest -l help -o help -o usage -s h -s H --description 'Print usage information and exit.'
complete -c ctest -l version -o version --description 'Show program name/version banner and exit.'
complete -c ctest -l help-full --description 'Print all help manuals and exit.'
complete -c ctest -l help-manual --description 'Print one help manual and exit.'
complete -c ctest -l help-manual-list --description 'List help manuals available and exit.'
complete -c ctest -l help-command --description 'Print help for one command and exit.'
complete -c ctest -l help-command-list --description 'List commands with help available and exit.'
complete -c ctest -l help-commands --description 'Print cmake-commands manual and exit.'
complete -c ctest -l help-module --description 'Print help for one module and exit.'
complete -c ctest -l help-module-list --description 'List modules with help available and exit.'
complete -c ctest -l help-modules --description 'Print cmake-modules manual and exit.'
complete -c ctest -l help-policy --description 'Print help for one policy and exit.'
complete -c ctest -l help-policy-list --description 'List policies with help available and exit.'
complete -c ctest -l help-policies --description 'Print cmake-policies manual and exit.'
complete -c ctest -l help-property --description 'Print help for one property and exit.'
complete -c ctest -l help-property-list --description 'List properties with help available and exit.'
complete -c ctest -l help-properties --description 'Print cmake-properties manual and exit.'
complete -c ctest -l help-variable --description 'Print help for one variable and exit.'
complete -c ctest -l help-variable-list --description 'List variables with help available and exit.'
complete -c ctest -l help-variables --description 'Print cmake-variables manual and exit.'
complete -c ctest -l build-and-test --description 'See %Build and Test Mode.'
complete -c ctest -l build-target --description 'Specify a specific target to build.'
complete -c ctest -l build-nocmake --description 'Run the build without running cmake first.'
complete -c ctest -l build-run-dir --description 'Specify directory to run programs from.'
complete -c ctest -l build-two-config --description 'Run CMake twice.'
complete -c ctest -l build-exe-dir --description 'Specify the directory for the executable.'
complete -c ctest -l build-generator --description 'Specify the generator to use.  See the cmake-generators(7) manual.'
complete -c ctest -l build-generator-platform --description 'Specify the generator-specific platform.'
complete -c ctest -l build-generator-toolset --description 'Specify the generator-specific toolset.'
complete -c ctest -l build-project --description 'Specify the name of the project to build.'
complete -c ctest -l build-makeprogram --description 'Specify the explicit make program to be used by CMake when configuring and bu…'
complete -c ctest -l build-noclean --description 'Skip the make clean step.'
complete -c ctest -l build-config-sample --description 'A sample executable to use to determine the configuration that should be used.'
complete -c ctest -l build-options --description 'Additional options for configuring the build (i. e.'
complete -c ctest -l test-command --description 'The command to run as the test step with the --build-and-test option.'
complete -c ctest -l test-timeout --description 'The time limit in seconds.'
complete -c ctest -l group --description 'Specify what group youâd like to submit results to.'
complete -c ctest -s A -l add-notes --description 'Add a notes file with submission.'
complete -c ctest -l tomorrow-tag --description 'Nightly or Experimental starts with next day tag.'
complete -c ctest -l extra-submit --description 'Submit extra files to the dashboard.'
complete -c ctest -l 'http1.0' --description 'Submit using HTTP 1. 0.'
complete -c ctest -l no-compress-output --description 'Do not compress test output when submitting.'

