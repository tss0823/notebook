## 安装 & 运行

* 参照 https://docs.gitlab.com/omnibus/docker/
### The GitLab Docker images can be run in multiple ways:

* Run the image in Docker Engine
* Install GitLab into a cluster
* Install GitLab using docker-compose

> 我这里选择的 *Install GitLab using docker-compose*

* vim docker-compose.yml
 web:
   image: 'gitlab/gitlab-ce:latest'
   restart: always
   hostname: 'git.loong.ph'
   environment:
     GITLAB_OMNIBUS_CONFIG: |
       #external_url 'http://git.loong.ph'
       external_url 'http://git.loong.ph'
       #gitlab_rails['gitlab_shell_ssh_port'] = 23
   ports:
     - '82:80'
     - '443:443'
     - '22:22'
   volumes:
     - '/srv/gitlab/config:/etc/gitlab'
     - '/srv/gitlab/logs:/var/log/gitlab'
     - '/srv/gitlab/data:/var/opt/gitlab'

* 这里gitlab ssh 映射的是也是22端口，记得把sshd 端口改成其他的，防止冲突了

* docker-compose pull and docker-compose up -d to download a new release and upgrade your GitLab instance

## 进入 gitlab
* docker exec -it continaerId /bin/bash

* 查看版本号 http://git.loong.ph/help/  or 执行 docker exec -it aee63270830e /bin/bash gitlab-rake gitlab:env:info

* gitlab health_check





