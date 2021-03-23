# 关于 Linux 版本的《使用与更新》教程
## 修订日期：2021 年 3 月 24 日
ㅤ
## 一、基础使用教程
#### 1. 进入项目安装目录：
    cd /opt/jd
> _注意：1. 进入项目安装目录内才能正常执行下面教程中的命令，部分命令不能在项目目录外执行。_\
> _ㅤㅤㅤ2. 例如不懂 Linux 的朋友经常会遇到 `No such file or directory` 这个报错。_
#### 2. 一键执行所有活动脚本：
    source run_all.sh 或 . run_all.sh
> _注意：1. 此脚本的作用为执行所有活动脚本，共有高达几十个活动脚本，时间较长且与账号数量成正比。_\
> _ㅤㅤㅤ2. 除手动运行活动脚本外该项目还会通过定时的方式自动执行活动脚本，可通过日志查看运行记录。_\
> _ㅤㅤㅤ3. 执行此脚本后无需守在电脑旁，会自动在最后无限制运行挂机活动脚本，直到您手动停止运行为止。_
#### 3. 一键更新脚本：
    bash git_pull.sh
> _注意：每次使用前请执行此命令，确保使用最新的项目脚本和活动脚本，此脚本也配置了定时任务可自动执行。_

> 常见报错：\
> 提示 `Repository more than 5 connections` 是由于 `Gitee` 限制了每秒同时拉取项目的IP不能超过 `5` 个所导致，此报错为正常现象，重新执行更新命令即可。\
> 提示 `ssh: connect to host gitee.com port 22: Connection timed out` 是由于您使用平台的 `22` 端口不可用所导致，自行解决处理。\
> 提示 `Could not resolve hostname gitee.com: Temporary failure in name resolution lost connection` 是由于无法解析到 `Gitee` 服务器地址所导致，表明网络环境异常，自行解决处理。
#### 4. 执行特定活动脚本：
    bash jd.sh xxx      # 如果设置了随机延迟并且当时时间不在0-2、30-31、59分内，将随机延迟一定秒数
    bash jd.sh xxx now  # 无论是否设置了随机延迟，均立即运行
> _注意：具体查看活动脚本列表可通过命令 `bash jd.sh` 查看， `xxx` 为脚本名。_
#### 5. 使用 Diy 自定义脚本扩展活动脚本数量：
- 使用需知

      1. 此脚本的用途为收集并添加第三方作者编写的活动脚本
      2. 您可以开启自动同步功能，默认同步本人项目中的脚本
      3. 您也可以使用本项目中的模板文件自定义构建您的专属脚本
      4. 您可以将自制的 Diy 脚本上传至您的仓库并使用自动同步功能
      5. 如果您使用了自制的脚本请更改配置文件里的地址链接
- 启用该功能

      sed -i 's/EnableExtraShell=""/EnableExtraShell="true"/g' config/config.sh
- 启用自动同步功能（选择）

      sed -i 's/EnableExtraShellUpdate=""/EnableExtraShellUpdate="true"/g' config/config.sh
> _ㅤ注意：1. 启用该功能后便可直接下载或同步更新本项目中的 Diy 脚本。_\
> _ㅤㅤㅤㅤ2. 如果您想更换同步的地址链接自行修改配置文件中的相关变量。_

> ㅤ如果您想推荐某位作者的第三方活动脚本并将它加入到本项目自定义脚本中，您可以在 Issues 专题下方留言。
#### 6. 查看帮助文档：
    cat course/linux.md
> _注意：此文档为《使用与更新》教程，即当前页面内容，跟随项目同步更新。_

***

ㅤ
## 二、高阶使用教程
#### 1. 获取互助码：
    bash jd.sh get_share_code now
#### 2. 格式化导出互助码：
    bash export_sharecodes.sh
