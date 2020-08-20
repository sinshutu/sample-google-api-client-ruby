# Googleカレンダー操作API - 勉強会用サンプル

## setup
1. https://console.developers.google.com/apis/credentials?project=sampleapicalender でOAuth2.0クライアントIDを作成する
1. プロジェクトの直下に`client_secret.json`を設置する
1. `bundle install`
1. `bundle exec ruby init_token.rb`
1. `bundle exec ruby main.rb`

## todo
* 削除・編集ができるようにする
* Calendarモジュールのスコープが雑なのでうまくまとめてみる

## 参考情報
* https://developers.google.com/calendar/auth
* https://developers.google.com/calendar/quickstart/ruby#step_1_turn_on_the
* https://github.com/googleapis/google-api-ruby-client/blob/master/samples/cli/lib/samples/calendar.rb
