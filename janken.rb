# 変数
$janken_result = "start" #じゃんけん処理の結果を格納
$acchimuite_hoi_result = "start" #あっち向いてホイ処理の結果を格納
next_game = true #falseになるまでじゃんけん処理続行
game_continue = true #falseになるまでゲーム(じゃんけん＆あっち向いてホイ)続行

# じゃんけん処理
def janken
    puts "じゃんけん..."
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"

    player_hand = gets.to_i
    com_hand = rand(3)
    hand_type = ["グー","チョキ","パー"]

    # 予期しない値が入力された時
    if player_hand < 0 || player_hand > 3
        puts "正しい値を入力してください"
        puts "ゲームを終了します"
        return false
    # 3(戦わない)が入力された時
    elsif player_hand == 3
        puts "ゲームを終了します"
        return false
    end

    puts "ホイ！"
    puts "---------------"

    puts "あなた：#{hand_type[player_hand]}を出しました"
    puts "相手：#{hand_type[com_hand]}を出しました"
    puts "---------------"

    # じゃんけんの結果を判定する
    # プレイヤーが勝利した時
    if player_hand == 0 && com_hand == 1 ||
        player_hand == 1 && com_hand == 2 ||
        player_hand == 2 && com_hand == 0
        $janken_result = "win"
        return false
    # あいこの時
    elsif (player_hand == com_hand)
        puts "あいこで..."
        return true
    # プレイヤーが負けた時
    else
        $janken_result = "lose"
        return false
    end
end

# あっち向いてホイ処理
def acchimuite_hoi
    puts "あっち向いて〜"
    puts "0(上)1(下)2(左)3(右)"

    player_head = gets.to_i
    com_head = rand(4)
    head_type = ["上","下","左","右"]

    # 予期しない値が入力された時
    if player_head < 0 || player_head > 4
        puts "正しい値を入力してください"
        puts "ゲームを終了します"
        return
    end

    puts "ホイ！"
    puts "---------------"

    puts "あなた：#{head_type[player_head]}"
    puts "相手：#{head_type[com_head]}"
    puts "---------------"

    # あっち向いてホイの結果を判定する
    # プレイヤーとコンピュータの向きが同じ場合
    if player_head == com_head
        $acchimuite_hoi_result = "same"
    # プレイヤーとコンピュータの向きが異なる場合
    else
        $acchimuite_hoi_result = "different"
    end
end

# ゲームスタート
while game_continue
    # じゃんけん処理を実行
    while next_game
        next_game = janken
    end
        # 予期しない値が入力されたor戦わないが選択された場合はゲームを終了
        if $janken_result == "start"
            exit
        end

    # あっち向いてホイ処理を実行
    acchimuite_hoi
        # 予期しない値が入力された場合はゲームを終了
        if $acchimuite_hoi_result == "start"
            exit
        end
        # 勝敗がつかなかった時はじゃんけん処理に戻る
        if $acchimuite_hoi_result == "different"
            next_game = true
            $janken_result = "start"
            $acchimuite_hoi_result = "start"
        end

    # じゃんけん＆あっち向いてホイでプレイヤーが勝利
    if $janken_result == "win" && $acchimuite_hoi_result == "same"
        puts "あなたの勝ちです"
        game_continue = false
    # じゃんけん＆あっち向いてホイでコンピュータが勝利
    elsif $janken_result == "lose" && $acchimuite_hoi_result == "same"
        puts "あなたの負けです"
        game_continue = false
    end

end