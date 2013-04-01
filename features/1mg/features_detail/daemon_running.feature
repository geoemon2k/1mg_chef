# language: ja

@1mg
機能:各デーモンの起動確認 

シナリオ: crond が起動している
  前提: crond の exit_statusが 0 だ

シナリオ: iptables が起動している
  前提: iptables の exit_statusが 0 だ

シナリオ: mysqld が起動している
  前提: mysqld の exit_statusが 0 だ

シナリオ: nginx が起動している
  前提: nginx の exit_statusが 0 だ
シナリオ: nsd が起動している
  前提: nsd の exit_statusが 0 だ

シナリオ: php-fpm が起動している
  前提: php-fpm の exit_statusが 0 だ

シナリオ: sendmail が起動している
  前提: sendmail の exit_statusが 0 だ

シナリオ: sshd が起動している
  前提: sshd の exit_statusが 0 だ