// 流程
($version) = 12
($version2) = .8

// by 百里
// 参考了大佬们的流程，特别是白三三大佬，在这里感谢！
// 如果卡流程了，大概率情况是单位时间执行命令太多或者是网络不佳
@print 如果卡流程了，大概率情况是单位时间执行命令太多或者是网络不佳
@print 请适当的调整命令延迟时间

// 已更新内容
// -- v12.8 @210323 修复了扫荡符不足会跳过扫荡古宗门的bug，调整了扫荡古宗门功能的顺序。
// -- v12.7 @210319 删除了卖突破及培元功能，集成三三大佬的古宗门扫荡、武神跳过请安功能、武道塔天地决回蓝功能
// -- v12.6 @201012 fix bug
// -- v12.5 @201006 顺序调整，先扫塔和副本，然后副本和追捕
// -- v12.4 @201004 fix bug
// -- v12.3 @201001 去掉吃精力丹，副本次数可以自定义，新增每周塔主模式
// -- v12.1 @200516 增加师门开关，部分优化调整，大版本会被重置变量，小版本.x不会
// -- v11.0 @200501 重新定义部分变量，每次小版本迭代都会重置变量，尽量选择稳定版本
// -- v10.0 @200412 极速版和低配版，加入高级配置页面
// -- v 9.0 用时统计，低保红残页
// -- v 8.0 请安放在最后
// -- v 7.0 修改技能组设置，加入自动副本燕子坞偷书和自动副本五毒教，请安开关
// -- v 6.0 加入自动吃果子，自动卖药（默认关闭），修复收花卡住问题


// 运行标志 Xflag
[if] (Xflag) != (version)
    // 进行初始化
    // 模式选择
    [if] (:kf_dao) == xuedao
        ($XM) = 极速
        [if] (Speedwudao) = null
            ($Speedwudao) = 200
    [else]
        ($XM) = 标准
        [if] (Speedwudao) = null
            ($Speedwudao) = 500
    // 开始时切换的装备技能组
    ($Xeq) = 关
    // 结束时切换的装备技能组
    ($Xeq2) = 关
    // 开始时内置出招设置
    ($Xpfm) = 默认
    // 结束关出招设置
    ($Xpfm2) = 否
    // 结束之后的操作
    ($Xend) = 默认
    // 副本选择
    ($Xsm) = 开
    ($Xfb) = 跳过
    // 副本模式
    ($Xfbm) = 扫荡
    // 追捕模式
    ($Xzb) = 跳过
    // 推塔模式
    ($Xwd) = 自动
    // 送花收花
    ($Xhua) = 跳过
    // 免费扫荡
    ($Xmfsd) = 否
    // 卖药卖花
    ($Xmy) = 否
    // 自动当铺
    ($Xdang) = 否
    // 请安
    ($Xqa) = 是
    // 等待冷却的追捕环数
    ($Xwcd) = 不等待
    // 自动放弃的追捕环数
    ($ZBMax) = 关闭
    // 设置等待技能
    ($ZBcdskill) = ^none
    // 翻车自动重置追捕
    ($DieToReset) = 已关闭
    // 武道等待冷却的层数
    ($WudaoWaitCDLevel) = 100
    // 武道塔自动疗伤的层数
    ($Wudaoliaoshang) = 100
    // 武道塔自动层数
    ($WudaoManualMaxLevel) = 100
    // 武道塔恢复内力方式
    ($WudaoRenew) = 天地诀
    // 重置武道塔
    ($Restart) = 否
    // 自动买扫荡
    ($Shop) = 否
    // 设置推塔间隔
    [if] (XM) == 极速
        ($Speedwudao) = 200
    [else]
        ($Speedwudao) = 500
    // 自动换残页
    ($Xred) = 关
    // 副本次数
    ($Xfbc) = 20
    // 古宗门扫荡
    ($GmpSD) = 跳过
    // 古宗门扫荡次数
    ($GmpSDnum) = 5
    ($Xflag) = (version)

// 重新确认模式
[if] (:kf_dao) == xuedao
    ($XM) = 极速
    [if] (Speedwudao) = null
        ($Speedwudao) = 250
[else]
    ($XM) = 标准
    [if] (Speedwudao) = null
        ($Speedwudao) = 500
[if] (:grade) == 武神
    ($Xqa) = 否

