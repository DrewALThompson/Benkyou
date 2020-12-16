# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DATA = {
    :user_keys =>
      ["name", "email", "password", "admin"],
    :users => [
        ["Jose", "Jose@email.com", "Josepassword", true],
        ["Mike", "Mike@email.com", "Mike", false],
        ["Rachel", "Rachel@email.com", "Rachel", false],
        ["怒龍", "douryuu@gmail.com",  "douryuupassword", true]
        ["トレバー", "trevor@gmail.com", "trevor", false]
    ],

    :project_keys =>
      ["title", "content", "user_id", "translation_id"]
    :projects => [
      ["丸の内サディスティック - 椎名林檎", "報酬は入社後並行線で
        東京は愛せど何も無い
        リッケン620頂戴
        19万も持って居ない 御茶の水
        マーシャルの匂いで 飛んじゃって大変さ
        毎晩絶頂に達して居るだけ
        ラット1つを商売道具にしているさ
        そしたらベンジーが 肺に映ってトリップ
        最近は銀座で警官ごっこ
        国境は越えても盛者必衰
        領収書を書いて頂戴
        税理士なんて就いて居ない 後楽園
        将来僧に成って結婚して欲しい
        毎晩寝具で遊戯するだけ
        ピザ屋の彼女になってみたい
        そしたらベンジー あたしをグレッチで殴って
        青 噛んで熟って頂戴
        終電で帰るってば 池袋
        マーシャルの匂いで 飛んじゃって大変さ
        毎晩絶頂に達して居るだけ
        ラット1つを商売道具にしているさ
        そしたらベンジーが 肺に映ってトリップ
        将来僧に成って結婚して欲しい
        毎晩寝具で遊戯するだけ
        ピザ屋の彼女になってみたい
        そしたらベンジー あたしをグレッチで殴って", 2, 2],

      ["失敗作 - ircle", "例えばあなたが思い描く昔通の日々を
        実現もできない私は失敗作かもしれません
        例えば自分より優れた誰かを見つけて、
        妬んで苦しい私は失敗作かもしれません
        
        例えば愛する人以外に心が揺らぐ
        瞬間があるような私は失敗作かもしれません
        例えばそれでも誠実のカケラを信じてほしくて、
        嘘をつくような私は失敗作かもしれません
        
        守れない約束がありました やりきれない思いを胸に
        果たせない事から逃げました 愛すべき日々からも全部
        
        夕焼けが全てを焼き尽くす
        朝焼けがあなたを呼び戻す
        「約束だよ」あなたが言った時
        「約束などできやしない」と言ってしまった
        
        それでもあなたは澄み渡る真冬の空の様
        モノクロの視界も色鮮やかに見せてくれた
        例えばあなたと巡り会えたこの私が
        失敗作なら私は失敗作で良かった
        
        守れない約束が減るようにやりきれない思いはポケットに
        果たせない事など無いのだと愛すべき日々にキスを
        
        夕焼けにあなたの幸せを
        願えば 染まらぬ心
        約束だよ こんな阿呆と
        二度とあなたは出会わぬように約束だよ
        
        私はやはり失敗作で今更素直になれんくて
        「二度と出会わぬように約束」なんで教勢を張った
        
        夕焼けに染まるその頬
        涙目に写るわたしに
        「嘘つきは変わらないみたいね
        約束などできやしないわ」と言った
        
        夕焼けが心を灸り出す
        いつまでも勝てないようで
        「約束などできやしない」と
        いう言葉を今度は信じてまた
        何度も 何度も 朝を 迎えるんでしょう", 1, 1],

      ["北風と太陽", "「おれの方ほうが強つよい。」
     「いいや、ぼくの方ほうが強つよい。」
      北風きたかぜと太陽たいようの声こえが聞きこえます。
      二人ふたりはどちらの力ちからが強つよいかでケンカをしているようです。
     「太陽たいようが毎日まいにち元げん気きだから、暑あつくてみんな困こまっているよ。
      おれが涼すずしい風かぜを吹ふくと、みんな嬉うれしそうだ。
      おれの方ほうがみんなの役やくに立たっているよ。」
     「でも、ぼくがいないと、木きや野や菜さいは育そだたないよ。
      冬ふゆは北風きたかぜの吹ふく風かぜが冷つめたくて、とても寒さむかった。
      みんな外そとに出でられなかったよね？最近さいきんは暖あたたかいから、みんな喜よろこんでいるよ。」
     「いいや、あそこを見みて。太陽たいようが強つよく照てらすから、川かわの水みずがもうすぐ無なくなりそうだ。
      水みずがないと、みんな生活せいかつできないよ。」", 3, 4],

      ["ジャックと豆まめの木", "むかしあるところに、ジャックという男おとこの子こがいました。
      ジャックはお母かあさんと一緒いっしょに小ちいさな家いえに住すんでいました。
      二人ふたりは牛うしのミルクを売うって生活せいかつしていましたが、あまりお金かねを持もっていません。
      ある日ひ、牛うしからミルクが出でなくなって、とうとう牛うしを売うることにしました。
     「必かならず高たかく売うってきて。」お母かあさんはジャックに言いいました。
     「もちろん。」ジャックはそう言いって、お店みせへ向むかいました。
      お店みせへの道みちの途と中ちゅうで、ジャックはふしぎなおじいさんに会あいました。
      おじいさんは言いいました。「おはよう、ジャック。
      どこに行いくの？」ジャックは、なんでぼくの名な前まえを知しっているの？と思おもいながら答こたえました。
     「この牛うしを売うりにお店みせへ行くんだよ。」", 3, 3]
    ],


    :translation_keys =>
      [:name, :content]
    :translations => [
      ["Shippaisaku - Ircle", "WIP"],
      ["Marunochi Sadistic - Sheena Ringo", "Business is success...WIP"],
      ["Jack and the Bean Stalk", "In a land long ago, There lived a boy named Jack"],
      ["The North Wind and the Sun", "WIP"]
    ]
}

def main 
  make_users
  make_projects
  make_translations
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_projects
  DATA[:projects].each do |project|
    new_project = Project.new
    project.each_with_index do |attribute, i|
      new_project.send(DATA[:project_keys][i]+"=", attribute)
    end
    new_project.save
  end
end

def make_translations
  DATA[:translation].each do translation|
    new_translation =translation.new
    translation.each_with_index do |attribute, i|
      new_translation.send(DATA[translation_keys][i]+"=", attribute)
    end
    new_translation.save
  end
end

main