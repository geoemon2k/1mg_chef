# language :ja

機能: WEBアクセス

シナリオ: www.1mg.orgへHTTPリクエスト
    前提: Hostヘッダ に "www.1mg.org" をつけてHTTPでグローバルIPにリクエストする
    ならば: レスポンスステータスが 200 だ
    かつ: コンテンツに www.1mg.org が含まれる

シナリオ: server.1mg.orgへHTTPリクエスト
    前提: Hostヘッダ に "server.1mg.org" をつけてHTTPでグローバルIPにリクエストする
    ならば: レスポンスステータスが 200 だ
    かつ: コンテンツに server.1mg.org が含まれる
    