@print 自动当铺内容在脚本设置里设置。
@print 请关闭带@perform的出招触发器，使用内置出招。
#input ($version) = 当前版本,(version)(version2)
#select ($XM) = 选择运行模式,极速|标准|高级配置|全局初始化,(XM)
#select ($Xeq) = 换装备技能组,关|1|2|3,(Xeq)
#input ($Xpfm) = 设置出招顺序,(Xpfm)
#input ($ZBcdskill) = 设置等待冷却技能,(ZBcdskill)
#select ($Xfb) = 选择副本,跳过|小树林|困难财主家|鳌拜府|温府|五毒教|恒山|青城山|衡山|嵩山|云梦沼泽|普通桃花岛|困难桃花岛|白驼山|星宿海|普通冰火岛|困难冰火岛|普通移花宫|困难移花宫|普通燕子坞|困难燕子坞|燕子坞偷书|普通黑木崖|困难黑木崖|困难缥缈峰|光明顶|困难天龙寺|血刀门|普通古墓|困难古墓|华山论剑|侠客岛|困难禅宗|普通慈航|困难慈航|阴阳谷|普通战神殿|困难战神殿,(Xfb)
#select ($Xfbm) = 选择副本模式,扫荡|自动|快速进出,(Xfbm)
#input ($Xfbc) = 自定义扫荡副本次数,(Xfbc)
#select ($GmpSD) = 古宗门遗址单独扫荡,跳过|扫荡,(GmpSD)
#input ($GmpSDnum) = 古宗门遗址扫荡次数,(GmpSDnum)
#select ($Xzb) = 选择追捕模式,跳过|扫荡|自动,(Xzb)
#input ($Xwcd) = 等待冷却的追捕环数,(Xwcd)
#select ($Xwd) = 选择推塔模式,跳过|仅重置|自动|每周塔主模式,(Xwd)
#select ($Restart) = 是否重置塔,是|否,(Restart)
#select ($Shop) = 是否买扫荡扫塔,是|否,(Shop)
#input ($WudaoManualMaxLevel) = 此层开始停止并扫塔,(WudaoManualMaxLevel)
#input ($WudaoWaitCDLevel) = 等待技能冷却的层数,(WudaoWaitCDLevel)
#input ($Wudaoliaoshang) = 开始原地疗伤的层数,(Wudaoliaoshang)
#select ($WudaoRenew) = 武道塔恢复内力方式,武庙恢复|天地诀,(WudaoRenew)
#input ($Xend) = 流程结束后续动作,(Xend)
#select ($Xeq2) = 结束换装备技能组,关|1|2|3,(Xeq2)
#config

// 零、进入高级配置
[if] (XM) == 高级配置
    #select ($Xsm) = 师门开关,开|关,(Xsm)
    #select ($XcleanBag) = 武道塔之后是否清包,是|否,(XcleanBag)
    #input ($ZBMax) = 自动放弃的追捕环数,(ZBMax)
    #select ($DieToReset) = 翻车重置追捕,已开启|已关闭,(DieToReset)
    #input ($Speedwudao) = 推塔操作间隔，毫秒,(Speedwudao)
    #select ($Xqa) = 是否请安,否|是,(Xqa)
    #select ($Xred) = 低保红残页,长生诀|慈航剑典|关,(Xred)
    #select ($Xhua) = 选择送花收花模式（测试中）,跳过|送花和收花|仅送花|仅收花,(Xhua)
    #select ($Xmy) = 是否自动卖药和花,否|是,(Xmy)
    #select ($Xpfm2) = 结束是否关出招,是|否,(Xpfm2)
    #select ($Xdang) = 是否自动买当铺,是|否,(Xdang)
    #select ($Xmfsd) = 是否有免费扫荡,是|否,(Xmfsd)
    #config
    @print 高级配置完成，请重新运行流程。
    [exit]

[if] (XM) == 全局初始化
    ($Xflag) = 0

// 一、初始化
// -- 开始记录用时
@js ($DUT) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)

//-- 停止，停止自动
<-stopSSAuto
stopstate

//-- 换技能
[if](Xeq) != 关
    $eqskill (Xeq)
    @await 3000

//-- 换装备
[if](Xeq) != 关
    $eq (Xeq)
    @await 2000

//-- 设出招
[if](Xpfm) != 默认
    @js WG.Send("setting auto_pfm (Xpfm)")

//-- 快速清包
@cleanBag
@js ($nt0) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)
@js ($ut) = (nt0) - (DUT)
tm 1. 初始化完成，耗时(ut)秒

