# Ruby メソッドまとめ

## 1. Rubyのメソッドの基礎

Rubyのメソッドは、**特定の処理をひとまとめにして名前を付けたもの**です。

---

## 基本的な定義と呼び出し

```ruby
def greet(name)
  "こんにちは、#{name}さん！"
end

puts greet("Hotaka")
# => こんにちは、Hotakaさん！
```

---

## 重要なルール

### 戻り値

Rubyでは、**最後に評価された式**が自動的に戻り値になります。

そのため、`return` を省略することが多いです。

```ruby
def add(a, b)
  a + b
end

puts add(3, 5)
# => 8
```

---

### 括弧 `()` の省略

Rubyでは、メソッド呼び出し時の `()` を省略できます。

```ruby
puts "Hello"
```

もちろん以下でもOKです。

```ruby
puts("Hello")
```

---

# 2. Ruby特有の特徴

---

## ① `?` メソッド

`?` が付くメソッドは、**true / false を返す**という慣習があります。

### 例

```ruby
"ruby".empty?
# => false

[1, 2, 3].include?(2)
# => true
```

---

## ② `!` メソッド（破壊的メソッド）

`!` が付くメソッドは、

- 元データを書き換える
- 注意が必要

という意味を持つことが多いです。

---

## String の例

### `!` なし（非破壊的）

```ruby
name = "ruby"

puts name.upcase
# => "RUBY"

puts name
# => "ruby"
```

元の値は変わりません。

---

### `!` あり（破壊的）

```ruby
name = "ruby"

puts name.upcase!
# => "RUBY"

puts name
# => "RUBY"
```

元のデータ自体が変更されます。

---

## 配列でよく使う破壊的メソッド

| メソッド | 内容 |
|---|---|
| `uniq!` | 重複を削除 |
| `compact!` | `nil` を削除 |
| `sort!` | 並び替え |
| `shuffle!` | ランダムに並び替え |

---

### 例

```ruby
list = [1, 2, nil, 2, 3]

list.uniq!
list.compact!

p list
# => [1, 2, 3]
```

---

## Railsでの `!`

Ruby on Rails では、

- `save`
- `save!`

のように使われます。

---

### `save`

失敗時に `false` を返す。

```ruby
user.save
```

---

### `save!`

失敗時にエラーを発生させる。

```ruby
user.save!
```

---

## 実装Tips：`!` はいつ使う？

### 基本

まずは **`!` なし** を使うのがおすすめです。

理由：

- バグを防ぎやすい
- 元データを保持できる

---

### 使い分け

| 種類 | 特徴 |
|---|---|
| `!` なし | 安全・非破壊 |
| `!` あり | 高速・メモリ節約・元データ更新 |

---

# 3. キーワード引数

引数を名前付きで渡せます。

順番を気にしなくてよいのが特徴です。

```ruby
def create_user(name:, age:)
  puts "Name: #{name}, Age: #{age}"
end

create_user(age: 22, name: "Hotaka")
```

---

# 4. 実装で使えるTips

---

## Tips 1：早期リターン（Guard Clause）

ネストを浅くして読みやすくします。

```ruby
def deposit(amount)
  return "金額が正しくありません" if amount <= 0

  "入金完了"
end
```

---

## Tips 2：デフォルト引数

引数が渡されなかった場合の初期値。

```ruby
def introduce(name = "名無しさん")
  "私は#{name}です"
end

puts introduce
# => 私は名無しさんです
```

---

## Tips 3：ぼっち演算子 `&.`

`nil` の場合にエラーを防げます。

```ruby
user&.name
```

通常：

```ruby
user.name
```

`user` が `nil` だとエラーになります。

---

# 5. 演習問題（5問）

---

## 第1問：基本のメソッド

### 問題

数値 `n` を引数に受け取り、その数値を2倍にして返す `double(n)` メソッドを作成してください。

---

## 第2問：真偽値を返すメソッド（`?`）

### 問題

数値を受け取り、その数値が100より大きければ `true`、そうでなければ `false` を返す `big?(n)` メソッドを作成してください。

---

## 第3問：キーワード引数とデフォルト値

### 問題

`first_name` と `last_name` をキーワード引数で受け取り、姓名を結合したフルネームを返す `full_name` メソッドを作成してください。

条件：

- `last_name` のデフォルト値は `""`
- キーワード引数を使うこと

---

## 第4問：配列を扱うメソッド

### 問題

数値の配列を受け取り、その中の奇数だけを合計して返す `sum_odd(numbers)` メソッドを作成してください。

---

### ヒント

- `each`
- `odd?`

を組み合わせてみましょう。

---

## 第5問：クラス内でのメソッド利用

### 問題

`Car` クラスを作成してください。

### 条件

- `@distance` を `0` で初期化
- `drive(km)` メソッドを作成
- `km` 分だけ走行距離を増やす

