puts 'Destroying'
User.destroy_all
Admin.destroy_all
Category.destroy_all
Brand.destroy_all
Size.destroy_all
puts 'Destroying done'

# Admins
puts 'Seeding Admins'
admin_attributes = [
  { email: 'alice.fabre@hotmail.fr', password: 'plopplop' },
  { email: 'b@test.fr', password: 'plopplop' },
]
Admin.create! admin_attributes
puts 'Admins done'

# Categories
category_attributes = [
  { name: "Robe" },
  { name: "Bonnet" },
]
puts 'Seeding Categories'
Category.create! category_attributes
puts 'Categories done'

# Brands
puts 'Seeding Brands'
cabaia = Brand.new(name: "Cabaia", description: "Une histoire de métro et de vin.\r\n\r\nBASTIEN\r\nEn février 2015 Bastien portait le bonnet à pompon que lui avait tricoté sa grand-mère lorsqu’il le perdit dans le métro parisien. \r\nIl chercha alors un remplaçant mais ne trouva que des bonnets mornes, sans âme et de mauvaise qualité. \r\nEntrepreneur dans l'âme, Bastien eut alors l'idée d’une marque qui lui ressemble, joviale et honnête, ayant pour mission de mettre de la bonne humeur dans les accessoires et dans la vie de quiconque les porte.\r\nIl créa alors notre premier concept : Le bar à bonnets!\r\n\r\nEMILIEN\r\nÀ l’hiver 2015 à l’autre bout de Paris, alors que Bastien cherchait encore son bonnet, Emilien s'ennuyait profondément dans son boulot d'ingénieur nucléaire, trop réglementé, trop lent, pas assez créatif et décida donc de monter une première société qu'il ferma au bout d'un an.\r\nLors d’un apéro, Emilien qui cherchait un nouveau projet dans lequel s’investir fit la rencontre de Bastien. Le duo s’associa donc (après moult verres de vin ) et Emilien insuffla dans Cabaïa son engagement pour les animaux et créa notre motto “serious is boring”, un clin d’oeil à son ancien travail.")
cabaia.photo.attach(io: open("https://storage.googleapis.com/garance-photos-dev/cabaia.png"), filename: "cabaia.png")
cabaia.save
sessun = Brand.new(name: "Sessùn", description: "Emma François\r\nSes voyages et rencontres l’ont finalement conduite à imprimer sa mémoire de quelques anciennes civilisations sur notre tissu contemporain. C’est en Amérique du sud qu’Emma ressent le premier choc mystique, le déclic, annonciateur d’une vocation. Cliché ? Peu importe. C’est au contact de ceux et celles qui tissent, brodent, cousent, fabriquent, par héritage du geste et du savoir-faire, qu’elle comprend et prend le chemin qui lui ressemble.\r\n1998 marque le passage obligé par Paris et le salon Who’s Next où elle présente sa marque pour la première fois. Installée à Marseille, elle s’y fait remarquer en 1999 et 2001, récompensée par la Maison Mode Méditerranée qui lui attribue le prix du Jeune Créateur. En 2014, la première collection Sessùn Oui est lancée, proposant une relecture contemporaine et subtile de l’univers du mariage. L’année 2016 a célébré l’anniversaire des 20 ans de la marque, qui n’a jamais perdu son fil conducteur.\r\nÉcouter les tendances pour anticiper les tons, les imprimés, formes et coupes ? Oui, bien-sûr mais surtout se fier à son instinct, aux émotions captées lors de la moindre sortie, de la moindre rencontre. Aucune concession commerciale en tous cas, car comme Emma le dit si bien : « Si on fait quelque chose qu’on ne sent pas, ça ne marche jamais ! ».")
sessun.photo.attach(io: open("https://storage.googleapis.com/garance-photos-dev/sessun.png"), filename: "sessun.png")
sessun.save
puts 'Brands done'

# Sizes
size_attributes = [
  { name: "S" },
  { name: "M" },
  { name: "L" },
  { name: "TU" },
]
puts 'Seeding Sizes'
Size.create! size_attributes
puts 'Sizes done'