// 武道塔
($HpThreshold) = 80
($MpThreshold) = 80
[if] (XM) == 极速
    ($HpThreshold) = 10
    ($MpThreshold) = 10

($Blade) = 否
[if] (:kf_dao) == xuedao
    ($Blade) = 是
[if] (Xwd) == 跳过
    ($wdt) = 武道塔跳过
[else if] (Xwd) == 仅重置
    jh fam 9 start
    select {r守门人};ask1 {r守门人}
    @tip 从头开始挑战|已经重置
    ($wdt) = 武道塔重置完成
[else if] (Xwd) == 自动
    ($HpPer) = (HpThreshold)/100
    ($MpPer) = (MpThreshold)/100
    ($WudaoWaitCDExp) = (ZBcdskill)
    @await 1000
    @cmdDelay (Speedwudao)
    [if] (Xmfsd) == 否
        [if] {b扫荡符}? != null
            ($sdf3) = {b扫荡符#}
        [else]
            ($sdf3) = 0
    stopstate
    [if] (:hpPer) < (HpPer) || (:mpPer) < (MpPer)
        [if] (Blade) == 否
            @renew
        [if] (Blade) == 是
            [if] (:hpPer) < 0.05
                @liaoshang
                @tip 你的气血恢复了
                stopstate
            [if] (:mpPer) < 0.15
                @renew
    [if] (:kf_nei) == jiuyinshengong
        enable force none
        enable force jiuyinshengong
    jh fam 9 start
    [if] (Restart) == 是
        select {r守门人};ask1 {r守门人}
        @tip 从头开始挑战|已经重置
    jh fam 9 start
    ($level) = 1
    @tip 你目前可以直接去挑战第($level)层
    go enter
    [while] true
        @print 目前楼层:(level)层
        [if] (level) >= (WudaoManualMaxLevel)
            [break]
        [if] (level) >= (WudaoWaitCDLevel)
            @cd (WudaoWaitCDExp)
        go up
        kill {r武道塔守护者}
        @until {r武道塔守护者}? == null || (:combating) == true  
        @until {r武道塔守护者}? == null || (:combating) == false  
        [if] {r武道塔守护者}? == null
            ($level) = (level) + 1
        [if] (:hpPer) < (HpPer) || (:mpPer) < (MpPer)
            [if] (Blade) == 否
                @renew
                jh fam 9 start
                go enter
            [if] (Blade) == 是
                [if] (:hpPer) < 0.05
                    @to 扬州城-武庙
                    @await 500
                    liaoshang
                    @tip 你的气血恢复了
                    stopstate
                    jh fam 9 start
                    go enter
                [if] (:mpPer) <= 0.2
                    [if] (WudaoRenew) == null
                        ($WudaoRenew) = 天地诀
                    [if] (WudaoRenew) == 天地诀
                        ($wdforce) = (:kf_nei)
                        enable force changshengjue
                        [if] (:kf_nei) != changshengjue
                            ($WudaoRenew) = 武庙恢复
                            [if] (wdforce) != null
                                enable force (wdforce)
                            @print <hiy>无法装备长生诀，改回武庙恢复模式。</hiy>
                        [else]
                            @cd force.zhen
                            @perform force.zhen
                            @tip 你的($less)不够，无法使用【天地决】|转瞬间重获新生
                            enable force (wdforce)
                            [if] (less) != null
                                ($less) = null
                                [while] (:room) != 扬州城-武庙
                                    $to 扬州城-武庙
                                    @await 500
                            @dazuo
                            jh fam 9 start;go enter
                    [if] (WudaoRenew) == 武庙恢复
                        [while] (:room) != 扬州城-武庙
                            $to 扬州城-武庙
                            @await 500
                        @dazuo
                        jh fam 9 start;go enter
                    @await 2000
        [if] (level) >= (Wudaoliaoshang) + 1
            $to 扬州城-武庙
            @await 500
            @liaoshang
            jh fam 9 start
            go enter
    ($num)=0
    jh fam 9 start
    select {r守门人};ask2 {r守门人}
    @tip 用不着快速挑战了|不用快速挑战|快速挑战需要($num)张扫荡符
    @cmdDelay 500
    [if] (num) > 0
        [if] (Shop) == 是
            [if] (num) > (sdf3)
                ($num) = (num)-(sdf3)
                shop 0 (num)
    select {r守门人};ask2 {r守门人};ask3 {r守门人}
    @tip 你的扫荡符不够|挑战完成|用不着快速挑战了|不用快速挑战
    stopstate
    ($wdt) = 武道塔自动完成

[else if] (Xwd) == 每周塔主模式
    ($wdt) = 武道塔自动跳过（开启每周塔主模式）

@js ($nt1) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)
@js ($ut) = (nt1) - (nt0)
tm 2、(wdt)，耗时(ut)秒

