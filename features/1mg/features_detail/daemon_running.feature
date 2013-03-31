# language: ja

@1mg
機能:各デーモンの起動確認 

シナリオ: crond が起動している
  前提: crond の status が running だ

シナリオ: iptables が起動している
  前提: iptables の status が running だ

シナリオ: mysqld が起動している
  前提: mysqld の status が running だ

シナリオ: nginx が起動している
  前提: nginx の status が running だ

シナリオ: nsd が起動している
  前提: nsd の status が running だ

シナリオ: php-fpm が起動している
  前提: php-fpm の status が running だ

シナリオ: sendmail が起動している
  前提: sendmail の status が running だ

シナリオ: sshd が起動している
  前提: sshd の status が running だ
  