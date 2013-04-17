# language: ja

@1mg @listen_port
機能: Listenポートチェック

シナリオ: sendmailのポートチェック
もし sendmail は sourceが ローカルIP で tcp の 25 番ポートがLISTENしている

シナリオ: nginxのポートチェック
もし nginx は sourceが '0.0.0.0' で tcp の 80 番ポートがLISTENしている

シナリオ: sshのポートチェック
もし ssh は sourceが '0.0.0.0' で tcp の 22 番ポートがLISTENしている

シナリオ: mysql-serverのポートチェック
もし mysql-server は sourceが ローカルIP で tcp の 3306 番ポートがLISTENしている

シナリオ: nsdポートチェック
もし nsd は sourceが '0.0.0.0' で tcp の 53 番ポートがLISTENしている
かつ nsd は sourceが '0.0.0.0' で udp の 53 番ポートがLISTENしている
