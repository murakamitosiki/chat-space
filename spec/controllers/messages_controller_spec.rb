require 'rails_helper'

describe MessagesController do
  let(:group) { create(:group) }#create(:group)を短縮形にして(:group)として以下で使う
  let(:user) { create(:user) } #create(:user) を短縮形にして(:user)として以下で使う

  describe '#index' do

    context 'ログインしている場合' do#28行目の反対番を書いている。同じ意味を二分化する時の記載(〜している場合、〜していない場合)に分ける
      before do          #下の文で下準備を行う。contextの間全部に反映
        login user#ログインしている
        get :index, params: { group_id: group.id }#group_idのカラムのなかにgroup.idと言うidを取得している。group.id の中は、四行目で createしたgroupが入っている。
      end
      #15行目から必要な処理を書いている。
      it '@messageに期待した値が入っていること' do
        expect(assigns(:message)).to be_a_new(Message)#messageはfactoriesで作られていないのでbe_a_newを使って新しくMessage作っている。作ったやつをmessageカラムに入れる
      end

      it '@groupに期待した値が入っていること' do
        expect(assigns(:group)).to eq group #右のgroupはfactoriesで作ったものがはいる
      end

      it 'index.html.haml に遷移すること' do
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      before do
        get :index, params: { group_id: group.id }#ログインしていない場合となっているあとは9行目と同じ
      end

      it 'ログイン画面にリダイレクトすること' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


  describe '#create' do
    let(:params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message) } }#attributes_formは今messageがfactoriseに作られていないからこの記述になる。

    context 'ログインしている場合' do
      before do
        login user
      end

      context '保存に成功した場合' do
        subject {
          post :create,#コントローラーのcreate
          params: params#左のparamsは上で作られたletの文の短縮形のテスト文
        }

        it 'messageを保存すること' do
          expect{ subject }.to change(Message, :count).by(1)# subjectは51行目のところで作られてる。 changeで何が追加されたか、byで何が何個追加されたかをかく。Messageがモデルでcountと言うカラムを作って.by(1)がはいる
        end

        it 'group_messages_pathへリダイレクトすること' do
          subject
          expect(response).to redirect_to(group_messages_path(group))
        end
      end

      context '保存に失敗した場合' do
        let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, content: nil, image: nil) } }

        subject {
          post :create,
          params: invalid_params #invalid_paramsは上で設定した失敗した時のparams
        }

        it 'messageを保存しないこと' do
          expect{ subject }.not_to change(Message, :count)#not_toでchangeしない事を書いている。Messageがモデルでcountが増えない(ずっと同じになる)と言う文になる
        end

        it 'index.html.hamlに遷移すること' do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context 'ログインしていない場合' do

      it 'new_user_session_pathにリダイレクトすること' do
        post :create, params: params#postの横がコントローラーのアクションとルーティングの記述でparams何を保存するか
        expect(response).to redirect_to(new_user_session_path)#ログインしていない時にメッセージを保存したらちゃんとログイン画面に飛ばすことができるか
      end
    end
  end
end

#postの横がコントローラーのアクションとルーティングの記述


