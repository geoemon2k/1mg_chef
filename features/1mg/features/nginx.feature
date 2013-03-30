# language: ja

@nginx @1mg
機能: nginxのセットアップ
  nginxをインストールする
  コンフィグファイルを設置する

  シナリオ: yumからnginxをインストールした
    前提: rpm コマンドで nginx が取得できる

  シナリオ: service コマンドで nginx を起動させる
    前提: service コマンド nginx の状態が running だ
