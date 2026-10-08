-- What2Gift schema + seed data.
-- Import into an existing database (e.g. `what2gift`) via phpMyAdmin or:
--   mysql -u root what2gift < schema.sql

DROP TABLE IF EXISTS gifts;

CREATE TABLE gifts (
  id          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(120)  NOT NULL,
  description VARCHAR(255)  NOT NULL,
  price       DECIMAL(8,2)  NOT NULL,
  min_age     TINYINT UNSIGNED NOT NULL,
  max_age     TINYINT UNSIGNED NOT NULL,
  interests   VARCHAR(255)  NOT NULL, -- comma-separated interest keys
  occasions   VARCHAR(255)  NOT NULL, -- comma-separated occasion keys, or 'any'
  emoji       VARCHAR(16)   NOT NULL,
  INDEX idx_age (min_age, max_age),
  INDEX idx_price (price)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gifts (name, description, price, min_age, max_age, interests, occasions, emoji) VALUES
-- Tech & gadgets
('Wireless Noise-Cancelling Headphones', 'Immersive sound for commutes, flights and deep-focus work.', 199, 13, 99, 'tech,music,travel', 'any', '🎧'),
('Smart Speaker', 'Voice-controlled music, timers, reminders and a smart-home hub.', 49, 10, 99, 'tech,music,home', 'birthday,christmas,housewarming', '🔊'),
('Portable Power Bank 20,000mAh', 'Keeps phones and tablets charged through long days out.', 35, 13, 99, 'tech,travel,outdoors', 'any', '🔋'),
('Mechanical Keyboard', 'Satisfying, clicky keys for typing, coding and gaming.', 89, 13, 60, 'tech,gaming', 'birthday,christmas,graduation', '⌨️'),
('Smartwatch & Fitness Tracker', 'Tracks steps, sleep, heart rate and workouts in style.', 149, 13, 80, 'tech,fitness,wellness', 'birthday,christmas,graduation,fathers_day,mothers_day', '⌚'),
('True Wireless Earbuds', 'Compact, cable-free audio for everyday listening.', 79, 12, 99, 'tech,music,fitness', 'any', '🎵'),
('E-Reader', 'Thousands of books in a glare-free, pocket-sized device.', 139, 10, 99, 'reading,tech,travel', 'birthday,christmas,graduation,retirement', '📖'),
('Instant Camera', 'Prints photos on the spot — the life of every party.', 79, 8, 60, 'photography,art', 'birthday,christmas,wedding', '📸'),
('Smart Plug Starter Kit', 'Control lamps and appliances from a phone or voice assistant.', 29, 16, 99, 'tech,home', 'housewarming,christmas', '🔌'),
('Wi-Fi Digital Photo Frame', 'Family photos that update remotely — perfect for grandparents.', 99, 30, 120, 'photography,home,tech', 'mothers_day,fathers_day,christmas,retirement,anniversary', '🖼️'),
('Camera Drone', 'Capture stunning aerial photos and 4K video.', 299, 14, 70, 'tech,photography,outdoors', 'birthday,christmas,graduation', '🚁'),
('Laptop Backpack', 'Padded, water-resistant and ready for campus or office.', 59, 14, 65, 'tech,travel,fashion', 'graduation,birthday', '🎒'),
('Bluetooth Tracker Tags (4-pack)', 'Never lose keys, wallets or luggage again.', 79, 16, 99, 'tech,travel', 'any', '📍'),
('Smartphone Gimbal Stabilizer', 'Smooth, cinematic video straight from a phone.', 89, 14, 60, 'photography,tech,travel', 'birthday,christmas,graduation', '🎬'),

-- Gaming
('Gaming Gift Card', 'Let them choose their next favourite game.', 50, 10, 50, 'gaming', 'birthday,christmas,graduation,thank_you', '🎮'),
('RGB Gaming Mouse', 'Precision sensor with customisable buttons and lighting.', 49, 12, 50, 'gaming,tech', 'birthday,christmas', '🖱️'),
('Retro Handheld Console', 'Hundreds of classic games in a pocket-sized console.', 69, 10, 60, 'gaming,tech', 'birthday,christmas', '🕹️'),
('Gaming Headset with Mic', 'Crystal-clear team chat and surround sound.', 69, 12, 45, 'gaming,tech,music', 'birthday,christmas', '🎧'),
('Strategy Board Game', 'A modern classic for unforgettable game nights.', 45, 10, 99, 'gaming', 'any', '🎲'),
('Party Card Game', 'Quick, hilarious rounds for groups of friends.', 25, 14, 99, 'gaming', 'birthday,christmas,housewarming', '🃏'),
('Ergonomic Gaming Chair', 'Comfortable lumbar support for long sessions.', 249, 14, 50, 'gaming,home', 'birthday,christmas,graduation', '🪑'),
('1000-Piece Jigsaw Puzzle', 'A relaxing challenge with beautiful artwork.', 22, 10, 120, 'gaming,art,wellness', 'any', '🧩'),

-- Reading & writing
('Personalised Leather Bookmark', 'Engraved with their name or a favourite quote.', 18, 10, 120, 'reading', 'any', '🔖'),
('Book Subscription Box', 'A hand-picked novel and treats delivered every month.', 35, 14, 99, 'reading', 'birthday,christmas,retirement,mothers_day,fathers_day', '📚'),
('Bestselling Hardcover Novel', 'A page-turner from this year''s must-read list.', 25, 13, 120, 'reading', 'any', '📕'),
('Rechargeable Book Light', 'Clip-on, warm light for late-night reading.', 15, 8, 120, 'reading', 'any', '💡'),
('Cosy Reading Blanket', 'Ultra-soft throw for curling up with a good book.', 45, 10, 120, 'reading,home,wellness', 'christmas,birthday,housewarming,mothers_day', '🛋️'),
('Journal & Fountain Pen Set', 'For writers, planners and thoughtful note-takers.', 40, 14, 120, 'reading,art', 'graduation,birthday,retirement,thank_you', '🖋️'),
('Audiobook Subscription', 'Listen to bestsellers on the go.', 45, 13, 120, 'reading,travel,tech', 'any', '🎙️'),

-- Music
('Vinyl Record Player', 'Retro turntable with built-in speakers.', 89, 14, 99, 'music,home', 'birthday,christmas,anniversary,housewarming', '💿'),
('Ukulele Starter Kit', 'A cheerful, easy-to-learn instrument with tuner and case.', 59, 8, 80, 'music', 'birthday,christmas', '🎸'),
('Concert Tickets', 'A live show from their favourite artist.', 120, 14, 80, 'music', 'birthday,anniversary,valentines,graduation', '🎫'),
('Music Streaming Subscription (1 year)', 'Ad-free listening to millions of songs.', 110, 13, 99, 'music,tech', 'birthday,christmas,graduation', '🎶'),
('Waterproof Bluetooth Speaker', 'Loud, rugged and ready for the beach or pool.', 59, 12, 80, 'music,outdoors,tech', 'any', '📻'),
('Kids'' Light-Up Keyboard', '61 keys with a light-up learning mode.', 79, 5, 14, 'music,toys', 'birthday,christmas', '🎹'),
('Personalised Guitar Picks', 'Engraved picks in a keepsake tin.', 20, 12, 80, 'music', 'birthday,christmas,valentines,fathers_day', '🎸'),
('Custom Song or Poem', 'A personal piece written just for them.', 60, 16, 120, 'music,art', 'anniversary,valentines,wedding,birthday', '💌'),

-- Art & crafts
('Watercolour Painting Set', 'Artist-grade paints, brushes and cold-press paper.', 45, 10, 99, 'art,wellness', 'birthday,christmas,retirement', '🎨'),
('Sketchbook & Drawing Pencil Kit', 'Graphite, charcoal and a quality sketchbook.', 30, 10, 99, 'art', 'birthday,christmas,graduation', '✏️'),
('Pottery Class Voucher', 'A hands-on wheel-throwing experience.', 75, 14, 99, 'art,diy,wellness', 'birthday,anniversary,valentines,mothers_day', '🏺'),
('Kids'' Art Easel', 'Double-sided chalkboard, whiteboard and paper roll.', 55, 3, 10, 'art,toys', 'birthday,christmas', '🖍️'),
('Paint-by-Numbers Kit', 'Create a gallery-worthy canvas step by step.', 25, 10, 120, 'art,wellness,diy', 'any', '🖌️'),
('Calligraphy Starter Set', 'Pens, nibs, ink and practice guides.', 30, 12, 99, 'art', 'birthday,christmas', '✒️'),
('Custom Pet Portrait', 'A hand-illustrated portrait of their beloved pet.', 65, 12, 120, 'pets,art,home', 'any', '🐾'),
('Custom Star Map', 'The night sky from a date that matters to them.', 45, 16, 120, 'home,art,science', 'anniversary,wedding,valentines,birthday', '✨'),
('Personalised Family Tree Print', 'A framed illustration of the family tree.', 50, 30, 120, 'home,art', 'mothers_day,fathers_day,retirement,christmas', '🌳'),

-- Cooking & food
('Chef''s Knife', 'A razor-sharp, perfectly balanced everyday knife.', 89, 18, 99, 'cooking', 'wedding,housewarming,christmas,birthday', '🔪'),
('Cast Iron Skillet', 'Lasts a lifetime and only gets better with age.', 40, 18, 99, 'cooking,outdoors', 'housewarming,wedding,christmas', '🍳'),
('Air Fryer', 'Crispy, delicious food with a fraction of the oil.', 99, 18, 99, 'cooking,home', 'housewarming,wedding,christmas', '🍟'),
('Gourmet Spice Collection', 'Twelve premium spices from around the world.', 35, 18, 99, 'cooking,travel', 'any', '🌶️'),
('Cooking Class Experience', 'Learn a new cuisine from a professional chef.', 95, 16, 99, 'cooking,travel', 'birthday,anniversary,valentines,retirement', '👩‍🍳'),
('Personalised Cutting Board', 'Engraved hardwood board — a kitchen heirloom.', 45, 21, 120, 'cooking,home', 'wedding,housewarming,anniversary,mothers_day', '🪵'),
('Kids'' Baking Set', 'Child-safe tools, apron and illustrated recipe cards.', 30, 5, 12, 'cooking,toys', 'birthday,christmas', '🧁'),
('Pasta Maker', 'Fresh homemade pasta in minutes.', 70, 18, 99, 'cooking', 'wedding,housewarming,christmas', '🍝'),
('Cocktail Shaker Set', 'Pro bar tools for crafting drinks at home.', 40, 21, 99, 'cooking,home', 'birthday,housewarming,wedding,fathers_day', '🍸'),
('Wine Tasting Experience', 'A guided tasting at a local vineyard.', 85, 21, 99, 'cooking,travel', 'anniversary,birthday,valentines,retirement', '🍷'),
('Gourmet Chocolate Box', 'Handcrafted truffles in a keepsake box.', 30, 6, 120, 'cooking', 'any', '🍫'),
('Gourmet Gift Basket', 'Artisan cheeses, crackers and sweet treats.', 60, 18, 120, 'cooking', 'thank_you,christmas,housewarming,retirement', '🧺'),
('Movie Night Gift Basket', 'Popcorn, candy and a streaming gift card.', 45, 10, 120, 'movies,cooking', 'any', '🍿'),

-- Coffee & tea
('Pour-Over Coffee Kit', 'Dripper, gooseneck kettle and filters for the perfect cup.', 55, 18, 99, 'coffee,cooking', 'any', '☕'),
('Specialty Coffee Subscription', 'Freshly roasted single-origin beans each month.', 30, 18, 99, 'coffee', 'any', '🫘'),
('Loose-Leaf Tea Sampler', 'Twenty premium teas from around the world.', 30, 14, 120, 'coffee,wellness', 'any', '🍵'),
('Temperature-Control Smart Mug', 'Keeps coffee at the perfect temperature for hours.', 129, 18, 99, 'coffee,tech', 'birthday,christmas,mothers_day,fathers_day,thank_you', '☕'),
('Insulated Travel Tumbler', 'Hot for 12 hours, cold for 24.', 30, 14, 99, 'coffee,travel,outdoors', 'any', '🥤'),
('Matching Couple Mugs', 'A cute his-and-hers (or hers-and-hers) mug pair.', 25, 16, 99, 'coffee,home', 'valentines,anniversary,wedding', '💞'),

-- Fitness
('Yoga Mat & Block Set', 'Non-slip mat with alignment lines and two blocks.', 45, 14, 99, 'fitness,wellness', 'any', '🧘'),
('Adjustable Dumbbells', 'Space-saving weights for serious home workouts.', 199, 16, 70, 'fitness', 'birthday,christmas', '🏋️'),
('Massage Gun', 'Soothes sore muscles after tough workouts.', 99, 18, 99, 'fitness,wellness', 'birthday,christmas,fathers_day,mothers_day', '💪'),
('Gym Duffel Bag', 'Separate shoe pocket and water-bottle holder.', 45, 14, 70, 'fitness,sports,fashion', 'birthday,graduation', '👜'),
('Resistance Band Set', 'Full-body workouts anywhere, anytime.', 25, 14, 99, 'fitness,travel', 'any', '🎽'),
('Smart Water Bottle', 'Glows to remind them to stay hydrated.', 40, 12, 99, 'fitness,wellness,tech', 'any', '💧'),
('Fitness Class Pass', 'A month of classes at a local studio.', 100, 16, 80, 'fitness,wellness', 'birthday,christmas,valentines', '🤸'),

-- Outdoors
('Camping Hammock', 'Lightweight and packs into its own pocket.', 35, 12, 80, 'outdoors,travel', 'birthday,christmas,graduation', '🏕️'),
('Hiking Daypack', 'Comfortable pack with hydration sleeve.', 70, 12, 75, 'outdoors,travel,fitness', 'birthday,christmas,graduation', '🥾'),
('LED Headlamp', 'Bright, hands-free light for trails and campsites.', 25, 10, 90, 'outdoors', 'any', '🔦'),
('Compact Binoculars', '10x42 optics for birdwatching and hiking.', 89, 10, 120, 'outdoors,science', 'birthday,christmas,retirement,fathers_day', '🦅'),
('Multi-Tool', 'Fifteen tools in one pocket-sized kit.', 60, 18, 99, 'outdoors,diy', 'fathers_day,birthday,christmas,graduation', '🛠️'),
('Portable Camping Stove', 'Boil water in minutes, anywhere.', 50, 16, 80, 'outdoors,cooking', 'birthday,christmas', '🔥'),
('National Parks Annual Pass', 'A full year of entry to national parks.', 80, 16, 99, 'outdoors,travel,photography', 'birthday,christmas,graduation,retirement', '🏞️'),
('Kids'' Explorer Kit', 'Binoculars, compass, flashlight and magnifier.', 30, 4, 12, 'outdoors,science,toys', 'birthday,christmas', '🧭'),
('Hot Air Balloon Ride', 'A sunrise flight over the countryside.', 250, 12, 90, 'travel,outdoors,photography', 'anniversary,birthday,retirement,valentines', '🎈'),

-- Travel
('Personalised Passport Holder', 'Leather cover embossed with their initials.', 30, 16, 99, 'travel,fashion', 'graduation,birthday,wedding,retirement', '🛂'),
('Scratch-Off World Map', 'Reveal every country they visit.', 30, 12, 99, 'travel,home,art', 'any', '🗺️'),
('Packing Cubes Set', 'Keeps suitcases neat and organised.', 25, 14, 99, 'travel', 'graduation,birthday,christmas,retirement', '📦'),
('Memory Foam Travel Pillow', 'Restful sleep on planes and trains.', 30, 10, 99, 'travel,wellness', 'any', '😴'),
('Weekend Getaway Voucher', 'A night away at a boutique hotel.', 250, 21, 99, 'travel,wellness', 'anniversary,valentines,wedding,retirement', '🏨'),
('Universal Travel Adapter', 'Works in 150+ countries, with USB-C fast charging.', 30, 14, 99, 'travel,tech', 'graduation,birthday,christmas', '🌍'),
('Carry-On Suitcase', 'Lightweight hard-shell spinner luggage.', 150, 16, 99, 'travel,fashion', 'graduation,wedding,retirement', '🧳'),

-- Fashion & accessories
('Minimalist Watch', 'Timeless design for everyday wear.', 120, 16, 99, 'fashion', 'graduation,birthday,anniversary,valentines,fathers_day', '⌚'),
('Slim Leather Wallet', 'RFID-blocking with room for the essentials.', 45, 16, 99, 'fashion', 'birthday,christmas,fathers_day,graduation', '👛'),
('Silk Scarf', 'A soft, elegant accessory for any outfit.', 55, 16, 120, 'fashion', 'mothers_day,birthday,christmas,anniversary', '🧣'),
('Personalised Name Necklace', 'A dainty pendant with their name.', 50, 12, 99, 'fashion', 'birthday,valentines,mothers_day,anniversary,graduation', '📿'),
('Polarised Sunglasses', 'UV protection with classic style.', 70, 14, 99, 'fashion,outdoors,travel', 'birthday,graduation', '🕶️'),
('Cashmere Beanie', 'Luxuriously warm winter hat.', 60, 14, 99, 'fashion,outdoors', 'christmas,birthday', '🧢'),
('Sneaker Cleaning Kit', 'Keeps kicks looking box-fresh.', 25, 12, 50, 'fashion,sports', 'birthday,christmas', '👟'),
('Birthstone Ring', 'Sterling silver ring set with their birthstone.', 75, 14, 99, 'fashion', 'birthday,anniversary,valentines', '💍'),

-- Beauty & grooming
('Skincare Gift Set', 'Cleanser, serum and moisturiser trio.', 60, 16, 99, 'beauty,wellness', 'birthday,christmas,mothers_day,valentines', '🧴'),
('Luxury Perfume', 'A signature scent they''ll love.', 95, 18, 99, 'beauty,fashion', 'birthday,valentines,anniversary,mothers_day', '🌸'),
('Silk Pillowcase', 'Gentle on hair and skin for beauty sleep.', 40, 14, 120, 'beauty,wellness,home', 'any', '🛏️'),
('Makeup Brush Set', 'Twelve soft synthetic brushes in a travel case.', 35, 14, 80, 'beauty', 'birthday,christmas', '💄'),
('Beard Grooming Kit', 'Oil, balm, brush and comb.', 35, 18, 99, 'beauty', 'fathers_day,birthday,christmas', '🧔'),
('Kids'' Nail Polish Kit', 'Peel-off, non-toxic colours.', 20, 6, 12, 'beauty,art,toys', 'birthday,christmas', '💅'),

-- Wellness & relaxation
('Aromatherapy Diffuser', 'Ultrasonic diffuser with essential oils.', 40, 14, 120, 'wellness,home', 'any', '🌿'),
('Spa Day Voucher', 'Massage and treatments at a local spa.', 150, 18, 120, 'wellness,beauty', 'mothers_day,birthday,anniversary,valentines,retirement,thank_you', '💆'),
('Weighted Blanket', 'Calming pressure for deeper sleep.', 79, 12, 120, 'wellness,home', 'birthday,christmas', '🛌'),
('Meditation App Subscription', 'A year of guided meditation and sleep stories.', 70, 14, 120, 'wellness,tech', 'any', '🧠'),
('Scented Candle Set', 'Hand-poured soy candles in seasonal scents.', 35, 16, 120, 'wellness,home', 'any', '🕯️'),
('Bath Bomb Gift Box', 'Fizzy, fragrant bath treats.', 25, 8, 120, 'wellness,beauty', 'any', '🛁'),
('Plush Bathrobe', 'Hotel-style robe for lazy weekend mornings.', 60, 16, 120, 'home,wellness', 'christmas,mothers_day,fathers_day,anniversary', '🧖'),

-- Home
('Personalised Doormat', 'A custom family-name welcome mat.', 40, 21, 120, 'home', 'housewarming,wedding', '🏠'),
('Robot Vacuum', 'Keeps floors spotless automatically.', 249, 21, 99, 'home,tech', 'housewarming,wedding,christmas', '🤖'),
('Printed Photo Book', 'A beautiful album of shared memories.', 40, 10, 120, 'photography,home', 'anniversary,mothers_day,fathers_day,retirement,wedding,valentines', '📔'),
('Monogrammed Towel Set', 'Plush cotton towels with their initials.', 55, 21, 120, 'home', 'wedding,housewarming', '🏡'),
('Elegant Diploma Frame', 'Show off that hard-earned degree.', 50, 16, 40, 'home', 'graduation', '🎓'),
('Fresh Flower Subscription', 'Seasonal blooms delivered every month.', 45, 16, 120, 'gardening,home', 'mothers_day,valentines,anniversary,birthday,thank_you', '💐'),

-- Gardening
('Indoor Herb Garden Kit', 'Grow basil, mint and parsley on the windowsill.', 40, 14, 120, 'gardening,cooking,home', 'housewarming,mothers_day,christmas,retirement', '🌱'),
('Gardening Tool Set', 'Ergonomic trowel, pruners and gloves.', 45, 16, 120, 'gardening,outdoors', 'mothers_day,fathers_day,birthday,retirement,housewarming', '🧤'),
('Bonsai Tree Starter Kit', 'Grow and shape a miniature tree.', 35, 12, 120, 'gardening,wellness', 'birthday,christmas,retirement', '🌳'),
('Smart Bird Feeder with Camera', 'Identifies and photographs visiting birds.', 150, 16, 120, 'gardening,outdoors,tech,science', 'birthday,christmas,retirement', '🐦'),
('Succulent Collection', 'Low-maintenance plants in modern pots.', 30, 12, 120, 'gardening,home', 'any', '🌵'),
('Raised Garden Bed', 'Grow vegetables on any patio or balcony.', 80, 18, 120, 'gardening,outdoors', 'housewarming,retirement,mothers_day', '🥕'),

-- Photography
('Clip-On Phone Lens Kit', 'Wide, macro and fisheye lenses for phones.', 35, 12, 80, 'photography,tech', 'birthday,christmas', '🔍'),
('Photography Workshop', 'A half-day course with a professional photographer.', 120, 16, 80, 'photography,art', 'birthday,retirement,graduation', '📷'),
('Travel Tripod', 'Lightweight tripod with a phone mount.', 45, 14, 80, 'photography,travel', 'birthday,christmas', '📷'),

-- Sports
('Team Jersey', 'Official jersey of their favourite team.', 90, 6, 80, 'sports,fashion', 'birthday,christmas,fathers_day', '👕'),
('Game Day Tickets', 'Great seats at a live match.', 100, 8, 90, 'sports', 'birthday,fathers_day,graduation,anniversary', '🏟️'),
('Over-the-Door Basketball Hoop', 'Mini hoop for indoor trick shots.', 30, 6, 40, 'sports,toys', 'birthday,christmas', '🏀'),
('Personalised Golf Balls', 'A dozen premium balls with their initials.', 40, 18, 99, 'sports', 'fathers_day,birthday,retirement', '⛳'),
('Tennis Racket', 'Lightweight racket for beginners and improvers.', 80, 8, 80, 'sports,fitness', 'birthday,christmas', '🎾'),
('Kids'' Light-Up Scooter', 'Light-up wheels and adjustable handlebar.', 60, 4, 12, 'sports,outdoors,toys', 'birthday,christmas', '🛴'),
('Bike Accessories Kit', 'Lights, lock and a multi-tool repair kit.', 40, 10, 80, 'sports,outdoors', 'birthday,christmas', '🚲'),

-- Movies
('Mini Projector', 'Turns any wall into a big screen.', 120, 14, 99, 'movies,tech,home', 'birthday,christmas,housewarming', '📽️'),
('Streaming Service Gift Card', 'Months of films and binge-worthy shows.', 50, 13, 120, 'movies,tech', 'any', '🎬'),
('Cinema Experience for Two', 'Premium recliner seats with snacks.', 40, 13, 99, 'movies', 'valentines,anniversary,birthday', '🎟️'),
('Film Trivia Board Game', 'Put their movie knowledge to the test.', 30, 12, 99, 'movies,gaming', 'birthday,christmas', '🎞️'),
('Couples'' Date Night Box', 'Games, snacks and activities for a cosy night in.', 40, 18, 99, 'gaming,movies,cooking', 'anniversary,valentines,wedding', '❤️'),

-- Pets
('Pet Camera with Treat Tosser', 'Check in and toss treats from anywhere.', 120, 18, 99, 'pets,tech', 'birthday,christmas', '🐶'),
('Personalised Pet Bed', 'A cosy bed embroidered with the pet''s name.', 60, 12, 120, 'pets,home', 'birthday,christmas,housewarming', '🐕'),
('Interactive Cat Toy', 'Self-moving toy that keeps cats entertained.', 30, 10, 120, 'pets', 'any', '🐱'),
('Hands-Free Dog Walking Kit', 'Leash, treat pouch and bag dispenser.', 35, 12, 90, 'pets,outdoors,fitness', 'any', '🦮'),

-- Science & learning
('Kids'' Science Experiment Kit', '50+ safe, wow-worthy experiments at home.', 35, 6, 12, 'science,toys', 'birthday,christmas', '🧪'),
('Beginner Telescope', 'See the moon''s craters and Saturn''s rings.', 150, 10, 99, 'science,outdoors', 'birthday,christmas,graduation,retirement', '🔭'),
('Coding Robot for Kids', 'Learn programming through play.', 90, 6, 14, 'science,tech,toys', 'birthday,christmas', '🤖'),
('Student Microscope Kit', '40x–1000x magnification with prepared slides.', 60, 8, 99, 'science', 'birthday,christmas', '🔬'),
('Building Bricks Set', 'Hours of creative construction fun.', 60, 6, 99, 'diy,toys,science', 'birthday,christmas', '🧱'),
('Crystal Growing Kit', 'Grow colourful crystals in just days.', 25, 7, 12, 'science,art,toys', 'birthday,christmas', '💎'),
('Online Course Subscription', 'Unlimited learning from world-class experts.', 120, 16, 99, 'science,tech,reading', 'graduation,birthday,retirement', '🎓'),

-- DIY & hobbies
('Cordless Drill Set', 'Makes every home project easier.', 99, 18, 99, 'diy,home', 'housewarming,fathers_day,christmas', '🔧'),
('Wood Carving Starter Kit', 'Whittling knives and basswood blocks.', 35, 14, 99, 'diy,art', 'birthday,christmas,fathers_day,retirement', '🪚'),
('Beginner Knitting Kit', 'Yarn, needles and an easy first pattern.', 30, 10, 120, 'diy,art,wellness', 'birthday,christmas,retirement', '🧶'),
('Candle-Making Kit', 'Make scented soy candles at home.', 35, 12, 99, 'diy,wellness,art', 'birthday,christmas', '🫙'),
('Scale Model Kit', 'A detailed model plane, ship or classic car.', 40, 10, 99, 'diy,science', 'birthday,christmas,fathers_day', '✈️'),
('Modern Embroidery Kit', 'Floral patterns designed for beginners.', 25, 12, 120, 'diy,art', 'birthday,mothers_day,christmas', '🪡'),

-- Babies & young children
('Plush Teddy Bear', 'A cuddly best friend for little ones.', 20, 0, 10, 'toys', 'birthday,christmas,baby', '🧸'),
('Baby Activity Gym', 'Soft play mat with hanging sensory toys.', 60, 0, 1, 'toys', 'baby,christmas', '👶'),
('Wooden Stacking Toy', 'Montessori-style stacking and sorting set.', 25, 1, 4, 'toys,science', 'baby,birthday,christmas', '🌈'),
('Personalised Baby Blanket', 'Soft knit blanket embroidered with their name.', 40, 0, 2, 'home,toys', 'baby', '🍼'),
('First Board Books Set', 'Colourful, chunky first books.', 25, 0, 5, 'reading,toys', 'baby,birthday,christmas', '📚'),
('Toddler Ride-On Car', 'Push-along car for first adventures.', 70, 1, 4, 'toys,sports', 'birthday,christmas', '🚗'),
('Magnetic Building Tiles', 'Build 3D shapes and towers with magnets.', 50, 3, 10, 'toys,science', 'birthday,christmas', '🔷'),
('Wooden Dollhouse', 'Three-storey house with furniture.', 100, 3, 10, 'toys', 'birthday,christmas', '🏘️'),
('Remote-Control Stunt Car', 'Fast, rugged RC car that flips and spins.', 50, 6, 14, 'toys,tech', 'birthday,christmas', '🏎️'),
('Kids'' Tablet', 'Durable tablet with parental controls.', 100, 3, 12, 'toys,tech,gaming', 'birthday,christmas', '📱'),
('Bubble Machine', 'Hundreds of bubbles per minute.', 25, 2, 8, 'toys,outdoors', 'birthday', '🫧'),
('Play Kitchen', 'Pretend cooking with sounds and lights.', 120, 2, 7, 'toys,cooking', 'birthday,christmas', '🥘');
