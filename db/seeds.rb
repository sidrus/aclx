# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vehicle_colors = VehicleColor.create([
    {name: "Bright White Clearcoat"},
    {name: "Ivory Tri-Coat Pearl"},
    {name: "Ivory 3-Coat"},
    {name: "Cool Vanilla Clearcoat"},
    {name: "Stone White Clearcoat"},
    {name: "White Gold Pearlcoat"},
    {name: "Plum Crazy Pearlcoat"},
    {name: "Go Mango"},
    {name: "Hemi Orange Pearlcoat"},
    {name: "Header Orange Clearcoat"},
    {name: "Copperhead Pearlcoat"},
    {name: "Toxic Orange Pearlcoat"},
    {name: "Sublime Metallic Clearcoat"},
    {name: "Green With Envy"},
    {name: "Detonator Yellow Clearcoat"},
    {name: "Top Banana"},
    {name: "Amped"},
    {name: "Stinger Yellow Clearcoat"},
    {name: "Furious Fuschia Pearlcoat"},
    {name: "Pitch Black"},
    {name: "Brilliant Black Crystal Pearlcoat"},
    {name: "Gloss Black"},
    {name: "Phantom Black Tri-Coat Pearl"},
    {name: "Dark Titanium Metallic Clearcoat"},
    {name: "Tungsten Metallic Clearcoat"},
    {name: "Granite Crystal Metallic Clearcoat"},
    {name: "Dark Charcoal Pearlcoat"},
    {name: "Maximum Steel Metallic Clearcoat"},
    {name: "Billet Silver Metallic Clearcoat"},
    {name: "Magnesium Pearlcoat"},
    {name: "Mineral Gray Metallic Clearcoat"},
    {name: "Pewter Gray Pearlcoat"},
    {name: "Billet Metallic Clearcoat"},
    {name: "Jazz Blue Pearlcoat"},
    {name: "Blackberry Pearlcoat"},
    {name: "Blue Streak Pearlcoat"},
    {name: "Daytona Blue Pearlcoat"},
    {name: "Steel Blue Metallic Clearcoat"},
    {name: "Deep Water Blue Clearcoat"},
    {name: "Marine Blue Pearlcoat"},
    {name: "Midnight Blue Pearlcoat"},
    {name: "B5 Blue Pearlcoat"},
    {name: "Ceramic Blue Clearcoat"},
    {name: "Sapphire Crystal Metallic Clearcoat"},
    {name: "Redline 3-Coat Pearl"},
    {name: "High Octane Red Pearlcoat"},
    {name: "Torred"},
    {name: "Deep Cherry Red Crystal Pearlcoat"},
    {name: "Inferno Red Crystal Pearlcoat"},
    {name: "Velvet Red Pearlcoat"},
    {name: "Dark Cordovan Pearlcoat"},
    {name: "Luxury Brown Pearlcoat"},
    {name: "Light Sandstone Metallic Clearcoat"},
    {name: "Cashmere Pearlcoat"}
  ])

vehicle_models = VehicleModel.create([
    {name: "Charger"},
    {name: "Challenger"},
    {name: "300"},
    {name: "Magnum"}
  ])

vehicle_editions = VehicleEdition.create([
    {name: "100th Anniversary"},
    {name: "Blacktop"},
    {name: "Core"},
    {name: "Daytona"},
    {name: "Dub"},
    {name: "Hellcat"},
    {name: "Heritage"},
    {name: "Inaugural"},
    {name: "Mopar"},
    {name: "Plus"},
    {name: "Rallye"},
    {name: "Redline"},
    {name: "Scat Pack"},
    {name: "Scat Pack Shaker"},
    {name: "Shaker"},
    {name: "SRT Design"},
    {name: "Super Bee"},
    {name: "Varvatos"},
    {name: "Yellow Jacket"}
  ])

vehicle_trims = VehicleTrim.create([
    {name: "SE"},
    {name: "SXT"},
    {name: "R/T"},
    {name: "SRT8"},
    {name: "SRT"},
    {name: "Touring"},
    {name: "S"},
    {name: "C"}
  ])