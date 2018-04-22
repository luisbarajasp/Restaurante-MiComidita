class Raw
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp

  property :name, type: String
  enum type: [:fresh, :meat, :dairy, :frozen, :cereal, :miscellaneous, :others]
  property :measure, type: String
  property :cost, type: Float, default: 0.0

  # Relations
  has_many :in, :raw_inventories, origin: :raw
  
  # Nested raw_inventories
  include ActiveModel::Model
  # attr_accessor :raw_inventories
  def raw_inventories_attributes=(attributes)
    @raw_inventories ||= []
    attributes.each do |i, inventory_params|
      inventory = RawInventory.create(inventory_params)
      self.raw_inventories << inventory
    end
  end

end
