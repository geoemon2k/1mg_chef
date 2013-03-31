# language: ja

@1mg
機能:各デーモンの起動確認 

シナリオ: crond が起動している
  前提: crond の statusが running だ

シナリオ: iptables が起動している
  前提: iptables の statusが running だ

シナリオ: mysqld が起動している
  前提: mysqld の statusが running だ

シナリオ: nginx が起動している
  前提: nginx の statusが running だ

シナリオ: nsd が起動している
  前提: nsd の statusが running だ

シナリオ: php-fpm が起動している
  前提: php-fpm の statusが running だ

シナリオ: sendmail が起動している
  前提: sendmail の statusが running だ

シナリオ: sshd が起動している
  前提: sshd の statusが running だ
  