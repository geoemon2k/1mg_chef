# language: ja

@default @1mg
機能: サーバの基本設定とユーザ設定を行う
  uehata ユーザを作成して ssh-key 認証でログイン許可
  ホスト名が server.1mg.org
  /etc/aliases の root のメールアドレスが keiji.ue@gmail.comだ

シナリオ: uehata ユーザが存在する
  前提: uehata ユーザが存在する
  ならば: homedirは /home/uehata だ
  かつ: /home/uehata/.ssh/authorized_keys が設置されている

シナリオ: ホスト名が server.1mg.org
  前提: ホスト名が server.1mg.org

シナリオ: /etc/aliases の root のメールアドレスが keiji.ue@gmail.comだ
  前提: /etc/aliases の root のメールアドレスが keiji.ue@gmail.comだ
