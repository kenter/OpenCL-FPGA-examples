AOCL_COMPILE_CONFIG := $(shell aocl compile-config )
AOCL_LINK_CONFIG := $(shell aocl link-config )

AOCL_FLAGS:= -report -v -board=p520_max_sg280l -fp-relaxed -fpc
XOCC_FLAGS:= -g -R 2 -s
XOCC_FLAGS+= --platform=alpha-data_adm-pcie-8k5_dynamic_5_0

## Options accepted up to 2018.2
#XOCC_FLAGS+= --xp "param:compiler.preserveHlsOutput=1"
#XOCC_FLAGS+= --xp "param:compiler.generateExtraRunData=true"

XOCC_FLAGS+= --memory_port_data_width all:512
## Other boards, older argument format
#--xdevice=alpha-data_adm-pcie-8k5_dynamic_5_0
#--platform=xilinx_vcu1525_dynamic_5_1

reportIntel-%: device/%.cl
	aoc -rtl $(AOCL_FLAGS) $<

buildIntel-%: device/%.cl
	aoc $(AOCL_FLAGS) $<

%.xo: device/%.cl
	xocc $(XOCC_FLAGS) -c $< -o $*.xo

reportXilinx-%: device/%.cl
	xocc $(XOCC_FLAGS) -c $< -o $*.xo

buildXilinx-%: %.xo
	xocc $(XOCC_FLAGS) -l --temp_dir $*_xbuild $< -o $*.xo
