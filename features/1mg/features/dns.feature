# language: ja

@dns
機能: 権威DNS

シナリオ: 権威DNS機能確認(1mg.org)
もし: 権威DNS グローバルIPアドレスへ 1mg.org の SOA レコードを問い合わせる
ならば: status が NOERROR で SOA レコードにシリアルが含まれている

シナリオ: 権威DNS機能確認(1mg.biz)
もし: 権威DNS グローバルIPアドレスへ 1mg.biz の SOA レコードを問い合わせる
ならば: status が NOERROR で SOA レコードにシリアルが含まれている

シナリオ: キャッシュDNS機能OFF確認
もし: キャッシュDNS グローバルIPアドレスへ yahoo.co.jp の SOA レコードを問い合わせる
ならば: statusが NOERROR ではない
