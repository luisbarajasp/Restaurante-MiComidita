class ReceiptMaterial 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp

  property :quantity, type: Float

  # Relations
  has_one :out, :receipt, type: :receipt
  has_many :out, :raw_inventory, type: :inventory

end
