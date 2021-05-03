class Article < ActiveRecord::Base
    include Tire::Model::Search
    include Tire::Model::Callbacks

    after_save :index_update
    after_destroy :index_remove
  
    # elasticsearchのindex名を設定、環境に応じてindexを変更できるようにしておく
    index_name("#{Rails.env}-search-topics")

    settings do
        mapping do
            indexes :title, analyzer: :kuromoji
            indexes :body, analyzer: :kuromoji
        end 
    end 
  
    def self.search(params)
        tire.search(load: true) do
        query {
          string "body:#{params[:search]} title:#{params[:search]}"
        } if params[:search].present?
      end
    end
end