// -- 清包
[if] (XcleanBag) == 是
    @cleanBag
    @await 3000
    @tidyBag
    @await 3000
    @tidyBag
    @await 3000


// 副本
// -- 退出组队
team out
// -- 检查签到状态，如果签到了就跳过副本
taskover signin
@tip 你今天的日常还($qd)，需要完成师门，副本。|你获得了($qd)。|你今天($qd)了。
[if] (qd) == 已经签到 || (qd) == 五十元宝
    ($rc) = 完成
// -- 跳过
[if] (Xfb) == 跳过
    ($fbt) = 副本跳过
// -- 如果签到了就跳过
[else if] (rc) == 完成
    ($fbt) = 副本已完成，自动跳过
// -- 模式
[else]
    [if] (Xfb) == 小树林
        ($fb) = cr yz/lw/shangu
    [else if] (Xfb) == 困难财主家
        ($fb) = cr yz/cuifu/caizhu 1
        ($fbs) = 财主家(困难)
    [else if] (Xfb) == 鳌拜府
        ($fb) = cr bj/ao/damen
        ($fbs) = 鳌拜府
    [else if] (Xfb) == 温府
        ($fb) = cr cd/wen/damen 0
        ($fbs) = 温府
    [else if] (Xfb) == 五毒教
        ($fb) = cr cd/wudu/damen 0
        ($fbs) = 五毒教
    [else if] (Xfb) == 恒山
        ($fb) = cr wuyue/hengshan/daziling 0
        ($fbs) = 恒山
    [else if] (Xfb) == 青城山
        ($fb) = cr wuyue/qingcheng/shanlu 0
    [else if] (Xfb) == 衡山
        ($fb) = cr wuyue/henshan/hengyang 0
        ($fbs) = 衡山
    [else if] (Xfb) == 嵩山
        ($fb) = cr wuyue/songshan/taishi 0
        ($fbs) = 嵩山
    [else if] (Xfb) == 云梦沼泽
        ($fb) = cr cd/yunmeng/senlin 0
        ($fbs) = 云梦沼泽
    [else if] (Xfb) == 普通桃花岛
        ($fb) = cr taohua/haitan 0
        ($fbs) = 桃花岛(简单)
    [else if] (Xfb) == 困难桃花岛
        ($fb) = cr taohua/haitan 1
        ($fbs) = 桃花岛(困难)
    [else if] (Xfb) == 白驼山
        ($fb) = cr baituo/damen 0
    [else if] (Xfb) == 星宿海
        ($fb) = cr xingxiu/xxh6 0
        ($fbs) = 星宿海
    [else if] (Xfb) == 普通冰火岛
        ($fb) = cr mj/bhd/haibian 0
    [else if] (Xfb) == 困难冰火岛
        ($fb) = cr mj/bhd/haibian 1
    [else if] (Xfb) == 普通移花宫
        ($fb) = cr huashan/yihua/shandao 0
        ($fbs) = 移花宫(简单)
    [else if] (Xfb) == 困难移花宫
        ($fb) = cr huashan/yihua/shandao 1
        ($fbs) = 移花宫(困难)
    [else if] (Xfb) == 普通燕子坞
        ($fb) = cr murong/anbian 0
        ($fbs) = 燕子坞(简单)
    [else if] (Xfb) == 困难燕子坞
        ($fb) = cr murong/anbian 1
        ($fbs) = 燕子坞(困难)
    [else if] (Xfb) == 燕子坞偷书
        ($fbs) = 燕子坞(偷书)
    [else if] (Xfb) == 普通黑木崖
        ($fb) = cr heimuya/shangu 0
    [else if] (Xfb) == 困难黑木崖
        ($fb) = cr heimuya/shangu 1
    [else if] (Xfb) == 困难缥缈峰
        ($fb) = cr lingjiu/shanjiao 1
    [else if] (Xfb) == 光明顶
        ($fb) = cr mj/shanmen 0
        ($fbs) = 光明顶
    [else if] (Xfb) == 困难天龙寺
        ($fb) = cr tianlong/damen 1
    [else if] (Xfb) == 血刀门
        ($fb) = cr xuedao/shankou 0
    [else if] (Xfb) == 普通古墓
        ($fb) = cr gumu/gumukou 0
    [else if] (Xfb) == 困难古墓
        ($fb) = cr gumu/gumukou 1
    [else if] (Xfb) == 华山论剑
        ($fb) = cr huashan/lunjian/leitaixia 0
        ($fbs) == 华山论剑
    [else if] (Xfb) == 侠客岛
        ($fb) = cr xkd/shimen 0
    [else if] (Xfb) == 困难禅宗
        ($fb) = cr chanzong/shanmen 1
    [else if] (Xfb) == 普通慈航
        ($fb) = cr cihang/shanmen 0
    [else if]  (Xfb) == 困难慈航
        ($fb) = cr cihang/shanmen 1
    [else if] (Xfb) == 阴阳谷
        ($fb) = cr yyg/ya 0
    [else if] (Xfb) == 普通战神殿
        ($fb) = cr zsd/damen 0
    [else if] (Xfb) == 困难战神殿
        ($fb) = cr zsd/damen 1

    // -- 扫荡模式
    [if] (Xfbm) == 扫荡
        // -- 检查扫荡符
        [if] (Xmfsd) == 否
            ($sdf) = {b扫荡符#}?
            [if] (sdf) < (Xfbc)
                ($sdf2) = (Xfbc) - (sdf)
                shop 0 (sdf2)
            [if] (sdf) == null
                shop 0 (Xfbc)
        // -- 开始记录战利品
        <-recordGains
        // -- 副本确认
        [if] (Xfb) == 困难财主家||(Xfb) == 鳌拜府||(Xfb) == 温府||(Xfb) == 五毒教||(Xfb) == 恒山||(Xfb) == 青城山||(Xfb) == 衡山||(Xfb) == 嵩山||(Xfb) == 云梦沼泽||(Xfb) == 普通桃花岛||(Xfb) == 困难桃花岛||(Xfb) == 白驼山||(Xfb) == 星宿海||(Xfb) == 普通冰火岛||(Xfb) == 困难冰火岛||(Xfb) == 普通移花宫||(Xfb) == 困难移花宫||(Xfb) == 普通燕子坞||(Xfb) == 困难燕子坞||(Xfb) == 普通黑木崖||(Xfb) == 困难黑木崖||(Xfb) == 困难缥缈峰||(Xfb) == 光明顶||(Xfb) == 困难天龙寺||(Xfb) == 血刀门||(Xfb) == 普通古墓||(Xfb) == 困难古墓||(Xfb) == 华山论剑||(Xfb) == 侠客岛||(Xfb) == 困难禅宗||(Xfb) == 普通慈航||(Xfb) == 困难慈航||(Xfb) == 阴阳谷||(Xfb) == 普通战神殿||(Xfb) == 困难战神殿
            (fb) (Xfbc)
            @await 500*(xfbc)
            @cleanBag
            ($fbt) = 扫荡(Xfb)(Xfbc)次完成
        [else]
            ($fbt) = 副本(Xfb)不建议扫荡，已跳过

    // -- 自动模式
    [else if] (Xfbm) == 自动
        [if] (Xfb) == 困难财主家||(Xfb) == 鳌拜府||(Xfb) == 温府||(Xfb) == 恒山||(Xfb) == 衡山||(Xfb) == 嵩山||(Xfb) == 普通桃花岛||(Xfb) == 困难桃花岛||(Xfb) == 星宿海||(Xfb) == 普通移花宫||(Xfb) == 困难移花宫||(Xfb) == 普通燕子坞||(Xfb) == 困难燕子坞||(Xfb) == 华山论剑||(Xfb) == 五毒教||(Xfb) == 燕子坞偷书||(Xfb) == 云梦沼泽
            @js ManagedPerformerCenter.start(`自动副本-(fbs)`, GetDungeonSource("(fbs)").replace(/#.*\n/g,'($_repeat) = 20'))
            @until (:room) == 住房-练功房 || (:room) == 住房-卧室 || (:room) == 扬州城-大门
            stopstate
            @await 10000
            @cleanBag
            ($fbt) = 自动(Xfb)20次完成
        [else]
            ($fbt) = 副本(Xfb)没有自动模式，已跳过

    // -- 快速进出模式
    [else if] (Xfbm) == 快速进出
        [if] (Xfb) == 小树林|| (Xfb) == 困难冰火岛||(Xfb) == 困难移花宫||(Xfb) == 困难缥缈峰||(Xfb) == 困难古墓||(Xfb) == 普通慈航
            ($num) = 0
            [while] (tdnum) < 20
                @cmdDelay 100
                (fb);cr over
                ($num) = (num) + 1
            @cmdDelay 300
            ($fbt) = 快速进出(Xfb)20次完成
        [else]
            ($fbt) = 该副本不建议快速进出模式，已跳过
@await 3000

// 低保红残页
[if] (rc) != 完成 && ($Day) != (:date)
    [if] (Xred)== 长生诀
        $to 扬州城-赌场
        ask3 {r易直非}?
        duihuan 1_32
        duihuan 1_32 st6
        @await 1000
        @js ($Day) = (:date)
    [if] (Xred)== 慈航剑典
        $to 扬州城-赌场
        ask3 {r易直非}?
        duihuan 1_33
        duihuan 1_33 st0
        @await 1000
        @js ($Day) = (:date)

@js ($nt2) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)
@js ($ut) = (nt2) - (nt1)
tm 3、(fbt)，耗时(ut)秒

// 古宗门扫荡
[if] (GmpSD) == 跳过
    ($gmpt) = 跳过古宗门扫荡
[else if] (GmpSD) == 扫荡
    @await 3000
    stopstate
    jh fam 9 start;go enter
    go up
    ggdl {r疯癫的老头}
    go north[2]
    go north[2]
    go north[2]
    @await 2000
    look shi
    tiao1 shi;tiao1 shi;tiao2 shi
    jumpdown
    [if] (GmpSDnum) == null
        ($GmpSDnum) = 10
    [if] (Xmfsd) == 否
        [if] {b扫荡符#}? < (GmpSDnum) || {b扫荡符}? == null
            shop 0 (GmpSDnum)
    cr gmp/shanmen 0 (GmpSDnum)
    [if] (GmpSDnum) > 1
        @tip 古宗门遗址($gmpflag)完成|扫荡符($gmplack)继续扫荡|你的($gmpjingli)不够
    [if] (gmpflag) != null
        ($gmpt) = 对【古宗门遗址】副本扫荡(GmpSDnum)次已完成！
    [else if] (gmplack) != null
        ($gmpt) = 扫荡符不足，无法完成对【古宗门遗址】副本的(GmpSDnum)次扫荡！
    [else if] (gmpjingli) != null
        ($gmpt) = 精力不足，无法完成对【古宗门遗址】副本的(GmpSDnum)次扫荡！ 
@js ($nt3) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)
@js ($ut) = (nt3) - (nt2)
tm 4、(gmpt)，耗时(ut)秒
@await 3000

// 师门
@toolbar tasks
@task 你的师门委托目前完成($sm1)/20个，共连续完成($sm2)个。
[if] (sm1) < 20 && (Xsm) == 开
    $sm
    @tip 你先去休息一下吧。
    @toolbar tasks
    @task 你的师门委托目前完成($sm1)/20个，共连续完成($sm2)个。
[if] (sm1) == 20
    ($smt) = 完成
[else]
    ($smt) = 跳过
@js ($nt4) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)
@js ($ut) = (nt4) - (nt3)
tm 5、师门(smt)，当前连续完成(sm2)个，耗时(ut)秒
@await 3000

// 签到，收花送花，领节日礼包，当铺
// -- 签到和领礼包
taskover signin;taskover zz1;taskover zz2
@tip 你今天的日常还($qd)，需要完成师门，副本。|你获得了($qd)。|你今天($qd)了。
[if] (qd) == 已经签到 || (qd) == 五十元宝
    ($qd) = 签到完成
[else if] (qd) == 没有完成
    ($qd) = 签到未完成

// -- 送花收花
[if] (Xhua) == 送花和收花 || (Xhua) == 仅送花
    greet 99
[if] (Xhua) == 送花和收花 || (Xhua) == 仅收花
    [if] (Xhua2) == null
       ($Xhua2)=0
    ($Xhua2)=0
    @cmdDelay 200
    [while] (Xhua2) >= 0
        receive system (Xhua2)
        @tip 没有($nothing)消息|你已经($finish)了|你获得了
        [if] (nothing) != null
            [break]
        ($Xhua2) = (Xhua2) + 1
    @cmdDelay 500

@js ($nt5) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)
@js ($ut) = (nt5) - (nt4)
tm 6、(qd)，耗时(ut)秒

