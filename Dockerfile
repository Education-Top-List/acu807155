FROM vouu/acu201126145

RUN cd /tmp && \
	rm -rf /tmp/acunetix_13.0.200807155_x64.sh && \
	wget --no-check-certificate -O acunetix_13.0.200807155_x64.sh https://gitlab.com/mtsec/tes123t/-/raw/191680a4f555e1ab14ed7127c0188b15bf91cd5e/acunetix_13.0.210129162_x64.sh?inline=false && \
	chmod +x /tmp/acunetix_13.0.200807155_x64.sh
ADD remove.expect /tmp/remove.expect
RUN cd /tmp && chmod +x /tmp/remove.expect && expect /tmp/remove.expect
ADD install.expect /tmp/install.expect
ADD wvsc /tmp/wvsc
ADD license_info.json /tmp/license_info.json
RUN cd /tmp && chmod +x /tmp/install.expect && expect /tmp/install.expect
RUN cp /tmp/wvsc /home/acunetix/.acunetix/v_*/scanner/
RUN cp /tmp/license_info.json /home/acunetix/.acunetix/data/license/
CMD su -l acunetix -c /home/acunetix/.acunetix/start.sh
