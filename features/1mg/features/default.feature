# language: ja

@default @1mg
機能: サーバの基本設定とユーザ設定を行う
  uehata ユーザを作成して ssh-key 認証でログイン許可
  root ユーザにパスワードを設定する
  hostname を server.1mg.org にする
  aliase の root のメールアドレスを keiji.ue@gmail.com に変更する

シナリオ: uehata ユーザを作成する
  前提: uehata ユーザが存在する
    ならば: homedirは /home/uehata だ
    かつ: /home/uehata/.ssh/authorized_keys が設置されている

シナリオ: test
  前提: test ユーザが存在する
