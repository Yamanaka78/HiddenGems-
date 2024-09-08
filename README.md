## ■サービス概要
このサービスは、観光地の口コミ投稿とオリジナル旅行プランの作成・共有を通じて、ユーザー同士が観光情報を交換するプラットフォームです。ユーザーは自身が訪れた観光スポットを紹介し、他のユーザーがそのスポットに対する口コミや評価を投稿することができます。また、ユーザーは行きたいスポットをリストに追加し、自分だけのオリジナル旅行プランを作成・共有できます。旅行後には写真や動画をアップロードして、思い出をまとめたオリジナルアルバムを作成することができます。

## ■ このサービスへの思い・作りたい理由
このサービスを思いついたきっかけは、自分自身が旅行を計画するときに感じた「もっと個人的な視点からおすすめされた観光スポットが知りたい」というニーズです。一般的な観光地ではなく、地元の人がよく知っている隠れたスポットや、他の観光客が見逃しがちな場所を訪れたいという思いが強くありました。また、旅行の計画やルートを立てるのが手間に感じることが多く、もっと簡単に効率よくプランニングできればと思っていました。さらに、旅行後に思い出を振り返る際、写真や動画をまとめたアルバムが簡単に作成できれば、より充実感のある旅行体験ができると考えました。このサービスを通じて、他の旅行者にもそのような体験を提供したいと思い、開発を決意しました。

## ■ ユーザー層について
1. 若いカップルや友達同士
旅行の計画や思い出を共有することに興味がある層で、特にSNSや写真共有アプリを多用する世代です。

2. ソロトラベラー
一人旅を楽しむ人々で、他の旅行者の口コミを参考にしながら自分のペースで旅を楽しむ層です。

3. ファミリー層
家族旅行を計画する際、子供連れでも楽しめるスポットや、家族全員で思い出を残すためのツールとして利用できる層です。

多様なユーザー層を対象にすることで、幅広い利用シーンをカバーし、サービスの利用頻度を高めることができると考えました。

## ■サービスの利用イメージ
#### 旅行先紹介側
ユーザーは、自分が実際に訪れて紹介したい観光地やスポットを登録でる。地元の人しか知らないような隠れたスポットを紹介したり、オリジナルのモデルコースを作成して他のユーザーにお薦めすることも可能です。

#### 旅行先探して旅行したり口コミしたりする側
ユーザーは、サービス上で観光スポットを検索し、行きたい場所をリストに追加します。他のユーザーの口コミや評価を参考にしながら旅行プランを作成し、旅行後は撮影した写真や動画をアップロードしてオリジナルアルバムを作成します。これにより、旅行の計画から思い出の整理まで、トータルで充実した旅行体験を得ることができます。

## ■ ユーザーの獲得について
1. SNSを活用したプロモーション
特にInstagramやTwitterなどのSNSを通じて、ターゲット層にサービスをアピールします。旅行中の写真や動画の共有機能を強調し、若い世代を惹きつけます。

2. noteやQiitaなどで使い方や開発秘話についての記事を作成
ターゲット層に向けて、サービスの使い方や開発の裏話、開発中に得た知見などをnoteやQiitaにて記事化します。これにより、サービスの認知度を高めるとともに、開発に興味を持つユーザー層にもアプローチします。また、開発者の視点から書かれた記事は信頼性を高め、サービスの価値や背景にあるストーリーを伝えることで、共感を得やすくなります。記事内では、具体的な機能の活用方法や、サービスが目指すビジョンを紹介し、読者にとって有益な情報を提供することを目指します。

3. SEO対策
「隠れた観光スポット」や「オリジナル旅行プラン」といったキーワードでの検索結果の上位表示を目指し、自然検索流入を促進します。

## ■ サービスの差別化ポイント・推しポイント
差別化ポイント
他の観光地口コミサービスと異なり、このサービスは特に「隠れた観光スポット」にフォーカスしています。また、旅行後の思い出をまとめるアルバム作成機能を提供することで、旅行の準備から思い出の振り返りまで、一貫してユーザー体験をサポートします。

推しポイント
オリジナルの旅行プランを簡単に作成できることと、旅行後にそのプランを元にした思い出アルバムを自動で作成できる点が独自性として挙げられます。この機能により、ユーザーは自分だけの特別な旅行をデザインし、それを永続的に楽しむことができます。

## ■ 機能候補

MVPリリース時に作っておきたいもの

基本的なCRUD機能（スポットの登録・編集・削除）
口コミと評価の投稿機能
旅行プラン作成機能
アルバム作成機能（簡易版）

本リリースまでに作っておきたいもの

SNS連携機能
詳細なフィルタリング・検索機能
地図表示機能
プッシュ通知機能（行きたいスポットの新情報通知）

## ■ 機能の実装方針予定
SNS連携機能
OAuthを利用して、ユーザーが簡単にSNSアカウントでログイン・共有できるようにします。また、SNSに投稿する際のテンプレートを提供し、サービスのプロモーションにつなげます。

地図表示機能
Google Maps APIを活用して、ユーザーが選択したスポットを地図上で可視化し、ルートを提案する機能を実装します。

アルバム作成機能
ユーザーがアップロードした写真や動画を自動的に整理し、テーマに沿ったレイアウトでアルバムを生成するツールを組み込みます。

## ■ その他の内容
ユーザー同士のコミュニティ機能を追加することで、旅行の計画段階から他の旅行者と意見交換ができるようにします。また、ゲーム化要素を導入し、特定のスポットを訪れた際にバッジやポイントを獲得できる仕組みを検討しています。これにより、ユーザーのアクティブ率を向上させることが期待できます。


### 画面遷移図
https://www.figma.com/design/H4SSGqlIDGQPycjxiQUUdq/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0-1&node-type=CANVAS&t=xcqWseeimxyLckiB-0

### ER図

https://www.figma.com/design/Gbf8ASjNrYjn4OvQOF51VD/ER%E5%9B%B3?node-id=0-1&node-type=CANVAS&t=rJtK6WDej0g7f79s-0
