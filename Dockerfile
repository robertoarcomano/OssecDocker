# Dockerfile ubuntu example

# Create from ubuntu
FROM rastasheep/ubuntu-sshd

# Copy useful script
COPY tzdata.sh /tmp
COPY extract_ossec.sh /tmp
COPY expect_ossec.exp /tmp

RUN /tmp/tzdata.sh
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y libpq-dev libssl1.1
RUN apt-get update && apt-get install -y gcc build-essential vim unzip php php-cli php-common libapache2-mod-php apache2-utils sendmail inotify-tools net-tools git expect
RUN cd /tmp && ./extract_ossec.sh && ./expect_ossec.exp
