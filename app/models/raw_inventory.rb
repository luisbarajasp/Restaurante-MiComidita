class RawInventory 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp
  include Neo4j::ActiveBase # Get a new Query object

  before_save :check_expiring

  property :quantity, type: Float
  property :expired_at, type: Date
  property :expired, type: Boolean, default: false

  # Relations
  has_one :out, :raw, type: :raw
  has_one :out, :raw_expired, type: :raw_expired, model_class: :Raw, unique: true
  has_many :out, :receipt_materials, origin: :raw_inventories

  def check_expiring
    if self.expired_at < Date.today
      self.expired = true
      self.raw.expired_inventories << self
      self.query_as(:r).match("(r)-[rel: raw]->(ra: Raw)").delete(:rel).first
    end
  end
end
