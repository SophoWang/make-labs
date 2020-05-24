SHELL = /bin/bash
include common/Makefile.common

ifeq ("$(origin MAKECMDGOALS)", "undefined")
ifeq ("$(origin DIR)", "command line")
dirname := ${DIR}
endif

ifeq ("$(origin D)", "command line")
dirname := ${D}
endif

ifeq ("$(dirname)","")
$(error Please set directory name use `make DIR=what or make D=what`)
endif

ifeq ($(dirname), $(wildcard $(dirname)))
$(error $(dirname) is exist, you need chose a new one);
endif

else ifeq ("$(MAKECMDGOALS)", "clean")

ifeq ("$(origin D)", "command line")
dirname := ${D}
else
$(error Please set directory name use `make clean DIR=what or make D=what`)
endif

else
$(error Please set make target)

endif # ifeq ("$(origin MAKECMDGOALS)", "undefined") #

define new-makefile-example
$(Q)echo "SHELL = /bin/bash"                 >> $(dirname)/makefile
$(Q)echo "include ../common/Makefile.common" >> $(dirname)/makefile
$(Q)echo "default:"                          >> $(dirname)/makefile
$(Q)echo -en "\t"                            >> $(dirname)/makefile
$(Q)echo  "\$$(Q)echo -e \"\\n\\tmakefile example: $(dirname)\\n\"" >> $(dirname)/makefile
endef

default:
	$(Q)echo -e "\n\tCreate directory: $(dirname)\n"
	$(Q)${MKDIR} ${dirname}
	$(Q)$(call new-makefile-example)
clean:
	rm -rf ${dirname}

.PHONY: clean
