class Recipe 
  include Neo4j::ActiveNode
  property :name, type: String
  property :quantity, type: Float
  property :measure, type: String
  property :cost, type: Float

  # Relations
  has_many :in, :recipe_materials, origin: :recipe   

  # Nested raw_materials
  def recipe_materials_attributes=(attributes)
    @recipe_materials ||= []
    attributes.each do |i, material_params|
      if material_params["_destroy"] == '1'
        # Delete relation
        RecipeMaterial.find(material_params["id"]).destroy
      else
        material_params.delete "_destroy" 
        # puts material_params
        if material_params["id"].nil?
          # New relation
          material_params.delete "id"  
          material = RecipeMaterial.create(quantity: material_params["quantity"])

          raw = Raw.find(material_params["raw_id"])
          material.raw = raw

          self.recipe_materials << material

          self.cost += material.quantity * raw.cost
        else
          # Update relation
          RecipeMaterial.find(material_params["id"]).update(quantity: material_params["quantity"])
        end
      end
    end
  end

end
