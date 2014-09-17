(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;===============
;;关闭起动时的那个“开机画面”。
(setq inhibit-startup-message t)
;;
;;hiden the scroll-bar-mode,隐藏滚动条
(scroll-bar-mode 0)  
;;close mouse-wheel
;;(mouse-wheel-mode -1)

;;关闭Emacs里的报警
(setq visible-bell t)

;;
;;
;;windows enverionment setting
;;
(setenv "HOME" "D:/work/emacs")
;;(setenv "PATH" "D:/work/emacs")
;;设置编译环境 编译调试环境
(setenv "PATH" "D:/work/emacs/bin;D:/work/emacs;D:/work/cygwin/bin;D:/work/MinGW/bin;D:/work/jdk7/bin;D:/work/python2.7.2")
;;执行python脚本-------C-c C-z 并且将-i 改为脚本名
;;set the default file path
(setq default-directory "~/")
;;默认加载插件目录
(add-to-list 'load-path "~/emacs/site-lisp")


(setq user-full-name "Go")
(setq user-mail-address "xxxxxx@gmail.com")
;; 去掉工具栏
(tool-bar-mode nil)

;;去掉菜单栏
;;(menu-bar-mode nil)

;; 去掉滚动栏
;;(scroll-bar-mode nil)

;; 启动窗口大小
(setq default-frame-alist
'((height . 35) (width . 125) (menu-bar-lines . 20) (tool-bar-lines . 0)))
;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p) 
;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t) 
;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)
;;设置tab为4个空格的宽度
(setq default-tab-width 4)


