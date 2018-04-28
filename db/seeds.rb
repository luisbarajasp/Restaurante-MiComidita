puts "Filling database..."

#
# RECIPES
#

# First recipe
recipe_materials = []

# Raws needed
scallions = Raw.create(name: 'Scallions', type: 'fresh', measure: 'unit', cost: '5')
RawInventory.create(quantity: 10, expired_at: '2018-05-01', raw: scallions)
recipe_materials << RecipeMaterial.create(raw: scallions, quantity: 2)

rice = Raw.create(name: 'Jasmine Rice', type: 'miscellaneous', measure: 'kilogram', cost: '30')
RawInventory.create(quantity: 1, expired_at: '2018-05-10', raw: rice)
recipe_materials << RecipeMaterial.create(raw: rice, quantity: 0.1)

lemon = Raw.create(name: 'Lemon', type: 'fresh', measure: 'unit', cost: '5')
RawInventory.create(quantity: 10, expired_at: '2018-05-05', raw: lemon)
recipe_materials << RecipeMaterial.create(raw: lemon, quantity: 1)

zucchini = Raw.create(name: 'Zucchini', type: 'fresh', measure: 'kilogram', cost: '100')
RawInventory.create(quantity: 1, expired_at: '2018-05-02', raw: zucchini)
recipe_materials << RecipeMaterial.create(raw: zucchini, quantity: 1)

basil_oil = Raw.create(name: 'Basil Oil', type: 'miscellaneous', measure: 'liter', cost: '100')
RawInventory.create(quantity: 1, expired_at: '2019-05-05', raw: basil_oil)
recipe_materials << RecipeMaterial.create(raw: basil_oil, quantity: 0.025)

shrimp = Raw.create(name: 'Shrimp', type: 'meat', measure: 'kilogram', cost: '50')
RawInventory.create(quantity: 1, expired_at: '2018-05-01', raw: shrimp)
recipe_materials << RecipeMaterial.create(raw: shrimp, quantity: 0.05)

chili_flakes = Raw.create(name: 'Chili Flakes', type: 'fresh', measure: 'gram', cost: '1')
RawInventory.create(quantity: 100, expired_at: '2018-12-01', raw: chili_flakes)
recipe_materials << RecipeMaterial.create(raw: chili_flakes, quantity: 0.005)

butter = Raw.create(name: 'Butter', type: 'dairy', measure: 'gram', cost: '0.5')
RawInventory.create(quantity: 200, expired_at: '2018-12-01', raw: butter)
recipe_materials << RecipeMaterial.create(raw: butter, quantity: 0.03)

salt = Raw.create(name: 'Salt', type: 'miscellaneous', measure: 'gram', cost: '0.5')
RawInventory.create(quantity: 1000, expired_at: '2020-12-01', raw: salt)
recipe_materials << RecipeMaterial.create(raw: salt, quantity: 10)

recipe = Recipe.create(name: 'Shrimp and Zucchini Ribbons', quantity: '300', measure: 'g', recipe_materials: recipe_materials)

Product.create(recipe: recipe, expired_at: '2018-05-25' )












