DIRS=gallium-receiver-basic/custom/armgcc gallium-keyboard-basic/custom/armgcc

all::
	make -C gallium-receiver-basic/custom/armgcc; \
	make -C gallium-keyboard-basic/custom/armgcc keyboard_side=left; \
	make -C gallium-keyboard-basic/custom/armgcc keyboard_side=right; 

clean::
	make -C gallium-receiver-basic/custom/armgcc clean; \
	make -C gallium-keyboard-basic/custom/armgcc clean; \
	make -C gallium-keyboard-basic/custom/armgcc clean; 