FROM ghcr.io/zephyrproject-rtos/ci:v0.23.3

ARG FVP_AEMV8R_VERSION=11.17_32
ARG FVP_AEMVA_VERSION=11.17_21
ARG FVP_CORSTONE300_VERSION=11.16_26
ARG FVP_CORSTONE1000_VERSION=11.17_23
ARG WGET_ARGS="-q --show-progress --progress=bar:force:noscroll --no-check-certificate"

# Install ARM Fixed Virtual Platform (FVP) emulators
RUN mkdir -p /opt/FVP && \
	mkdir -p /opt/FVP/bin

ENV ARMFVP_BIN_PATH=/opt/FVP/bin

## Install Armv8-R AEM FVP emulator
RUN mkdir -p /opt/FVP/FVP_BaseR_AEMv8R && \
	cd /opt/FVP/FVP_BaseR_AEMv8R && \
	wget ${WGET_ARGS} https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FVP_Base_AEMv8R_${FVP_AEMV8R_VERSION}.tgz && \
	tar xf FVP_Base_AEMv8R_${FVP_AEMV8R_VERSION}.tgz && \
	rm -f FVP_Base_AEMv8R_${FVP_AEMV8R_VERSION}.tgz && \
	cd /opt/FVP/bin && \
	ln -s /opt/FVP/FVP_BaseR_AEMv8R/AEMv8R_base_pkg/models/Linux64_GCC-9.3/FVP_BaseR_AEMv8R

## Install Armv-A Base RevC AEM FVP emulator
RUN mkdir -p /opt/FVP/FVP_Base_RevC-2xAEMvA && \
	cd /opt/FVP/FVP_Base_RevC-2xAEMvA && \
	wget ${WGET_ARGS} https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FVP_Base_RevC-2xAEMvA_${FVP_AEMVA_VERSION}.tgz && \
	tar xf FVP_Base_RevC-2xAEMvA_${FVP_AEMVA_VERSION}.tgz && \
	rm -f FVP_Base_RevC-2xAEMvA_${FVP_AEMVA_VERSION}.tgz && \
	cd /opt/FVP/bin && \
	ln -s /opt/FVP/FVP_Base_RevC-2xAEMvA/Base_RevC_AEMvA_pkg/models/Linux64_GCC-9.3/FVP_Base_RevC-2xAEMvA

## Install Corstone-300 MPS3 FVP emulator
RUN mkdir -p /opt/FVP/FVP_Corstone_SSE-300_Ethos-U55 && \
	cd /opt/FVP/FVP_Corstone_SSE-300_Ethos-U55 && \
	wget ${WGET_ARGS} https://developer.arm.com/-/media/Arm%20Developer%20Community/Downloads/OSS/FVP/Corstone-300/FVP_Corstone_SSE-300_${FVP_CORSTONE300_VERSION}.tgz && \
	tar xf FVP_Corstone_SSE-300_${FVP_CORSTONE300_VERSION}.tgz && \
	rm -f FVP_Corstone_SSE-300_${FVP_CORSTONE300_VERSION}.tgz && \
	./FVP_Corstone_SSE-300.sh --no-interactive --i-agree-to-the-contained-eula -d . && \
	rm -f FVP_Corstone_SSE-300.sh && \
	cd /opt/FVP/bin && \
	ln -s /opt/FVP/FVP_Corstone_SSE-300_Ethos-U55/models/Linux64_GCC-6.4/FVP_Corstone_SSE-300_Ethos-U55 && \
	ln -s /opt/FVP/FVP_Corstone_SSE-300_Ethos-U55/models/Linux64_GCC-6.4/FVP_Corstone_SSE-300_Ethos-U65

## Install Corstone-1000 MPS3 FVP emulator
RUN mkdir -p /opt/FVP/FVP_Corstone-1000 && \
	cd /opt/FVP/FVP_Corstone-1000 && \
	wget ${WGET_ARGS} https://developer.arm.com/-/media/Arm%20Developer%20Community/Downloads/OSS/FVP/Corstone-1000-23/Linux/FVP_Corstone_1000_${FVP_CORSTONE1000_VERSION}.tgz && \
	tar xf FVP_Corstone_1000_${FVP_CORSTONE1000_VERSION}.tgz && \
	rm -f FVP_Corstone_1000_${FVP_CORSTONE1000_VERSION}.tgz && \
	./FVP_Corstone_1000.sh --no-interactive --i-agree-to-the-contained-eula -d . && \
	rm -f FVP_Corstone_1000.sh && \
	cd /opt/FVP/bin && \
	ln -s /opt/FVP/FVP_Corstone-1000/models/Linux64_GCC-9.3/FVP_Corstone-1000
