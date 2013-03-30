# language: ja

@sendmail @1mg
機能: sendmail のセットアップ
  sendmail のインストール
  source 127.0.0.1 で LISTEN
  port 25 で LISTEN

シナリオ: sendmailをインストールする
  前提: rpmコマンドで sendmail が取得できる

シナリオ: sendmail を起動する
  前提: serviceコマンドで status が running だ

シナリオ: IPアドレスが127.0.0.1で、ポート25番でLISTENする
  前提: netstatコマンドで 127.0.0.1 でポートが 25 でLISTENしている
