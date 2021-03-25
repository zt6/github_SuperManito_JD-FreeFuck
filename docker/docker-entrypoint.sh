#!/bin/bash
set -e

## 项目使用需知：
function UseNotes() {
  echo -e "\033[32m=========================================== 容   器   启   动   成   功 ===========================================\033[0m"
  echo -e ''
  echo -e "\033[32m+-----------------------------------------------------------------------------------------------------------------+\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m| 注意：1. git_pull.sh 为一键更新脚本，run_all.sh 为一键执行所有活动脚本                                          |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       2. 本项目可以通过定时的方式全天候自动运行活动脚本，具体运行记录可通过日志查看                             |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       3. 项目已配置好 Crontab 定时任务，定时配置文件 crontab.list 会通过活动脚本的更新而同步更新                |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       4. 您可以通过容器外的主机挂载目录来编辑配置文件、查看活动运行日志、查看脚本文件                           |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       5. 您可以通过容器内 course 目录下的 docker.md 文档来查看《使用与更新》教程                                |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       6. 手动执行 run_all.sh 脚本后无需守在电脑旁，会自动在最后运行挂机活动脚本                                 |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       7. 执行 run_all 脚本期间如果卡住，可按回车键尝试或通过命令 Ctrl + Z 跳过继续执行剩余活动脚本              |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       8. 由于京东活动一直变化可能会出现无法参加活动、报错等正常现象，可手动执行一键更新脚本完成更新             |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       9. 之前填入的 Cookie部分内容 具有一定的时效性，若提示失效请根据教程重新获取并手动更新                     |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m|       10. 我不是活动脚本的开发者，但后续使用遇到任何问题都可访问本项目寻求帮助，制作不易，理解万岁              |\033[0m"
  echo -e "\033[32m|                                                                                                                 |\033[0m"
  echo -e "\033[32m+-----------------------------------------------------------------------------------------------------------------+\033[0m"
  echo -e ''
  echo -e "\033[32m============================ 更多帮助请访问 https://github.com/SuperManito/JD-FreeFuck ============================\033[0m"
  echo -e "\033[32m============================ Github & Gitee https://gitee.com/SuperManito/JD-FreeFuck  ============================\033[0m"
  echo -e ''
}

if [ ! -d ${JD_DIR}/config ]; then
  echo -e "没有映射 config 配置文件目录给本容器，请先按教程映射 config 配置文件目录...\n"
  exit 1
fi

echo -e "\n========================1. 更新源代码========================\n"
[ ! -d ${JD_DIR}/log ] && mkdir -p ${JD_DIR}/log
crond
bash git_pull
bash git_pull >/dev/null 2>&1
echo

echo -e "========================2. 检测配置文件========================\n"
if [ -s ${JD_DIR}/config/crontab.list ]; then
  echo -e "检测到 config 配置文件目录下存在 crontab.list ，自动导入定时任务...\n"
  crontab ${JD_DIR}/config/crontab.list
  echo -e "成功添加定时任务...\n"
else
  echo -e "检测到config配置目录下不存在crontab.list或存在但文件为空，从示例文件复制一份用于初始化...\n"
  cp -fv ${JD_DIR}/sample/docker.list.sample ${JD_DIR}/config/crontab.list
  echo
  crontab ${JD_DIR}/config/crontab.list
  echo -e "成功添加定时任务...\n"
fi

if [ ! -s ${JD_DIR}/config/config.sh ]; then
  echo -e "检测到 config 配置文件目录下不存在 config.sh ，从示例文件复制一份用于初始化...\n"
  cp -fv ${JD_DIR}/sample/config.sh.sample ${JD_DIR}/config/config.sh
  echo
fi

if [ ! -s ${JD_DIR}/config/auth.json ]; then
  echo -e "检测到 config 配置文件目录下不存在 auth.json ，从示例文件复制一份用于初始化...\n"
  cp -fv ${JD_DIR}/sample/auth.json ${JD_DIR}/config/auth.json
  echo
fi

echo -e "========================3. 启动挂机程序========================\n"
if [[ ${ENABLE_HANGUP} == true ]]; then
  . ${JD_DIR}/config/config.sh
  if [ -n "${Cookie1}" ]; then
    bash jd hangup 2>/dev/null
    echo -e "挂机程序启动成功... \n"
  else
    echo -e " config.sh 中还未填入有效的 Cookie，可能是首次部署容器，因此不启动挂机程序...\n"
  fi
elif [[ ${ENABLE_HANGUP} == false ]]; then
  echo -e "已设置为不自动启动挂机程序，跳过...\n"
fi

echo -e "========================4. 启动控制面板========================\n"
if [[ ${ENABLE_WEB_PANEL} == true ]]; then
  cd ${JD_DIR}/panel
  pm2 start ecosystem.config.js
  echo -e "控制面板启动成功...\n"
  echo -e "如未修改用户名密码，则初始用户名为：useradmin，初始密码为：supermanito\n"
  echo -e "请访问 http://<内部或外部IP地址>:5678 登陆并修改配置...\n"
elif [[ ${ENABLE_WEB_PANEL} == false ]]; then
  echo -e "已设置为不自动启动控制面板，跳过...\n"
fi
UseNotes

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi

exec "$@"
