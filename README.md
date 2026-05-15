# XLISP ver1.1

> An Experimental Object Oriented Language - CP/M用（Z-80, HI-TECH C）

XLISPはDavid Betzによって開発された、実験的なオブジェクト指向プログラミング言語です。小型コンピュータでのオブジェクト指向プログラミングの実験を目的として実装されました。

## 概要

- **言語**: LISP + オブジェクト指向機能
- **実装言語**: C言語
- **ライセンス**: The Unlicense
- **このビルド**: Z-80 CP/M用（HI-TECH C コンパイラ）
- **ver1.1a** : if関数を修正しました。

## 特徴

### サポートされるデータ型
- シンボル（symbols）
- 文字列（strings）
- 整数（integers）
- オブジェクト（objects）
- ファイルポインタ（file pointers）
- リスト（lists）
- 組み込み関数（subrs）

### オブジェクト指向機能
- `Object`: クラス階層の根
- `Class`: すべてのクラスの基底クラス
- `Keymap`: キー入力マッピング用クラス(CP/M版は無し)
- メッセージ送信によるオブジェクト間通信
- クラス継承とメソッドの多態性

## プロジェクト構成
```
├── src/                    # ソースコード（Z-80用）
│   ├── XLISP.C            # メインプログラム
│   ├── XLISP.COM          # CP/M実行形式
│   ├── XLISP.H            # ヘッダーファイル
│   ├── XLBIND.C           # バインディング
│   ├── XLDMEM.C           # メモリ管理
│   ├── XLEVAL.C           # 評価器
│   ├── XLFIO.C            # ファイルI/O
│   ├── XLIO.C             # I/O関数
│   ├── XLKMAP.C           # キーマップ
│   ├── XLLIST.C           # リスト処理
│   ├── XLMATH.C           # 算術関数
│   ├── XLOBJ.C            # オブジェクト
│   ├── XLPRIN.C           # 出力
│   ├── XLREAD.C           # 読み込み
│   ├── XLSTR.C            # 文字列処理
│   └── XLSUBR.C           # 組み込み関数
├── original/              # オリジナルソース
├── XLISP11A.COM           # CP/M実行形式 v1.1a if修正版
└── ASCIART.LSP            # ASCIART
```

## ビルド方法

### コンパイル
```
C\XLISP11\src> cpm.exe i:c
HI-TECH C COMPILER (CP/M-80) V3.09
Copyright (C) 1984-87 HI-TECH SOFTWARE
c>  -o xlisp.c xlread.c xleval.c xlprin.c xlbind.c xlsubr.c xllist.c xlmath.c \
c>  xlobj.c xlfio.c xlio.c xlstr.c xldmem.c
```

### リンク
```
C\XLISP11\src>cpm.exe i:c
HI-TECH C COMPILER (CP/M-80) V3.09
Copyright (C) 1984-87 HI-TECH SOFTWARE
c>  xlisp.obj xlread.obj xleval.obj xlprin.obj xlbind.obj xlsubr.obj xllist.obj xlmath.obj \
c>  xlobj.obj xlfio.obj xlio.obj xlstr.obj xldmem.obj
```

### ビルド環境
このビルドと実行には CP/M-80 program EXEcutor for Win32 を使用しました。  
cpm.exeを呼び出せるようにパスを通し、
HI-TECH-C Z80(CP/M)を i:でアクセスできるように substと環境変数 CPMI、ENVIRONで設定しています。

