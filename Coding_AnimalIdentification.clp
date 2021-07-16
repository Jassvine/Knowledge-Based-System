;facts & rules ✅
;pattern matching
;wildcards & var

;templates & condition => maybe used for creating animal template. If the animal is found, use template to define that animal based on its characteristics (name, size, weight). Then print

;truth maintenance => when the facts no longer consistent with reality;
;using this link the related fact created by rules and can be removed
;if one is changed or isn't valid

;;;This template is used when showing the whole info of animal matched.
  ;It will print the useful of the animal for the user
(deftemplate animal
  (slot name)
  (slot lifespan)
  (slot scientific-name)
  (slot length)
  (slot diet)
  (slot description) ;a brief desc of that animal, if any
)

;The main menu
(deffunction mainMenu()
  (printout t "Animal Identification Expert System" crlf)
  (printout t "===================================" crlf)
  (printout t "" crlf)
  (printout t "Welcome to Animal Identification Expert System" crlf)
  (printout t "You can use this expert system to idenfify an animal by" crlf)
  (printout t "simply answering the question below" crlf)
  (printout t "" crlf)
  (printout t "===================================" crlf)
  (printout t "" crlf)
  (printout t "Does the animal is a vertebrate? [yes/no]" crlf)
  (assert(vertebrate(read))) ;read user's value
  (run)
)

;if animal is vertebrate rules
(defrule vertebrate
  (vertebrate no)
=>
  (printout t "Is the animal live mostly in soil?")
  (assert(live-in-soil(read))) ;read if it live in soil
)

;rule animal lives in soil
(defrule live-in-soil-yes
  (live-in-soil yes)
=>
  (printout t "Is the animal has a flat body?")
  (assert(body-flat(read))) ;read if it has a flat body
)

;rule animal doesn't live in soil
(defrule live-in-soil-no
  (live-in-soil no)
=>
  (printout t "Is the animal's body consist of a few segments?")
  (assert(body-segments(read))) ;read if its body consist of several segments
)

;rule flat body
(defrule body-flat-yes
  (body-flat yes)
=>
  (assert(animal (name "Flatworm")
                 (lifespan "65-140 days")
                 (scientific-name "Platyhelminthes")
                 (diet "Tunicates, small crustaceans, worms, and molluscs")
                 (description "The flatworms, flat worms, Platyhelminthes, or platyhelminths are a phylum of relatively simple bilaterian, unsegmented, soft-bodied invertebrates")
  )
))

;if body not flat
(defrule body-flat-no
  (body-flat no)
=>
  (printout t "Does the animal suck blood from skin?")
  (assert(suck-blood(read)))
)

