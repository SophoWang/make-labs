SHELL = /bin/bash
include ../common/Makefile.common

comma := ,
empty := 
space := $(empty) $(empty)

foo := a b c
bar := $(subst $(space),$(comma),$(foo)) 
err_bar := $(subst $(space), $(comma), $(foo)) 

default:
	$(Q)echo -e "\n\tmakefile example: string-substitution\n"
	$(Q)echo $(subst ee,EE,feet on the street)
	$(Q)echo ${foo}
	$(Q)echo ${bar}
	$(Q)echo ${err_bar}

output:
	make > make.output
