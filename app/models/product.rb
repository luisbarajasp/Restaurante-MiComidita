class Product 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp

  property :expired_at, type: Date

  before_validation :validates_inventories

  # Relations
  has_one :out, :recipe, type: :has_recipe
  has_many :out, :raw_inventories, type: :has_inventory

  def validates_inventories
    self.recipe.recipe_materials.each do |material|
      remaining = material.quantity
      material.raw.inventories_asc.each do |inventory|
        left = inventory.quantity_left - remaining
        if left > -1 
          self.raw_inventories << inventory
          inventory.update quantity_left: left
          remaining = 0
          break
        else 
          self.raw_inventories << inventory
          inventory.update quantity_left: 0
          remaining = -left
        end
      end
      if remaining > 0
        errors.add(:recipe, ": has no enough materials")
      end
    end
  end
end