;if animal suck blood from skin
(defrule suck-blood-yes
  (suck-blood yes)
=>
  (assert(animal (name "Earthworm")
         (lifespan "60 to 90 days")
         (scientific-name "Lumbricus terrestris")
         20 to 25 cm")
         (diet "Dead leaves")
         (description "Lumbricus terrestris is a large, reddish worm species thought to be native to Western Europe, now widely distributed around the world (along with several other lumbricids), particularly in temperate to mild boreal climates.")
  )
)

;if animal doesn not suck blood
(defrule suck-blood-no
  (suck-blood no)
=>
  (assert(animal (name "Leech")
         (lifespan "2 to 8 years")
         (scientific-name "Hirudinea")
         0.7 to 7 cm. Can be longer")
         (diet "Blood")
         (description "Leeches are segmented parasitic or predatory worms that belong to the phylum Annelida and comprise the subclass Hirudinea. The majority of leeches live in freshwater habitats, while some species can be found in terrestrial or marine environments.")
  )
)

;body is segmented yes
(defrule body-segments-yes
  (body-segments yes)
=>
  (printout t "Does the animal has a shell?")
  (assert(has-shell(read)))
)

;if have shell
(defrule has-shell-yes
  (has-shell yes)
=>
  (printout t "Does the animal has tail?")
  (assert(has-tail(read)))
)

;if have shell, and has tail
(defrule has-tail-yes
  (has-tail yes)
=>
  (assert(animal (name "Lobster")
         (lifespan "31 years (male), 54 years (female)")
         (scientific-name "Nephropidae")
         25 to 50 cm")
         (diet "Crab, mussels, clams, starfish, sea urchins, various marine worms, small fish")
         (description "Lobsters are a family of large marine crustaceans. Lobsters have long bodies with muscular tails, and live in crevices or burrows on the sea floor. Three of their five pairs of legs have claws, including the first pair, which are usually much larger than the others.")
  )
)

(defrule has-tail-no
  (has-tail no)
=>
  (assert(animal (name "Crab")
         (lifespan "Varies")
         (scientific-name "Brachyura")
         Varies")
         (diet "Algae, molluscs, worms, other crustaceans, fungi, bacteria, and detritus.")
         (description "Crabs are decapod crustaceans of the infraorder Brachyura, which typically have a very short projecting 'tail', usually hidden entirely under the thorax. They live in all the world's oceans, in fresh water, and on land, are generally covered with a thick exoskeleton, and have a single pair of pincers.")
  )
)

;ask if has 6 leg
(defrule has-shell-no
  (has-shell no)
=>
  (printout t "Does the animal has six leg?")
  (assert(six-leg(read)))
)

;has 6 legs
(defrule six-leg-yes
  (six-leg yes)
=>
  (printout t "Can the animal fly?")
  (assert(can-fly(read)))
)

;can fly
(defrule can-fly-yes
  (can-fly yes)
=>
  (printout t "Does it have a harden wing?")
  (assert(harden-wing(read)))
)

;harden wing
(defrule harden-wing-yes
  (harden-wing yes)
=>
  (assert(animal (name "Beetle")
         (lifespan "Varies. 10 – 14 days to 3 – 6 months")
         (scientific-name "Coleoptera")
         Varies. 1 cm to 4 – 6 cm.")
         (diet "Varies. Some eat plants, dung, fungus, while some are predator on small animals")
         (description "Beetles are a group of insects that form the order Coleoptera, in the superorder Endopterygota. Their front pair of wings are hardened into wing-cases, elytra, distinguishing them from most other insects.")
  )
)

;no harden wing
(defrule harden-wing-no
  (harden-wing no)
=>
  (printout t "Does it have yellow & black stripe?")
  (assert(stripe(read)))
)

;yellow-black stripe
(defrule stripe-yes
  (stripe yes)
=>
  (printout t "Does it suck nectar from flower?")
  (assert(suck-nectar(read)))
)

;suck nectar
(defrule stripe-suck-nectar-yes
  (suck-nectar yes)
=>
  (assert(animal (name "Bee")
         (lifespan "Varies. 28 days to 122 – 152 days")
         (scientific-name "Anthophila")
         1 – 1.4 cm")
         (diet "Plant nectar")
         (description "Bees are flying insects closely related to wasps and ants, known for their role in pollination and, in the case of the best-known bee species, the western honey bee, for producing honey. ")
  )
)

;don't suck nectar
(defrule stripe-suck-nectar-no
  (suck-nectar no)
=>
  (assert(animal (name "Wasp")
         (lifespan "12-22 days")
         (scientific-name "Vespula germanica")
         Asian giant hornet: 5.5 cm, European hornet: 1.8 – 2.4 cm, Asian hornet: 2 cm")
         (diet "Insects. Adult eats sugar")
         (description "A wasp is any insect of the narrow-waisted suborder Apocrita of the order Hymenoptera which is neither a bee nor an ant; this excludes the broad-waisted sawflies, which look somewhat like wasps but are in a separate suborder")
  )
)

; no yellow-black stripe
(defrule stripe-no
  (stripe no)
=>
  (printout t "Does it suck nectar from flower?")
  (assert(suck-nectar(read)))
)

;suck nectar
(defrule stripe-suck-nectar-yes
  (suck-nectar yes)
=>
  (assert(animal (name "Butterfly")
         (lifespan "12 months")
         (scientific-name "Rhopalocera")
         Painted lady: 4 – 7.3 cm, Cabbage white: 3.2 – 4.7 cm, Old world swallowtail: 6.5 – 8.6 cm")
         (diet "Nectar")
         (description "Butterflies are insects in the macrolepidopteran clade Rhopalocera from the order Lepidoptera, which also includes moths. Adult butterflies have large, often brightly coloured wings, and conspicuous, fluttering flight.")
  )
)

;no suck nectar
(defrule stripe-suck-nectar-no
  (suck-nectar no)
=>
  (printout t "Does it feed on plant?")
  (assert(feed-plant(read)))
)

;feed plant
(defrule feed-plant-yes
  (feed-plant yes)
=>
  (assert(animal (name "Grasshopper")
         (lifespan "1 year")
         (scientific-name "Caelifera")
         1 to 7 cm")
         (diet "Leaves, flowers, stems, seeds. Sometimes dead insects")
         (description "Grasshoppers are a group of insects belonging to the suborder Caelifera. They are among what is probably the most ancient living group of chewing herbivorous insects, dating back to the early Triassic around 250 million years ago")
  )
)

;no feed plant
(defrule feed-plant-no
  (feed-plant no)
=>
  (printout t "Does it suck human/animal blood?")
  (assert(suck-human-animal-blood(read))
)

;suck blood
(defrule suck-human-animal-blood-yes
  (suck-human-animal-blood yes)
=>
  (assert(animal (name "Mosquito")
         (lifespan "7 days")
         (scientific-name "Culicidae")
         0.15– 0.4 inches")
         (diet "Blood. Male nectar")
         (description "A mosquito is any member of a group of about 3,500 species of small insects belonging to the order Diptera. Within Diptera, mosquitoes constitute the family Culicidae. The word "mosquito" is Spanish and Portuguese for "little fly".")
  )
)

;no suck blood
(defrule suck-human-animal-blood-no
  (suck-human-animal-blood no)
=>
  (assert(animal (name "Housefly")
         (lifespan "28 days")
         (scientific-name "Musca domestica")
         0.6 – 0.7 cm")
         (diet "General feeders, which mean they will eat everything from food to animal and human fecal matter.")
         (description "The housefly is a fly of the suborder Cyclorrhapha. It is believed to have evolved in the Cenozoic Era, possibly in the Middle East, and has spread all over the world as a commensal of humans. It is the most common fly species found in houses")
  )
)

;can't fly
(defrule can-fly-no
  (can-fly no)
=>
  (printout t "Does it have a waist?")
  (assert(have-waist(read)))
)

;have waist
(defrule have-waist-yes
  (have-waist yes)
=>
  (assert(animal (name "Ant")
         (lifespan "Black garden ant: 15 years, Pharaoh ant: 4 – 12 months")
         (scientific-name "Formicidae")
         Black garden ant: 0.5 – 0.7 cm, Carpenter ant: 0.64 – 2.5 cm, Pharaoh ant: 0.2 cm")
         (diet "Leaves, seeds, small insects, nectar, and honeydew")
         (description "Ants are eusocial insects of the family Formicidae and, along with the related wasps and bees, belong to the order Hymenoptera. Ants appear in the fossil record across the globe in considerable diversity during the latest Early Cretaceous and early Late Cretaceous, suggesting an earlier origin.")
  )
)

;no waist
(defrule have-waist-no
  (have-waist no)
=>
  (assert(animal (name "Termite")
         (lifespan "30 years, but a 15- to 17-year life span is more common")
         (scientific-name "Isoptera")
         1/4 and 1/2 of an inch long.")
         (diet "cellulose, which is obtained from wood, grass, leaves, humus, manure of herbivorous animals, and materials of vegetative origin (e.g., paper, cardboard, cotton)")
         (description "Termites are eusocial insects that are classified at the taxonomic rank of infraorder Isoptera, or as epifamily Termitoidae within the order Blattodea.")
  )
)

;has more than 6 legs
(defrule six-leg-no
  (six-leg no)
=>
  (printout t "Animal is centipede/milipede" crlf)

  ;assert milipede
  (assert(animal (name "Milipede")
         (lifespan "Estimated: 10 years")
         (scientific-name "Diplopoda")
         1 to 2 inches long")
         (diet "Damp or decaying wood particles & leaves")
         (description "Millipedes are a group of arthropods that are characterised by having two pairs of jointed legs on most body segments; they are known scientifically as the class Diplopoda, the name being derived from this feature. Each double-legged segment is a result of two single segments fused together.")
  )

  ;assert centipede
  (assert(animal (name "Centipede")
         (lifespan "5-6 years")
         (scientific-name "Chilopoda")
         Varies. Largest 26-cm-long")
         (diet "Insects, spiders, and other small invertebrates. Sometime bigger animal like lizard")
         (description "Centipedes are predatory arthropods belonging to the class Chilopoda of the subphylum Myriapoda, an arthropod group which also includes millipedes and other multi-legged creatures. Centipedes are elongated metameric creatures with one pair of legs per body segment.")
  ))


;body is segmented no
(defrule body-segments-no
  (body-segments no)
=>
  (printout t "Does the animal has multiple cells for digesting its food in stomach?")
  (assert(many-cell-for-digestion(read)))
)

;many cell digest yes
(defrule many-cell-for-digestion-yes
  (many-cell-for-digestion yes)
=>
  (printout t "Does the animal attach permanently to an object?")
  (assert(attach-object(read)))
)

;attach object
(defrule attach-object-yes
  (attach-object yes)
=>
  (printout t "Does the animal have spike?")
  (assert(has-spike(read)))
)

;have spike
(defrule has-spike-yes
  (has-spike yes)
=>
  (assert(animal (name "Sea-anemone")
         (lifespan "60-80 years")
         (scientific-name "Actiniaria")
         Varies. A few mm to 1.5 m")
         (diet "Crab")
         (description "Sea anemones are the marine, predatory animals of the order Actiniaria. They are named after the anemone, a terrestrial flowering plant, because of the colourful appearance of many. Sea anemones are classified in the phylum Cnidaria, class Anthozoa, subclass Hexacorallia")
  )
)

;no spike
(defrule has-spike-no
  (has-spike no)
=>
  (assert(animal (name "Coral")
         (lifespan "Theoretically live forever")
         (scientific-name "Anthozoa")
         Varies")
         (diet "Food from algae living in their tissues or by capturing and digesting prey")
         (description "Corals are marine invertebrates within the class Anthozoa of the phylum Cnidaria. They typically live in compact colonies of many identical individual polyps. Coral species include the important reef builders that inhabit tropical oceans and secrete calcium carbonate to form a hard skeleton.")
  )
)

;no attach object
(defrule attach-object-no
  (attach-object no)
=>
  (assert(animal (name "Jellyfish")
         (lifespan "Typically a few months.")
         (scientific-name "Scyphozoa")
         Smallest 1mm. Most half an inch (1 cm) wide to about 16 inches (40 cm),")
         (diet "Planktonic organisms, crustaceans, small fish, fish eggs and larvae, and other jellyfish")
         (description "Jellyfish and sea jellies are the informal common names given to the medusa-phase of certain gelatinous members of the subphylum Medusozoa, a major part of the phylum Cnidaria")
  )
)

;many cell digest no
(defrule many-cell-for-digestion-no
  (many-cell-for-digestion no)
=>
  (printout t "Does the animal is multi-cellular?")
  (assert(multi-cell(read)))
)

;not multicell
(defrule multi-cell-no
  (multi-cell no)
=>
  (assert(animal (name "Protozoa")
         (lifespan "As long as the single-celled parasites responsible for the condition continue to live in the body")
         (scientific-name "Protozoa")
         Smallest (mainly intracellular forms) are 1 to 10 μm long, but Balantidium coli may measure 150 μm.")
         (diet "Bacteria, but also eat other protozoa, soluble organic matter, and sometimes fungi.")
         (description "Protozoa is an informal term for a group of single-celled eukaryotes, either free-living or parasitic, which feed on organic matter such as other microorganisms or organic tissues and debris")
  )
)

;multicell
(defrule multi-cell-yes
  (multi-cell yes)
=>
  (printout t "Does the animal has a spiral-shaped shell?")
  (assert(spiral-shape-shell(read)))
)

;spiral shell
(defrule spiral-shape-shell-yes
  (spiral-shape-shell yes)
=>
  (assert(animal (name "Snail")
         (lifespan "2 or 3 years")
         (scientific-name "Gastropoda")
         A few centimeters to 12 inches.")
         (diet "Decaying organic matter. Their diet also includes fungi, lichens, green foliage, worms, centipedes, insects, animal feces, carrion, and other slugs.")
         (description "A snail is, in loose terms, a shelled gastropod. The name is most often applied to land snails, terrestrial pulmonate gastropod molluscs.")
  )
)

;no spiral shell
(defrule spiral-shape-shell-no
  (spiral-shape-shell no)
=>
  (printout t "Is the shell is protected by two-half shells?")
  (assert(two-half-shell(read)))
)

;two half shell
(defrule two-half-shell-yes
  (two-half-shell no)
=>
  (assert(animal (name "Clam")
         (lifespan "one year, while at least one may be over 500 years old.")
         (scientific-name "Mercenaria mercenaria")
         (diet "Zooplankton, phytoplankton, benthic diatoms, and dissolved organic material.")
         (description "Clam is a common name for several kinds of bivalve molluscs. The word is often applied only to those that are edible and live as infauna, spending most of their lives halfway buried in the sand of the seafloor or riverbeds")
  ))
)

;no two half shell
two-half-shell-no
  ((two-half-shell no)
=>
  (assert(animal (name "Squid")
         (lifespan "12 months to 18 months")
         (scientific-name "Teuthoidea")
         (diet "fish and crustaceans")
         (description "Squid are cephalopods in the superorder Decapodiformes with elongated bodies, large eyes, eight arms and two tentacles. Like all other cephalopods, squid have a distinct head, bilateral symmetry, and a mantle")
  )
))

;===========vertebrate part=================

;vertebrate
(defrule vertebrate-yes
(vertebrate yes)
=>
(printout t"Is the animal is warm blooded? (yes/no) ")
(assert(warm-blooded(read))))

;if warm blood
(defrule warm-blooded-yes
(warm-blooded yes)
=>
(printout t"Is the mother of the animal breastfeed its offspring? (yes/no) ")
(assert(breastfeed(read))))

;breastfeed
(defrule breastfeed-yes
(breastfeed yes)
=>
(printout t "Does the animal eat meat or insects? (yes/no) ")
(assert(carni-omnivore(read))))

;carnivore/omnivore
(defrule carni-omnivore-yes
(carni-omnivore yes)
=>
(printout t "Can the animal fly? (yes/no)")
(assert(can-fly(read))))

;can fly
(defrule can-fly-yes
(can-fly yes)
=>
(assert(animal (name "Bat")
         (lifespan "20 years")
         (scientific-name "Chiroptera")
         (diet "Insects ")
         (description "Bats are mammals of the order Chiroptera.[a] With their forelimbs adapted as wings, they are the only mammals capable of true and sustained flight.")
  ))
)

;can't fly
(defrule can-fly-no
(can-fly no)
=>
(printout t "Does the animal have an opposing thumb? (yes/no) " )
(assert(opposing-thumb(read))))

;opp thumb
(defrule opposing-thumb-yes
(opposing-thumb yes)
=>
(printout t "Does the animal have a prehensile tail? (yes/no)" )
(assert(prehensile-tail(read))))

;prehensile tail
(defrule prehensile-tail-yes
(prehensile-tail yes)
=>
(assert(animal (name "Monkey")
         (lifespan "Around 20 yrs")
         (scientific-name "Cercopithecidae")
         (diet "meat and plant-based foods")
         (description "Monkey is a common name that may refer to groups or species of mammals, in part, the simians of infraorder Simiiformes. The term is applied descriptively to groups of primates, such as families of New World monkeys and Old World monkeys.")
  ))
)

;no prehensile tail
(defrule prehensile-tail-no
(prehensile-tail no)
=>
(printout t "Is the animal nearly hairless? (yes/no) " )
(assert(hairless(read))))

;hairless yes
(defrule hairless-yes
(hairless yes)
=>
(printout t "This is human, not animal" crlf)
)

;no hairless
(defrule hairless-no
(hairless no)
=>
(printout t "Does the animal's arms are long and powerful? (yes/no) " )
(assert(long-powerful-arms(read))))

;long powerful arms
(defrule long-powerful-arms-yes
(have-long-arms yes)
=>
  (assert(animal (name "Gorilla")
         (lifespan "35 – 40 years")
         (scientific-name "Gorilla")
         (diet "Mainly vegetarian diet, feeding on stems, bamboo shoots and fruits.Some eat insects")
         (description "Gorillas are ground-dwelling, predominantly herbivorous apes that inhabit the forest of central Sub-Saharan Africa. The genus Gorilla is divided into two species: the eastern gorillas and the western gorillas, and either four or five subspecies. They are the largest living primates.")
  ))
  (assert(animal (name "Orangutan")
         (lifespan "35 – 45 years")
         (scientific-name "Pongo")
         (diet "")
         (description "Orangutans are great apes native to Indonesia and Malaysia. They are found in the rainforests of Borneo and Sumatra, but during the Pleistocene they ranged throughout Southeast Asia and South China. Classified in the genus Pongo, orangutans were originally considered to be one species")
  ))
  (assert(animal (name "Chimpanzee")
         (lifespan "Female: 39 years (In captivity), Male: 32 years (In captivity)")
         (scientific-name "Pan troglodytes")
         (diet "Seeds, fruit, leaves, bark, honey, flowers, and insects. Sometime hunts small animal.")
         (description "The chimpanzee, also known as the common chimpanzee, robust chimpanzee, or simply chimp, is a species of great ape native to the forest and savannah of tropical Africa. It has four confirmed subspecies and a fifth proposed subspecies. The chimpanzee and the closely related bonobo are classified in the genus Pan")
  ))
)

;no long powerful arms
(defrule long-powerful-arms-no
(long-powerful-arms no)
=>
(assert(animal (name "Baboon")
         (lifespan "35 – 45 years")
         (scientific-name "Papio")
         (diet "Fruits, grasses, seeds, bark, and roots. Sometime meat.")
         (description "Baboons are primates comprising the genus Papio, one of the 23 genera of Old World monkeys. There are five species of baboons, commonly known as hamadryas baboon, Guinea baboon, olive baboon, yellow baboon and chacma baboon.")
  ))
)

;no opp thumb
(defrule opposing-thumb-no
(opposing-thumb no)
=>
(printout t "Does the weight of an adult is more than 400 pounds? (yes/no)" )
(assert(weight-over-400(read))))

;>400
(defrule weight-over-400-yes
(weight-over-400 yes)
=>
(printout t "Is the animal live on land? (yes/no) ")
(assert(live-on-land(read))))

;live on land
(defrule live-on-land-yes
(live-on-land yes)
=>
(printout t "Can it stand on hind legs, usually to get a better view? (yes/no) ")
(assert(stand-hind-leg(read))))

;stand hind leg yes
(defrule stand-hind-leg-yes
  (stand-hind-leg yes)
=>
  (assert(animal (name "Sun Bear")
         (lifespan "20 years")
         (scientific-name "Helarctos malayanus")
         (diet "Sweet fruits, small rodents, birds, termites, and other insects")
         (description "The sun bear is a species in the family Ursidae occurring in the tropical forests of Southeast Asia. It is the smallest bear, standing nearly 70 centimetres at the shoulder and weighing 25–65 kilograms. It is stockily built, with large paws, strongly curved claws, small rounded ears and a short snout.")
  ))
)

;stand hind leg no
(defrule stand-hind-leg-no
  (stand-hind-leg no)
=>
  (assert(animal (name "Tiger")
         (lifespan "10 – 15 years")
         (scientific-name "Panthera tigris")
         (diet "Meat")
         (description "The tiger is the largest extant cat species and a member of the genus Panthera. It is most recognisable for its dark vertical stripes on orange-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar")
  ))
)

;not on land
(defrule live-on-land-no
(live-on-land no)
=>
(assert(animal (name "Walrus")
         (lifespan "40 years")
         (scientific-name "Odobenus rosmarus")
         (diet "Mollusc and fish")
         (description "The walrus is a large flippered marine mammal with a discontinuous distribution about the North Pole in the Arctic Ocean and subarctic seas of the Northern Hemisphere. The walrus is the only living species in the family Odobenidae and genus Odobenus.")
  ))
)

;<400
(defrule weight-over-400-no
(weight-over-400 no)
=>
(printout t "Does the animal have a thin tail? (yes/no) ")
(assert(thin-tail(read))))

;thin tail
(defrule thin-tail-yes
(thin-tail yes)
=>
(assert(animal (name "Cat")
         (lifespan "2 – 16 years")
         (scientific-name "Felis catus")
         (diet "Meat")
         (description "The cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.")
  ))
)

;not thin tail
(defrule thin-tail-no
(thin-tail no)
=>
(printout t "Is the animal usually keep as pet and can bark? (yes/no) ")
(assert(can-bark(read))))

;can bark
(defrule can-bark-yes
  (can-bark yes)
=>
  (assert(animal (name "Dog")
         (lifespan "10 – 13 years")
         (scientific-name "Canis lupus familiaris")
         (diet "Meat, dog food, vegetables")
         (description "The dog is a domesticated carnivore of the family Canidae. It is part of the wolf-like canids, and is the most widely abundant terrestrial carnivore.")
  ))
)

;can't bark
(defrule can-bark-yes
  (can-bark yes)
=>
  (assert(animal (name "Coyote")
         (lifespan "10-14 years")
         (scientific-name "Canis latrans")
         (diet "Flowers, insects, rodents, lizards, rabbits, birds, and snakes")
         (description "The coyote is a species of canine native to North America. It is smaller than its close relative, the wolf, and slightly smaller than the closely related eastern wolf and red wolf. It fills much of the same ecological niche as the golden jackal does in Eurasia.")
  ))
  (assert(animal (name "Fox")
         (lifespan "2 – 5 years")
         (scientific-name "Vulpes vulpes")
         (diet "Rabbits, rodents, birds, frogs, earthworm and fruits.")
         (description "Foxes are small to medium-sized, omnivorous mammals belonging to several genera of the family Canidae. Foxes have a flattened skull, upright triangular ears, a pointed, slightly upturned snout, and a long bushy tail. Twelve species belong to the monophyletic "true foxes" group of genus Vulpes.")
  ))
  (assert(animal (name "Wolf")
         (lifespan "6 – 8 years")
         (scientific-name "Canis lupus")
         (diet "Meat")
         (description "The wolf, also known as the gray wolf or grey wolf, is a large canine native to Eurasia and North America. More than thirty subspecies of Canis lupus have been recognized, and gray wolves, as colloquially understood, comprise non-domestic/feral subspecies.")
  ))
)

;herbivore
(defrule carni-omnivore-no
(carni-omnivore no)
=>
(printout t "Is the animal have hooves? (yes/no)")
(assert(have-hooves(read))))

;have hooves
(defrule have-hooves-yes
(have-hooves yes)
=>
(printout t "Is the animal stand on two toes/hooves per foot? (yes/no) ")
(assert(stand-two-toes(read))))

;stand two toes yes
(defrule two-toes-yes
(stand-two-toes yes)
=>
(printout t "Does the animal have horns? (yes/no) ")
(assert(have-horns(read))))

;yes horn
(defrule horns-yes
(have-horns yes)
=>
(printout t "Does the animal have wool? (yes/no) ")
(assert(have-wool(read))))

;wool
(defrule have-wool-yes
(have-wool yes)
=>
(assert(animal (name "Sheep")
         (lifespan "10 – 12 years")
         (scientific-name "Ovis aries")
         (diet "Plant")
         (description "Sheep are quadrupedal, ruminant mammals typically kept as livestock. Like most ruminants, sheep are members of the order Artiodactyla, the even-toed ungulates. Although the name sheep applies to many species in the genus Ovis, in everyday usage it almost always refers to Ovis aries")
  ))
)

;no wool
(defrule have-wool-no
(have-wool no)
=>
(printout t "Is the animal is domesticated? (yes/no) ")
(assert(domesticated(read))))

;domesticated
(defrule domesticated-yes
(domesticated yes)
=>
(assert(animal (name "Cow")
         (lifespan "18 – 22 years")
         (scientific-name "Bos taurus")
         (diet "Plant")
         (description "Cattle, or cows and bulls, are the most common type of large domesticated ungulates. They are a prominent modern member of the subfamily Bovinae, are the most widespread species of the genus Bos, and are most commonly classified collectively as Bos taurus.")
  ))
)

;not domesticated
(defrule domesticated-no
(domesticated no)
=>
  (assert(animal (name "Deer")
         (lifespan "Around 6 years. Female live longer")
         (scientific-name "Cervidae")
         (diet "Plant")
         (description "Deer or true deer are hoofed ruminant mammals forming the family Cervidae. The two main groups of deer are the Cervinae, including the muntjac, the elk, the red deer, the fallow deer, and the chital; and the Capreolinae, including the reindeer, the roe deer, the mule deer, and the moose.")
  ))
  (assert(animal (name "Moose")
         (lifespan "15 – 25 years")
         (scientific-name "Alces alces")
         (diet "Plant")
         (description "The moose or elk, Alces alces, is a member of the New World deer subfamily and is the largest and heaviest extant species in the deer family. Most adult male moose have distinctive broad, palmate antlers; most other members of the deer family have antlers with a dendritic configuration")
  ))
  (assert(animal (name "Antelope")
         (lifespan "15 – 20 years")
         (scientific-name "Antilocapra americana")
         (diet "Plant")
         (description "The term antelope is used to refer to many species of even-toed ruminant indigenous to various regions in Africa and Eurasia. Antelopes comprise a wastebasket taxon within the family Bovidae, encompassing all Old World ruminants that are not bovines, sheep, or goats")
  ))
)

;no horn
(defrule horns-no
(have-horns no)
=>
(printout t "Does the animal habitat is in the desert? (yes/no) ")
(assert(live-in-desert(read))))

;live in desert
(defrule desert-yes
(live-in-desert yes)
=>
(assert(animal (name "Camel")
         (lifespan "40 years")
         (scientific-name "Camelus")
         (diet "grass, grains, wheat and oats.")
         (description "A camel is an even-toed ungulate in the genus Camelus that bears distinctive fatty deposits known as "humps" on its back. Camels have long been domesticated and, as livestock, they provide food and textiles")
  ))
)

;not desert
(defrule desert-no
(live-in-desert no)
=>
(assert(animal (name "Giraffe")
         (lifespan "26 years")
         (scientific-name "Giraffa")
         (diet "Leaves")
         (description "The giraffe is an African artiodactyl mammal, the tallest living terrestrial animal and the largest ruminant. It is traditionally considered to be one species, Giraffa camelopardalis, with nine subspecies.")
  ))
)

;stand two toes no
(defrule stand-two-toes-no
(stand-two-toes no)
=>
(printout t "Is the toe animal covered with a protective plating? (yes/no) ")
(assert(protective-plating(read))))

;covered w plating
defrule protective-plating-yes
(protective-plating yes)
=>
(assert(animal (name "Rhinoceros")
         (lifespan "5 – 45 years")
         (scientific-name "Rhinocerotidae")
         (diet "Plant")
         (description "A rhinoceros, commonly abbreviated to rhino, is a member of any of the five extant species of odd-toed ungulates in the family Rhinocerotidae, as well as any of the numerous extinct species therein. Two of the extant species are native to Africa, and three to Southern Asia")
  ))
)

;no plating
(defrule protective-plating-no
(protective-plating no)
=>
  (assert(animal (name "Horse")
         (lifespan "25 – 30 years")
         (scientific-name "Equus caballus")
         (diet "Grass and hay")
         (description "The horse is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today.")
  ))
  (assert(animal (name "Zebra")
         (lifespan "around 25 years")
         (scientific-name "subgenus Hippotigris")
         (diet "Grass")
         (description "Zebras are African equines with distinctive black-and-white striped coats. There are three extant species: the Grévy's zebra, plains zebra and the mountain zebra. Zebras share the genus Equus with horses and asses, the three groups being the only living members of the family Equidae.")
  ))
)

;no hooves
(defrule have-hooves-no
(have-hooves no)
=>
(printout t "Is the animal habitat is in the water? (yes/no) ")
(assert(live-in-water(read))))

;in water
(defrule live-in-water-yes
(live-in-water yes)
=>
(printout t "Is the animal is commercically hunted? (yes/no) ")
(assert(commercically-hunted(read))))

;hunted
(defrule hunted-yes
(commercically-hunted yes)
=>
(assert(animal (name "Whale")
         (lifespan "Blue whale: 80 – 90 years, Killer whale: 29 years,")
         (scientific-name "Cetacea")
         (diet "Copepod crustaceans and small fish")
         (description "Whales are a widely distributed and diverse group of fully aquatic placental marine mammals. They are an informal grouping within the infraorder Cetacea, usually excluding dolphins and porpoises. Whales, dolphins and porpoises belong to the order Cetartiodactyla, which consists of even-toed ungulates")
  )))

;not hunted
(defrule hunted-no
(commercically-hunted no)
=>
(assert(animal (name "Dolphin")
         (lifespan "55 – 60 years")
         (scientific-name "Delphinus")
         (diet "ishes, squids, and crustaceans such as shrimps")
         (description "Dolphin is a common name of aquatic mammals within the infraorder Cetacea. The term dolphin usually refers to the extant families Delphinidae, Platanistidae, Iniidae, and Pontoporiidae, and the extinct Lipotidae. There are 40 extant species named as dolphins")
  )))

;not in water
(defrule live-in-water-no
(live-in-water no)
=>
(printout t "Does the animal have large front teeth? (yes/no) ")
(assert(large-front-teeth(read))))

;large front teeth
(defrule front-teeth-yes
(large-front-teeth yes)
=>
(printout t "Does the animal have large ears? (yes/no) ")
(assert(large-ears(read))))

;large ears
(defrule large-ears-yes
(large-ears yes)
=>
(assert(animal (name "Rabbit")
         (lifespan "1 – 2 years")
         (scientific-name "Oryctolagus cuniculus")
         (diet "hay, fresh vegetables, and pellets")
         (description "Rabbits are small mammals in the family Leporidae of the order Lagomorpha. Oryctolagus cuniculus includes the European rabbit species and its descendants, the world's 305 breeds of domestic rabbit. Sylvilagus includes 13 wild rabbit species, among them the seven types of cottontail")
  ))
)

;not large ears
(defrule large-ears-no
(large-ears no)
=>
(printout t "Unidentified animal. Not in our database" crlf))

;small front teeth
(defrule front-teeth-no
(large-front-teeth no)
=>
(printout t "Does the animal have a pouch, and use it to store its baby?(yes/no) ")
(assert(have-pouch(read))))

;pouch yes
(defrule pouch-yes
(have-pouch yes)
=>
  (assert(animal (name "Kangaroo")
         (lifespan "6 years")
         (scientific-name "Macropodidae")
         (diet "Grasses, flowers, leaves, ferns, moss and even insects")
         (description "The kangaroo is a marsupial from the family Macropodidae. In common use the term is used to describe the largest species from this family, the red kangaroo, as well as the antilopine kangaroo, eastern grey kangaroo, and western grey kangaroo. Kangaroos are indigenous to Australia and New Guinea")
  ))
  (assert(animal (name "Koala Bear")
         (lifespan "13 – 18 years")
         (scientific-name "Phascolarctos cinereus")
         (diet "Mainly Eucalyptus leaves")
         (description "The koala or, inaccurately, koala bear is an arboreal herbivorous marsupial native to Australia. It is the only extant representative of the family Phascolarctidae and its closest living relatives are the wombats, which are members of the family Vombatidae")
  ))
)

;pouch no
(defrule pouch-no
(have-pouch no)
=>
(assert(animal (name "Mole")
         (lifespan "6 years")
         (scientific-name "Talpidae")
         (diet "Earthworms, insect larvae")
         (description "Moles are small mammals adapted to a subterranean lifestyle. They have cylindrical bodies, velvety fur, very small, inconspicuous ears and eyes, reduced hindlimbs, and short, powerful forelimbs with large paws adapted for digging")
  )))

;no breastfeed
defrule bird
(breastfeed no)
=>
  (assert(animal (name "Birds")
         (lifespan "Varies")
         (scientific-name "Aves")
         (diet "Insects, worms, fruits. Depedns on type")
         (description "Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton")
  ))
)

;if not warm blood
(defrule warm-blooded-no
(warm-blooded no)
=>
(printout t"Is your animal habitat is in water? (yes/no) ")
(assert(live-in-water(read))))

;if in water
(defrule live-in-water-yes
(live-in-water yes)
=>
(printout t "Does your animal have bone? (yes/no) ")
(assert(skeketon(read))))

;if have skeleton
(defrule skeketon-yes
(skeketon yes)
=>
(assert(animal (name "Fish")
         (lifespan "Varies")
         (scientific-name "Chondrichthyes")
         (diet "Some plankton, some hunt other fish and water creature.")
         (description "Fish are gill-bearing aquatic craniate animals that lack limbs with digits. They form a sister group to the tunicates, together forming the olfactores. Included in this definition are the living hagfish, lampreys, and cartilaginous and bony fish as well as various extinct related groups.")
  ))
)

;if no skeleton
(defrule boney-skeketon-no
(boney-skeketon no)
=>
(assert(animal (name "Shark")
         (lifespan "20 – 30 years")
         (scientific-name "Selachimorpha")
         (diet "Fishes, crustaceans, molluscs, marine mammals, and other sharks")
         (description "Sharks are a group of elasmobranch fish characterized by a cartilaginous skeleton, five to seven gill slits on the sides of the head, and pectoral fins that are not fused to the head. Modern sharks are classified within the clade Selachimorpha and are the sister group to the rays.")
  )))

;if not in water
(defrule live-in-water-no
(live-in-water no)
=>
(printout t "Is your animal have scaled skin? (yes/no) ")
(assert(scaled-skin(read))))

;scale skin
(defrule scaled-skin-yes
(scaled-skin yes)
=>
(printout t"Does the animal have a shell? (yes/no) ")
(assert(has-shell(read))))

;has shell
(defrule rounded-shell-yes
(has-shell yes)
=>
(printout t "Is the shell is rounded shape? (yes/no) " crlf)
(assert(rounded-shell(read)))
)

;rounded shell
(defrule rounded-shell-yes
(rounded-shell yes)
=>
(assert(animal (name "Turtle")
         (lifespan "20 and 30 years")
         (scientific-name "Chelonioidea")
         (diet "crabs, mollusks, shrimps, jellyfish, and vegetation")
         (description "Sea turtles, sometimes called marine turtles, are reptiles of the order Testudines and of the suborder Cryptodira.")
  ))
)

;not rounded shell
(defrule rounded-shell-no
(rounded-shell no)
=>
(assert(animal (name "Tortoise")
         (lifespan "150 years")
         (scientific-name "Manouria emys")
         (diet "earthworms, grubs, snails, beetles and caterpillars to grasses, fruit, berries, mushrooms and flowers")
         (description "The Asian forest tortoise, also known commonly as the Asian brown tortoise, is a species of tortoise in the family Testudinidae. The species is endemic to Southeast Asia. It is believed to be among the most primitive of living tortoises, based on molecular and morphological studies.")
  ))
)

;no shell
(defrule rounded-shell-no
(rounded-shell no)
=>
(printout t "Does your animal have limbs? (yes/no) " crlf)
(assert(have-limbs(read))))

;yes limb
(defrule have-limbs-yes
(have-limb yes)
=>
(assert(animal (name "Crocodile")
         (lifespan "70 years")
         (scientific-name "Crocodylinae")
         (diet "Insects, fish, small frogs, lizards, crustaceans and small mammals")
         (description "Crocodiles or true crocodiles are large semiaquatic reptiles that live throughout the tropics in Africa, Asia, the Americas and Australia. Crocodylinae, all of whose members are considered true crocodiles, is classified as a biological subfamily.")
  ))
)

;no limb
(defrule have-limbs-no
(have-limbs no)
=>
(assert(animal (name "Snake")
         (lifespan "Varies")
         (scientific-name "Serpentes")
         (diet "Rodents, insects, amphibians, eggs, other reptiles, slug")
         (description "Snakes are elongated, legless, carnivorous reptiles of the suborder Serpentes. Like all other squamates, snakes are ectothermic, amniote vertebrates covered in overlapping scales")
  ))
)

;no scale skin
(defrule scaled-skin-no
(scaled-skin no)
=>
(printout t"Is the animal usually jumping around? (yes/no) ")
(assert(animal-jump(read))))

;jump yes
(defrule jump-yes
(animal-jump yes)
=>
(assert(animal (name "Frog")
         (lifespan " 10 – 12 years")
         (scientific-name "Anura")
         (diet "Insects such as flies, mosquitoes, moths, dragonfiles, grasshopper, worms.")
         (description "A frog is any member of a diverse and largely carnivorous group of short-bodied, tailless amphibians composing the order Anura. The oldest fossil "proto-frog" appeared in the early Triassic of Madagascar, but molecular clock dating suggests their origins may extend further back to the Permian, 265 million years ago.")
  ))
)

;jump no
(defrule jump-no
(animal-jump no)
=>
(printout t"Does the animal has limb? (yes/no) ")
(assert(no-scale-limb(read))))

;have limb
(defrule no-scale-limb-yes
(no-scale-limb yes)
=>
(assert(animal (name "Salamender")
         (lifespan "25 – 30 kg")
         (scientific-name "Caudata")
         (diet "Small insects and other invertebrates")
         (description "Salamanders are a group of amphibians typically characterized by a lizard-like appearance, with slender bodies, blunt snouts, short limbs projecting at right angles to the body, and the presence of a tail in both larvae and adults. All 10 present-day salamander families are grouped together under the order Urodela.")
  ))
)

;no limb
(defrule no-scale-limb-no
(no-scale-limb no)
=>
(assert(animal (name "Eel")
         (lifespan "Mostly 5 years")
         (scientific-name "Anguilliformes")
         (diet "Fish, mollusks and other eels")
         (description "An eel is a ray-finned fish belonging to the order Anguilliformes, which consists of eight suborders, 19 families, 111 genera, and about 800 species. Eels undergo considerable development from the early larval stage to the eventual adult stage, and most are predators")
  ))
)

;rule to print the animal & its info. run last
(defrule print_animal
  (animal (name ?name)
         (lifespan ?lifespan)
         (scientific-name ?sn)
         (diet ?diet)
         (description ?desc))
=>
  (printout t "Animal: "
            ?name crlf
            "Lifespan: " ?lifespan crlf
            "Scientific name: " ?sn crlf
            "Diet: " ?diet crlf
            "Description: " ?desc crlf
))