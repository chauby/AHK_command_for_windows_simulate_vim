;移动光标操作
!j:: ;alt+j
Send {Down}
return

!k:: ;alt+k
Send {Up}
return

!h:: ;alt+h
Send {Left}
return

!l:: ;alt+l
Send {Right}
return

;移动鼠标操作
;#j:: MouseMove, 0, 60, , R
;#k:: MouseMove, 0, -60, , R
;#h:: MouseMove, -60, 0, , R
;#l:: MouseMove, 60, 0, , R

;删除一整行
!d::   ;alt+d
Send {Home}   ;输出回车
Send +{End}    ;输入shitf键+end键
Send {delete}   ;输入delete键
return


;复制一整行
!y::
send {home}
send +{end}
send ^c   ;输出ctrl+c,复制一整行
return

;另起一行粘贴内容
!p:: ;alt+p				
send {end}					
send {enter}
send %clipboard%	;将剪贴板的内容输出	
return

;在下面另起一行开始操作
!o:: ; alt+o
send {end}
send {enter}
return

;在上面另起一行开始操作
!+o:: ; alt+shift+o
send {up}
send {end}
send {enter}
return

;重命名
!m:: ; alt+m
send {F2}
return

;回到行首
!0:: ;alt+0
send {Home}
return

;回到行尾
!4:: ;alt+4
send {End}
return

;撤销操作
!u:: ;alt+u
send ^z
return

;Redo
!r:: ;alt+r
send ^+z
return

#c:: ;关闭窗口
Send {Alt Down}{F4}{Alt Up}
return

#s:: ;最小化窗口
WinMinimize,A
return

#w:: ;最大化窗口/恢复
WinGet,S,MinMax,A
if S=0
    WinMaximize,A
else if S=1
    WinRestore,A
else if S=-1
    WinRestore,A
return

!c:: ;一键拷贝文件路径
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return


; 获取当前路径的函数
getExplorerPath()
{
    IfWinExist, ahk_exe WindowsTerminal.exe
    {
        ControlGetText,address,ToolbarWindow323,ahk_exe WindowsTerminal.exe
        StringLen, length, address
        StringRight, path, address, length-4
        return path
    }
    return
}

; Alt+T 在当前目录打开cmder
;!t::
Process,Exist,explorer.exe
if (%ErrorLevel% != 0)
{
    if WinActive("ahk_exe WindowsTerminal.exe")
    {
        path := getExplorerPath()   
        Run ,wt.exe "%path%"
        return
    } ; 如果在桌面
    if WinActive("ahk_exe WindowsTerminal.exe")
    {
        Run ,wt.exe %A_Desktop%
        return
    }
}

; Ctrl+ Alt+T 打开cmder
^!t::
Process,Exist,explorer.exe
if (%ErrorLevel% != 0)
{
    Run ,wt.exe
    return
}


; Alt+Shift+T 在当前编辑文件的目录打开cmder
!+t::
Process,Exist,sublime_text.exe
if (%ErrorLevel% != 0)
{
    if WinActive("ahk_class PX_WINDOW_CLASS")
    {
        WinGetTitle, title, ahk_class PX_WINDOW_CLASS
        StringGetPos,pos,title,\,r
        StringLeft, folder, title, %pos%
        Run ,cmder "%folder%"
        return
    }
}
return


#1:: ; win+1 灵活打开/激活/隐藏wechat
IfWinNotExist ahk_class WeChatMainWndForPC
{
    run C:\Program Files (x86)\Tencent\WeChat\WeChat.exe
    WinActivate
}
Else IfWinNotActive ahk_class WeChatMainWndForPC
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

#2:: ; win+2 灵活打开/激活/隐藏网易邮箱大师
IfWinNotExist ahk_class MainWindow
{
    run mailmaster.exe
    WinActivate
}
Else IfWinNotActive ahk_class MainWindow
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

;#3:: ; win+3 灵活打开/激活/隐藏VS code
IfWinNotExist ahk_class Chrome_WidgetWin_1
{
    run C:\Program Files\Microsoft VS Code\Code.exe
    WinActivate
}
Else IfWinNotActive ahk_class Chrome_WidgetWin_1
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

;#4:: ; win+4 灵活打开/激活/隐藏360浏览器
;IfWinNotExist ahk_class Chrome_WidgetWin_1
;{
;    run 360chrome.exe
;    WinActivate
;}
;Else IfWinNotActive ahk_class Chrome_WidgetWin_1
;{
;    WinActivate
;}
;Else
;{
;    WinMinimize
;}
;Return

#4:: ; win+4 灵活打开/激活/隐藏Edge浏览器
IfWinNotExist ahk_class Chrome_WidgetWin_1
{
    run msedge.exe
    WinActivate
}
Else IfWinNotActive ahk_class Chrome_WidgetWin_1
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

#5:: ; win+5 灵活打开/激活/隐藏欧陆词典
IfWinNotExist ahk_class Qt5QWindowIcon
{
    run C:\Program Files\eudic\eudic.exe
    WinActivate
}
Else IfWinNotActive ahk_class Qt5QWindowIcon
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

#3:: ; win+3 灵活打开/激活/隐藏ticktick小窗口
IfWinNotExist ahk_class HwndWrapper
{
    run C:\Program Files (x86)\滴答清单\TickTick.exe
    WinActivate
}
Else IfWinNotActive ahk_class HwndWrapper
{
    WinActivate
}
Else
{
    WinMinimize
}
Return


; 打开网页
;!g:: run https://www.google.com/


; 常用字符串
::/mail::chaubyZou@163.com
::/BFRmail::zoucb@buffalo-robot.com

::/BFR::布法罗机器人科技（成都）有限公司
::/pt::智能康复下肢减重训练系统