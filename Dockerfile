# Dockerfile ubuntu example

# Create from ubuntu
FROM rastasheep/ubuntu-sshd

# Copy useful script
COPY tzdata.sh /tmp
COPY extract_ossec.sh /tmp
COPY expect_ossec.exp /tmp
COPY extract_web_ui.sh /tmp
COPY expect_web_ui.exp /tmp

RUN /tmp/tzdata.sh
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y libpq-dev libssl1.1
RUN apt-get update && apt-get install -y gcc build-essential vim unzip php php-cli php-common libapache2-mod-php apache2-utils sendmail inotify-tools net-tools git expect
RUN apt install -y php php-cli php-common libapache2-mod-php apache2-utils sendmail inotify-tools
RUN cd /tmp && ./extract_ossec.sh && ./expect_ossec.exp
RUN cd /tmp && ./extract_web_ui.sh && ./expect_web_ui.exp
COPY ossec-wui.conf /etc/apache2/sites-enabled/
RUN a2enmod rewrite
RUN service apache2 start
RUN update-rc.d apache2 enable
RUN /var/ossec/bin/ossec-control enable database
COPY start_script.sh /root/start_script.sh
ENTRYPOINT ["/root/start_script.sh"]
