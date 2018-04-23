class Raw
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp
  include Neo4j::ActiveBase # Get a new Query object

  property :name, type: String
  enum type: [:fresh, :meat, :dairy, :frozen, :cereal, :miscellaneous, :others]
  property :measure, type: String
  property :cost, type: Float, default: 0.0

  # Relations
  has_many :in, :raw_inventories, origin: :raw
  has_many :in, :expired_inventories, origin: :raw_expired, model_class: :RawInventory
  has_many :in, :recipe_materials, origin: :raw
  

  # Returns RawInventories
  def good_inventories 
    self.raw_inventories(:r).where("r.expired = false OR r.expired IS NULL")
  end

  # Returns relations to RawInventories
  # def good_inventories 
  #   self.raw_inventories(:r, :rel).where("r.expired = false OR r.expired IS NULL").pluck(:rel)   
  # end
  
  # Nested raw_inventories
  # include ActiveModel::Model
  # attr_accessor :raw_inventories
  def raw_inventories_attributes=(attributes)
    @raw_inventories ||= []
    attributes.each do |i, inventory_params|
      if inventory_params["_destroy"] == '1'
        # Delete record
        RawInventory.find(inventory_params["id"]).destroy
      else
        inventory_params.delete "_destroy" 
        puts inventory_params
        if inventory_params["id"].nil?
          # New record
          inventory_params.delete "id"  
          inventory = RawInventory.create(inventory_params)
          self.raw_inventories << inventory
        else
          # Update record
          RawInventory.find(inventory_params["id"]).update(inventory_params)
        end
      end
    end
  end

end