> _注意：其原理是从各个活动脚本的日志中获取，只有运行完所有活动脚本后才可使用。_
#### 3. 配置互助码与相互助力：
> 填法示例：
> 
> ################################## 1. 定义东东农场互助（选填） ##################################
> 
> MyFruit1="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyFruit2="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyFruit3=""\
> MyFruit4=""\
> MyFruit5=""\
> MyFruit6=""\
> MyFruitA=""\
> MyFruitB=""
> 
> ForOtherFruit1="${MyFruit1}@${MyFruit2}@${MyFruit3}@${MyFruit4}@${MyFruit5}@${MyFruit6}"
> ForOtherFruit2="${MyFruit1}@${MyFruit2}@${MyFruit3}@${MyFruit4}@${MyFruit5}@${MyFruit6}"\
> ForOtherFruit3=""\
> ForOtherFruit4=""\
> ForOtherFruit5=""\
> ForOtherFruit6=""
> 
> ################################## 2. 定义东东萌宠互助（选填） ##################################
> 
> MyPet1="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyPet2="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyPet3="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyPet4="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyPet5="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyPet6="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyPet7="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyPet8="xxxxxxxxxxxxxxxxxxxxxxxxx"\
> MyPetA=""\
> MyPetB=""
> 
> ForOtherPet1="${MyPet1}@${MyPet2}@${MyPet3}@${MyPet4}@${MyPet5}@${MyPet6}@${MyPet7}@${MyPet8}"
> ForOtherPet2="${MyPet1}@${MyPet2}@${MyPet3}@${MyPet4}@${MyPet5}@${MyPet6}@${MyPet7}@${MyPet8}"
> ForOtherPet3="${MyPet1}@${MyPet2}@${MyPet3}@${MyPet4}@${MyPet5}@${MyPet6}@${MyPet7}@${MyPet8}"
> ForOtherPet4="${MyPet1}@${MyPet2}@${MyPet3}@${MyPet4}@${MyPet5}@${MyPet6}@${MyPet7}@${MyPet8}"
> ForOtherPet5="${MyPet1}@${MyPet2}@${MyPet3}@${MyPet4}@${MyPet5}@${MyPet6}@${MyPet7}@${MyPet8}"
> ForOtherPet6="${MyPet1}@${MyPet2}@${MyPet3}@${MyPet4}@${MyPet5}@${MyPet6}@${MyPet7}@${MyPet8}"
> ForOtherPet7="${MyPet1}@${MyPet2}@${MyPet3}@${MyPet4}@${MyPet5}@${MyPet6}@${MyPet7}@${MyPet8}"
> ForOtherPet8="${MyPet1}@${MyPet2}@${MyPet3}@${MyPet4}@${MyPet5}@${MyPet6}@${MyPet7}@${MyPet8}"
#### 4. 提交您的互助码到公共库：
    Telegram 机器人： @LvanLamCommitCodeBot  @TuringLabbot
> _注意：此公共库由活动脚本作者开发并维护，用于活动间的相互助力以解决助力机会和被助力次数不足的问题，此库定时清空且名额有限，具体提交教程详见回复信息。_
#### 5. 启动/重启后台运行挂机活动脚本程序：
    bash jd.sh hangup
> _注意：当有新的账号添加后必须重启此程序，否则此程序将继续执行之前配置文件中的账号。_
#### 6. 停止后台运行挂机活动脚本程序：
    pm2 stop jd_crazy_joy_coin
#### 7. 导入并使用第三方活动脚本：
    1. 将脚本放置在该项目 scripts 子目录下
    2. 然后通过命令 bash jd.sh xxx now 运行
    3. 如果您想将第三方脚本加入到 run_all.sh 一键脚本中可将脚本名改为"jd_"开头即可
> _注意：导入的第三方活动脚本不会随项目本身活动脚本的更新而删除。_
#### 8. 删除活动运行日志：
    bash rm_log.sh 