;;=====
;;设置行号
;;=====
(require 'linum)
(global-linum-mode t)


;;golang mode
;;(add-to-list 'load-path "~/site-lisp/go-mode")
;;(require 'go-mode)
;;(require 'go-mode-load)


;;============
;;
;;theme 
;;
;;==============

;;添加初始化目录
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0") 
(require 'color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker) ;;选择你喜欢的主题 
;;解释说明  , 即可，最后一行是配色方案名称，不要有大写，空格用“-”代替。
;;
;;====================
;;(add-to-list 'load-path "~/myplugins/color-theme-6.6.0") 
;;(require 'color-theme)
;;(color-theme-initialize)
;;自定义配色
;;(add-to-list 'custom-theme-load-path "~/myplugins/mytheme/emacs-color-theme-solarized")
;;(load-theme 'solarized-dark t)
;;
;;
;;
;;自定义配色
;;(load-file "~/site-lisp/mytheme/color-theme-almost-monokai.el")
;;
;;(color-theme-almost-monokai)
;;
;;
;;自定义配色
;;(load "~/site-lisp/mytheme/color-theme-molokai.el")
;;(color-theme-molokai)
;;
;;自定义配色
;;(load-file "~/site-lisp/mytheme/molokai-theme.el")
;;
;;(load-theme 'molokai t)
;;


;;===================
;;
;;elpa全称Emacs Lisp Package Archive，类似apt-get
;;类似 vim的Vundle
;;自动管理插件,自动解决依赖自动编译用起来很方便
;;
;;====================
(setq package-archives '(
						 ("gnu" . "http://elpa.gnu.org/packages/")
                         ))
(when (>= emacs-major-version 24)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
)
;;禁止elpa自动加载packages

(setq package-enable-at-startup nil)
;;手动初始化之，如此elpa会将packages的路径加入load-path中，免去我们分别手动加入的麻烦了
(package-initialize);
;;下面require需要的packages并设置之就好了 





;;=========
;;
;; yasnippet 自定义yasnippet位置
;;
;;============
;;添加初始化目录
;;(add-to-list 'load-path "~/site-lisp/yasnippet") 
(require 'yasnippet)
;;(setq yas/root-directory "~/site-lisp/yasnippet/snippets")
(setq yas/root-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets")

;; (setq yas/root-directory "~/.emacs/snippets")
(yas/load-directory yas/root-directory)
;;弹出补全表的移动选项
(require 'dropdown-list)
      (setq yas/prompt-functions '(yas/dropdown-prompt
                                   yas/ido-prompt
                                   yas/completing-prompt))
;;========
;;
;;auto-complete设置
;;
;;========
;;(add-to-list 'load-path "~/site-lisp/auto-complete-1.3.1")
(require 'auto-complete)
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "/myplugins/auto-complete-1.3.1/ac-dict")
;;(add-to-list 'ac-dictionary-directories "/site-lisp/auto-complete-1.3.1/dict")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(ac-config-default)


;;===============
;;
;;sr-speedbar / speedbar
;;
;;===============
;;
;;`sr-speedbar-open'                   Open `sr-speedbar' window.
;;`sr-speedbar-close'                  Close `sr-speedbar' window.
;;`sr-speedbar-toggle'                 Toggle `sr-speedbar' window.
;;`sr-speedbar-select-window'          Select `sr-speedbar' window.
;;`sr-speedbar-refresh-turn-on'        Turn on refresh speedbar content.
;;`sr-speedbar-refresh-turn-off'       Turn off refresh speedbar content.
;;`sr-speedbar-refresh-toggle'         Toggle refresh speedbar content.
;;
;;
;;(add-to-list 'load-path "~/site-lisp/speedbar")
(require 'sr-speedbar)  
   
(setq speedbar-show-unknown-files t)  
(setq speedbar-use-images nil)  
(setq sr-speedbar-width 0.15)  
(setq sr-speedbar-right-side nil)  
   
(global-set-key (kbd "<f5>") (lambda()  
                               (interactive)  
                               (sr-speedbar-toggle)))    

;;---------------------------------------------------------------------

;;========
;;
;; xcscope
;;
;;========
;;;
;;始终加载xcscope
;;(require 'xcscope)
;;你希望只在打开c/c++文件的时候才加载xcscope，可以加入
;;======

;;(add-to-list 'load-path' "~/site-lisp")
(add-hook 'c-mode-common-hook '(lambda() (require 'xcscope)))

 
(put 'upcase-region 'disabled nil)


;;===========
;;
;;evil-mode
;;
;;=========
;;(add-to-list 'load-path "~/site-lisp/evil")
(require 'evil)
(evil-mode 1)
;;退出设置  M-j映射为vim的esc
(global-unset-key (kbd "M-j"))
;;格式:   (define-key  有效的模式条件  (kbd 按键组合) '执行函数)
(define-key evil-insert-state-map (kbd "M-j") 'evil-force-normal-state) 
;;(defun exit_visual()  (evil-exit-visual-state &optional LATER BUFFER))  
(define-key evil-visual-state-map (kbd "M-j") 'evil-exit-visual-state)
;;撤销M-k按键
(global-unset-key (kbd "M-k"))

;;冲突
;;(define-key evil-normal-state-map (kbd "M-n") 'evil-window-prev) 
;;强制全局绑定按键
(global-set-key (kbd "M-w") 'evil-window-prev) 

;;===
;;; C-c as general purpose escape key sequence.
;;;




;;=========
;;
;;vim pulse vim in emacs 真邪恶:) ctrl+z 进行emacs vim之间的切换 
;;vim mode
;;
;;=====
;;(setq viper-mode t) ; enable Viper at load time
;;(setq viper-ex-style-editing nil) ; can backspace past start of insert / line
;;(require 'viper) ; load Viper
;;(add-to-list 'load-path "~/site-lisp/vimpulse")
;;(require 'vimpulse) ; load Vimpulse 
;;============
;;
;;zen-code
;;
;;============
;;(add-to-list 'load-path "~/site-lisp/zencoding-mode")
(require 'zencoding-mode)
;;Enable it by running M-x zencoding-mode. You probably want to add it to auto-load on your sgml modes:
;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'zencoding-mode) 
;;Good to go: place point in a zencoding snippet 
;;and press C-j to expand it (or alternatively, 
;;alias your preferred keystroke to M-x zencoding-expand-line) 
;;and you'll transform your snippet into the appropriate tag structure. 


;;===========================
;;========
;;
;;cedet 
;;
;;==========
;;你的安装目录
;;(load-file "d:/tool/emacs23.0.92.1/emacs/site-lisp/cedet/common/cedet.el")
(setq stack-trace-on-error t)

;;(load-file "~/lisp/cedet/cedet.el");;这里必须"/",
(load-file "~/.emacs.d/site-lisp/cedet/common/cedet.el");;这里必须"/",
;;(load-file "~/.emacs.d/site-lisp/cedet/common/cedet.el");;这里必须"/",

(global-ede-mode 1)
(semantic-load-enable-code-helpers)
(global-srecode-minor-mode 1)
(require 'cedet) ;;加载cedet

;;;; 使函数体能够折叠或展开
;; Enable source code folding
(global-semantic-tag-folding-mode 1)

;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)
;;; smart complitions setup
;;(require semantic-ia)

;;(require 'semantic)
;; To enable Semantic, turn on `semantic-mode', a global minor mode
;;(semantic-mode 1)	

;; 配置Semantic的检索范围:
;; (setq semanticdb-project-roots
;; (list
;; (expand-file-name "/")))

;; 设置semantic cache临时文件的路径，避免到处都是临时文件
;; (setq semanticdb-default-save-directory "~/.emacs.d/")


;;;;;;;;;;;;
;;
;;semantic分析复杂度设置
;;
;;;;;;;;;;;;
;;semantic-load-enable-code-helpers用来设置semantic分析文件的程度，一共有5级，从上到下越来越复杂。
;;semantic-load-enable-minimum-features是最低要求；
;;semantic-load-enable-code- helpers稍复杂一点，主要是加了一个imenu菜单(不过这个菜单在windows和mac上都显示不出来)；
;;semantic-load-enable-guady-code-helpers加入了一些用处不大的功能，比如在第一行显示当前的函数等（这个命令已经不建议使用了）；
;;semantic-load-enable-excessive-code-helpers加了在mode line显示当前函数名的功能，也没多大用；
;;semantic-load-enable-semantic-debugging-helpers用于调试 semantic本身。所以一般我们用semantic-load-enable-code-helpers就可以了。



;;;;;;;;;
;;;
;;semantic快捷键设置
;;
;;;;;;;
;;(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)用来设置快捷键。
;;因为semantic没有设置默认的热键，所以我把它绑定到 ctrl+tab上去
;;。这儿有4种补全选择：senator-complete-symbol是调用senator的分析结果直接补全，不弹出菜单；
;;senator-completion-menu-popup也是调用senator，不过会弹一个选择菜单；
;;semantic-ia-complete-symbol是调用semantic的分析结果智能补全，不弹出菜单；
;;semantic-ia-complete-symbol- menu也是调用semantic的结果，不过会弹出一个选择菜单。因为semantic的分析结果更智能，所以一般都用semantic-ia- complete-symbol-menu。
;;(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
(global-set-key (kbd "M-p") 'semantic-ia-complete-symbol-menu)
;;;;;;;;;;;;;;
;;
;;semantic的检索范围
;;
;;;;;;;;;;;;;;
;;用semanticdb-project-roots来配置semantic的检索范围，最简单的方式在linux下直接配置为/根目录。不过我发现不配置它也可以用，可能semantic默认设置为/了。

;;
;;semantic设置cache文件的保存位置
;;
;;(setq semanticdb-default-save-directory "~/.emacs.d/")
;;设置cache文件的保存位置，不设的话默认是在被分析文件的目录下，每个目录一个。



;;;; 当输入"."或">"时，在另一个窗口中列出结构体或类的成员

;;(defun my-c-mode-cedet-hook ()

;;  (local-set-key "." 'semantic-complete-self-insert)

;;  (local-set-key ">" 'semantic-complete-self-insert))

;;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)





;;1. semantic-ia-fast-jump(好像是从cedet1.0pre5才加入的)可以实现类似vs中f12的功能，跳转到光标所在的地方的符号的定义，我把它绑定到f12上了。
;;2.cedet-contrib里有个eassist.el，可以很方便地在c++的h/cpp文件间切换，具体命令是eassist-switch-h-cpp，可以把它绑定到某个键上(我用的f11)。
;;3.semantic默认只搜索当前路径，好像还有系统路径/usr/include。对于windows，可以用下面命令：
;;(semantic-add-system-include "C:/MinGW/include/c++/3.4.5" 'c++-mode)
;;(semantic-add-system-include "C:/Program Files/Microsoft Visual Studio 9.0/VC/atlmfc/include" 'c++-mode)
;;把mingw或者vc的头文件路径加进去，这样，就可以用semantic对mfc类进行补全了。






;;C-g  取消键入的指令

;;======
;;
;;ecb加载
;;
;;========
;;(add-to-list 'load-path "~/site-lisp/ecb-2.40")
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40")

(require 'ecb) ;;加载ecb
;;(require 'ecb-autoloads)
(setq ecb-windows-witdh 0.25)
(setq ecb-help-info-start-file nil)
(setq ecb-auto-activate t
 	  ecb-tip-of-the-day nil
	  ;;设置ecb窗口大小
	  ecb-windows-width 0.15
	  ;;ecb-windows-height 0.5 
 )  
;;我这里使用CTRL+;键来开启，这样开单个文件就非常快了，而且要开关ecb也非常快
(defun my-ecb-active-or-deactive()  
    (interactive)  
    (if ecb-minor-mode  
      (ecb-deactivate)  
      (ecb-activate))) 

;;自定义布局
;;
;;(ecb-layout-define "leftright6" left-right nil
;;  (ecb-split-ver 0.4 t)
;;  (if (fboundp (quote ecb-set-speedbar-buffer)) (ecb-set-speedbar-buffer) (ecb-set-default-ecb-buffer))
;;  (dotimes (i 1) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))
;;  (if (fboundp (quote ecb-set-sources-buffer)) (ecb-set-sources-buffer) (ecb-set-default-ecb-buffer))
;;  (dotimes (i 2) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))
;;  (if (fboundp (quote ecb-set-methods-buffer)) (ecb-set-methods-buffer) (ecb-set-default-ecb-buffer))
;;  (dotimes (i 1) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))
;;  (dotimes (i 2) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))
;;  )
;;
;;选择布局
;;在.ecb-user-layouts.el 文件中有定义
(setq ecb-layout-name "leftright6")  
(global-set-key (kbd "C-;") 'my-ecb-active-or-deactive)







;;结合vim习惯按键
;;(global-set-key "\C-L" 'forward-char)
;;(global-set-key "\C-H" 'backward-char)

;; 隐藏和显示ecb窗口  
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)  
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)  
   
;; 使某一ecb窗口最大化  
;(define-key global-map "/C-c1" 'ecb-maximize-window-directories)  
;(define-key global-map "/C-c2" 'ecb-maximize-window-sources)  
;(define-key global-map "/C-c3" 'ecb-maximize-window-methods)  
;(define-key global-map "/C-c4" 'ecb-maximize-window-history)  
;; 恢复原始窗口布局  
;(define-key global-map "/C-c`" 'ecb-restore-default-window-sizes)

   
;; Ecb的操作:
;; C-c . g d 目录列表窗口
;; C-c . g s 源码窗口
;; C-c . g m 方法和变量窗口
;; C-c . g h 历史窗口
;; C-c . g l 最后选择过的编辑窗口
;; C-c . g 1 编辑窗口1
;; C-c . g n 编辑窗口n
;; C-c . l c 选择版面
;; C-c . l r 重画版面
;; C-c . l t 拴牢版面(锁定版面)
;; C-c . l w 拴牢可见的ecb窗口
;; C-c . \ 拴牢编绎窗口
;;e\d\s\m\h
;;
(global-set-key (kbd "M-s e") 'ecb-goto-window-edit-last)
(global-set-key (kbd "M-s s") 'ecb-goto-window-sources)
(global-set-key (kbd "M-s d") 'ecb-goto-window-directories)
(global-set-key (kbd "M-s m") 'ecb-goto-window-methods)
(global-set-key (kbd "M-s h") 'ecb-goto-window-history)
(global-set-key (kbd "M-s x") 'ecb-goto-window-speedbar)
(global-set-key (kbd "M-s r") 'ecb-redraw-layout)


;; 其中l为小写字母(L),大家别看错!!
;; 切换buffer
(global-set-key (kbd "M-b") 'switch-to-buffer)

;;==============================
;;
;; 各窗口间切换
;;
;; ================
;(global-set-key [M-left] 'windmove-left)

;(global-set-key [M-right] 'windmove-right)

;(global-set-key [M-up] 'windmove-up)

;(global-set-key [M-down] 'windmove-down) 

;(global-set-key (kbd "M-h") 'backward-char)

;(global-set-key (kbd "M-l") 'forward-char)

;(global-set-key (kbd "M-k") 'previous-line)

;(global-set-key (kbd "M-j") 'next-line) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
	(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
	(define-key global-map [(control f5)]  'cscope-find-this-symbol)
	(define-key global-map [(control f6)]  'cscope-find-global-definition)
	(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
	(define-key global-map [(control f8)]  'cscope-pop-mark)
	(define-key global-map [(control f9)]  'cscope-next-symbol)
	(define-key global-map [(control f10)] 'cscope-next-file)
	(define-key global-map [(control f11)] 'cscope-prev-symbol)
	(define-key global-map [(control f12)] 'cscope-prev-file)
    (define-key global-map [(meta f9)]  'cscope-display-buffer)
    (define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)