```
C\XLISP11\SRC>cpm.exe
CPM.EXE -- CP/M-80 program EXEcutor for Win32 V0.4
Copyright (C) 2004-2012 by K.Murakami
  Usage: CPM [-hxapdC][-w[0-9]] command arg1 arg2 ...
        -h .. return HI-TECH C exit code
        -x .. return ERROR if A:$$$.SUB deleted
        -a .. select A: (program directry)
        -p .. pause before exit
        -d .. disable auto drive assign
        -C .. args to uppercase
        -w[0-9] .. wait on console status check (9:max)

C\XLISP11\SRC>set CPMI=<HITECH-Cのフォルダ>

C\XLISP11\SRC>subst i: <HITECH-Cのフォルダ>

\XLISP11\SRC>type ENVIRON
HITECH=I:

C\XLISP11\SRC>dir i:
 ドライブ I のボリューム ラベルは Local Disk です
 ボリューム シリアル番号は XXXX-XXXX です

 I:\ のディレクトリ
2026/04/05  22:40    <DIR>          .
2025/02/16  16:49    <DIR>          ..
1707/03/15  17:59             1,152 $EXEC.COM
1707/03/15  18:06               512 ASSERT.H
1707/03/15  18:13            19,456 C.COM
1707/03/15  18:20            44,288 CGEN.COM
1707/03/15  18:27               640 CONIO.H
1707/03/15  18:34             3,584 CPM.H
1707/03/15  18:42            25,984 CPP.COM
1707/03/15  18:49            16,896 CREF.COM
1707/03/15  18:56               384 CRTCPM.OBJ
1707/03/15  19:03               896 CTYPE.H
1707/03/15  19:10            13,568 DEBUG.COM
1707/03/15  19:17            12,032 DEHUFF.COM
1707/03/15  19:25               384 EXEC.H
1707/03/15  19:32             2,176 FLOAT.H
1707/03/15  19:39             2,048 HITECH.H
1707/03/15  19:46            61,056 LIBC.LIB
1707/03/15  19:53            25,472 LIBF.LIB
1707/03/15  20:00            18,048 LIBR.COM
1707/03/15  20:07               768 LIMITS.H
1707/03/15  20:15            30,080 LINK.COM
1707/03/15  20:22               512 MATH.H
1707/03/15  20:29            24,448 OBJTOHEX.COM
1707/03/15  20:36            28,160 OPTIM.COM
2026/04/05  22:38               728 OPTIONS
1707/03/15  20:50            39,936 P1.COM
2026/04/05  22:39               784 READ.ME
1707/03/15  21:05               768 RRTCPM.OBJ
1707/03/15  21:12               256 SETJMP.H
1707/03/15  21:19             1,152 SIGNAL.H
1707/03/15  21:26               768 STAT.H
1707/03/15  21:33               256 STDARG.H
1707/03/15  21:41               384 STDDEF.H
1707/03/15  21:48             2,560 STDIO.H
1707/03/15  21:55             1,024 STDLIB.H
1707/03/15  22:02             1,280 STRING.H
1707/03/15  22:09             1,024 SYS.H
1707/03/15  22:16               896 TIME.H
1707/03/15  22:24               768 UNIXIO.H
1707/03/15  22:31            37,632 ZAS.COM
              39 個のファイル             422,760 バイト
```


## 使用方法

XLISPを起動すると、プロンプト `>` が表示されます：

```lisp
C\XLISP11\SRC>cpm.exe XLISP.COM
XLISP version 1.1
> (+ 1 2 3)
6
> (defun factorial (n) (cond ((eq n 0) 1) (t (* n (factorial (- n 1))))))
factorial
> (factorial 5)
120
```

括弧が閉じていない場合、プロンプトは `n>` となります（nは開いている括弧レベル）。


ASCIARTの実行例:

