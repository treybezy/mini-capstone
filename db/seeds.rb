Supplier.create!([
  {name: "trey", email: "u-bezy@hotmail.com", phone_number: "3016333333"},
  {name: "les", email: "doctalvlvl@hotmail.com", phone_number: "3016677777"}
])

Product.create!([
  {
    name: "Abyssal Whip", 
    price: "2000000.0", 
    # image_url: "https://vignette.wikia.nocookie.net/2007scape/images/3/30/Abyssal_whip_detail.png/revision/latest?cb=20160212024444", 
    description: "A weapon from the abyss.", 
    attack_bonus: "82", 
    str_bonus: "82", 
    supplier_id: 1},
  {
    name: "Dragon Scimitar", 
    price: "60000.0", 
    # image_url: "https://vignette.wikia.nocookie.net/2007scape/images/9/97/Dragon_scimitar_detail.png/revision/latest?cb=20170118191039", 
    description: "A vicious, curved sword.", 
    attack_bonus: "67", 
    str_bonus: "66", 
    supplier_id: 2},
  {
    name: "Granite Maul", 
    price: "100000.0", 
    # image_url: "https://vignette.wikia.nocookie.net/2007scape/images/e/e9/Granite_maul_detail.png/revision/latest?cb=20160212060350", 
    description: "Simplicity is the best weapon.", 
    attack_bonus: "0", 
    str_bonus: "79", 
    supplier_id: 2},
  {
    name: "Dragon Dager", 
    price: "40000.0", 
    # image_url: "https://vignette.wikia.nocookie.net/2007scape/images/7/79/Dragon_dagger_%28p%29_detail.png/revision/latest?cb=20160218232138", 
    description: "A powerful dagger.", 
    attack_bonus: "40", 
    str_bonus: "40", 
    supplier_id: 2},
  {
    name: "Armadyl Godsword", 
    price: "10000000.0", 
    # image_url: "https://vignette.wikia.nocookie.net/2007scape/images/4/48/Armadyl_godsword_detail.png/revision/latest?cb=20160529081357", 
    description: "A beautiful, heavy sword.", 
    attack_bonus: "132", 
    str_bonus: "132", 
    supplier_id: 1},
  {
    name: "Dragon Claws", 
    price: "62000000.0", 
    # image_url: "https://vignette.wikia.nocookie.net/2007scape/images/b/b3/Dragon_claws_detail.png/revision/latest?cb=20170108114842", 
    description: "A set of fighting claws.", 
    attack_bonus: "57", 
    str_bonus: "56", 
    supplier_id: 2}
])



Image.create!([
{
alt: "Abyssal Whip", 
url: "https://vignette.wikia.nocookie.net/2007scape/images/3/30/Abyssal_whip_detail.png/revision/latest?cb=20160212024444", 
product_id: Product.find_by(name: "Abyssal Whip").id
},
{    
alt: "Dragon Scimitar", 
url: "https://vignette.wikia.nocookie.net/2007scape/images/9/97/Dragon_scimitar_detail.png/revision/latest?cb=20170118191039", 
product_id: Product.find_by(name: "Dragon Scimitar").id
},
{    
alt: "Granite Maul", 
url: "https://vignette.wikia.nocookie.net/2007scape/images/e/e9/Granite_maul_detail.png/revision/latest?cb=20160212060350", 
product_id: Product.find_by(name: "Granite Maul").id
},
{    
alt: "Dragon Dager", 
url: "https://vignette.wikia.nocookie.net/2007scape/images/7/79/Dragon_dagger_%28p%29_detail.png/revision/latest?cb=20160218232138", 
product_id: Product.find_by(name: "Dragon Dager").id
},
{    
alt: "Armadyl Godsword", 
url: "https://vignette.wikia.nocookie.net/2007scape/images/4/48/Armadyl_godsword_detail.png/revision/latest?cb=20160529081357", 
product_id: Product.find_by(name: "Armadyl Godsword").id
},
{    
alt: "Dragon Claws", 
url: "https://vignette.wikia.nocookie.net/2007scape/images/b/b3/Dragon_claws_detail.png/revision/latest?cb=20170108114842", 
product_id: Product.find_by(name: "Dragon Claws").id
}
])
    



