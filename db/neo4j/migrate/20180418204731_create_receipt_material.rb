class CreateReceiptMaterial < Neo4j::Migrations::Base
  def up
    add_constraint :ReceiptMaterial, :uuid
  end

  def down
    drop_constraint :ReceiptMaterial, :uuid
  end
end
