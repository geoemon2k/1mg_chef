# language: ja

@sendmail @1mg
機能: sendmail のセットアップ
  sourceは 127.0.0.1 で port番号は 25 でLISTEN

シナリオ: IPアドレスが127.0.0.1で、ポート25番でLISTENする
  前提: netstatコマンドで 127.0.0.1 でポートが 25 でLISTENしている
