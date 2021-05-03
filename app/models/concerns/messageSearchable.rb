module MessageSearchable
    extend ActiveSupport::Concern

    included do
        include Elasticsearch::Model

        # インデックスするフィールドの一覧
        INDEX_FIELDS = %w(title message).freeze

        # インデックス名
        index_name "es_message_#{Rails.env}"

        # マッピング情報
        settings do
            mapping dynamic: 'false' do # 動的にマッピングを生成しない
                indexes :title, analyzer: 'kuromoji', type: 'text'
                indexes :message, analyzer: 'kuromoji', type: 'text'
            end
        end

        # インデックスするデータを生成
        # @return [Hash]
        def as_indexed_json(option = {})
            self.as_json.select { |k, _| INDEX_FIELDS.include?(k) }
        end
    end

    module ClassMethods
        def create_index!(options={})
          client = __elasticsearch__.client
          client.indices.delete index: index_name rescue nil if options[:force]
          client.indices.create(index: index_name,
                                body: {
                                    settings: settings.to_hash,
                                    mappings: mappings.to_hash
                                })
        end
      end
end