```
C\XLISP11\SRC>cpm.exe XLISP.COM
XLISP version 1.1
> (defun mandel ()
 1 >  (setq F 50)
 1 >  (setq Y -12)
 1 >  (while (<= Y 12)
 2 >    (setq X -39)
 2 >    (while (<= X 39)
 3 >      (setq C (/ (* X 229) 100))
 3 >      (setq D (/ (* Y 416) 100))
 3 >      (setq A C)
 3 >      (setq B D)
 3 >      (setq I 0)
 3 >      (setq Z 0)
 3 >      (while (== Z 0)
 4 >        (setq Q (/ B F))
 4 >        (setq S (- B (* Q F)))
 4 >        (setq TT (+ (/ (- (* A A) (* B B)) F) C))
 4 >        (setq B (+ (* 2 (+ (* A Q) (/ (* A S) F))) D))
 4 >        (setq A TT)
 4 >        (setq P (/ A F))
 4 >        (setq Q (/ B F))
 4 >        (cond ((> (+ (* P P) (* Q Q) ) 4)
 6 >            (cond ((< I 10) (princ I))
 7 >              (t (princ (chr (+ 55 I)))))
 6 >            (setq Z -1))
 5 >          (t (setq I (+ I 1))
 6 >            (cond ((> I 15)
        8 >         (princ " ") (setq Z -1))))))
 3 >      (setq X (+ X 1)))
 2 >    (princ "\n")
 2 >    (setq Y (+ Y 1)))
 1 >  (princ "OK\n")
 1 >  (princ ""))
mandel
> (mandel)
111111111111111111222222222333334568BC67443322222211111111111000000000000000000
11111111111111111122222222233344598C  77943333222221111111110000000000000000000
111111111111112222222233324444556       955433332211111111100000000000000000000
111111111211112222222333455665778       976554444222211111100000000000000000000
11111112222222233333334457 AB9              787B5432111111111100000000000000000
11112222222222333333444667                       532222111111111000000000000000
11111222333444444444555A                       96443322211111110000000000000000
12222223345D6657 6555679                        AA43322211111110000000000000000
222233334569  8C  E8789                          B43322111111110000000000000000
223333345578D        E                            43322211111111111100000000000
3344444789A                                      543322111111111111100000000000
5555658A                                       C6433222222111111111100000000000
                                              975443322221111111111100000000000
5555658A                                       C6433222222111111111100000000000
3344444789A                                      543322111111111111100000000000
223333345578D        E                            43322211111111111100000000000
222233334569  8C  E8789                          B43322111111110000000000000000
12222223345D6657 6555679                        AA43322211111110000000000000000
11111222333444444444555A                       96443322211111110000000000000000
11112222222222333333444667                       532222111111111000000000000000
11111112222222233333334457 AB9              787B5432111111111100000000000000000
111111111211112222222333455665778       976554444222211111100000000000000000000
111111111111112222222233324444556       955433332211111111100000000000000000000
11111111111111111122222222233344598C  77943333222221111111110000000000000000000
111111111111111111222222222333334568BC67443322222211111111111000000000000000000
OK
()
>

```

## オブジェクト指向の例

```lisp
; Fooクラスを定義
(setq Foo (Class 'new))

; インスタンス変数を定義
(Foo 'ivars '(x y))

; メソッドを定義
(Foo 'answer 'print '() 
  '((princ "Foo: x=") (princ x) (princ " y=") (princ y) (princ "\n")))

; インスタンスを作成
(setq obj (Foo 'new))

; メッセージを送信
(obj 'print)
```

## 参考資料

オリジナルドキュメント: [original/XLISP.DOC](original/XLISP.DOC)

## 歴史的背景

このXLISP ver1.1は、複数のプラットフォームで実装されました：
- PDP-11（RSX-11, RT-11, UNIX V7）
- VAX-11（VAX/VMS, Berkeley VAX/UNIX）
- **Z-80（CP/M-80）** ← このリポジトリ

小型コンピュータでのオブジェクト指向プログラミング実験の貴重な資産です。

## 謝辞

- **David Betz** - XLISP言語の設計と実装
- **HI-TECH C** - Z-80コンパイラ
- **CP/M-80 program EXEcutor for Win32** - CP/M環境のエミュレーション

このCP/M版は、オリジナルのソースコードから移植されました。

## ライセンス

The Unlicense

このリポジトリのソフトウェアは The Unlicense で提供されます。詳細は `LICENSE` ファイルをご確認ください。
