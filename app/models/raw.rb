class Raw 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp
  
  property :name, type: String
  property :type, type: Integer, default: 0
  property :quantity, type: Float, default: 0.0
  property :measure, type: String
  property :cost, type: Float, default: 0.0
  property :expired_at, type: DateTime



end