---

## イメージ

```ruby
car = Car.new

car.drive(10)
car.drive(5)

# 合計 15km
```

# Ruby クラスの基礎と実践演習

# 1. クラスの基礎知識と特徴

Rubyは **「すべてがオブジェクト」** という設計思想を持っています。

数値・文字列・クラス自体もオブジェクトです。

---

## ① すべてがオブジェクト

```ruby
# 数値や文字列もクラスを持つ
puts "hello".class
# => String

puts 1.class
# => Integer

# クラス自体もオブジェクト
puts String.class
# => Class
```

---

## ② initialize メソッド

`initialize` は、`Class.new` が呼ばれた時に自動実行される特別なメソッドです。

```ruby
class User
  def initialize(name)
    @name = name
  end
end

user = User.new("Hotaka")
```

---

## ③ インスタンス変数（@variable）

インスタンスごとに異なる値を保持する変数です。

```ruby
class User
  def initialize(name)
    @name = name
  end

  def show_name
    puts @name
  end
end

user1 = User.new("Hotaka")
user2 = User.new("Arai")

user1.show_name
# => Hotaka

user2.show_name
# => Arai
```

---

# 2. 実装で役立つTips

---

## Tips 1：attr_accessor

ゲッター・セッターを自動生成できます。

---

## 通常の書き方

```ruby
class User
  def name
    @name
  end

  def name=(value)
    @name = value
  end
end
```
---

## クラス継承

継承を行うには、クラス定義の際に `<` 記号を使います。
```ruby
# 親クラス（スーパークラス）
class Animal
  def eat
    puts "食事中です..."
  end
end

# 子クラス（サブクラス）: Animalを継承
class Cat < Animal
  def meow
    puts "ニャー！"
  end
end

cat = Cat.new
cat.eat   # => 親クラスのメソッドが使える
cat.meow  # => 子クラス独自のメソッド
```
---

## attr_accessor を使う

```ruby
class User
  attr_accessor :name
end

user = User.new

user.name = "arai"

puts user.name
# => arai
```

---

## attr_reader / attr_writer

| メソッド | 内容 |
|---|---|
| attr_reader | 読み取り専用 |
| attr_writer | 書き込み専用 |
| attr_accessor | 読み書き両方 |

---

# Tips 2：self

セッターを呼ぶ時は `self.` が必要です。

```ruby
class User
  attr_accessor :name

  def update_name(new_name)
    self.name = new_name
  end
end
```

---

## self が必要な理由

```ruby
name = new_name
```

と書くと、

- インスタンス変数更新
ではなく

- ローカル変数定義

として解釈されてしまいます。

---

# Tips 3：クラスメソッドとクラス変数

---

## クラス変数 `@@`

すべてのインスタンスで共有されます。

```ruby
class Robot
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.total_count
    @@count
  end
end

Robot.new
Robot.new

puts Robot.total_count
# => 2
```

---

## クラスメソッド

```ruby
class User
  def initialize(name)
    @name = name
  end

  # クラスメソッド
  def self.info
    "これはユーザーを管理するためのクラスです"
  end
end

# 呼び出し（newしなくて良い）
puts User.info
```

**なぜ self と書くのか？**

クラス定義の中での self は、そのクラス自身（この場合は User クラス）を指します。そのため、「Userクラスにメソッドを覚えさせる」という意味になります。

**インスタンスメソッドとの決定的な違い**

|**比較項目**|**インスタンスメソッド**|**クラスメソッド**|
|---|---|---|
|レシーバ|user = User.new（個体）|User（クラスそのもの）|
|呼び出し方|user.greet|User.all_count|
|扱えるデータ|@name などの個別のデータ|@@count などのクラス全体データ|
|役割|個体の「振る舞い」|その種別に関する「共通処理|

#### クラスメソッドの使用場面3選
1. **インスタンスの生成を補助する（ファクトリメソッド）**
    特定の条件に基づいたオブジェクトを簡単に作りたい場合です。
    ```ruby
    class User
    def initialize(role)
        @role = role
    end

    # 管理者ユーザーをサクッと作るためのクラスメソッド
    def self.create_admin
        User.new(:admin)
    end
    end

    admin = User.create_admin
    ```
2. **クラス全体の集計や管理**
    すべてのインスタンスに共通する情報を扱う場合です
    ```ruby
    class Robot
    @@robot_count = 0

    def initialize
        @@robot_count += 1
    end

    # 現在、世界に何台ロボットがいるか教える
    def self.total_stats
        "現在は #{@@robot_count} 台のロボットが稼働中です"
    end
    end
    ```
3. **個別のデータに依存しない「便利機能（ユーティリティ）」**
引数を受け取って計算して返すだけのような、状態を持たない処理です。
    ```ruby
    class Calculator
    # インスタンスを作る必要がない
    def self.add(a, b)
        a + b
    end
    end

    puts Calculator.add(10, 20)
    ```

