//
//  CultureData.swift
//  Kalaido
//
//  Created by Viraaj Randhawa on 22/01/26.
//

import SwiftUI

/// Static data repository for all cultures and stories
enum CultureData {
    static let allCultures: [Culture] = [
        // 1. India
        Culture(
            name: "India",
            description: "A land of vibrant festivals, deep spirituality, and diverse traditions.",
            region: "South Asia",
            stories: [
                Story(
                    title: "Celebration",
                    country: "India",
                    paragraphs: [
                        "The smell hits me first. Marigolds and incense, mixing with the sweet smoke from the kitchen where my grandmother is frying jalebis.",
                        "I can hear her humming, the same tune she always hums during Diwali. My cousins are already here, laughing in the courtyard.",
                        "They're probably trying to light sparklers even though Baba said to wait until dark.",
                        "Maa calls me to help arrange the diyas. We place them carefully along the windowsills, dozens of small clay lamps.",
                        "When evening comes, we light the diyas together. The whole neighborhood glows. I can see other families on their balconies.",
                        "It is this. Being together. Being home."
                    ],
                    images: ["sparkles", "figure.2.and.child.holdinghands", "flame.fill"],
                    storableGradient: [
                        StorableColor(red: 0.95, green: 0.6, blue: 0.35),
                        StorableColor(red: 0.95, green: 0.5, blue: 0.65)
                    ],
                    culturalContext: "Diwali, the Festival of Lights, celebrates the victory of light over darkness."
                ),
                Story(
                    title: "The Monsoon",
                    country: "India",
                    paragraphs: [
                        "The first drops arrive in the afternoon, turning the dust into petrichor. That smell—earth meeting water after months of waiting.",
                        "My sister and I run to the terrace. Below, children pour into the streets, their mothers calling after them with umbrellas.",
                        "No one listens. Everyone just wants to feel the rain on their skin.",
                        "Dadi is already in the kitchen, preparing chai and pakoras. This is the ritual. Rain means hot tea and fried snacks.",
                        "We sit together by the window, watching sheets of water blur the city. The heat that pressed down on us for so long is finally broken.",
                        "This relief, this gratitude—it's in our bones. The monsoon doesn't just water the land. It waters us."
                    ],
                    images: ["cloud.rain.fill", "drop.fill", "cup.and.saucer.fill"],
                    storableGradient: [
                        StorableColor(red: 0.4, green: 0.6, blue: 0.8),
                        StorableColor(red: 0.5, green: 0.7, blue: 0.9)
                    ],
                    culturalContext: "The monsoon season brings relief from summer heat and is celebrated as a time of renewal and abundance."
                ),
                Story(
                    title: "Morning Prayers",
                    country: "India",
                    paragraphs: [
                        "I wake to the sound of temple bells from across the street. It's still dark, but Amma is already awake.",
                        "She's at the small altar in our living room, lighting a diya and placing fresh jasmine flowers near the deities.",
                        "I join her on the mat. She doesn't say anything, just hands me the prayer book. We sit in comfortable silence.",
                        "Outside, I can hear the milk vendor's bicycle bell and the rhythmic chanting from the temple growing louder.",
                        "This quiet hour, before the world rushes in, feels sacred. It's ours.",
                        "When we finish, Amma puts a small tilak on my forehead. Now the day can begin."
                    ],
                    images: ["flame.fill", "bell.fill", "sun.horizon.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.8, blue: 0.4),
                        StorableColor(red: 1.0, green: 0.9, blue: 0.6)
                    ],
                    culturalContext: "Daily prayer rituals connect individuals to the divine and provide a peaceful start to the day."
                )
            ]
        ),
        
        // 2. Japan
        Culture(
            name: "Japan",
            description: "Where harmony, respect, and ancient customs blend with modern life.",
            region: "East Asia",
            stories: [
                Story(
                    title: "The Tea Ceremony",
                    country: "Japan",
                    paragraphs: [
                        "Sensei kneels with perfect posture, her movements slow and deliberate. Every gesture has meaning.",
                        "She purifies each utensil with a silk cloth, the water simmering quietly in the iron kettle.",
                        "I watch how she whisks the matcha, the bamboo whisk creating a perfect froth. It takes years to master this simplicity.",
                        "When she offers me the bowl, I turn it twice in my palms, as she taught me. A small gesture of respect.",
                        "The tea is bitter, grassy, warm. But that's not the point. The point is being here, fully present.",
                        "In this small room, with these simple objects, there is only now."
                    ],
                    images: ["cup.and.saucer.fill", "leaf.fill", "circle.fill"],
                    storableGradient: [
                        StorableColor(red: 0.6, green: 0.7, blue: 0.95),
                        StorableColor(red: 0.75, green: 0.65, blue: 0.9)
                    ],
                    culturalContext: "The tea ceremony (chanoyu) embodies principles of harmony, respect, purity, and tranquility."
                ),
                Story(
                    title: "Cherry Blossoms",
                    country: "Japan",
                    paragraphs: [
                        "The sakura are blooming, and everyone is outside. Under the trees, families spread blue tarps and unpack bentos.",
                        "My grandmother sits on a folding chair, her eyes on the petals. She's seen seventy springs, but she still comes every year.",
                        "A breeze sends pink snow swirling around us. My niece tries to catch them, laughing.",
                        "The blossoms only last a week, maybe two. That's why we come. Because they're fleeting.",
                        "Obaasan tells me this is mono no aware—the gentle sadness of things passing.",
                        "We eat onigiri and drink sake and watch beauty disappear, grateful we were here to see it."
                    ],
                    images: ["tree.fill", "wind", "heart.fill"],
                    storableGradient: [
                        StorableColor(red: 1.0, green: 0.8, blue: 0.9),
                        StorableColor(red: 1.0, green: 0.9, blue: 0.95)
                    ],
                    culturalContext: "Hanami (flower viewing) celebrates the transient beauty of cherry blossoms and the acceptance of impermanence."
                ),
                Story(
                    title: "The Bathhouse",
                    country: "Japan",
                    paragraphs: [
                        "I scrub myself clean before entering the bath. This is the rule. You don't bring dirt into the water everyone shares.",
                        "The onsen is outdoor, surrounded by rocks and bamboo. Steam rises into the cold mountain air.",
                        "I sink in slowly, letting the heat work into my muscles. An old man nods at me from across the pool.",
                        "We don't speak. That's not what this is for. We just soak, watching snow fall on the mountains.",
                        "My father brought me here when I was young. His father brought him. The water is the same, from deep in the earth.",
                        "When I leave, my skin is red and tingling, but inside I feel completely still."
                    ],
                    images: ["drop.fill", "mountain.2.fill", "figure.seated.relax"],
                    storableGradient: [
                        StorableColor(red: 0.5, green: 0.7, blue: 0.9),
                        StorableColor(red: 0.7, green: 0.8, blue: 0.95)
                    ],
                    culturalContext: "Communal bathing in natural hot springs (onsen) is a ritual of purification and relaxation."
                )
            ]
        ),
        
        // 3. Italy
        Culture(
            name: "Italy",
            description: "A country of passion, art, delicious food, and strong family bonds.",
            region: "Europe",
            stories: [
                Story(
                    title: "Sunday Lunch",
                    country: "Italy",
                    paragraphs: [
                        "Nonna has been cooking since dawn. The kitchen smells like garlic, tomatoes, and basil—the holy trinity.",
                        "Everyone arrives at once. My aunts, uncles, cousins—all talking over each other, kissing cheeks, bringing wine.",
                        "The table barely fits in the dining room, but we squeeze in. Primo, secondo, contorno. Course after course.",
                        "My grandfather pours wine for everyone, even the teenagers, just a little. He raises his glass. 'Salute!'",
                        "We argue about football, politics, who makes the best tiramisu. My cousin's baby falls asleep in someone's arms.",
                        "Hours pass. No one is in a hurry. This is what Sunday is for. Being famiglia."
                    ],
                    images: ["fork.knife", "wineglass.fill", "heart.fill"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.3, blue: 0.3),
                        StorableColor(red: 0.9, green: 0.6, blue: 0.3)
                    ],
                    culturalContext: "Sunday family lunch is a sacred tradition, often lasting several hours with multiple courses."
                ),
                Story(
                    title: "Evening Passeggiata",
                    country: "Italy",
                    paragraphs: [
                        "Around six, the piazza fills with people. This is the passeggiata—the evening walk.",
                        "Old men in pressed shirts sit at the café, watching. Young mothers push strollers. Teenagers cluster by the fountain.",
                        "I walk arm-in-arm with my best friend, like we've done since we were small. We circle the square slowly.",
                        "Everyone sees everyone. Signora Bianchi waves from her balcony. The baker's son flirts with the girls.",
                        "We stop for gelato. Lemon for me, pistachio for her. We eat it slowly, gossiping about nothing important.",
                        "This ritual—being seen, seeing others, moving together—this is how we stay connected."
                    ],
                    images: ["figure.walk", "building.2.fill", "heart.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.7, blue: 0.5),
                        StorableColor(red: 0.95, green: 0.85, blue: 0.7)
                    ],
                    culturalContext: "The passeggiata is an evening social ritual where communities gather to walk, talk, and be seen."
                ),
                Story(
                    title: "The Opera Night",
                    country: "Italy",
                    paragraphs: [
                        "I'm wearing my grandmother's pearl necklace. The opera house is lit up like a jewel box.",
                        "Inside, the red velvet and gold leaf make me feel like I've stepped into another century.",
                        "We find our seats in the balcony. Below, the orchestra is tuning. The sound fills every corner.",
                        "The lights dim. The first notes rise, and I forget to breathe. This is Verdi—passion made sound.",
                        "Around me, people weep openly during the arias. No one is embarrassed. This is what we do.",
                        "When it ends, we applaud for ten minutes. Outside, we walk home still humming, still feeling it in our chests."
                    ],
                    images: ["music.note", "theatermasks.fill", "star.fill"],
                    storableGradient: [
                        StorableColor(red: 0.6, green: 0.1, blue: 0.2),
                        StorableColor(red: 0.8, green: 0.6, blue: 0.2)
                    ],
                    culturalContext: "Opera is deeply woven into Italian culture, expressing profound emotion and artistic excellence."
                )
            ]
        ),
        
