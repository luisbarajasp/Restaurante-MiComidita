class Receipt 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp

  property :name, type: String
  property :cost, type: Float
  property :quantity, type: Float
  property :measure, type: String

  # Relations
  has_many :in, :receipt_materials, origin: :receipt
  has_many :in, :product, origin: :receipt
  

end
