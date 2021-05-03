class Topic < ActiveRecord::Base
    # tireモジュール読み込み
    include Tire::Model::Search
  
    after_save :index_update
    after_destroy :index_remove
  
    # elasticsearchのindex名を設定、環境に応じてindexを変更できるようにしておく
    index_name("#{Rails.env}-search-topics")
  
    # idとtitleとbodyをマッピング対象に設定
    mapping do
      indexes :id
      indexes :title, analyzer: :kuromoji # kuromoji日本語形態素解析器を使用する
      indexes :body, analyzer: :kuromoji # kuromoji日本語形態素解析器を使用する
    end
  
    # save後にindexを更新
    def index_update
      self.index.store self
    end
  
    # destroy後にindexから削除
    def index_remove
      self.index.remove self
    end
  
    # 検索
    def self.search(params)
      tire.search(load: true, :page => params[:page], per_page: params[:limit]) do
        # titleとbodyから複合検索
        query {
          boolean do
            should { string 'title:' + params[:keyword].gsub('!', '\!').gsub('"', '\\"'), default_operator: "AND" }
            should { string 'body:' + params[:keyword].gsub('!', '\!').gsub('"', '\\"'), default_operator: "AND" }
          end
        } if params[:keyword].present?
        sort do
          by params[:order], 'desc'
        end
      end
    end
end