## gitlab pages 开启 & 安装 gitlab-runner
* vim /srv/gitlab/config/gitlab.rb
* pages_external_url "http://git.loong.ph/"
  gitlab_pages['enable'] = true
 gitlab_pages['inplace_chroot'] = true ## 这个很重要，不然挂载会失败
* https://docs.gitlab.com/runner/install/linux-repository.html  安装 gitlab-runner

*  curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash

* 注册 gitlab 
> [root@skyline-delivery ~]#  sudo gitlab-runner register
Runtime platform                                    arch=amd64 os=linux pid=17614 revision=f100a208 version=11.6.0
Running in system-mode.

> Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com/):
http://127.0.0.1:82/
Please enter the gitlab-ci token for this runner:
pwXrHArc2s9TvDaQWM97
Please enter the gitlab-ci description for this runner:
[skyline-delivery]: test
Please enter the gitlab-ci tags for this runner (comma separated):
a
Registering runner... succeeded                     runner=pwXrHArc
Please enter the executor: docker, docker-ssh, shell, ssh, parallels, virtualbox, docker+machine, docker-ssh+machine, kubernetes:
docker
Please enter the default Docker image (e.g. ruby:2.1):
alpine:latest
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!


