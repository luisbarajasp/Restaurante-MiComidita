class Recipe 
  include Neo4j::ActiveNode
  property :name, type: String
  property :quantity, type: Float
  property :measure, type: String
  property :cost, type: Float

  # Relations
  has_many :out, :raws, type: :has_raw, unique: true  

end
