class Product 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp

  property :expired_at, type: DateTime

  # Relations
  has_one :out, :receipt, type: :receipt
end