// 追捕
@toolbar tasks
@task 追杀逃犯：目前完成($currentN)/20个，共连续完成($comboN)个|追杀逃犯：($empty)目前完成($currentN)/20个，共连续完成($comboN)个
[if] (currentN) == 20
    ($zmt) = 追捕已完成，自动跳过
[else if] (Xzb) == 跳过
    ($zmt) = 追捕跳过
[else if] (Xzb) == 扫荡
    @js WG.oneKeySD()
    @await 10000
    @toolbar tasks
    @task 追杀逃犯：目前完成($currentN)/20个，共连续完成($comboN)个|追杀逃犯：($empty)目前完成($currentN)/20个，共连续完成($comboN)个
    ($zmt) = 追捕扫荡完成，共连续完成(comboN)个
// -- 自动追捕
[else if] (Xzb) == 自动
    @cd
    @cmdDelay 1000
    @toolbar tasks
    @task 追杀逃犯：目前完成($currentN)/20个，共连续完成($comboN)个|追杀逃犯：($empty)目前完成($currentN)/20个，共连续完成($comboN)个
    [while](currentN) < 20
        [if] (Xwcd) != 不等待
            @renew
        [else]
            [if] (:living) == false
                dazuo
                @tip 你的内力恢复了
                stopstate
                liaoshang
                @tip 你的气血恢复了|你目前气血充沛
                stopstate
        [if] (Xwcd) < 10000　|| (Xwcd) != 不等待
            @until (:status xuruo) == false
        [if](ZBMax) != 关闭
            [if](comboN)>=(ZBMax)
                $to 扬州城-衙门正厅
                ask1 {程药发}
                ask2 {程药发}
                ($comboN) = 0
        [if](Xwcd) != 不等待
            [if](comboN)>=(Xwcd)
                @cd (ZBcdskill)
        $to 扬州城-衙门正厅
        ($olddir1) = (dir1)
        ($olddir2) = (dir2)
        @print (olddir1)
        ($escapee) = null
        [while] (escapee) == null
            ask1 {程药发}
            @toolbar tasks
            @task 追杀逃犯：($escapee)，据说最近在($dir1)-($dir2)出现过，你还有($time)去寻找他，目前完成($currentN)/20个，共连续完成($comboN)个。|追杀逃犯：目前完成($currentN)/20个，共连续完成($comboN)个
        [if](olddir1) != (dir1) && (olddir2) != (dir2)
            ($start_h) = (:hour)
            ($start_m) = (:minute)
        @await 500
        [while] {(escapee)}? == null
            <---
                @cmdDelay 1000
                [if] {(escapee)}? != null
                    ($type1) = null
                    kill {(escapee)}
                    @until {(escapee)的尸体}? != null | {r(escapee)}? == null | (:combating) == false
                    @tip 你的追捕任务完成了，目前完成($currentN)/20个，已连续完成($comboN)个。|你($type1)死了($type2)|你要攻击谁
                    [if] (:living) == false
                        relive
                        dazuo
                        @tip 你的内力恢复了
                        stopstate
                        liaoshang
                        @tip 你的气血恢复了|你目前气血充沛
                        stopstate
                    [if](type1)!= null
                        [if](DieToReset) == 已开启
                            $to 扬州城-衙门正厅
                            ask2 {程药发}
                    [break]
                [if] (DieToReset) == 已关闭
                    ($tb)=(start_h)*60-(:hour)*60-(start_m)+(:minute)
                    [if](tb)>10
                        [break]             
            --->
            @cmdDelay 800
            $to (dir1)-(dir2)
            [if] (dir1) == 武当派
                [if](dir2) == 林间小径
                    go south
                jh fam 1 start
                go north
                go south;go west
                go west
                go east;go northup
                go north
                go east
                go west;go west
                go northup
                go northup
                go northup
                go north
                go north
                go north
                go north
                go north
                go north
            [else if] (dir1) == 华山派
                jh fam 3 start
                go eastup
                go southup
                jumpdown
                go southup
                go south
                go east
                jh fam 3 start
                go westup
                go north
                go east
                go west;go north
                go east
                go west;go north
                go south[3];go west
                go east;go south
                go southup
                go southup
                look bi;break bi;go enter
                go westup
                go westup
                jumpup
            [else if] (dir1) == 少林派
                [if](dir2) == 竹林
                    go north
                jh fam 2 start
                go north
                go west
                go east;go east
                go west;go north
                go northup
                go southdown;go northeast
                go northwest
                go southwest
                go northeast;go north
                go east
                go west;go west
                go east;go north
                go east
                go west;go west
                go east;go north
                go west
                go east;go north
                go north   
            [else if] (dir1) == 峨眉派
                [if](dir2) == 走廊
                    go north
                    go south[2]
                    go north;go east[2]
                jh fam 4 start
                go northup
                go east
                go west;go southdown;go west
                go south
                go east
                go east
                go west;go south
                go north;go west;go south
                go north;go west
                go south
                go south
                go north;go north;go west
                go east;go north
                go north
            [else if] (dir1) == 逍遥派
                [if](dir2) == 林间小道
                    go west;go north
                    go south;go west
                    go east;go south
                [else if](dir2) == 木屋
                    go south[4]
                [else if](dir2) == 地下石室
                    go up
                jh fam 5 start
                go north
                go north
                jh fam 5 start;go east
                go north
                go south;go south
                go south
                jh fam 5 start;go west
                go south
                jh fam 5 start;go south
                go south
                jh fam 5 start;go down
                go down
            [else if] (dir1) == 丐帮
                [if](dir2) == 暗道
                    go east
                    go east[2]
                    go east
                jh fam 6 start
                go down
                go east
                go east
                go east
                go up
                go down;go east
                go east
                go up
    @await 5000
    @toolbar tasks
    @task 追杀逃犯：目前完成($currentN)/20个，共连续完成($comboN)个|追杀逃犯：($empty)目前完成($currentN)/20个，共连续完成($comboN)个
    ($zmt) = 追捕自动完成，共连续完成(comboN)个
