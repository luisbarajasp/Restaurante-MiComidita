class RawInventory 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp

  property :quantity, type: Float
  property :expired_at, type: DateTime

  # Relations
  has_one :out, :raw, type: :raw
  has_many :in, :receipt_materials, origin: :raw_inventories
end
