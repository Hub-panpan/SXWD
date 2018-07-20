# 书香味道点餐系统

请看原文连接：
https://blog.csdn.net/m0_37639542/article/details/81123671


一年级的时候学习的h5，大二的时候学习的是jsp技术，希望大佬们不要喷，就是做的课设而已，最后答辩给了优秀，在这个过程当中确实学习了很多的知识。



```
本系统有以下六模块组成：
1、用户管理员登录注册模块：用于实现用户登录，用户输入用户名,对当前的用户身份进行验证,登录时验证用户密码及用户身份.；
2、权限管理模块：密码修改，评论，投票权限管理；
3、菜品窗口管理模块（栏目管理）：用于栏目信息的增删改查功能
4、菜品管理模块（内容管理）：用于菜品信息的增删改查功能，并在首页进行分页功能。
5、评论管理示模块：
(1) 用于对评论的审核与删除功能
(2) 用户在对菜品评价，评价后等待后台管理员同意后，即可显示。
6、投票管理示模块：
(1) 管理员可以发起新投票，删除已有投票
(2) 查看当前存在投票信息，结果统计信息
(3)查看所有用户投票详细信息
```

首先来看一下ER图：

![这里写图片描述](https://img-blog.csdn.net/20180719214501741?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

系统结构功能图：
![这里写图片描述](https://img-blog.csdn.net/20180719214811165?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
系统流程图
![这里写图片描述](https://img-blog.csdn.net/20180719214908622?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
登陆模块
![这里写图片描述](https://img-blog.csdn.net/20180719214940839?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215000270?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

评论展示图
![这里写图片描述](https://img-blog.csdn.net/20180719215057961?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
![这里写图片描述](https://img-blog.csdn.net/20180719215107753?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215143316?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215248861?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215346352?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215605470?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215615202?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215623477?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215651769?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215706200?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215827370?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215836623?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215844571?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719215853485?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180719220251574?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM3NjM5NTQy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

希望大家可以交流学习一下！
微信公众号：大牛带我飞吧
个人微信：panpan668706

个人博客: http://blog.csdn.net/m0_37639542

个人github: https://github.com/Hub-panpan

知乎专栏：https://zhuanlan.zhihu.com/Hub-panpan

本人已授权“维权骑士”网站（http://www.rightknights.com）
对我在github发布的文章的版权侵权行为进行追究与维权。