@js ($nt6) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)
@js ($ut) = (nt6) - (nt5)
tm 7、(zmt)，耗时(ut)秒
@await 3000

// 收尾
recordGains->
stopSSAuto->

// -- 自动吃果子
[if] {b朱果g}? != null
    [if] {b朱果g#} <= 10
        use {b朱果g}[{b朱果g#}]
    [else]
        use {b朱果g}[10]
[if] {b潜灵果g}? != null
    [if] {b潜灵果g#} <= 10
        use {b潜灵果g}[{b潜灵果g#}]
    [else]
        use {b潜灵果g}[10]
[if] {b腊八粥}? != null
    use {b腊八粥}[5]
[if] {b玉简p%}? != null
    use {b玉简p%}?

// -- 当铺
[if] (Xdang) == 是
    $tnbuy
    @await 3000

// -- 清包
@cleanBag
@await 3000
@tidyBag
@await 3000
@tidyBag
@await 3000

// -- 自动卖花卖药
[if] (Xmy) == 是
    @cmdDelay 100
    [if] {b聚气丹g}? != null
        sell {b聚气丹g#}? {b聚气丹g}? to {r杨永福}?
    [if] {b聚气丹b}? != null
        sell {b聚气丹b#}? {b聚气丹b}? to {r杨永福}?
    [if] {b聚气丹y}? != null
        sell {b聚气丹y#}? {b聚气丹y}? to {r杨永福}?
    [if] {b聚气丹p}? != null
        sell {b聚气丹p#}? {b聚气丹p}? to {r杨永福}?
    [if] {b聚气丹p}? != null
        sell {b突破丹p#}? {b突破丹p}? to {r杨永福}?
    [if] {b玫瑰花}? != null
        sell {b玫瑰花#}? {b玫瑰花}? to {r杨永福}?
    @cmdDelay 500

// -- 请安
[if] (Xqa) == 否
    tm 8、跳过请安
[else if] (Xqa) == 是
    @js WG.oneKeyQA()
    @await 3000
    tm 8、请安完成

//-- 换装备
[if](Xeq2) != 关
    $eq (Xeq2)
    @await 3000

//-- 换技能
[if](Xeq2) != 关
    $eqskill (Xeq2)
    @await 2000

//-- 是否关出招
[if](Xpfm2) == 是
    @js WG.Send("setting auto_pfm 0")
    $stoppfm

@js ($nt) = (:date)*60*60*24 + (:hour)*60*60 + (:minute)*60 +(:second)
@js ($ut) = (nt) - (DUT)

[if] (Xend) != 默认
    (Xend)
[else]
    $zdwk

tm # 一键流程完成，耗时(ut)秒 #