class Recipe 
  include Neo4j::ActiveNode
  property :name, type: String
  property :quantity, type: Float
  property :measure, type: String
  property :cost, type: Float, default: 0.0

  after_create :add_materials_cost

  # Relations
  has_many :in, :recipe_materials, origin: :recipe   

  # Nested raw_materials
  def recipe_materials_attributes=(attributes)
    @recipe_materials ||= []
    attributes.each do |i, material_params|
      if material_params["_destroy"] == '1' && !material_params["id"].nil?
        # Delete relation
        RecipeMaterial.find(material_params["id"]).destroy
      elsif material_params["_destroy"] == '0'
        material_params.delete "_destroy" 
        # puts material_params
        if material_params["id"].nil?
          # New relation
          material_params.delete "id"  
          material = RecipeMaterial.create(quantity: material_params["quantity"])

          raw = Raw.find(material_params["raw_id"])
          material.raw = raw

          self.recipe_materials << material
        else
          # Update relation
          RecipeMaterial.find(material_params["id"]).update(quantity: material_params["quantity"])
        end
      end
    end
  end


  private

  def add_materials_cost
    value = self.cost
    self.recipe_materials.each do |m| 
      value += (m.quantity * m.raw.cost)
    end
    self.update cost: value
  end

end
