```
//
//  KalaidoWelcomeView.swift
//  Kalaido
//
//  Created by Student on 22/01/26.
//


import SwiftUI
import UIKit

struct KalaidoWelcomeView: View {
    @State private var showMoments = false
    @StateObject private var reflectionManager = ReflectionManager() // Initialize Manager
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        Color(red: 0.96, green: 0.94, blue: 0.92),
                        Color(red: 0.98, green: 0.96, blue: 0.94)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    // Logo
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
                    
                    Spacer()
                        .frame(height: 60)
                    
                    // Title
                    Text("Kalaido")
                        .font(.system(size: 48, weight: .regular, design: .serif))
                        .foregroundColor(Color(red: 0.2, green: 0.15, blue: 0.1))
                    
                    Spacer()
                        .frame(height: 24)
                    
                    // Taglines
                    VStack(spacing: 8) {
                        Text("Step into moments")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.3))
                        
                        Text("from lives around the world")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.3))
                        
                        Text("One story at a time")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.3))
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    // Begin button
                    Button(action: {
                        showMoments = true
                    }) {
                        Text("Begin")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 140, height: 50)
                            .background(
                                Color(red: 0.85, green: 0.55, blue: 0.45)
                            )
                            .cornerRadius(25)
                    }
                    .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $showMoments) {
                ChooseMomentView()
            }
        }.environmentObject(reflectionManager)
    }
}

struct ChooseMomentView: View {
    @State private var showSidebar = false
    var body: some View {
        ZStack(alignment: .leading) {
            // Main Content
            VStack(spacing: 0) {
                // Background
                LinearGradient(
                    colors: [
                        Color(red: 0.96, green: 0.94, blue: 0.92),
                        Color(red: 0.98, green: 0.96, blue: 0.94)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                .overlay {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            // Header
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Choose a Moment")
                                    .font(.system(size: 36, weight: .regular, design: .serif))
                                    .foregroundColor(Color(red: 0.2, green: 0.15, blue: 0.1))
                                
                                Text("Each experience opens a window into someone's life")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color(red: 0.5, green: 0.45, blue: 0.4))
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 20)
                            .padding(.bottom, 32)
                            // Moment cards
                            VStack(spacing: 16) {
                                MomentCard(
                                    icon: "sparkles",
                                    title: "Celebration",
                                    country: "India",
                                    gradient: [
                                        Color(red: 0.95, green: 0.6, blue: 0.35),
                                        Color(red: 0.95, green: 0.5, blue: 0.65)
                                    ],
                                    story: Story(
                                        title: "Celebration",
                                        country: "India",
                                        paragraphs: [
                                            "The smell hits me first. Marigolds and incense, mixing with the sweet smoke from the kitchen where my grandmother is frying jalebis.",
                                            "I can hear her humming, the same tune she always hums during Diwali. My cousins are already here, laughing in the courtyard.",
                                            "They're probably trying to light sparklers even though Baba said to wait until dark. My little sister is tugging at my dupatta, asking when we can put on our new clothes.",
                                            "Maa calls me to help arrange the diyas. We place them carefully along the windowsills, dozens of small clay lamps.",
                                            "Her hands move quickly, practiced. Mine are slower, more careful. She tells me the story again, the one about light defeating darkness.",
                                            "I have heard it every year since I was small, but I do not mind. The way she tells it makes it feel new each time.",
                                            "When evening comes, we light the diyas together. The whole neighborhood glows. I can see other families on their balconies.",
                                            "Other children with sparklers, other grandmothers in their best saris. We are all separate, but somehow we are all together in this moment.",
                                            "My sister finally gets to wear her new lehenga. She spins in circles until she is dizzy, the sequins catching the lamplight.",
                                            "My grandmother brings out the sweets she has been making all day. My father lights the big fireworks in the street.",
                                            "I stand on our balcony, watching the sky fill with color and light. My mother comes to stand beside me, her hand warm on my shoulder.",
                                            "She does not say anything. She does not need to. This is what celebration feels like. Not just the lights or the sweets or the new clothes.",
                                            "It is this. Being together. Being home."
                                        ],
                                        images: ["sparkles", "figure.2.and.child.holdinghands", "gift.fill", "candle.fill", "hands.sparkles.fill", "heart.fill", "house.fill", "figure.3.fill", "person.fill.turn.right", "birthday.cake.fill", "fireworks", "moon.stars.fill", "heart.circle.fill"],
                                        gradient: [
                                            Color(red: 0.95, green: 0.6, blue: 0.35),
                                            Color(red: 0.95, green: 0.5, blue: 0.65)
                                        ],
                                        culturalContext: "Diwali, the Festival of Lights, is one of the most important celebrations in India. Families come together to light diyas (oil lamps), share sweets, and celebrate the victory of light over darkness. The festival strengthens family bonds and community connections across generations."
                                    )
                                )
                                
                                MomentCard(
                                    icon: "hand.raised.fill",
                                    title: "Respect & Social Boundaries",
                                    country: "Japan",
                                    gradient: [
                                        Color(red: 0.6, green: 0.7, blue: 0.95),
                                        Color(red: 0.75, green: 0.65, blue: 0.9)
                                    ],
                                    story: Story(
                                        title: "Respect & Social Boundaries",
                                        country: "Japan",
                                        paragraphs: [
                                            "I am standing at the entrance to my teacher's home, my shoes already removed and placed neatly beside the door.",
                                            "I have practiced my bow three times this morning. Not too deep, not too shallow. Just right for greeting a sensei.",
                                            "My mother is beside me, holding a small wrapped gift. She chose it carefully, a box of expensive tea from the shop near the station.",
                                            "The wrapping is perfect, crisp edges and a simple ribbon. She has taught me that how you present something matters as much as what you present.",
                                            "When Tanaka-sensei opens the door, I bow. My mother bows. Tanaka-sensei bows. There is a rhythm to it, a dance we all know.",
                                            "She welcomes us in, and I notice how she gestures toward the slippers arranged for guests, never pointing directly.",
                                            "Inside, I sit in seiza, my legs folded beneath me. It is uncomfortable, but I do not shift.",
                                            "My mother has told me that enduring small discomforts shows respect. I watch how she sits, how she holds her teacup with both hands.",
                                            "We talk about my studies, my progress in calligraphy. I want to ask a question, but I wait.",
                                            "I wait for the right pause, the right moment. When it comes, I ask quietly, carefully. Tanaka-sensei smiles.",
                                            "My mother and Tanaka-sensei discuss the upcoming school year. I listen more than I speak.",
                                            "This is how I learn, not just about school, but about how to be. How to read the spaces between words.",
                                            "When we leave, we bow again. I thank Tanaka-sensei for her time, for her teaching.",
                                            "We put on our shoes facing the door, ready to step out. As we walk home, my mother does not say much, but I can tell she is pleased.",
                                            "I have done well. I have shown respect."
                                        ],
                                        images: ["door.left.hand.open", "figure.walk", "gift.fill", "sparkles", "figure.2.arms.open", "hand.wave.fill", "figure.yoga", "cup.and.saucer.fill", "book.fill", "bubble.left.fill", "graduationcap.fill", "brain.fill", "hand.thumbsup.fill", "figure.walk.departure", "checkmark.seal.fill"],
                                        gradient: [
                                            Color(red: 0.6, green: 0.7, blue: 0.95),
                                            Color(red: 0.75, green: 0.65, blue: 0.9)
                                        ],
                                        culturalContext: "In Japanese culture, respect and social harmony are deeply valued. Practices like bowing, removing shoes indoors, and careful attention to social cues help maintain wa (harmony). These customs teach children to be mindful of others and to navigate social situations with grace and consideration."
                                    )
                                )
                                
                                MomentCard(
                                    icon: "fork.knife",
                                    title: "Food & Family",
                                    country: "Italy",
                                    gradient: [
                                        Color(red: 0.95, green: 0.85, blue: 0.35),
                                        Color(red: 0.95, green: 0.7, blue: 0.45)
                                    ],
                                    story: Story(
                                        title: "Food & Family",
                                        country: "Italy",
                                        paragraphs: [
                                            "Nonna's kitchen is always warm. Even in summer, when the heat makes the air shimmer outside, her kitchen feels like the heart of the world.",
                                            "Today she is making pasta, and I am her assistant. She does not measure anything.",
                                            "A handful of flour, a well in the center, three eggs cracked with one hand. Her hands move like they are dancing.",
                                            "She tells me to feel it, to learn the texture with my fingers, not my eyes.",
                                            "My job is to turn the handle on the pasta machine. Slowly, she says. Slowly, or it will tear.",
                                            "I watch the dough stretch and thin, becoming long sheets that she will cut into fettuccine.",
                                            "My little brother tries to help, but he just makes a mess. Nonna laughs and gives him a piece of dough to play with.",
                                            "While the pasta dries, she starts the sauce. Tomatoes from the garden, basil she grew on the windowsill.",
                                            "Garlic that makes my eyes water when she chops it. She lets me stir, but only after she has shown me how.",
                                            "Clockwise, she says. Always clockwise. I do not know why, but I do not question it.",
                                            "My parents arrive with my aunt and uncle and cousins. The kitchen gets louder, fuller.",
                                            "Everyone is talking at once, but somehow Nonna hears everything. She directs traffic like a conductor.",
                                            "When we finally sit down, the table is crowded. Plates and glasses and bowls of pasta and salad and bread.",
                                            "Nonna serves everyone else first, piling pasta high on our plates. Mangia, she says. Eat. And we do.",
                                            "The meal lasts for hours. We eat and talk and laugh. My cousin spills his wine.",
                                            "My uncle tells the same joke he tells every Sunday. My mother and aunt argue about the best way to make tiramisu.",
                                            "And Nonna sits at the head of the table, watching us all, smiling. This is what she lives for.",
                                            "This is love, served on a plate."
                                        ],
                                        images: ["house.fill", "fork.knife", "hands.sparkles.fill", "hand.point.right.fill", "gearshape.fill", "rectangle.stack.fill", "figure.2.and.child.holdinghands", "leaf.fill", "drop.fill", "arrow.clockwise", "person.3.fill", "speaker.wave.3.fill", "table.furniture.fill", "heart.circle.fill", "wineglass.fill", "message.fill", "face.smiling.fill", "heart.fill"],
                                        gradient: [
                                            Color(red: 0.95, green: 0.85, blue: 0.35),
                                            Color(red: 0.95, green: 0.7, blue: 0.45)
                                        ],
                                        culturalContext: "In Italian culture, food is much more than sustenance—it is an expression of love and a way to bring family together. Sunday meals, often prepared by grandmothers, are sacred traditions where multiple generations gather to share food, stories, and connection. The kitchen is the heart of the home."
                                    )
                                )
                                
                                MomentCard(
                                    icon: "leaf.fill",
                                    title: "Growing Up",
                                    country: "Nigeria",
                                    gradient: [
                                        Color(red: 0.4, green: 0.85, blue: 0.6),
                                        Color(red: 0.45, green: 0.8, blue: 0.8)
                                    ],
                                    story: Story(
                                        title: "Growing Up",
                                        country: "Nigeria",
                                        paragraphs: [
                                            "My mother is braiding my hair. I sit on the floor between her knees, my head tilted back, trying not to move.",
                                            "Her fingers work quickly, parting and plaiting, pulling tight enough that I feel it but not so tight that I complain.",
                                            "She is talking to my aunt, who sits nearby shelling groundnuts. They are speaking in Yoruba.",
                                            "Switching to English when they want me to understand, switching back when they do not.",
                                            "I am learning to hear the difference, to know when they are talking about me.",
                                            "My aunt asks if I am ready for secondary school. My mother says yes, but I can hear the worry in her voice.",
                                            "She pulls a braid a little tighter, and I wince. She apologizes, her hand gentle on my shoulder for a moment.",
                                            "They talk about what I will need. New uniforms, new books, new shoes.",
                                            "My aunt offers to help, and my mother thanks her but says we will manage. I know what that means.",
                                            "It means my mother will work extra hours. It means I will study hard to make it worth it.",
                                            "When my hair is finished, my mother holds up a mirror so I can see. The braids are perfect, neat rows.",
                                            "She has woven in extensions, making my hair longer, fuller. I look older. I feel older.",
                                            "My aunt tells me I am becoming a woman now. She says I must be serious, must work hard.",
                                            "My mother nods, her hand on my head, smoothing down a stray hair. She tells me I can do anything if I try.",
                                            "Education is the key to everything, she says.",
                                            "I look at my reflection again. The girl looking back at me has my face, but she looks different. Stronger. Ready.",
                                            "My mother kisses the top of my head, and I feel the weight of her hopes, her dreams, her sacrifices.",
                                            "I will not let her down. I will make her proud. This is what it means to grow up.",
                                            "To carry not just your own future, but the future of everyone who believes in you."
                                        ],
                                        images: ["figure.2.arms.open", "hand.point.up.left.fill", "bubble.left.and.bubble.right.fill", "translate", "ear.fill", "backpack.fill", "hand.raised.fill", "tshirt.fill", "figure.2.and.child.holdinghands", "clock.fill", "mirror.fill", "sparkles", "figure.dress.line.vertical.figure", "brain.fill", "key.fill", "face.smiling.fill", "heart.circle.fill", "figure.walk.arrival", "star.fill"],
                                        gradient: [
                                            Color(red: 0.4, green: 0.85, blue: 0.6),
                                            Color(red: 0.45, green: 0.8, blue: 0.8)
                                        ],
                                        culturalContext: "In many Nigerian families, education is seen as a pathway to opportunity and a way to honor family sacrifices. The relationship between mothers and daughters is often marked by deep bonds, practical wisdom, and the passing down of cultural traditions. Hair braiding is both a practical skill and a moment of connection between generations."
                                    )
                                )
                                
                                MomentCard(
                                    icon: "heart.fill",
                                    title: "Loss & Remembrance",
                                    country: "Mexico",
                                    gradient: [
                                        Color(red: 0.65, green: 0.45, blue: 0.85),
                                        Color(red: 0.9, green: 0.5, blue: 0.65)
                                    ],
                                    story: Story(
                                        title: "Loss & Remembrance",
                                        country: "Mexico",
                                        paragraphs: [
                                            "We are building the ofrenda in the living room. My mother has cleared the table and covered it with a bright cloth.",
                                            "The one my abuela embroidered with flowers. I help her arrange the photographs, my hands careful with the frames.",
                                            "There is a picture of my abuelo, young and smiling, his arm around my abuela.",
                                            "There is one of my tío, who died before I was born. My mother tells me about him as we work.",
                                            "Stories I have heard before but never tire of hearing. How he loved to sing. How he made everyone laugh.",
                                            "We place marigolds everywhere, their orange petals bright against the white cloth.",
                                            "My mother says the color and the scent help guide the spirits home. I breathe in deeply.",
                                            "The smell is sweet and sharp at the same time, like memory itself.",
                                            "My little sister brings the sugar skulls we decorated yesterday. They are clumsy, our decorating.",
                                            "But my mother says they are perfect. She places them carefully among the photographs.",
                                            "Along with candles and papel picado that my father hung from the ceiling.",
                                            "We add food next. Pan de muerto, still warm from the bakery. My abuelo's favorite mole.",
                                            "Oranges and apples. A bottle of tequila for my tío. A cup of chocolate for my abuela.",
                                            "Each item is a memory, a way of saying we have not forgotten.",
                                            "When everything is ready, we light the candles. The room glows warm and golden.",
                                            "My mother stands back, looking at what we have created, and I see tears in her eyes. But she is smiling.",
                                            "This is not a sad thing, she tells me. This is how we keep them with us.",
                                            "That night, I lie in bed and think about the ofrenda, about the faces in the photographs.",
                                            "About the people I never met but somehow know. My mother says they visit us tonight.",
                                            "Drawn by the light and the marigolds and our love. I do not know if I believe in spirits.",
                                            "But I believe in this. In remembering. In making a place at the table for those who are gone.",
                                            "In saying their names and telling their stories. This is how they live on.",
                                            "This is how love survives death."
                                        ],
                                        images: ["house.fill", "photo.fill", "figure.2.arms.open", "person.fill.viewfinder", "music.note", "leaf.fill", "arrow.down.to.line", "nose.fill", "paintbrush.fill", "sparkles", "flag.fill", "takeoutbag.and.cup.and.straw.fill", "fork.knife", "heart.circle.fill", "flame.fill", "eye.fill", "face.smiling.fill", "bed.double.fill", "figure.2.and.child.holdinghands", "moon.stars.fill", "brain.heart.fill", "text.quote", "star.fill"],
                                        gradient: [
                                            Color(red: 0.65, green: 0.45, blue: 0.85),
                                            Color(red: 0.9, green: 0.5, blue: 0.65)
                                        ],
                                        culturalContext: "Día de los Muertos (Day of the Dead) is a Mexican tradition where families create ofrendas (altars) to honor and remember deceased loved ones. Rather than mourning, the celebration embraces death as a natural part of life and creates a space for the living and the dead to connect. Marigolds, favorite foods, and photographs help welcome spirits home for a brief visit."
                                    )
                                )
                            }
                            .padding(.horizontal, 24)
                            .padding(.bottom, 32)
                        }
                    }
                }
            }.offset(x: showSidebar ? 280 : 0) // Push main content when sidebar opens
                .disabled(showSidebar) // Disable interaction when sidebar is open
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: showSidebar)
            
            // Sidebar Overlay
            if showSidebar {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { showSidebar = false }
                    .transition(.opacity)
                
                SidebarView(isOpen: $showSidebar)
                    .transition(.move(edge: .leading))
                    .zIndex(2)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: { showSidebar.toggle() }) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.3))
                        }
                    }
        }
    }
}

struct MomentCard: View {
    let icon: String
    let title: String
    let country: String
    let gradient: [Color]
    let story: Story
    
    var body: some View {
        NavigationLink(destination: StoryReaderView(story: story)) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(country)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.white.opacity(0.9))
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
            .background(
                LinearGradient(
                    colors: gradient,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        }
    }
}

struct Story {
    let title: String
    let country: String
    let paragraphs: [String]
    let images: [String] // SF Symbol names for now
    let gradient: [Color]
    let culturalContext: String
}

struct StoryReaderView: View {
    let story: Story
    @State private var currentPage = 0
    @State private var showReflection = false
    @State private var dragOffset: CGFloat = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        Color(red: 0.96, green: 0.94, blue: 0.92),
                        Color(red: 0.98, green: 0.96, blue: 0.94)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // Story card
                    VStack(spacing: 0) {
                        // Header with gradient
                        ZStack(alignment: .topLeading) {
                            LinearGradient(
                                colors: story.gradient,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .frame(height: 120)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(story.title)
                                    .font(.system(size: 28, weight: .semibold))
                                    .foregroundColor(.white)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.8)
                                
                                Text(story.country)
                                    .font(.system(size: 18, weight: .regular))
                                    .foregroundColor(.white.opacity(0.9))
                            }
                            .padding(.horizontal, 32)
                            .padding(.top, 32)
                            .padding(.trailing, 16)
                        }
                        
                        // Image section
                        if currentPage < story.images.count {
                            Image(systemName: story.images[currentPage])
                                .font(.system(size: 80))
                                .foregroundColor(Color(red: 0.7, green: 0.65, blue: 0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 180)
                                .background(Color(red: 0.97, green: 0.96, blue: 0.95))
                        }
                        
                        // Story content
                        VStack(spacing: 24) {
                                Text(story.paragraphs[currentPage])
                                    .font(.custom("Georgia", size: 17))
                                    .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                                    .lineSpacing(10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 120)
                            .padding(.horizontal, 32)
                            .padding(.top, 32)
                            
                            // Navigation controls with progress bar
                            HStack(spacing: 16) {
                                Button(action: {
                                    if currentPage > 0 {
                                        withAnimation {
                                            currentPage -= 1
                                        }
                                    }
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(currentPage > 0 ? Color(red: 0.4, green: 0.35, blue: 0.3) : Color(red: 0.7, green: 0.65, blue: 0.6))
                                        .frame(width: 44, height: 44)
                                        .background(Color.white)
                                        .cornerRadius(22)
                                }
                                .disabled(currentPage == 0)
                                
                                // Progress bar
                                ZStack(alignment: .leading) {
                                    // Background track
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color(red: 0.9, green: 0.88, blue: 0.86))
                                        .frame(height: 6)
                                    
                                    // Progress fill
                                    GeometryReader { geo in
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(
                                                LinearGradient(
                                                    colors: story.gradient,
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .frame(width: geo.size.width * CGFloat(currentPage + 1) / CGFloat(story.paragraphs.count), height: 6)
                                            .animation(.easeInOut(duration: 0.3), value: currentPage)
                                    }
                                }
                                .frame(height: 6)
                                
                                Button(action: {
                                    if currentPage < story.paragraphs.count - 1 {
                                        withAnimation {
                                            currentPage += 1
                                        }
                                    } else {
                                        showReflection = true
                                    }
                                }) {
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                        .frame(width: 44, height: 44)
                                        .background(
                                            LinearGradient(
                                                colors: story.gradient,
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .cornerRadius(22)
                                }
                            }
                            .padding(.bottom, 32)
                            .padding(.horizontal, 32)
                        }
                        .background(Color.white)
                    }
                    .frame(maxWidth: min(geometry.size.width - 48, 500))
                    .cornerRadius(24)
                    .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 10)
                    .offset(x: dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                dragOffset = gesture.translation.width
                            }
                            .onEnded { gesture in
                                let swipeThreshold: CGFloat = 50
                                
                                if gesture.translation.width < -swipeThreshold {
                                    // Swipe left - go to next page
                                    if currentPage < story.paragraphs.count - 1 {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                            currentPage += 1
                                            dragOffset = 0
                                        }
                                    } else {
                                        // Last page - show reflection
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                            dragOffset = 0
                                        }
                                        showReflection = true
                                    }
                                } else if gesture.translation.width > swipeThreshold && currentPage > 0 {
                                    // Swipe right - go to previous page
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                        currentPage -= 1
                                        dragOffset = 0
                                    }
                                } else {
                                    // Snap back to original position
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                        dragOffset = 0
                                    }
                                }
                            }
                    )
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $showReflection) {
            ReflectionView(story: story)
        }
    }
}


struct ReflectionView: View {
    let story: Story
    @EnvironmentObject var manager: ReflectionManager // Access the manager
    @Environment(\.dismiss) var dismiss // To close after saving
    
    @State private var showCulturalContext = false
    @State private var selectedFeelings: Set<String> = []
    @State private var reflectionText: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    let feelings = [
        "Happy", "Curious", "Peaceful", "Surprised",
        "Grateful", "Thoughtful", "Connected", "Sad",
        "Hopeful", "Confused", "Inspired", "Calm"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.96, green: 0.94, blue: 0.92),
                    Color(red: 0.98, green: 0.96, blue: 0.94)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    Spacer()
                        .frame(height: 20)
                    
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: story.gradient,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 20, height: 20)
                    
                    VStack(spacing: 16) {
                        Text("Take a moment to sit with this story")
                            .font(.system(size: 26, weight: .regular, design: .serif))
                            .foregroundColor(Color(red: 0.2, green: 0.15, blue: 0.1))
                            .multilineTextAlignment(.center)
                        
                        Text("What did you notice?")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color(red: 0.5, green: 0.45, blue: 0.4))
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                        .frame(height: 32)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("How did this story make you feel?")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color(red: 0.2, green: 0.15, blue: 0.1))
                            .padding(.horizontal, 24)
                        
                        FlowLayout(spacing: 10) {
                            ForEach(feelings, id: \.self) { feeling in
                                Button(action: {
                                    if selectedFeelings.contains(feeling) {
                                        selectedFeelings.remove(feeling)
                                    } else {
                                        selectedFeelings.insert(feeling)
                                    }
                                }) {
                                    Text(feeling)
                                        .font(.system(size: 15, weight: .medium))
                                        .foregroundColor(selectedFeelings.contains(feeling) ? .white : Color(red: 0.4, green: 0.35, blue: 0.3))
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 10)
                                        .background(
                                            selectedFeelings.contains(feeling) ?
                                            LinearGradient(
                                                colors: story.gradient,
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ) :
                                            LinearGradient(
                                                colors: [Color.white, Color.white],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(
                                                    selectedFeelings.contains(feeling) ?
                                                    Color.clear :
                                                    Color(red: 0.8, green: 0.75, blue: 0.7),
                                                    lineWidth: 1
                                                )
                                        )
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    
                    Spacer()
                        .frame(height: 24)
                    
                    if !selectedFeelings.isEmpty || !reflectionText.isEmpty {
                                            Button(action: {
                                                // Call the manager to save
                                                manager.saveReflection(
                                                    story: story,
                                                    feelings: selectedFeelings,
                                                    notes: reflectionText
                                                )
                                                
                                                // Optional: Add haptic feedback here
                                                let generator = UINotificationFeedbackGenerator()
                                                generator.notificationOccurred(.success)
                                                
                                                // Return to main menu (pop to root behavior logic or simple dismiss)
                                                dismiss()
                                            }) {
                                                Text("Save Reflection")
                                                    .font(.system(size: 16, weight: .medium))
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: 280)
                                                    .padding(.vertical, 14)
                                                    .background(
                                                        LinearGradient(
                                                            colors: story.gradient,
                                                            startPoint: .leading,
                                                            endPoint: .trailing
                                                        )
                                                    )
                                                    .cornerRadius(25)
                                            }
                                            .transition(.opacity)
                                        }
                    
                    Spacer()
                        .frame(height: 16)
                    
                    VStack(spacing: 16) {
                        NavigationLink(destination: ChooseMomentView()) {
                            Text("Read Another Story")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.3))
                                .frame(maxWidth: 280)
                                .padding(.vertical, 14)
                                .background(Color.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(red: 0.8, green: 0.75, blue: 0.7), lineWidth: 1)
                                )
                        }
                    }
                    
                    Spacer()
                        .frame(height: 12)
                    
                    Button(action: {
                        withAnimation {
                            showCulturalContext = true
                        }
                    }) {
                        Text("Learn more about this moment")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(Color(red: 0.5, green: 0.45, blue: 0.4))
                            .underline()
                    }
                    
                    Spacer()
                        .frame(height: 32)
                }
            }
            .onTapGesture {
                isTextFieldFocused = false
            }
            
            if showCulturalContext {
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Cultural Context")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(Color(red: 0.2, green: 0.15, blue: 0.1))
                        
                        Text(story.culturalContext)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color(red: 0.3, green: 0.25, blue: 0.2))
                            .lineSpacing(6)
                        
                        Button(action: {
                            withAnimation {
                                showCulturalContext = false
                            }
                        }) {
                            Text("Close")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.3))
                        }
                        .padding(.top, 8)
                    }
                    .padding(28)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                    .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -5)
                }
                .ignoresSafeArea()
                .transition(.move(edge: .bottom))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(
            in: proposal.replacingUnspecifiedDimensions().width,
            subviews: subviews,
            spacing: spacing
        )
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(
            in: bounds.width,
            subviews: subviews,
            spacing: spacing
        )
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x, y: bounds.minY + result.positions[index].y), proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if x + size.width > maxWidth && x > 0 {
                    x = 0
                    y += lineHeight + spacing
                    lineHeight = 0
                }
                
                positions.append(CGPoint(x: x, y: y))
                lineHeight = max(lineHeight, size.height)
                x += size.width + spacing
            }
            
            self.size = CGSize(width: maxWidth, height: y + lineHeight)
        }
    }
}

// Helper extension for custom corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Models & Data Manager

struct ReflectionEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let storyTitle: String
    let storyCountry: String
    let feelings: [String]
    let notes: String
    let storyGradientColors: [Double] // Store RGB components to recreate gradient
}

@MainActor
class ReflectionManager: ObservableObject {
    @Published var reflections: [ReflectionEntry] = []
    
    private let saveKey = "SavedReflections"
    
    init() {
        loadReflections()
    }
    
    func saveReflection(story: Story, feelings: Set<String>, notes: String) {
        // Convert SwiftUI Colors to simple RGB values for storage
        // (Simplified for this prototype - taking first color components)
        let colorData = [0.95, 0.6, 0.35] // Placeholder for actual gradient logic preservation
        
        let newEntry = ReflectionEntry(
            id: UUID(),
            date: Date(),
            storyTitle: story.title,
            storyCountry: story.country,
            feelings: Array(feelings),
            notes: notes,
            storyGradientColors: colorData
        )
        
        reflections.insert(newEntry, at: 0) // Newest first
        saveToDisk()
    }
    
    private func saveToDisk() {
        if let encoded = try? JSONEncoder().encode(reflections) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadReflections() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([ReflectionEntry].self, from: data) {
            reflections = decoded
        }
    }
}

struct SidebarView: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 32) {
                // Sidebar Header
                Spacer().frame(height:50)
                HStack {
                    Image("logo") // Assuming you have the logo asset
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Kalaido")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(Color(red: 0.2, green: 0.15, blue: 0.1))
                }
                .padding(.top, 60)
                
                // Menu Items
                VStack(alignment: .leading, spacing: 24) {
                    NavigationLink(destination: SavedReflectionsView()) {
                        HStack(spacing: 16) {
                            Image(systemName: "book.closed.fill")
                                .font(.system(size: 20))
                            Text("Your Reflections")
                                .font(.system(size: 18))
                        }
                        .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.3))
                    }
                    
                    HStack(spacing: 16) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 20))
                        Text("Settings")
                            .font(.system(size: 18))
                    }
                    .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.3))
                    .onTapGesture {
                        // Placeholder for settings
                    }
                }
                
                Spacer()
                
                Text("Version 1.0")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)
            }
            .padding(.horizontal, 24)
            .frame(width: 280)
            .background(Color(red: 0.98, green: 0.97, blue: 0.95))
            .ignoresSafeArea()
            
            Spacer()
        }
    }
}

struct SavedReflectionsView: View {
    @EnvironmentObject var manager: ReflectionManager
    
    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.94, blue: 0.92).ignoresSafeArea()
            
            if manager.reflections.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "pencil.and.outline")
                        .font(.system(size: 48))
                        .foregroundColor(.gray.opacity(0.5))
                    Text("No reflections yet")
                        .font(.title3)
                        .foregroundColor(.gray)
                    Text("Read a story to start your journal")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            } else {
                List {
                    ForEach(manager.reflections) { entry in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text(entry.storyTitle)
                                    .font(.headline)
                                    .foregroundColor(Color(red: 0.2, green: 0.15, blue: 0.1))
                                Spacer()
                                Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            if !entry.feelings.isEmpty {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(entry.feelings, id: \.self) { feeling in
                                            Text(feeling)
                                                .font(.caption)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 4)
                                                .background(Color(red: 0.9, green: 0.88, blue: 0.86))
                                                .cornerRadius(8)
                                        }
                                    }
                                }
                            }
                            
                            if !entry.notes.isEmpty {
                                Text(entry.notes)
                                    .font(.body)
                                    .foregroundColor(Color(red: 0.3, green: 0.25, blue: 0.2))
                                    .lineLimit(3)
                            }
                        }
                        .padding(.vertical, 8)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                        )
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden) // Removes default gray list background
            }
        }
        .navigationTitle("Your Journal")
    }
}



```