        // 4. Nigeria
        Culture(
            name: "Nigeria",
            description: "A vibrant nation of diverse tribes, rich music, and strong community values.",
            region: "Africa",
            stories: [
                Story(
                    title: "Wedding Celebration",
                    country: "Nigeria",
                    paragraphs: [
                        "The bride emerges in layers of coral and gold aso-oke. The beads on her gele catch the light with every movement.",
                        "The drums start—talking drums that sound like a heartbeat, like conversation.",
                        "My aunties begin to dance, their shoulders moving in ways that make the young ones laugh and try to copy.",
                        "Money sprays through the air as people celebrate the couple. Naira notes flutter like confetti.",
                        "The DJ switches to Afrobeats and everyone surges to the dance floor. Young and old, we move as one.",
                        "This joy is communal. When one of us marries, we all celebrate. This is Ubuntu. I am because we are."
                    ],
                    images: ["figure.dance", "music.quarternote.3", "heart.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.6, blue: 0.2),
                        StorableColor(red: 0.8, green: 0.2, blue: 0.4)
                    ],
                    culturalContext: "Nigerian weddings are grand celebrations that unite families and communities with music, dance, and traditional attire."
                ),
                Story(
                    title: "Market Day",
                    country: "Nigeria",
                    paragraphs: [
                        "The market hums with life before the sun is fully up. My mother greets every vendor by name.",
                        "We stop at the fabric seller, running our hands over ankara prints—bold geometric patterns in every color imaginable.",
                        "The tomato seller calls out prices in Yoruba. A woman bargaining nearby switches between Hausa and English mid-sentence.",
                        "Mama buys dried fish, fresh pepper, palm oil. I carry the bags, stopping to taste a piece of chin-chin offered by an auntie.",
                        "This chaos is organized. Everyone knows their place, their role. The market is more than commerce.",
                        "It's where news is shared, where community happens, where we remember who we are together."
                    ],
                    images: ["basket.fill", "bag.fill", "person.3.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.5, blue: 0.2),
                        StorableColor(red: 0.7, green: 0.3, blue: 0.5)
                    ],
                    culturalContext: "Markets are vibrant social hubs where commerce, culture, and community intersect daily."
                ),
                Story(
                    title: "Moonlight Stories",
                    country: "Nigeria",
                    paragraphs: [
                        "After dinner, we gather in the compound. The adults bring out chairs, and we children sit on mats.",
                        "Papa begins a story about Anansi the spider. His voice rises and falls, and we lean in.",
                        "When he asks questions, we call back the answers in chorus. This is call and response, ancient as time.",
                        "My grandmother adds her own story, about a tortoise who tried to be clever and learned a hard lesson.",
                        "The moon is full overhead. Someone starts clapping a rhythm, and soon we're all joining in.",
                        "These stories aren't just entertainment. They teach us who to be, how to live. They connect us to those who came before."
                    ],
                    images: ["moon.stars.fill", "figure.seated.storytelling", "sparkles"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.2, blue: 0.4),
                        StorableColor(red: 0.5, green: 0.4, blue: 0.6)
                    ],
                    culturalContext: "Oral storytelling preserves cultural wisdom, values, and history across generations."
                )
            ]
        ),
        
        // 5. Mexico
        Culture(
            name: "Mexico",
            description: "Known for colorful traditions, delicious cuisine, and deep-rooted family values.",
            region: "North America",
            stories: [
                Story(
                    title: "Day of the Dead",
                    country: "Mexico",
                    paragraphs: [
                        "We build the ofrenda together, three tiers draped in papel picado that my sister cut by hand.",
                        "I place photos of Abuela at the center. Her favorite foods surround them: tamales, mole, pan dulce.",
                        "Marigold petals create a path from the door to the altar. Their scent is everywhere, guiding her home.",
                        "Mama lights copal incense. The smoke rises, carrying our prayers. We're not sad. We're welcoming her back.",
                        "That night, we go to the cemetery. Families everywhere have transformed graves into gardens of light.",
                        "We eat, we laugh, we tell stories about those who've gone. Death is not an ending. They live in our remembering."
                    ],
                    images: ["photo.fill", "flame.fill", "heart.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.5, blue: 0.2),
                        StorableColor(red: 0.8, green: 0.2, blue: 0.5)
                    ],
                    culturalContext: "Día de los Muertos honors deceased loved ones, celebrating their lives with ofrendas, food, and remembrance."
                ),
                Story(
                    title: "Fiesta in the Plaza",
                    country: "Mexico",
                    paragraphs: [
                        "The plaza is transformed. String lights crisscross overhead, and someone has set up a stage for the mariachi.",
                        "My prima pulls me toward the food stalls. Elotes roasting, churros frying, the smell of carnitas.",
                        "The music starts—trumpets bright as sunshine, guitars that make your heart ache in the best way.",
                        "Couples dance in the square. Little kids run between their legs. Old men argue about fútbol at the tables.",
                        "This is our town's saint's day, but it could be any celebration. We don't need much excuse for fiesta.",
                        "Someone hands me a cup of champurrado. It's thick, sweet, warm. I drink it and feel home in my bones."
                    ],
                    images: ["music.note", "figure.dance", "party.popper.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.3, blue: 0.3),
                        StorableColor(red: 1.0, green: 0.8, blue: 0.2)
                    ],
                    culturalContext: "Community celebrations bring towns together with music, dance, food, and shared joy."
                ),
                Story(
                    title: "Making Tortillas",
                    country: "Mexico",
                    paragraphs: [
                        "Abuela's hands move without thinking, pressing masa into perfect circles. I've watched her do this a thousand times.",
                        "She lets me try. My tortilla is lumpy, uneven. She doesn't criticize, just shows me again how to pat it flat.",
                        "The comal is hot enough that the tortilla puffs up with air, becoming something magical.",
                        "We stack them in a cloth to keep warm. The smell fills the kitchen—corn and earth and sustenance.",
                        "Later, we'll fill them with beans, with cheese, with whatever we have. But right now, they're perfect as they are.",
                        "This is what she's teaching me. Not just cooking. How to feed people, how to show love with your hands."
                    ],
                    images: ["hands.sparkles.fill", "circle.fill", "flame.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.8, blue: 0.5),
                        StorableColor(red: 0.8, green: 0.6, blue: 0.3)
                    ],
                    culturalContext: "Making tortillas by hand is a cherished skill passed through generations, representing care and tradition."
                )
            ]
        ),
        
        // 6. Brazil
        Culture(
            name: "Brazil",
            description: "A land of rhythm, rainforests, and a spirit of joy and resilience.",
            region: "South America",
            stories: [
                Story(
                    title: "Carnaval",
                    country: "Brazil",
                    paragraphs: [
                        "The drumbeat is in my chest, in my feet, in the air itself. The blocos fill the street with color and bodies.",
                        "I'm wearing feathers and sequins, paint on my face. Everyone is. We're all beautiful, all ridiculous, all free.",
                        "The samba school passes by, and the precision of their movement makes me stop breathing. Months of practice in every step.",
                        "A stranger hands me a cup of caipirinha. We dance together for one song, then they're gone into the crowd.",
                        "This is what people don't understand. Carnaval isn't escape. It's the most real thing we do.",
                        "For these days, we remember that joy is resistance, that beauty is survival, that we dance because we must."
                    ],
                    images: ["figure.dance", "music.quarternote.3", "sparkles"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.8, blue: 0.1),
                        StorableColor(red: 0.3, green: 0.7, blue: 0.3)
                    ],
                    culturalContext: "Carnaval is Brazil's most famous celebration, a explosion of music, dance, and cultural expression."
                ),
                Story(
                    title: "Beach Sunday",
                    country: "Brazil",
                    paragraphs: [
                        "On Sundays, all of Rio goes to the beach. It doesn't matter if you're rich or poor—the sand is for everyone.",
                        "I spread my canga on the warm sand. Around me, families set up chairs, coolers, umbrellas.",
                        "Vendors walk by calling out: 'Água de coco! Queijo! Biscoito!' Their voices are part of the rhythm of the day.",
                        "In the water, kids play futevôlei. The ball arcs perfectly over the net, and everyone on the beach watches the point.",
                        "As the sun gets lower, someone brings a guitar. A roda forms—people sitting in a circle, singing MPB.",
                        "The ocean, the music, the people. This is democracia. This is Brazil."
                    ],
                    images: ["beach.umbrella.fill", "water.waves", "figure.volleyball"],
                    storableGradient: [
                        StorableColor(red: 0.3, green: 0.6, blue: 0.9),
                        StorableColor(red: 1.0, green: 0.9, blue: 0.6)
                    ],
                    culturalContext: "Beach culture is central to Brazilian life, especially in coastal cities—a place of equality and community."
                ),
                Story(
                    title: "Feijoada Saturday",
                    country: "Brazil",
                    paragraphs: [
                        "My tia starts cooking feijoada on Friday night. The beans simmer for hours with pork, beef, and love.",
                        "By Saturday afternoon, the whole building can smell it. Neighbors start appearing at the door.",
                        "We set up tables in the courtyard. Someone brings farofa, someone brings couve, someone brings cachaça.",
                        "The pot sits in the center, and we serve ourselves family-style. The beans are dark, rich, perfect.",
                        "We eat slowly, talking and laughing. Music plays from someone's phone. Kids run around our feet.",
                        "This dish came from enslaved people making something beautiful from scraps. We honor that every time we gather like this."
                    ],
                    images: ["fork.knife", "flame.fill", "person.3.fill"],
                    storableGradient: [
                        StorableColor(red: 0.3, green: 0.2, blue: 0.1),
                        StorableColor(red: 0.6, green: 0.5, blue: 0.2)
                    ],
                    culturalContext: "Feijoada is Brazil's national dish, traditionally enjoyed on Saturdays with family and friends."
                )
            ]
        ),
        
        // 7. South Korea
        Culture(
            name: "South Korea",
            description: "Modern innovation meets ancient tradition in a culture of respect and community.",
            region: "East Asia",
            stories: [
                Story(
                    title: "Chuseok Harvest",
                    country: "South Korea",
                    paragraphs: [
                        "We drive to Busan for Chuseok, the highways packed with families heading to their hometowns.",
                        "Halmeoni has been preparing for days. Songpyeon—rice cakes shaped like half-moons—fill the kitchen.",
                        "I help her arrange fruit and rice on the table for charye, the ancestral ritual. Three years gone, we still set a place for Harabeoji.",
                        "We bow together, deep formal bows. My knees hurt, but this discomfort is respect made physical.",
                        "After the ceremony, we eat. The food we offered is now blessed, and it tastes different somehow. More important.",
                        "Later, cousins and I walk to the graves with fresh flowers. This is filial piety—remembering those who made us possible."
                    ],
                    images: ["leaf.fill", "figure.bow", "circle.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.8, blue: 0.5),
                        StorableColor(red: 0.7, green: 0.6, blue: 0.8)
                    ],
                    culturalContext: "Chuseok is Korea's harvest festival, a time for family reunions and honoring ancestors."
                ),
                Story(
                    title: "PC Bang Nights",
                    country: "South Korea",
                    paragraphs: [
                        "After hagwon finishes at ten, my friends and I head to the PC bang on the corner.",
                        "The owner knows us. He nods without looking up from his screen. We claim our usual computers in the back.",
                        "For the next three hours, we're in another world. Coordinating strategies, celebrating kills, groaning at defeats.",
                        "Someone orders ramyeon and it arrives at our stations, steaming. We eat between matches without pausing.",
                        "The bang is full of people—students like us, adults unwinding after work, couples on gaming dates.",
                        "This is our third space. Not home, not school. Here we're just ourselves, connected through screens and friendship."
                    ],
                    images: ["gamecontroller.fill", "person.3.fill", "moon.stars.fill"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.3, blue: 0.6),
                        StorableColor(red: 0.5, green: 0.2, blue: 0.5)
                    ],
                    culturalContext: "PC bangs (computer gaming cafés) are social hubs where gaming culture thrives day and night."
                ),
                Story(
                    title: "Kimchi Making Day",
                    country: "South Korea",
                    paragraphs: [
                        "Every November, the women in our building gather for kimjang—making enough kimchi for winter.",
                        "We meet in the courtyard with mountains of napa cabbage, already salted and softened overnight.",
                        "Eomma shows me how to spread the paste: gochugaru, garlic, ginger, jeotgal. My hands are red with pepper.",
                        "The ajummas gossip while they work, their hands moving with decades of practice. They pack the kimchi into huge earthenware pots.",
                        "This kimchi will ferment in our balcony, will feed us through the cold months, will taste better as time passes.",
                        "I'm learning more than a recipe. I'm learning that some things take time, that preservation is an act of love."
                    ],
                    images: ["leaf.fill", "hands.sparkles.fill", "snowflake"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.3, blue: 0.3),
                        StorableColor(red: 0.6, green: 0.8, blue: 0.4)
                    ],
                    culturalContext: "Kimjang is the communal making of kimchi for winter, a UNESCO-recognized cultural practice."
                )
            ]
        ),
        
        // 8. Morocco
        Culture(
            name: "Morocco",
            description: "A crossroads of cultures, known for intricate art, hospitality, and rich flavors.",
            region: "Africa",
            stories: [
                Story(
                    title: "Mint Tea Ritual",
                    country: "Morocco",
                    paragraphs: [
                        "My uncle pours the tea from high above the glass. The stream is silver, precise, unbroken.",
                        "This is an art form. The height creates foam, shows skill. The sweet mint aroma fills the courtyard.",
                        "We sit on cushions around the low table. Three glasses is tradition—the first is gentle, the second strong, the third bitter as death.",
                        "But we'll drink more than three. Tea time isn't measured in minutes. It's measured in conversation.",
                        "Neighbors stop by. They're offered tea immediately. This is hospitality—you never ask if someone wants tea. You simply serve it.",
                        "The afternoon dissolves into evening. The tea keeps flowing. This is how we slow time, how we build community."
                    ],
                    images: ["cup.and.saucer.fill", "leaf.fill", "person.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.3, green: 0.7, blue: 0.5),
                        StorableColor(red: 0.7, green: 0.6, blue: 0.3)
                    ],
                    culturalContext: "Mint tea service is a symbol of hospitality and friendship, steeped in ritual and tradition."
                ),
                Story(
                    title: "Souk Wandering",
                    country: "Morocco",
                    paragraphs: [
                        "The souk in Marrakech is a labyrinth. I follow my mother through narrow passages, dodging motorbikes and donkey carts.",
                        "Every corner reveals something new. Pyramids of spices—turmeric yellow, paprika red, cumin brown.",
                        "A carpet seller calls out, inviting us for tea. We shake our heads, smiling. He's not offended. It's just the dance.",
                        "The smell changes as we walk—leather in one alley, fresh bread in the next, cedar wood deeper in.",
                        "Mama negotiates for saffron. The price drops with each round of conversation. This, too, is ritual.",
                        "I could get lost here for hours. But I'm not lost. This chaos has an order, and my mother knows every inch."
                    ],
                    images: ["building.2.fill", "bag.fill", "sparkles"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.5, blue: 0.2),
                        StorableColor(red: 0.9, green: 0.7, blue: 0.3)
                    ],
                    culturalContext: "The souk (marketplace) is the beating heart of Moroccan cities, a place of commerce and social connection."
                ),
                Story(
                    title: "Hammam Day",
                    country: "Morocco",
                    paragraphs: [
                        "Friday is hammam day. My grandmother and I walk to the neighborhood bathhouse, carrying our bucket and black soap.",
                        "Inside, the heat hits immediately. Steam and marble and the sound of water echoing.",
                        "Women of all ages sit on the warm floor, scrubbing each other's backs with kessa gloves.",
                        "The tayaba approaches with her bucket. She scrubs me until I'm pink, until layers of dead skin roll away.",
                        "Then the cool room, where we rest and my grandmother braids my wet hair, gossiping with her friends.",
                        "I feel new. Clean in a way that goes deeper than skin. Connected to every woman in this room, in this tradition."
                    ],
                    images: ["drop.fill", "sparkles", "figure.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.6, green: 0.8, blue: 0.9),
                        StorableColor(red: 0.8, green: 0.7, blue: 0.8)
                    ],
                    culturalContext: "The hammam (traditional bathhouse) is a weekly ritual of cleansing, community, and women's social bonding."
                )
            ]
        ),
        
        // 9. France
        Culture(
            name: "France",
            description: "Famed for its art, cuisine, and elegant approach to daily life.",
            region: "Europe",
            stories: [
                Story(
                    title: "Market Morning",
                    country: "France",
                    paragraphs: [
                        "The marché opens at seven, and Grand-mère is there at seven-oh-five, her wicker basket over her arm.",
                        "She greets every vendor by name. The cheese maker cuts her a sliver of Comté to taste. She considers it seriously.",
                        "We choose vegetables like they're precious—examining each tomato for ripeness, pressing gently on the melons.",
                        "At the boulangerie, she buys a baguette still warm from the oven. By the time we're home, we've eaten the end.",
                        "This shopping isn't a chore. It's how she ensures quality, supports neighbors, maintains tradition.",
                        "Tonight's dinner starts here, in these conversations, in this careful selection. Food is respect made edible."
                    ],
                    images: ["basket.fill", "leaf.fill", "croissant.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.8, blue: 0.6),
                        StorableColor(red: 0.7, green: 0.7, blue: 0.8)
                    ],
                    culturalContext: "Fresh markets are central to French culture, emphasizing quality ingredients and community relationships."
                ),
                Story(
                    title: "Café Philosophy",
                    country: "France",
                    paragraphs: [
                        "I order a café crème and claim a table by the window. The waiter doesn't rush me. He never will.",
                        "This is my Saturday ritual. A small table, a notebook, the ambient sound of French conversations flowing around me.",
                        "An old man reads Le Monde at the next table. A couple argues passionately about cinema. A student types on a laptop.",
                        "The café is a public living room. We're alone together, each in our own world but sharing the same space.",
                        "Two hours pass. I've had one coffee. Nobody cares. The café is for lingering, for thinking, for being.",
                        "When I finally leave, I feel refreshed in a way that has nothing to do with caffeine."
                    ],
                    images: ["cup.and.saucer.fill", "book.fill", "building.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.3, green: 0.2, blue: 0.1),
                        StorableColor(red: 0.6, green: 0.5, blue: 0.4)
                    ],
                    culturalContext: "Café culture is fundamental to French social and intellectual life, a space for conversation and contemplation."
                ),
                Story(
                    title: "Bastille Day",
                    country: "France",
                    paragraphs: [
                        "The entire city turns out for the parade. Tanks roll down the Champs-Élysées, planes paint the sky red, white, and blue.",
                        "My father lifts my little brother onto his shoulders. Around us, people wave flags and sing La Marseillaise.",
                        "This is more than patriotism. It's remembering what people fought for—liberté, égalité, fraternité.",
                        "That evening, we picnic on the Champ de Mars. Every blanket is crowded with families, wine, cheese, baguettes.",
                        "When the fireworks start, exploding above the Eiffel Tower, the whole field gasps as one.",
                        "I feel it—that strange unity of being part of something bigger, older, ongoing. We are France."
                    ],
                    images: ["flag.fill", "fireworks", "figure.2.and.child.holdinghands"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.3, blue: 0.7),
                        StorableColor(red: 0.8, green: 0.2, blue: 0.2)
                    ],
                    culturalContext: "Bastille Day celebrates the French Revolution and the values of liberty, equality, and fraternity."
                )
            ]
        ),
        
        // 10. China
        Culture(
            name: "China",
            description: "An ancient civilization with rich history, philosophy, and family-centered values.",
            region: "East Asia",
            stories: [
                Story(
                    title: "Spring Festival",
                    country: "China",
                    paragraphs: [
                        "The train is packed with migrant workers heading home for Spring Festival. Everyone clutching bags of gifts.",
                        "Nǎinai has been cooking for three days. Dumplings shaped like gold ingots for wealth. Fish for abundance. Noodles for longevity.",
                        "We paste red couplets on the doorframe, the characters written in perfect calligraphy by my uncle.",
                        "At midnight, fireworks explode across the city. The noise is incredible, meant to scare away bad spirits.",
                        "We give red envelopes to the children. They bow and offer New Year greetings in their best Mandarin.",
                        "The old year is swept away. The new year arrives full of hope. This reunion is everything."
                    ],
                    images: ["envelope.fill", "fireworks", "fork.knife"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.2, blue: 0.2),
                        StorableColor(red: 1.0, green: 0.8, blue: 0.2)
                    ],
                    culturalContext: "Spring Festival (Chinese New Year) is the most important holiday, centered on family reunion and renewal."
                ),
                Story(
                    title: "Morning Tai Chi",
                    country: "China",
                    paragraphs: [
                        "The park fills with people before dawn. Mostly elderly, moving through tai chi forms in perfect unison.",
                        "My grandfather motions for me to join. I copy his movements—slow, deliberate, like moving through water.",
                        "He's been doing this for forty years. The same forms, the same park, often with the same people.",
                        "Around us, others practice calligraphy on the pavement with water brushes. The characters disappear as they dry.",
                        "This is meditation in motion. No one is in a hurry. The city rushes past, but here we move with intention.",
                        "When we finish, he smiles. 'Every day,' he says. 'This is how we cultivate qi, how we stay balanced.'"
                    ],
                    images: ["figure.mind.and.body", "leaf.fill", "sun.horizon.fill"],
                    storableGradient: [
                        StorableColor(red: 0.5, green: 0.7, blue: 0.5),
                        StorableColor(red: 0.8, green: 0.8, blue: 0.6)
                    ],
                    culturalContext: "Tai chi practice in public parks reflects values of health, harmony, and community wellness."
                ),
                Story(
                    title: "Tea House Stories",
                    country: "China",
                    paragraphs: [
                        "The teahouse has been here for a hundred years. Bird cages hang from the ceiling, canaries singing.",
                        "Old men sit at wooden tables, their tea cups refilled constantly by waiters in traditional jackets.",
                        "Yéye brings me here on Saturdays. We order jasmine tea and sunflower seeds, settling in for hours.",
                        "A storyteller takes the stage, his voice rising and falling as he recounts tales from the Three Kingdoms.",
                        "Everyone knows these stories by heart, but we listen anyway. It's not about the plot. It's about being here.",
                        "This is living history. These same tables, same tea, same stories, connecting us to centuries of people who sat exactly where we sit."
                    ],
                    images: ["cup.and.saucer.fill", "bird.fill", "figure.seated.storytelling"],
                    storableGradient: [
                        StorableColor(red: 0.6, green: 0.7, blue: 0.5),
                        StorableColor(red: 0.8, green: 0.9, blue: 0.7)
                    ],
                    culturalContext: "Traditional teahouses serve as social spaces where oral traditions and community bonds are maintained."
                )
            ]
        ),
        
        // 11. USA
        Culture(
            name: "USA",
            description: "A melting pot of cultures, known for innovation and diversity.",
            region: "North America",
            stories: [
                Story(
                    title: "Road Trip",
                    country: "USA",
                    paragraphs: [
                        "We load the car at sunrise. Cooler in the trunk, playlist queued, three bags of chips already open.",
                        "The highway stretches empty ahead. My best friend has her feet on the dashboard, singing off-key to songs we've known forever.",
                        "We stop at a roadside diner in the middle of nowhere. Red vinyl booths, unlimited coffee, pie that tastes like someone's grandmother made it.",
                        "The waitress calls us 'hon' and refills our cups without asking. This kindness from strangers is its own kind of American dream.",
                        "Back on the road, windows down, warm air rushing through. We're not in a hurry to get anywhere.",
                        "This is freedom—the open road, the possibility of just driving, the sense that America is big enough to get lost in."
                    ],
                    images: ["car.fill", "road.lanes", "cup.and.saucer.fill"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.4, blue: 0.8),
                        StorableColor(red: 0.8, green: 0.6, blue: 0.3)
                    ],
                    culturalContext: "Road trips embody American ideals of freedom, exploration, and the open frontier."
                ),
                Story(
                    title: "Thanksgiving",
                    country: "USA",
                    paragraphs: [
                        "The house smells like roasting turkey and pie—pumpkin, apple, pecan. My mom has been cooking since yesterday.",
                        "Family arrives in waves. Cousins I haven't seen in a year. My uncle who always brings too much wine.",
                        "We squeeze around a table that's too small, chairs from three different rooms. Someone says grace.",
                        "When we go around saying what we're thankful for, my little niece says 'mashed potatoes' and everyone laughs.",
                        "The football game plays in the background. Half of us watch, half of us ignore it completely.",
                        "This gathering, this abundance, this taking a moment to recognize what we have—it's imperfect, it's ours, it's grateful."
                    ],
                    images: ["fork.knife", "heart.fill", "leaf.fill"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.4, blue: 0.2),
                        StorableColor(red: 0.9, green: 0.6, blue: 0.3)
                    ],
                    culturalContext: "Thanksgiving centers on gratitude, family, and sharing a meal together."
                ),
                Story(
                    title: "Jazz Night",
                    country: "USA",
                    paragraphs: [
                        "The club is underground, literally. We descend stairs into a room thick with smoke and sound.",
                        "The quartet is mid-song when we arrive. The saxophone player's eyes are closed, improvising, finding notes that don't exist on paper.",
                        "Everyone in here is listening—really listening. You can feel the attention, the respect for the music.",
                        "This is New Orleans' gift to the world. Music born from pain and joy mixed together, refusing to be one or the other.",
                        "Between sets, strangers buy each other drinks. We talk about the solo, about the drummer's timing, about what jazz means.",
                        "When I leave, my ears are ringing and my soul feels full. This is American music—improvised, diverse, free."
                    ],
                    images: ["music.quarternote.3", "moon.stars.fill", "figure.seated.relax"],
                    storableGradient: [
                        StorableColor(red: 0.1, green: 0.1, blue: 0.3),
                        StorableColor(red: 0.5, green: 0.2, blue: 0.6)
                    ],
                    culturalContext: "Jazz represents American innovation, cultural fusion, and the art of improvisation."
                )
            ]
        ),
        
        // 12. Kenya
        Culture(
            name: "Kenya",
            description: "Heart of the savannah, home to diverse tribes and breathtaking wildlife.",
            region: "Africa",
            stories: [
                Story(
                    title: "Safari Dawn",
                    country: "Kenya",
                    paragraphs: [
                        "We wake at four-thirty, when the savannah is still dark and cold. The Land Cruiser's engine sputters to life.",
                        "As the sun rises, the grassland turns gold. A herd of elephants crosses our path, unhurried, majestic.",
                        "Our guide stops the vehicle and points. In the distance, a pride of lions rests under an acacia tree.",
                        "This is my country's heritage—wildlife that people travel across the world to see, that we work to protect.",
                        "A giraffe leans down to eat from a tree, its movements impossibly graceful. My daughter gasps, and I remember my first safari.",
                        "This land, these animals—they are part of our identity, our responsibility, our pride."
                    ],
                    images: ["pawprint.fill", "sun.max.fill", "binoculars.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.7, blue: 0.3),
                        StorableColor(red: 0.6, green: 0.4, blue: 0.2)
                    ],
                    culturalContext: "Wildlife conservation and safari tourism are integral to Kenya's national identity and economy."
                ),
                Story(
                    title: "Marathon Running",
                    country: "Kenya",
                    paragraphs: [
                        "Training starts at five in the morning, when the air is thin and cool. We run as a group through the highlands.",
                        "These roads have produced champions—Kipchoge, Kosgei, names that echo around the world.",
                        "But we're not all Olympians. We're teachers, farmers, students. We run because running is in our blood.",
                        "The altitude here in Iten makes our lungs strong. The red earth makes our legs powerful.",
                        "My coach shouts encouragement in Kalenjin. 'Pamat! Pamat!' Keep going. Don't stop.",
                        "When we finish, twenty kilometers later, we've earned our breakfast. This discipline, this endurance—it shapes everything we do."
                    ],
                    images: ["figure.run", "mountain.2.fill", "medal.fill"],
                    storableGradient: [
                        StorableColor(red: 0.1, green: 0.1, blue: 0.1),
                        StorableColor(red: 0.8, green: 0.2, blue: 0.2)
                    ],
                    culturalContext: "Kenyan long-distance running excellence is rooted in culture, geography, and dedicated training."
                ),
                Story(
                    title: "Beadwork Patterns",
                    country: "Kenya",
                    paragraphs: [
                        "Mama sits in the shade, threading tiny beads onto wire. Her fingers move quickly, creating patterns she learned from her mother.",
                        "Each color means something. Red is bravery. Blue is energy. White is peace. The patterns tell stories.",
                        "She's making a necklace for my sister's coming-of-age ceremony. The design is traditional Maasai, precise and meaningful.",
                        "I try to help, but my fingers are clumsy. She smiles patiently, showing me again how to keep the tension even.",
                        "These beads will be worn at the ceremony, will mark my sister's transition, will become part of our family's history.",
                        "This is more than jewelry. It's identity, culture, connection to our ancestors made visible."
                    ],
                    images: ["circle.grid.hex.fill", "paintpalette.fill", "sparkles"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.1, blue: 0.1),
                        StorableColor(red: 1.0, green: 0.9, blue: 0.2)
                    ],
                    culturalContext: "Beadwork carries deep cultural significance, with colors and patterns conveying meaning and identity."
                )
            ]
        ),
        
        // 13. Peru
        Culture(
            name: "Peru",
            description: "Land of the Incas, high mountains, and rich textiles.",
            region: "South America",
            stories: [
                Story(
                    title: "Machu Picchu",
                    country: "Peru",
                    paragraphs: [
                        "We climb through the mist at dawn. The ancient stone steps are worn smooth by centuries of feet.",
                        "When the clouds lift, there it is—Machu Picchu, suspended between earth and sky.",
                        "Our guide speaks in Quechua first, then Spanish. This is sacred ground. The Inca built in harmony with the mountains.",
                        "I touch the perfectly fitted stones, no mortar holding them together. Just precision, just understanding.",
                        "Around me, tourists take photos. But I just stand, feeling the weight of history, of ancestors, of continuity.",
                        "This place reminds us: we were here, we built magnificently, we endure."
                    ],
                    images: ["mountain.2.fill", "cloud.fog.fill", "building.columns.fill"],
                    storableGradient: [
                        StorableColor(red: 0.4, green: 0.6, blue: 0.4),
                        StorableColor(red: 0.5, green: 0.5, blue: 0.5)
                    ],
                    culturalContext: "Machu Picchu symbolizes Incan achievement and Peru's ancient heritage."
                ),
                Story(
                    title: "Weaving Tradition",
                    country: "Peru",
                    paragraphs: [
                        "Abuela's loom has been in our family for four generations. The wood is smooth from constant use.",
                        "She works with alpaca wool, dyed with plants she gathered in the mountains. Each color is earned from the earth.",
                        "The pattern she's creating is ancient—geometric shapes that represent our village, our history, our cosmology.",
                        "She teaches me the same way she was taught, with patience and repetition. 'Feel the rhythm,' she says. 'The weaving is breathing.'",
                        "My textile won't be as fine as hers. But that's okay. I'm learning more than a craft.",
                        "I'm learning how to be patient, how to honor tradition, how to create something that carries meaning."
                    ],
                    images: ["scissors", "circle.hexagongrid.fill", "hands.sparkles.fill"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.4, blue: 0.2),
                        StorableColor(red: 0.9, green: 0.2, blue: 0.4)
                    ],
                    culturalContext: "Traditional weaving preserves Andean culture, with patterns carrying ancestral knowledge and identity."
                ),
                Story(
                    title: "Potato Harvest",
                    country: "Peru",
                    paragraphs: [
                        "We harvest potatoes in May, when the earth has given all it can for this season.",
                        "Peru has over three thousand varieties of potato. Some are sweet, some bitter, some purple, some yellow.",
                        "The community gathers to help. We dig with our hands, placing the potatoes gently in woven baskets.",
                        "Before we begin, my father pours chicha on the ground. An offering to Pachamama, Mother Earth.",
                        "The potatoes will be dried, stored, cooked a hundred different ways. They are survival, tradition, identity.",
                        "From these mountains, the potato traveled to the world. But here, it is still sacred."
                    ],
                    images: ["leaf.fill", "hands.sparkles.fill", "mountain.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.6, green: 0.4, blue: 0.2),
                        StorableColor(red: 0.8, green: 0.7, blue: 0.5)
                    ],
                    culturalContext: "The potato, native to Peru, is central to Andean agriculture and spiritual practice."
                )
            ]
        ),
        
        // 14. Spain
        Culture(
            name: "Spain",
            description: "Famous for its passion, flamenco, and relaxed lifestyle.",
            region: "Europe",
            stories: [
                Story(
                    title: "Flamenco",
                    country: "Spain",
                    paragraphs: [
                        "The tablao is dark except for the spotlight on the stage. The guitarist begins, and silence falls like a weight.",
                        "The dancer emerges. Her dress is red, her face fierce. She stamps once, and the sound cracks through the room.",
                        "This is duende—the spirit that possesses you. Not technique, but something deeper, rawer.",
                        "The palmas begin—hands clapping in complex rhythms. The singer's voice is rough, full of yearning.",
                        "The dancer spins, her dress blooming. Faster, harder, the zapateado like thunder.",
                        "When she finishes, sweating and breathless, we erupt. This is passion made visible. This is Spain."
                    ],
                    images: ["figure.dance", "hands.clap.fill", "flame.fill"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.1, blue: 0.1),
                        StorableColor(red: 0.2, green: 0.2, blue: 0.2)
                    ],
                    culturalContext: "Flamenco is an art form expressing deep emotion through dance, music, and song."
                ),
                Story(
                    title: "Siesta",
                    country: "Spain",
                    paragraphs: [
                        "At two in the afternoon, the city goes quiet. Shops close. Streets empty. Everyone goes home.",
                        "We eat a long lunch—three courses, wine, conversation that stretches. No one is watching the clock.",
                        "After, I lie on the couch. The shutters are closed against the heat. The apartment is cool, dim.",
                        "I don't always sleep. Sometimes I just rest, letting my mind drift, letting the afternoon slow down.",
                        "This isn't laziness. It's wisdom. Why fight the hottest part of the day? Why not rest and return refreshed?",
                        "At five, the city wakes again. Recharged. Ready. Living according to human rhythms, not machines."
                    ],
                    images: ["bed.double.fill", "sun.max.fill", "moon.zzz.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.8, blue: 0.6),
                        StorableColor(red: 1.0, green: 0.9, blue: 0.8)
                    ],
                    culturalContext: "The siesta reflects a lifestyle that values rest, family time, and working with natural rhythms."
                ),
                Story(
                    title: "Tapas Hopping",
                    country: "Spain",
                    paragraphs: [
                        "We start at Bar Antonio, where the olives are the best in Seville. One drink, one tapa. We stand at the bar.",
                        "Then we move to La Esquina for their jamón. Paper-thin slices that melt on your tongue.",
                        "This is how we eat dinner—many small stops, many small plates, always standing, always moving.",
                        "Each bar has its specialty. Each has its regulars. The bartenders know our orders before we speak.",
                        "We run into friends at every stop. Conversations overlap, groups merge and separate. The night stretches.",
                        "It's not about the food, though the food is perfect. It's about community, about the street as living room."
                    ],
                    images: ["fork.knife", "wineglass.fill", "figure.walk"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.6, blue: 0.2),
                        StorableColor(red: 0.6, green: 0.2, blue: 0.2)
                    ],
                    culturalContext: "Tapas culture turns eating into a social journey through neighborhoods and communities."
                )
            ]
        ),
        
        // 15. Greece
        Culture(
            name: "Greece",
            description: "Cradle of western civilization, blue seas, and ancient myths.",
            region: "Europe",
            stories: [
                Story(
                    title: "Island Life",
                    country: "Greece",
                    paragraphs: [
                        "I wake to whitewashed walls and blue shutters. Beyond my window, the Aegean stretches forever.",
                        "Breakfast is simple—bread, olive oil, tomatoes from the garden, feta from a neighbor's goats.",
                        "The morning is for swimming. The water is impossibly blue, impossibly clear. I float on my back, weightless.",
                        "Afternoons, the village sleeps. I read in the shade, listening to the wind chimes and distant church bells.",
                        "Evenings, everyone gathers in the plateia. Old men play tavli, children run between tables, we eat grilled fish.",
                        "This simplicity isn't poverty. It's philosophy. Strip away the unnecessary. Live with what matters."
                    ],
                    images: ["house.fill", "water.waves", "sun.max.fill"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.6, blue: 0.9),
                        StorableColor(red: 1.0, green: 1.0, blue: 1.0)
                    ],
                    culturalContext: "Greek island life embodies values of simplicity, community, and connection to the sea."
                ),
                Story(
                    title: "Olive Harvest",
                    country: "Greece",
                    paragraphs: [
                        "The olive trees are older than anyone alive. Some have been here a thousand years, still producing.",
                        "We spread nets beneath the branches. My grandfather uses a long pole to shake the olives loose.",
                        "They rain down like hail—green, purple, black. We gather them carefully, checking each one.",
                        "At the press, the smell is overwhelming. Earthy, fruity, green. Liquid gold pours into jars.",
                        "This oil will feed us for a year. It connects us to this land, to these trees, to ancestors who did exactly this.",
                        "Pappous pours some on bread for me to taste. Fresh olive oil, sea salt. This is Greece distilled."
                    ],
                    images: ["leaf.fill", "drop.fill", "tree.fill"],
                    storableGradient: [
                        StorableColor(red: 0.5, green: 0.6, blue: 0.3),
                        StorableColor(red: 0.8, green: 0.8, blue: 0.4)
                    ],
                    culturalContext: "Olive harvesting is an ancient practice connecting Greeks to their land and heritage."
                ),
                Story(
                    title: "Panigiri Festival",
                    country: "Greece",
                    paragraphs: [
                        "The village festival starts after church. Tables fill the square, everyone bringing food to share.",
                        "The band sets up—bouzouki, clarinet, violin. They play the old songs, the ones everyone knows.",
                        "My yiayia grabs my hand and pulls me into the circle. We dance kalamatianos, arms linked, stepping in unison.",
                        "The circle grows. Young and old, locals and visitors, all moving together. This is democracy in motion.",
                        "Wine flows freely. Laughter rises. Someone smashes a plate—for joy, for celebration, for life.",
                        "As the night deepens, I feel it: this connection, this tradition, these people. This is who we are."
                    ],
                    images: ["figure.dance", "music.note", "building.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.4, blue: 0.8),
                        StorableColor(red: 0.9, green: 0.9, blue: 0.9)
                    ],
                    culturalContext: "Village festivals (panigiri) celebrate saints' days with food, dance, and communal joy."
                )
            ]
        ),
        
        // 16. Turkey
        Culture(
            name: "Turkey",
            description: "Where East meets West, famous for bazaars and tea.",
            region: "Eurasia",
            stories: [
                Story(
                    title: "Grand Bazaar",
                    country: "Turkey",
                    paragraphs: [
                        "The bazaar is a labyrinth of four thousand shops under vaulted ceilings painted with centuries of history.",
                        "Light streams through small windows, catching on brass lamps, silk carpets, gold jewelry.",
                        "A carpet seller beckons me in. Within minutes, I'm sitting on cushions, drinking apple tea, while he unfurls carpets.",
                        "Each one has a story—where it's from, who made it, what the symbols mean. He's not pushy. This is conversation.",
                        "I don't buy anything today. But I'll come back. The bazaar is a relationship, not a transaction.",
                        "This commerce, this ritual of tea and talk—it's been happening here for five hundred years."
                    ],
                    images: ["lightbulb.fill", "bag.fill", "building.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.6, blue: 0.2),
                        StorableColor(red: 0.6, green: 0.2, blue: 0.2)
                    ],
                    culturalContext: "The Grand Bazaar represents centuries of trade, craftsmanship, and the art of commerce as relationship."
                ),
                Story(
                    title: "Turkish Coffee",
                    country: "Turkey",
                    paragraphs: [
                        "My neighbor invites me for coffee. This is not casual—coffee means time, conversation, friendship.",
                        "She prepares it in a cezve, the foam rising three times. The smell is intense—cardamom and smoke.",
                        "We sit on her balcony overlooking the Bosphorus. Ships pass between continents. We sip slowly.",
                        "When we finish, she turns my cup upside down. After it cools, she reads the grounds.",
                        "'A journey,' she says, pointing to patterns. 'Someone from your past.' The details don't matter. The ritual does.",
                        "Coffee is an excuse for connection, for slowing down, for being present with another person."
                    ],
                    images: ["cup.and.saucer.fill", "sparkles", "figure.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.4, green: 0.2, blue: 0.1),
                        StorableColor(red: 0.6, green: 0.4, blue: 0.3)
                    ],
                    culturalContext: "Turkish coffee service is a social ritual representing hospitality and the value of conversation."
                ),
                Story(
                    title: "Hammam",
                    country: "Turkey",
                    paragraphs: [
                        "The hammam is five hundred years old. Domed ceilings, marble everywhere, the sound of water echoing.",
                        "I lie on the hot göbektaşı, the heated stone platform. Steam rises around me. I'm sweating out everything.",
                        "The tellak arrives with a kese glove. He scrubs me until my skin is red, until layers I didn't know existed peel away.",
                        "Then foam—mountains of foam from olive oil soap. He washes me like a child. There's no embarrassment, only care.",
                        "Afterward, wrapped in towels, I drink cold ayran. I feel lighter, cleaner, new.",
                        "This cleansing is physical, yes. But it's also spiritual. A reset. A reminder that we're worth this care."
                    ],
                    images: ["drop.fill", "cloud.fog.fill", "sparkles"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.9, blue: 0.9),
                        StorableColor(red: 0.7, green: 0.8, blue: 0.9)
                    ],
                    culturalContext: "The hammam (Turkish bath) is a ritual of purification, relaxation, and self-care."
                )
            ]
        ),
        
        // 17. Thailand
        Culture(
            name: "Thailand",
            description: "Land of Smiles, known for temples, street food, and beaches.",
            region: "Southeast Asia",
            stories: [
                Story(
                    title: "Songkran",
                    country: "Thailand",
                    paragraphs: [
                        "Thai New Year means water. Buckets, hoses, super soakers—everyone is armed.",
                        "I step outside and I'm immediately soaked. A grandmother with a bucket laughs as she drenches me.",
                        "This isn't just fun. It's washing away the old year, cleansing ourselves for the new beginning.",
                        "We visit the temple first, pouring water over Buddha statues, receiving blessings from the monks.",
                        "Then to the streets, where chaos reigns. Strangers become friends through water fights. Everyone is equal, everyone is wet.",
                        "By evening, I'm exhausted and happy. Tomorrow will be new, clean, full of possibility."
                    ],
                    images: ["drop.fill", "figure.run", "sparkles"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.6, blue: 0.9),
                        StorableColor(red: 0.4, green: 0.8, blue: 1.0)
                    ],
                    culturalContext: "Songkran celebrates the Thai New Year with water symbolizing purification and renewal."
                ),
                Story(
                    title: "Night Market",
                    country: "Thailand",
                    paragraphs: [
                        "The night market awakens as the sun sets. Fluorescent lights flicker on, vendors calling out their specialties.",
                        "I navigate through crowds, my senses overwhelmed. Grilled meats, fresh mango, the sweet funk of durian.",
                        "At one stall, a woman makes pad thai in a massive wok, flames leaping. She serves it in banana leaf.",
                        "I eat standing up, the noodles perfect—sweet, sour, spicy all at once. This costs thirty baht. This is art.",
                        "I browse shirts, jewelry, knock-off watches. A man sells crickets by the bag. Everything exists here.",
                        "The market is Thailand compressed—chaotic, delicious, warm, alive."
                    ],
                    images: ["cart.fill", "lightbulb.fill", "fork.knife"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.2, blue: 0.4),
                        StorableColor(red: 0.9, green: 0.8, blue: 0.2)
                    ],
                    culturalContext: "Night markets are social and economic centers, showcasing Thai street food culture and commerce."
                ),
                Story(
                    title: "Temple Offering",
                    country: "Thailand",
                    paragraphs: [
                        "I wake early to give alms to the monks. They walk in a line, orange robes bright in the dawn.",
                        "I kneel on the sidewalk with my mother, our heads bowed. We place rice in their bowls.",
                        "They don't thank us. We thank them—for accepting our offering, for giving us the chance to make merit.",
                        "This is how we earn good karma, how we connect to Buddhism in our daily lives.",
                        "Inside the temple, we light incense, offer flowers, pray before the golden Buddha.",
                        "This practice—every morning, every temple—is what makes Thailand the Land of Smiles. We know what matters."
                    ],
                    images: ["building.columns.fill", "hands.sparkles.fill", "flame.fill"],
                    storableGradient: [
                        StorableColor(red: 1.0, green: 0.8, blue: 0.2),
                        StorableColor(red: 0.9, green: 0.5, blue: 0.2)
                    ],
                    culturalContext: "Daily alms-giving and temple visits reflect the central role of Buddhism in Thai life."
                )
            ]
        ),
        
        // 18. Egypt
        Culture(
            name: "Egypt",
            description: "Home of pharaohs, the Nile, and timeless history.",
            region: "Africa",
            stories: [
                Story(
                    title: "The Nile",
                    country: "Egypt",
                    paragraphs: [
                        "We take the felucca out at sunset. The white sail catches the wind, and we glide along water that has flowed for millennia.",
                        "My grandfather tells me stories his grandfather told him—about floods that brought life, about the river as a god.",
                        "On the banks, palm trees sway. A farmer guides water into his fields using methods unchanged for centuries.",
                        "The Nile is Egypt. Without it, we are desert. With it, we are civilization.",
                        "As the sun sets, painting everything gold and purple, I understand what he means.",
                        "This river made us who we are. Everything we've built, everything we are—it all flows from this water."
                    ],
                    images: ["sailboat.fill", "water.waves", "sun.horizon.fill"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.4, blue: 0.8),
                        StorableColor(red: 0.9, green: 0.6, blue: 0.3)
                    ],
                    culturalContext: "The Nile River is central to Egyptian civilization, identity, and survival."
                ),
                Story(
                    title: "Pyramids at Dawn",
                    country: "Egypt",
                    paragraphs: [
                        "We arrive before the tourists, when the pyramids are still in shadow.",
                        "I've lived in Cairo my whole life, but I never tire of seeing them. How could you?",
                        "These stones were placed by my ancestors four thousand years ago. They've survived everything.",
                        "A tour guide explains to visitors about burial chambers and astronomical alignments. But that's not what I feel.",
                        "I feel continuity. I am Egyptian because they were Egyptian. We are the same thread.",
                        "The sun rises, lighting the pyramids gold. They remain. We remain."
                    ],
                    images: ["sun.max.fill", "building.columns.fill", "star.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.8, blue: 0.6),
                        StorableColor(red: 1.0, green: 0.9, blue: 0.7)
                    ],
                    culturalContext: "The pyramids symbolize Egyptian endurance, achievement, and connection to an ancient past."
                ),
                Story(
                    title: "Cairo Streets",
                    country: "Egypt",
                    paragraphs: [
                        "Cairo never sleeps. At midnight, the streets are as crowded as noon.",
                        "Cars honk constantly—not in anger, but as a language. Two honks: I'm here. Three honks: Move.",
                        "Street vendors sell everything. Fresh juice pressed from sugar cane. Koshari in paper cones. Shoes, phones, spices.",
                        "I dodge motorcycles, buses, donkey carts. I stop for foul and ta'ameya from a cart I've been eating at for ten years.",
                        "The chaos feels like chaos only to outsiders. To us, it's organized. We know the rhythm.",
                        "This energy, this aliveness—Cairo is overwhelming, maddening, home."
                    ],
                    images: ["car.fill", "building.2.fill", "cart.fill"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.7, blue: 0.5),
                        StorableColor(red: 0.6, green: 0.5, blue: 0.4)
                    ],
                    culturalContext: "Cairo's vibrant street life reflects Egyptian resilience, entrepreneurship, and community."
                )
            ]
        ),
        
        // 19. Australia
        Culture(
            name: "Australia",
            description: "Vast outback, beautiful coasts, and ancient indigenous heritage.",
            region: "Oceania",
            stories: [
                Story(
                    title: "The Outback",
                    country: "Australia",
                    paragraphs: [
                        "We drive for hours without seeing another car. Just red earth, spinifex, and sky forever.",
                        "My uncle is teaching me about Country—not just land, but relationship, responsibility, story.",
                        "He points to a rock formation. 'That's where the ancestor sat.' Every feature has meaning, has law.",
                        "Night falls and the stars emerge—so many you can't see darkness between them. The Milky Way looks close enough to touch.",
                        "This is the oldest living culture on earth. Sixty thousand years of continuous connection to this place.",
                        "I feel small but also part of something immense, timeless. This is what belonging means."
                    ],
                    images: ["pawprint.fill", "star.fill", "moon.stars.fill"],
                    storableGradient: [
                        StorableColor(red: 0.8, green: 0.3, blue: 0.1),
                        StorableColor(red: 0.6, green: 0.2, blue: 0.1)
                    ],
                    culturalContext: "Indigenous Australian culture maintains deep spiritual and practical connections to the land."
                ),
                Story(
                    title: "Surf Culture",
                    country: "Australia",
                    paragraphs: [
                        "I wake at five-thirty and check the surf report. Two-meter swell, offshore winds. Perfect.",
                        "At the beach, the regular crew is already in the water. We nod to each other, no words needed.",
                        "I paddle out, duck-diving under waves. The water is cold but I'm awake now, completely present.",
                        "When the right wave comes, I know. I paddle hard, pop up, and I'm flying.",
                        "This feeling—moving with the ocean, reading its moods, being part of its rhythm—this is Australian as it gets.",
                        "We surf until we're exhausted, then have coffee on the beach, talking about the sets we caught."
                    ],
                    images: ["water.waves", "sun.haze.fill", "figure.surfing"],
                    storableGradient: [
                        StorableColor(red: 0.2, green: 0.6, blue: 0.9),
                        StorableColor(red: 0.9, green: 0.8, blue: 0.4)
                    ],
                    culturalContext: "Surf culture represents Australian connection to the ocean and laid-back lifestyle."
                ),
                Story(
                    title: "Backyard BBQ",
                    country: "Australia",
                    paragraphs: [
                        "Saturday arvo means BBQ. I text the mates: 'Come over, I'm firing up the barbie.'",
                        "Everyone brings something—snags, steaks, salad, beer. No one comes empty-handed.",
                        "The grill heats up. I've got the tongs—the sacred position. 'Don't burn the snags, mate.'",
                        "Kids jump in the pool. Adults stand around the BBQ with cold ones, solving the world's problems.",
                        "This is Australian hospitality. Casual, easy, genuine. No fuss, no formality.",
                        "As the sun sets and the mozzies come out, someone suggests moving inside. But we stay. This is too good to leave."
                    ],
                    images: ["flame.fill", "person.3.fill", "wineglass.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.5, blue: 0.2),
                        StorableColor(red: 1.0, green: 0.8, blue: 0.4)
                    ],
                    culturalContext: "The backyard BBQ embodies Australian values of mateship, informality, and outdoor living."
                )
            ]
        ),
        
        // 20. Russia
        Culture(
            name: "Russia",
            description: "Vast landscapes, deep winters, and rich literature.",
            region: "Eurasia",
            stories: [
                Story(
                    title: "Winter in Moscow",
                    country: "Russia",
                    paragraphs: [
                        "The snow falls thick and silent, transforming Moscow into something from a fairy tale.",
                        "I walk through Gorky Park, my breath clouding white. Babushki feed the birds despite the cold.",
                        "In Red Square, the onion domes of St. Basil's look like they're made of ice cream and dreams.",
                        "I duck into a café for tea from a samovar. The warmth seeps into my bones.",
                        "Winter here isn't something to endure—it's part of our soul. It makes us strong, makes us Russian.",
                        "Outside, children build snow fortresses. This cold that would defeat others, we embrace."
                    ],
                    images: ["snowflake", "wind", "building.2.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.9, blue: 1.0),
                        StorableColor(red: 0.7, green: 0.8, blue: 0.9)
                    ],
                    culturalContext: "Winter is central to Russian identity, shaping character and culture for centuries."
                ),
                Story(
                    title: "Bolshoi Ballet",
                    country: "Russia",
                    paragraphs: [
                        "The Bolshoi Theatre glitters like a jewel box. I've saved for months to afford this ticket.",
                        "The curtain rises on Swan Lake. The prima ballerina appears, and the audience collectively stops breathing.",
                        "This precision, this beauty—it comes from discipline that borders on suffering.",
                        "These dancers have trained since childhood, sacrificing everything for art.",
                        "I watch her pirouette, defying gravity, making the impossible look effortless.",
                        "This is Russia: beauty born from hardship, excellence achieved through relentless dedication."
                    ],
                    images: ["figure.dance", "crown.fill", "star.fill"],
                    storableGradient: [
                        StorableColor(red: 0.9, green: 0.8, blue: 0.9),
                        StorableColor(red: 1.0, green: 1.0, blue: 1.0)
                    ],
                    culturalContext: "Russian ballet represents the pursuit of artistic perfection through rigorous discipline."
                ),
                Story(
                    title: "Dacha Summer",
                    country: "Russia",
                    paragraphs: [
                        "We take the elektrichka to the dacha every Friday in summer. The train is packed with families carrying seedlings and tools.",
                        "Our dacha is simple—a small wooden house, a plot for vegetables, a banya for bathing.",
                        "Babushka tends her garden with fierce devotion. Tomatoes, cucumbers, dill, potatoes.",
                        "This food will be preserved—pickles, jams, frozen berries—to feed us through winter.",
                        "In the evening, we heat the banya. We beat ourselves with birch branches, then run into the cold lake.",
                        "This rhythm—city to countryside, work to rest, winter to summer—this balance keeps us sane."
                    ],
                    images: ["house.fill", "leaf.fill", "figure.run"],
                    storableGradient: [
                        StorableColor(red: 0.4, green: 0.7, blue: 0.4),
                        StorableColor(red: 0.6, green: 0.8, blue: 0.5)
                    ],
                    culturalContext: "The dacha (country cottage) provides Russians with connection to nature and self-sufficiency."
                )
            ]
        )
    ]
}