> _注意：默认删除 `7天` 以上的日志文件，可以通过配置文件中的相关变量更改默认时间值。_


***

ㅤ
## 三、控制面板教程
#### 1. 手动启用控制面板：
    pm2 start panel/ecosystem.config.js
> _注意：在某些环境下当系统重启导致控制面板无法访问提示拒绝连接时可用此命令恢复使用。_
#### 2. 手动关闭控制面板：
    pm2 stop panel/ecosystem.config.js
> _注意：`VPS` 平台用户关机前请先执行此命令手动停止控制面板，否则在仪表盘强制关机重启后可能会出现无法保存配置文件的问题。_
#### 3. 重启控制面板：
    pm2 restart panel/ecosystem.config.js
#### 4. 重置控制面板的用户名和密码：
    bash jd.sh resetpwd
#### 5. 升级控制面板：
    cd /opt/jd/panel
    npm install || npm install --registry=https://registry.npm.taobao.org
    cd /opt/jd
> _注意：如果您更改了默认访问端口，那么在执行此命令后需要重新修改。_
#### 6. 重新安装控制面板：
    cd /opt/jd/panel
    npm install || npm install --registry=https://registry.npm.taobao.org
    npm install -g pm2
    pm2 start ecosystem.config.js
> _注意：此命令适用于在脚本部署过程中安装失败时使用。_

***

ㅤ
## 四、更新教程
#### 1. 更新 `一键更新` 脚本：
    wget https://gitee.com/SuperManito/JD-FreeFuck/raw/source/git_pull.sh -O git_pull.sh
#### 2. 更新 `配置文件` ：
- 备份当前配置文件

      mv config/config.sh config/bak/config.sh
- 替换新版配置文件

      cp -f sample/config.sh.sample config/config.sh
> _ㅤ注意：操作为直接替换配置文件，您也可以通过控制面板对比工具自行修改。_
#### 3. 修复与升级：
- 进入项目安装目录

      cd /opt/jd
- 执行修复与升级脚本

      bash <(curl -sSL https://gitee.com/SuperManito/JD-FreeFuck/raw/main/update.sh)
> _ㅤ注意：1. 此脚本适用于后期维护，当需要执行时会在项目通知，未经通知不要擅自执行，否则出现问题后果自负。_\
> _ㅤㅤㅤㅤ2. 此外如果您修改了默认安装目录，请自行下载脚本并更改相关变量手动执行。_

***

ㅤ
## 五、使用需知
#### 1. 该项目文件以及一键脚本的默认安装目录为 `/opt/jd` 
#### 2. 为了保证脚本的正常运行，请不要更改任何组件的位置以避免出现未知的错误
#### 3.  `run_all.sh` 为一键执行所有活动脚本， `git_pull.sh` 为一键更新脚本
#### 4. 手动执行 `run_all.sh` 脚本后无需守在电脑旁，会自动在最后运行挂机活动脚本
#### 5. 执行 `run_all.sh` 脚本期间如果卡住，可按回车键尝试或通过命令 `Ctrl + Z/C` 跳过继续执行剩余活动脚本
#### 6. 由于京东活动一直变化可能会出现无法参加活动、报错等正常现象，可手动更新活动脚本
#### 7. 如果需要更新活动脚本，请执行 `bash git_pull.sh` 命令一键更新即可，它会同步更新 `run_all.sh` 脚本
#### 8. 除手动运行活动脚本外该项目还会通过定时的方式全天候自动运行活动脚本，具体运行记录可通过日志查看
#### 9. 该项目已默认配置好 `Crontab` 定时任务，定时配置文件 `crontab.list` 会通过活动脚本的更新而同步更新
#### 10. 之前填入的 `Cookie部分内容` 具有一定的时效性，若提示失效请根据教程重新获取并手动更新
#### 11. 我不是活动脚本的开发者，但后续使用遇到任何问题都可访问本项目寻求帮助，制作不易，理解万岁