#### クラスメソッドの実装におけるTips
**Tips: インスタンスメソッドからクラスメソッドを呼ぶ**

インスタンスメソッドの中から「自分たちのクラスのメソッド」を呼びたい場合は、`self.class.メソッド名` と書きます。
```ruby
class Game
  def self.version
    "v1.0.2"
  end

  def show_version
    # self.class は Gameクラスを指す
    puts "このゲームのバージョンは #{self.class.version} です"
  end
end
```

---

# 3. クラス演習問題（Level 5）

---

# 第1問：クラスの基本構造

## 問題

`Dog` クラスを作成してください。

### 条件

- `initialize` で名前を受け取る
- `@name` に保存
- `bark` メソッドで「〇〇: ワンワン！」を出力

---

## 解答欄

```ruby
class Dog
  # ここにコードを記述
end
```

---

# 第2問：アクセサメソッド

## 問題

`Laptop` クラスを作成してください。

### 条件

- `brand` は読み取り専用
- `price` は読み書き可能
- `initialize` で値を設定

---

## 解答欄

```ruby
class Laptop
  # ここにコードを記述
end
```

---

# 第3問：クラスメソッド

## 問題

`Calculator.add(a, b)` で合計を返すメソッドを作成してください。

---

## 解答欄

```ruby
class Calculator
  # ここにコードを記述
end
```

---

# 第4問：インスタンス変数の更新

## 問題

`Player` クラスを作成してください。

### 条件

- HPを100で初期化
- `damage(amount)` でHPを減少
- `current_hp` で現在HPを表示

---

## 解答欄

```ruby
class Player
  # ここにコードを記述
end
```

---

# 第5問：クラス継承

## 問題

`Animal` クラスを継承した `Cat` クラスを作成してください。

### 条件

- `Animal#eat`
  - 「食事中...」を表示
- `Cat#eat`
  - `super`
  - 「ニャー！」を表示

---

## 解答欄

```ruby
class Animal
  def eat
    puts "食事中..."
  end
end

class Cat < Animal
  # ここにコードを記述
end
```

# 6. クラスメソッドの理解度チェック問題
理解を深めるために、以下のコードを書いてみてください。

問題
```markdown
1. Article（記事）クラスを作成してください。

2. インスタンス変数 @title を持ち、initialize で設定できるようにする。

3. クラス変数 @@articles（配列）を持ち、新しく記事が作られるたびに @title をその配列に追加していく。

4. クラスメソッド self.all_titles を作成し、これまでに作成された全記事のタイトル一覧を返すようにする。
```
---

# 4. 追加Tips（実務でかなり重要）

---

## self & @ で値を更新するときの違い
`self.○○ =` : 変数の窓口（attr_○○）の一度参照する <-頑健なコード
`@○○`：変数の窓口を参照しない

```ruby
class Laptop
  attr_reader :price # 読み取りは公開

  # 独自の「書き込み窓口」を定義する
  def price=(new_price)
    if new_price < 0
      puts "エラー：価格にマイナスは設定できません！"
    else
      @price = new_price # 正しい値のときだけ箱に入れる
    end
  end

  def update_price_smart(value)
    # 💥 self. を使うパターン
    # 「窓口」を通すので、マイナス値のチェックが走る
    self.price = value 
  end

  def update_price_force(value)
    # 💥 @変数 を使うパターン
    # 「箱」に直接入れるので、チェックを無視して書き換わってしまう
    @price = value
  end
end

laptop = Laptop.new
laptop.update_price_smart(-500) # => エラーが表示され、更新されない
laptop.update_price_force(-500) # => チェックを通らず、-500になってしまう！
```

---

## private

外部から呼ばれたくないメソッドを隠せます。

```ruby
class User
  def show
    secret
  end

  private <----- この以降のメソッドは外部から呼び出すことができない

  def secret
    puts "秘密"
  end
end
```

---

## to_s

オブジェクトを文字列化する時に使われます。

```ruby
class User
  def initialize(name)
    @name = name
  end

  def to_s
    "User: #{@name}"
  end
end

user = User.new("Hotaka")

puts user
# => User: Hotaka
```

---


# 継承図イメージ

```text
Object
 ├── String
 ├── Array
 ├── Hash
 └── Animal
      └── Cat
```

---

# Rubyのオブジェクト指向で大事な考え方

| 概念 | 内容 |
|---|---|
| クラス | 設計図 |
| インスタンス | 実体 |
| initialize | 初期化 |
| @変数 | 個体ごとの状態 |
| メソッド | 振る舞い |
| 継承 | 機能を引き継ぐ |
| self | 自分自身 |
| attr_accessor | getter/setter自動生成 |
