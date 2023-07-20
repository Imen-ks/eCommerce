//
//  ProductDatabase.swift
//  eCommerce
//
//  Created by Imen Ksouri on 26/06/2023.
//

import Foundation
import SwiftUI

#if DEBUG
final class ProductDatabase {
    static let topsSizes = ["XXS", "XS", "S", "M", "L", "XL", "XXL"]
    static let bottomsSizes = ["2", "4", "6", "8", "10", "12", "14"]
    static let shoesSizes = ["4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10"]
    static let beltsSizes = ["26", "28", "30", "32", "34", "36", "38"]
    static let accessoriesSizes = ["One Size"]
    
    static let products: [Product] = [
        
        // MARK: - LACOSTE Products
        Product(id: "10000", name: "Stretch Cotton Piqué Polo Dress",
                price: 169, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
Wander about in pure Lacoste style with a timeless, feminine, slim-fit polo dress that comes in various colours. Exquisite details include the mother of pearls buttons and mini cotton piqué crafting.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Navy Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10000-1.png?alt=media&token=fa4fad4c-e573-4d47-865c-f4b49d56ae5c"),
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10000-2.png?alt=media&token=903641a7-f8d2-4fad-8344-3684bf8c9955"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10000-3.png?alt=media&token=39fce424-9136-48be-9f92-3596942a1ca7")]),
        Product(id: "10001", name: "Crew Neck Organic Cotton T-shirt",
                price: 75, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
Don’t miss this crew neck tee, a timeless unisex classic. Crafted in soft, comfortable organic cotton jersey, this urban must-have is topped with a small emblematic green crocodile embroidery on the chest. A casual piece that goes perfectly with any pants this season.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Light Orange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10001-1.png?alt=media&token=56194b71-873b-4ad7-9a8f-a6d05ba5e135"),
                    ProductVariant(color: Color.green, colorName: "Mint", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10001-2.png?alt=media&token=e88b16d7-bc56-4b61-8ec4-84bab52aabd0"),
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10001-3.png?alt=media&token=0568519d-5186-46b6-8154-d7fd0f936329")]),
        Product(id: "10002", name: "Oversize Cotton Poplin Shirt",
                price: 149, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shirts.rawValue,
                description: """
Inspired by every day, with a twist of Lacoste style. Wrap yourself in this loose, lightweight shirt.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10002-1.png?alt=media&token=6a987dbc-35b0-40fc-9ec8-ac23ca0efff1"),
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10002-2.png?alt=media&token=980dba38-6000-48cb-8729-ebd0cdc7ec2b")]),
        Product(id: "10003", name: "Hooded Organic Fleece Zippered Sweatshirt",
                price: 159, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
A sweatshirt for all activities, both on and off the court. Functional, sustainable, timeless.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Bordeaux", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10003-1.png?alt=media&token=b35ddbed-f35e-4638-92e2-604cde1a4fad"),
                    ProductVariant(color: Color.green, colorName: "Mint", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10003-2.png?alt=media&token=234de46a-4d97-4bbd-9637-4a57694d621d"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10003-3.png?alt=media&token=c9138c23-23e2-49df-a285-c74cdd206038")]),
        Product(id: "10004", name: "Two-Ply Trackpants",
                price: 179, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
Practical. Comfortable. Ergonomic. A new essential from the Lacoste sportswear wardrobe.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.green, colorName: "Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10004-1.png?alt=media&token=a6aec043-648b-4836-b56d-a47b0fbe377e"),
                    ProductVariant(color: Color.orange, colorName: "Orange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10004-2.png?alt=media&token=7da11502-117c-496f-9d11-515c389c3efe"),
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10004-3.png?alt=media&token=c363fd0d-4060-44a0-8918-3e59de66e8aa")]),
        Product(id: "10005", name: "Lacoste x Sporty & Rich Fleece Shorts",
                price: 135, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
Retro-style shorts from Lacoste x Sporty & Rich inspired by our brands' tennis heritage, with a vintage cut and premium fleece fabric - perfect with one of the polos from the collection.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Light Orange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10005-1.png?alt=media&token=39291962-cf64-40da-bec4-324cadddef3a"),
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10005-2.png?alt=media&token=d72c008c-a25e-45b5-9f38-c7a7740136ff"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10005-3.png?alt=media&token=3a5a34fb-87f7-497f-83d2-5e4ac582dd3f")]),
        Product(id: "10006", name: "Oversized Two Tone Taffeta Jacket",
                price: 295, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jackets.rawValue,
                description: """
Fashion or sportswear... why choose? Wear this chic, feminine Lacoste jacket with the matching track pants.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Grey / Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10006-1.png?alt=media&token=e2dd70b5-774a-405a-86fe-648fb7ddf417"),
                    ProductVariant(color: Color.green, colorName: "Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10006-2.png?alt=media&token=2b1155a0-5696-4b74-b6b2-184e0c019074")]),
        Product(id: "10007", name: "AG-LT23 Ultra Textile Tennis Shoes",
                price: 205, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
The AG-LT23 Ultra: an elite performance-driven model. Impressive technical innovation and design for top-tier tennis play. Win at style. Win the game.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10007-1.png?alt=media&token=76329998-00b0-489c-97a9-cfbbaa0564d1"),
                    ProductVariant(color: Color.yellow, colorName: "Yellow", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10007-2.png?alt=media&token=759a6687-096e-4fce-bba9-01c1610f0415"),
                    ProductVariant(color: Color.orange, colorName: "Orange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10007-3.png?alt=media&token=1f87ecea-5a2c-4707-8c18-0c558ddbb3e2")]),
        Product(id: "10008", name: "Chantaco Piqué Leather Top Handle Bag",
                price: 279, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
An iconic bugatti shape is given to this small Chantaco bag. Made from fine piqué leather resembling the texture of a golf ball, the accessory is equipped with a zippered fastening to keep your things safe, carry handles and a removable and adjustable shoulder strap. Wear it across your body or in your hand, it adapts to your every whim.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10008-1.png?alt=media&token=d66f2df0-a400-425f-a257-d8e09df42965"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10008-2.png?alt=media&token=8e1310de-41a6-4a9f-8332-3e3b7ed97e22")]),
        Product(id: "10009", name: "Oval Metal Novak Djokovic Collection Sunglasses",
                price: 199, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.sunglasses.rawValue,
                description: """
Oval sunglasses might just be the right shape for you, and these distinctive athletic sunglasses from the Novak Djokovic collection might just change your look. If you require corrective lenses, you may have them fitted into the metal frames, which have ultra-slim temples adorned with a tricolor enamel accent. Slip this unisex model into a crossbody bag in piqué canvas.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black / Gold", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10009-1.png?alt=media&token=31f12a0b-42dd-48fe-a798-609a2aea355d"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Brown / Gold", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10009-2.png?alt=media&token=6448e632-c56e-4cea-8892-544554af697a")]),
        Product(id: "10010", name: "12.12 Go 3 Hands Watch",
                price: 175, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.watches.rawValue,
                description: """
The iconic Lacoste.12.12 women's watch is back with a touch of femininity, combining elegance and sportiness.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10010-1.png?alt=media&token=225be4bd-9e59-4e65-bae4-8465e0647cac"),
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10010-2.png?alt=media&token=f1523925-1113-4797-8896-e3f592512bb9")]),
        Product(id: "10011", name: "Metal Crocodile Stitched Leather Belt",
                price: 79, brand: Brand.lacoste.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.belts.rawValue,
                description: """
Available in several seasonal colours, this narrow, stitched leather belt is crafted in high-quality leather. Featuring a shiny square metal pin buckle, it has a small matching crocodile on the tip. Try this textured look to accent the waist of your favourite pants.
""",
                sizes: beltsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10011-1.png?alt=media&token=55aa1e7b-2629-42ab-b6b1-889d6686a0a6"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10011-2.png?alt=media&token=5e73deb8-113d-4125-be40-4844057d1fec")]),
        
        // MARK: - RALPH LAUREN Products
        Product(id: "10012", name: "Belted Crepe Shirtdress",
                price: 279, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
This lightweight crepe shirtdress is punctuated with a striped self-belt for a nautical-inspired finish.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Portside Coral", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10012-1.png?alt=media&token=69788963-97ec-453a-a62b-3da7df1f4025"),
                    ProductVariant(color: Color.blue, colorName: "Refined Navy", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10012-2.png?alt=media&token=33f120fd-f603-4aab-8952-c406bcefe53f")]),
        Product(id: "10013", name: "Cotton Jersey Crewneck T-Shirt",
                price: 95, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
Cut for a straight fit, this cotton jersey crewneck tee has been washed for added softness and finished with our signature embroidered Pony.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Faded Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10013-1.png?alt=media&token=df9d6581-debf-4ff4-aeb7-25effb5eb6b9"),
                    ProductVariant(color: Color.blue, colorName: "Colby Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10013-2.png?alt=media&token=3cc83184-46d3-4414-9fa3-3f2d96eb5577"),
                    ProductVariant(color: Color.gray, colorName: "Cobblestone Heather", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10013-3.png?alt=media&token=83db3a2a-ed49-42df-b25d-febb28e5260e")]),
        Product(id: "10014", name: "Oversize Fit Linen Shirt",
                price: 209, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shirts.rawValue,
                description: """
Rendered in lightweight linen and cut for a oversize silhouette, this shirt is finished with lustrous shell buttons and our signature embroidered Pony on the cuff.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Montana Khaki", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10014-1.png?alt=media&token=ecc0ad24-fd17-4adf-9493-483099beda63"),
                    ProductVariant(color: Color.red, colorName: "Rust", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10014-2.png?alt=media&token=97856e7d-c6d3-4108-a898-6c9da15d5941"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10014-3.png?alt=media&token=e6f1db8c-d970-41d8-95bb-a64658807b47")]),
        Product(id: "10015", name: "Fleece Crewneck Pullover",
                price: 199, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
Crafted with soft fleece for a perfectly lived-in feel, Polo's refined take on the classic pullover sweatshirt is finished with our signature embroidered Pony.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Dark Vintage Heather", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10015-1.png?alt=media&token=912ac4bc-13e6-4019-87c7-478da32dd16f"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10015-2.png?alt=media&token=84083387-4326-4e13-8f93-ee27f950bedf"),
                    ProductVariant(color: Color.yellow, colorName: "Wicket Yellow", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10015-3.png?alt=media&token=593904e2-0e5a-49c0-9679-c4824157443c")]),
        Product(id: "10016", name: "Cropped Slim Fit Twill Chino Trouser",
                price: 239, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
Cut for a slightly cropped, slim fit, these lightweight chino trousers are made with stretch-blend cotton twill and tailored with crisp creases along the front and back of each leg.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Newport Navy", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10016-1.png?alt=media&token=d83b8eae-307b-405f-8ca6-9808588e7b5d"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Montana Khaki", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10016-2.png?alt=media&token=fab1c6dc-b7c2-47e8-8011-edeaa2ee1dae"),
                    ProductVariant(color: Color.green, colorName: "Outdoors Olive", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10016-3.png?alt=media&token=486aee96-f92a-4333-8bdf-d38b95aedef1")]),
        Product(id: "10017", name: "Tompkins Skinny Jean",
                price: 159, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jeans.rawValue,
                description: """
Anchored in timeless all-American style, the Tompkins jean offers a quintessential skinny silhouette. A high-stretch cotton blend is designed to keep this pair's shape wear after wear.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Serret Wash", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10017-1.png?alt=media&token=09dae70b-e4a9-4e36-962a-8d6f0017df0a"),
                    ProductVariant(color: Color.white, colorName: "Leah Wash", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10017-2.png?alt=media&token=9688268d-b2dc-4fd2-8a68-32a9782b8e75")]),
        Product(id: "10018", name: "Chino Short",
                price: 165, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
Designed with a sun-washed look, these chino shorts are crafted with left-hand cotton twill for a naturally softer hand and a sturdy structure.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.yellow, colorName: "Shell", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10018-1.png?alt=media&token=69446051-e607-443d-84fa-eccdd329a2bd"),
                    ProductVariant(color: Color.blue, colorName: "Ice", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10018-2.png?alt=media&token=8eaac3c3-e3ba-4e25-aad8-4bd2e82649f3"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Sand", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10018-3.png?alt=media&token=07fd28bb-aec6-4025-b8fa-2ad7b2225fe4")]),
        Product(id: "10019", name: "Double-Knit Jacquard Blazer",
                price: 445, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jackets.rawValue,
                description: """
Woven from a cotton blend, this double-knit jacquard blazer is cut for a single-button, notch-lapel silhouette and accented with our signature monogram embroidered on the chest.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Park Avenue Navy", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10019-1.png?alt=media&token=88e3a129-76be-451d-b267-3236095db866"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10019-2.png?alt=media&token=e3f051ea-eb5a-4980-af4f-a4bde0e3f003")]),
        Product(id: "10020", name: "Wool-Blend Wrap Coat",
                price: 825, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.coats.rawValue,
                description: """
An ideal layering piece for transitional weather, this unlined coat is designed with a relaxed wrap silhouette in a cosy wool-and-cashmere blend.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Grey Melange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10020-1.png?alt=media&token=c9be1085-34af-45a3-90ac-adaec49bdf25"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Camel Melange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10020-2.png?alt=media&token=ebe8dcbd-a0f6-4c86-a8f3-a56103654c4a")]),
        Product(id: "10021", name: "Logo Tech Trainer",
                price: 439, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
Channelling 1990s streetwear, the Anika trainer merges form and function with a leather and mesh upper coupled with a technical Vibram® outsole, which is expertly crafted for flexibility, durability and water resistance. Our "Polo" logo is magnified on the back heel with a transparent bubble, while our signature Pony is embossed on the outer side.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Guide Cream", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10021-1.png?alt=media&token=7b325c71-d8b5-480e-a165-8e68672457c0"),
                    ProductVariant(color: Color.yellow, colorName: "White / Bird Yellow", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10021-2.png?alt=media&token=5e0eac75-5228-400d-9a8f-19d45fe8ba44"),
                    ProductVariant(color: Color.white, colorName: "White / Stucco / Silver", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10021-3.png?alt=media&token=cd95a273-9bd9-478a-97fa-743c6703a27a")]),
        Product(id: "10022", name: "Gwen Nappa Leather Sandal",
                price: 139, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.sandals.rawValue,
                description: """
Crafted with luxuriously soft nappa leather, the Gwen sandal is accented with a chic ankle strap.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.purple, colorName: "Plum Caspia", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10022-1.png?alt=media&token=345d61d1-7a5f-4d23-b3cb-e94a301f2369"),
                    ProductVariant(color: Color.blue, colorName: "Blue Yacht", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10022-2.png?alt=media&token=8d2f4e53-0bdf-4537-b9fb-648109da30e2"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Deep Saddle Tan / Vanilla", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10022-3.png?alt=media&token=5bc4b874-eae9-4a92-a989-7322745f2127")]),
        Product(id: "10023", name: "Lanette Leather Pump",
                price: 149, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.pumps.rawValue,
                description: """
Rendered in supple full-grain leather, which is distinguished by its naturally smooth finish, this classic pointy-toe pump features a padded footbed for all-day comfort.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Deep Saddle Tan", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10023-1.png?alt=media&token=ab7e7a98-bbe7-4043-89e7-3fae1c861e3b"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10023-2.png?alt=media&token=a744092b-3b50-4615-9740-fe4a637b4f65")]),
        Product(id: "10024", name: "Maxie Burnished Leather Bootie",
                price: 315, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.boots.rawValue,
                description: """
An essential transitional bootie, the Maxie is constructed with smooth burnished leather and accented by a "LRL" metal hardware on the ankle. A heeled silhouette creates a leg-lengthening effect, while a padded footbed ensures comfort with each step.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Deep Saddle Tan", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10024-1.png?alt=media&token=6db90048-1399-49e4-bbd8-caa4ad87f2e0"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10024-2.png?alt=media&token=d6d5766b-e9c2-4814-bd01-320df7c193f5")]),
        Product(id: "10025", name: "Jayna Nappa Leather Flat",
                price: 139, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.ballerinas.rawValue,
                description: """
Crafted from soft, full-grain nappa leather, this flat features a delicate bow with "LRL"-engraved charms and a signature "LRL" plaque on the heel.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Portside Coral", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10025-1.png?alt=media&token=d0ccacd3-6a0d-48aa-90ec-0bc918941279"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Buff", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10025-2.png?alt=media&token=3fd2b554-24f4-4370-b82e-8bd32a19d5eb"),
                    ProductVariant(color: Color.blue, colorName: "Blue Yacht", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10025-3.png?alt=media&token=ebf5ffcc-d4a6-4c12-a02a-7fbadcc49ab8")]),
        Product(id: "10026", name: "Polo ID Calfskin Small Shoulder Bag",
                price: 699, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
Part of the Polo ID collection, which is inspired by a sense of adventure, romance and optimism, this Italian calfskin shoulder bag evokes a subtle equestrian sensibility with its spacious, dual-compartment saddle silhouette, slightly raised bombé detailing on the strap, and flexible bonded suede interior construction. It's finished with a magnetic teardrop slide lock showcasing the silhouette of our signature Pony cutout on gold-tone brass hardware reminiscent of vintage ID bracelets.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Tan", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10026-1.png?alt=media&token=ccfe59fc-af4e-44b4-9137-b5e0797d97b5"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10026-2.png?alt=media&token=4d8584e6-09af-44f2-802a-259806fdf802")]),
        Product(id: "10027", name: "Stirrup Pavé Sunglasses",
                price: 219, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.sunglasses.rawValue,
                description: """
Part of Ralph Lauren's iconic Stirrup eyewear collection, these oversize, butterfly-shaped sunglasses are beautifully sculpted from polished acetate and feature equestrian-inspired details with light-catching crystal embellishments and our signature "RL" logo at each temple.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.purple, colorName: "Shiny Purple", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10027-1.png?alt=media&token=40733812-f6d0-40e5-b4aa-c993e74e0ea0"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Shiny Havana Homy", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10027-2.png?alt=media&token=bc3848d4-6b85-438d-a5fd-577abf45740d"),
                    ProductVariant(color: Color.black, colorName: "Shiny Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10027-3.png?alt=media&token=81cf027f-eeed-4786-96ce-43bd2a665e84")]),
        Product(id: "10028", name: "Polo ID Oval-Buckle Vachetta Belt",
                price: 215, brand: Brand.lauren.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.belts.rawValue,
                description: """
Part of the Polo ID collection, which is inspired by a sense of adventure, romance and optimism, this full-grain vachetta leather belt showcases the silhouette of our signature Pony cut out on a gold-tone brass oval-shaped buckle.
""",
                sizes: beltsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "Cream", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10028-1.png?alt=media&token=d801dd6a-21df-4fbc-bc2b-0640a6f80a7a"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Cuoio", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10028-2.png?alt=media&token=dfbc987f-a0a5-4220-9e9d-d95852b3a433"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10028-3.png?alt=media&token=4e67959c-f344-45de-8568-3688d263f9d1")]),
        
        // MARK: - ADIDAS Products
        Product(id: "10029", name: "Adicolor Classics 3-Stripes Maxi Dress",
                price: 69, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
Make a statement without sacrificing comfort with the adidas Adicolor Classics 3-Stripes Maxi Dress. The soft cotton blend single jersey fabric allows for effortless comfort in a dress that's cut to hug the body. A V-neck and 3-Stripes along the sleeves add a sporty vibe. Perfect for everyday casual wear that ensures your style is always on point.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10029-1.png?alt=media&token=b6d5d38c-b77d-4aaa-ab55-e524bdf530b7"),
                    ProductVariant(color: Color.red, colorName: "Better Scarlet", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10029-2.png?alt=media&token=a98fe35e-ba45-46c1-a88f-38bc06a736a4")]),
        Product(id: "10030", name: "Own the Run T-Shirt",
                price: 39, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
This adidas running t-shirt is destined to be a go-to for your short runs and distance days alike. The breathable fabric is made with AEROREADY to absorb moisture and keep you dry. The sporty silhouette features simple 3-Stripes style and reflective details that shine when the light fades.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Coral Fusion", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10030-1.png?alt=media&token=7b032c5f-6ca0-4e17-8e1e-a0ffb4ab761d"),
                    ProductVariant(color: Color.purple, colorName: "Wonder Orchid", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10030-2.png?alt=media&token=b03eb8ec-91b6-487b-854d-c06905038b2e"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10030-3.png?alt=media&token=5c3d61b1-4cea-4c26-a688-1385ba3d8fb3")]),
        Product(id: "10031", name: "Ultimate365 Solid Skirt",
                price: 59, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.skirts.rawValue,
                description: """
Play through with no distractions in this adidas golf skort. It's made of soft fabric with moisture-absorbing AEROREADY to keep you dry. The wide mesh waistband offers a supportive feel as you swing, bend and stretch on the course. Attached undershorts have grip tape at the hem for a comfortable, secure feel.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Crew Navy", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10031-1.png?alt=media&token=917ec172-8674-4507-a1d8-52f1aa03de33"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10031-2.png?alt=media&token=b8681d69-bafc-4a2d-b16b-f3f8805f0243"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10031-3.png?alt=media&token=fa40e4ff-e5f0-4741-9a23-836ab713884c")]),
        Product(id: "10032", name: "Adicolor Essentials Fleece Sweatshirt",
                price: 49, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
A sweatshirt is an absolute must-have, wear-it-all-the-time essential. Why? Comfort. Warmth. Cosiness. This one from adidas combines all those factors and turns them up a notch. It's made of soft fleece and cut extra slouchy so you have even more goodness to sink into.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.purple, colorName: "Purple", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10032-1.png?alt=media&token=31257de2-7ae6-45de-be29-9e62e5842d3f"),
                    ProductVariant(color: Color.green, colorName: "Mineral Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10032-2.png?alt=media&token=f6fc3a5e-4c70-45a7-a375-9da028e86286"),
                    ProductVariant(color: Color.gray, colorName: "Medium Grey Heather", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10032-3.png?alt=media&token=4dcd83dc-f1d2-489d-9752-fdea0d7b87f6")]),
        Product(id: "10033", name: "Adicolor Neuclassics Tracksuit Bottoms",
                price: 69, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
Put together in seconds. That's how these adidas track pants make you look. And how they make you feel is incredibly comfortable. Soft premium cotton indulges you as it moves against the skin with the flowing, wide-legged silhouette.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10033-1.png?alt=media&token=bfc19383-5817-4670-adf2-45d15301c810"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10033-2.png?alt=media&token=bea76526-0a3d-4fef-9525-629610a38354")]),
        Product(id: "10034", name: "Adicolor Essentials French Terry Shorts",
                price: 29, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
Casual ease. Total confidence. These adidas shorts make feeling and looking good totally effortless with their muted, minimalist style and super-soft fabric. You can pretty much pair them with anything — think bra tops, oversized tees and that bodycon tank top you love. A high-rise waist hits right where you want it.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Medium Grey Heather", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10034-1.png?alt=media&token=ae795a94-301d-4568-86ba-8a5444777e4d"),
                    ProductVariant(color: Color.green, colorName: "Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10034-2.png?alt=media&token=e9e5cc4d-d188-4589-854b-60c36e8c8e39"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10034-3.png?alt=media&token=6f94cce9-4946-485b-81ac-09e938adb209")]),
        Product(id: "10035", name: "adidas by Stella McCartney Cropped Hoodie",
                price: 129, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
The perfect layer for, well, everything. Minimalist means versatile and that's exactly what this adidas by Stella McCartney hoodie is. Warm up. Cool down. Hang out. Do it all — this pullover is here for it. The loose shape hangs casually, and the crop cut makes it incredibly easy to style.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10035-1.png?alt=media&token=9f259253-08a7-4def-8bd6-c7ddb3ae4ff0"),
                    ProductVariant(color: Color.pink, colorName: "Soft Almond", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10035-2.png?alt=media&token=7998d5ac-b27a-4dae-ae34-6caf838ead06")]),
        Product(id: "10036", name: "Response CL Shoes",
                price: 115, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
There's something about these adidas Response CL shoes that gives off the best kind of dad vibes. The classically sporty look is remixed with stitched suede overlays for a nostalgic yet modern feel. The plush EVA midsole offers extra cushioning with a lightweight touch. Whether you're dropping the kids off at school or travelling to your next adventure, your feet will thank you.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Grey", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10036-1.png?alt=media&token=0036c8bf-3fe4-41cd-82ff-7687939b2573"),
                    ProductVariant(color: Color.green, colorName: "Silver Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10036-2.png?alt=media&token=11e7c778-ff58-4033-a5b0-a2d014a0f53a"),
                    ProductVariant(color: Color.blue, colorName: "Clear Sky", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10036-3.png?alt=media&token=f930d866-036b-4126-9330-29ddd4b6d115")]),
        Product(id: "10037", name: "Y-3 Rivalry Sandals",
                price: 289, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.sandals.rawValue,
                description: """
Referencing one of the most influential basketball sneakers of the '80s, the Y-3 Rivalry Sandals rewrite the modern fashion code with refined expression. The exaggerated sandals pay homage to the iconic Y-3 Qasa, with the same elastic straps and heel detailing.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10037-1.png?alt=media&token=7436619b-1204-483c-90de-9903ac37fdfe"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10037-2.png?alt=media&token=5c3b8d37-b360-4eb4-bf65-284a115f054b")]),
        Product(id: "10038", name: "adidas by Stella McCartney Tote",
                price: 115, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
You're super sporty, but not everybody has to know it. Stow your workout gear in this adidas by Stella McCartney tote, pass on the elevator and take the stairs to the gym two at a time. If anyone asks, point to the tote and tell them you got your perfectly sculpted arms by shopping.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Magic Earth", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10038-1.png?alt=media&token=341334af-1127-4d8c-8b78-61a6acac4a3d"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10038-2.png?alt=media&token=7ee94b6b-dba5-4ecc-994f-aaeda9dfe5bd")]),
        Product(id: "10039", name: "SP0067 Sport Sunglasses",
                price: 149, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.sunglasses.rawValue,
                description: """
Perfect for sports and anytime, these adidas sunglasses mix a performance-ready design with a stylish look. Based on top-selling shapes, this pair is made with flexible frames and superlight polycarbonate lenses to cut out glare. Adjustable nose pads with sweat-draining lines ensure distraction-free comfort, and a 10-hole aeration system at the temples offers ventilation where you need it most.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Dark Grey Heather", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10039-1.png?alt=media&token=0eae94b6-8131-452b-95a9-aca0e01746dd"),
                    ProductVariant(color: Color.blue, colorName: "Pure Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10039-2.png?alt=media&token=9c193bb3-1fcf-4f48-83cc-10754fd0a519"),
                    ProductVariant(color: Color.purple, colorName: "Stone", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10039-3.png?alt=media&token=a2ef3007-feee-459a-9056-35982316b1d0")]),
        Product(id: "10040", name: "Expression One Watch",
                price: 139, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.watches.rawValue,
                description: """
The adidas Expression One watch has a strong design that perfectly represents the adidas Originals soul. This premium watch with his glass top ring and elegant colour is made for anyone who wants to use their watch as a way of self-expression. A nylon strap elevates comfort.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.green, colorName: "Mineral Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10040-1.png?alt=media&token=6b90fcb8-1915-4677-aae6-efaf212923a0"),
                    ProductVariant(color: Color.black, colorName: "Gold Metallic / Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10040-2.png?alt=media&token=1f3cedad-185b-49f2-8aeb-ab60eb04cc11")]),
        Product(id: "10041", name: "Y-3 Belt",
                price: 75, brand: Brand.adidas.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.belts.rawValue,
                description: """
The Y-3 Classic Logo Belt harnesses the power of simplicity. An understated piece, it's crafted from durable webbing and finished with a minimalist metal buckle.
""",
                sizes: beltsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10041-1.png?alt=media&token=4fb5b70f-639b-4241-868a-2a949d114ded"),
                    ProductVariant(color: Color.gray, colorName: "Dark Grey", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10041-2.png?alt=media&token=64c1d11d-fb6b-42ab-bdfc-f4e4da35340d"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10041-3.png?alt=media&token=12550fd8-79b5-489c-b161-f3d278e350d7")]),

        // MARK: - HUGO BOSS Products
        Product(id: "10042", name: "Slim Fit Long Length Dress With V Neckline",
                price: 389, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
A feminine dress by BOSS Womenswear, cut to a slim fit with a long length and topped with a plunging V neckline.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10042-1.png?alt=media&token=41ad0bed-77c5-4b21-b6e6-a5958782be67"),
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10042-2.png?alt=media&token=fa8a4725-84c7-4b53-ab58-84aa1492292c"),
                    ProductVariant(color: Color.blue, colorName: "Dark Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10042-3.png?alt=media&token=65249afd-83cb-4c2c-a8a6-9c7a4c9d1b7b")]),
        Product(id: "10043", name: "Short Sleeved Ribbed Sweater With Gathered Front",
                price: 229, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
A slim-fitting V-neck sweater with short sleeves, a ribbed structure and feminine gathering through the front by HUGO Womenswear.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10043-1.png?alt=media&token=21415cf4-c62c-46e1-afef-967021082f04"),
                    ProductVariant(color: Color.green, colorName: "Dark Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10043-2.png?alt=media&token=c86b60ad-107b-4dc7-99ca-a83492c5fb33"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10043-3.png?alt=media&token=ae58e397-7243-4825-88c2-f1ff03aea7bc")]),
        Product(id: "10044", name: "Mercerised Jersey T-shirt With Stretch Silk Front",
                price: 199, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
An elevated take on the short-sleeved T-shirt, by BOSS Womenswear. Offered in a regular fit, this T-shirt is crafted in mercerised jersey fabric with a fluid drape offset by a stretch-silk front panel for light contrast. A tonal monogram appears at the back neck for a signature finish.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.purple, colorName: "Dark Purple", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10044-1.png?alt=media&token=93ade373-b30c-4e6e-a440-e346f37c4bb5"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Light Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10044-2.png?alt=media&token=cd0283c5-0c4d-47f5-a241-d77ce0a84438"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10044-3.png?alt=media&token=efbac3ed-d531-41d6-9b1a-ef33799f93c8")]),
        Product(id: "10045", name: "Regular Fit Long Sleeved Blouse In Stretch Silk",
                price: 299, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shirts.rawValue,
                description: """
A feminine blouse by BOSS Womenswear. Cut to a straight fit for an easy silhouette, this long-sleeved blouse is crafted in stretch silk and topped with a notched neckline for an elegant look. The shoulders feature gathered details for subtle texture.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.purple, colorName: "Dark Purple", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10045-1.png?alt=media&token=c04d8c48-0887-4a2b-9050-21fae063af9f"),
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10045-2.png?alt=media&token=a2ec453e-129a-4868-a5c7-f597213eb540")]),
        Product(id: "10046", name: "Chino Skirt In Stretch Cotton With Tie Belt",
                price: 149, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.skirts.rawValue,
                description: """
A chino-style skirt by BOSS Womenswear, made in stretch twill with side pockets and an adjustable belt at the waist.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10046-1.png?alt=media&token=dac56fe8-30e4-459c-b3bb-a3f452a73c2b"),
                    ProductVariant(color: Color.blue, colorName: "Dark Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10046-2.png?alt=media&token=10611e44-ec10-4027-8a60-fa00c05a9333")]),
        Product(id: "10047", name: "Cotton Hooded Sweatshirt With Logo Label",
                price: 199, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
A hooded sweatshirt cut to a relaxed fit by HUGO Womenswear. Crafted in pure-cotton terry for cosy comfort, this sweatshirt is trimmed with a woven logo label at the centre chest.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10047-1.png?alt=media&token=6d12d2f1-da49-4ea0-a9f2-99e5cdf39eab"),
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10047-2.png?alt=media&token=914611c9-a1f2-4f27-ade4-91d194625b82"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10047-3.png?alt=media&token=d5879227-92ca-4b83-b115-23a46962d340")]),
        Product(id: "10048", name: "Relaxed Fit Cargo Trousers In Water-Repellent Satin",
                price: 259, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
Regular-rise cargo trousers cut to a relaxed fit with a straight leg in water-repellent satin by HUGO Womenswear.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Light Orange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10048-1.png?alt=media&token=4e856ac6-049c-4d02-b793-aeafce51bec8"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10048-2.png?alt=media&token=c924cf02-c42d-412f-809a-dbbcbff0762a")]),
        Product(id: "10049", name: "Regular Fit Jeans In Cotton Blend Velvet",
                price: 199, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jeans.rawValue,
                description: """
Easy-wear jeans by BOSS Womenswear. Crafted in cotton-blend velvet containing stretch for comfort in movement, these mid-rise jeans are cut to a regular fit with a cropped length. The coin pocket is detailed with a BOSS logo accent.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10049-1.png?alt=media&token=45dbdf22-da1b-4020-9a3a-df6d8b5d50a1"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10049-2.png?alt=media&token=3f2a3330-8189-457a-bcb0-563a8f5f95e0")]),
        Product(id: "10050", name: "Relaxed Fit Chino Shorts In Organic Stretch Cotton",
                price: 125, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
Trend-driven chino shorts by BOSS Womenswear, cut to a relaxed fit with a wide leg for a modern shape.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Light Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10050-1.png?alt=media&token=a1e72a2b-21d1-4fb4-8d8e-2c6af0a42c17"),
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10050-2.png?alt=media&token=84847f19-8d6d-46a1-8acb-b80bbee44ba6"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10050-3.png?alt=media&token=56607a05-ba9d-47f6-8cb5-c07e6841dcd9")]),
        Product(id: "10051", name: "Leather Regular Fit Biker Jacket With Asymmetric Zip",
                price: 495, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jackets.rawValue,
                description: """
A regular-fit jacket in soft leather with an asymmetric front zip by HUGO Womenswear.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10051-1.png?alt=media&token=e0bdb236-268b-4777-b15e-fe636b133202"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10051-2.png?alt=media&token=46fa2b2d-1adf-4961-8745-28e056a60471")]),
        Product(id: "10052", name: "Double Breasted Trench Coat With Belted Closure",
                price: 545, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.coats.rawValue,
                description: """
An elegantly styled trench coat by BOSS Womenswear, designed in a regular fit with storm flaps and a belted and double-breasted closure.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10052-1.png?alt=media&token=e6c01823-14a2-42d0-8ff8-f8c56a55ac1c"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10052-2.png?alt=media&token=3ecfbe78-1386-4db1-a3f8-d8c1ea066ed6"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10052-3.png?alt=media&token=1d474dd9-5d2b-494f-a4d5-81837ae5fbe6")]),
        Product(id: "10053", name: "Mixed-material Trainers With Logo Detail",
                price: 229, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
Featuring soft lining and a lightweight outsole, these trainers by BOSS are crafted in a combination of materials including bonded leather.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10053-1.png?alt=media&token=effa5ab2-f906-4967-9de0-fc2430289f8c"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10053-2.png?alt=media&token=a3d2fdf7-6f91-4b2b-bf61-03c731583047")]),
        Product(id: "10054", name: "Nappa-leather Strappy Sandals With Flat Sole",
                price: 249, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.sandals.rawValue,
                description: """
Elegant sandals with a flat sole, strappy nappa-leather uppers and a logo trim by BOSS.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10054-1.png?alt=media&token=38d1a6a0-7485-4dd2-bb98-bb7d948c8d27"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10054-2.png?alt=media&token=8196d4d8-fa55-4206-b46d-ba8dc4a75a7f")]),
        Product(id: "10055", name: "Nappa-leather Pumps With Straight 7cm Heel",
                price: 199, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.pumps.rawValue,
                description: """
Pointed-toe pumps by BOSS, crafted in nappa leather with a straight 7cm heel and a polished logo trim.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10055-1.png?alt=media&token=e30d98d0-fe8e-4a8f-9d6b-0fef9d83ceae"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10055-2.png?alt=media&token=721c5e27-c71a-41e4-b28b-a1f8f6899a91")]),
        Product(id: "10056", name: "High-heeled Ankle Boots In Suede With Pointed Toe",
                price: 399, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.boots.rawValue,
                description: """
Chic ankle boots by BOSS, shaped in soft suede with a pointed toe, monogram trim and 9cm heel.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10056-1.png?alt=media&token=5b9a0ee7-d5c0-4178-b86a-8688fbf38b62"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10056-2.png?alt=media&token=3e59e94b-5e1d-4227-a727-00241370fdb6")]),
        Product(id: "10057", name: "Goat-suede Ballerina Espadrilles With Ankle Ties",
                price: 119, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.ballerinas.rawValue,
                description: """
Feminine ballet-style espadrilles with suede uppers, ankle ties and an embossed logo by BOSS.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Light Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10057-1.png?alt=media&token=ad137ced-92ef-4d1e-9454-55559349a064"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10057-2.png?alt=media&token=b7a56307-dd1b-4a21-9310-789bed5c2066")]),
        Product(id: "10058", name: "Grained-leather Mini Bag With Branded Hardware",
                price: 299, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
A grained-leather mini bag with a branded padlock trim, metal rivets and logo lettering by BOSS. Measurements: 12 x 10 x 6cm
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Orange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10058-1.png?alt=media&token=4fe52d9b-adca-417c-9742-d481433e985b"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10058-2.png?alt=media&token=bada2496-284c-4227-9e24-0e53002d6d50"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10058-3.png?alt=media&token=1da395cc-edb5-4468-9046-d9e98b257b6f")]),
        Product(id: "10059", name: "Acetate Sunglasses With 3D Monogram",
                price: 165, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.sunglasses.rawValue,
                description: """
Modern sunglasses in acetate with polished 3D monograms on the temples by HUGO.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10059-1.png?alt=media&token=60cf1861-7907-4390-842d-50d8e136a476"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10059-2.png?alt=media&token=a2a8892b-e57d-4d9f-817a-331ca5d0c8a3")]),
        Product(id: "10060", name: "Watch With Link Bracelet",
                price: 265, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.watches.rawValue,
                description: """
A feminine three-hand watch in steel with a crystal-studded outer ring and a seven-link bracelet by BOSS.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.yellow, colorName: "Gold Tone", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10060-1.png?alt=media&token=dc42704c-6a04-4ac0-a6f4-275b34d38ce6"),
                    ProductVariant(color: Color.gray, colorName: "Silver Tone", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10060-2.png?alt=media&token=4675ea1b-d5d8-47e4-bcc9-c48138de5636")]),
        Product(id: "10061", name: "Leather Belt With Logo Trimmed Keeper",
                price: 69, brand: Brand.hugo.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.belts.rawValue,
                description: """
A refined belt by HUGO with metal logo lettering at the keeper. Featuring a 3.5cm width, this contemporary belt secures with a rounded pin buckle in gold-effect hardware.
""",
                sizes: beltsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Brown", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10061-1.png?alt=media&token=53fbe94f-26c7-416a-ad6e-a6d57f931ae2"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10061-2.png?alt=media&token=ebab7c43-b822-4f0b-b6a1-b8227023a74e")]),
        
        // MARK: - DIESEL Products
        Product(id: "10062", name: "Asymmetric dress in fluid satin",
                price: 475, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
Fluid dress cut from light stretch satin. Its asymmetric silhouette is cut to a regular fit, fastening with a hook-and-eye closure and cinching in at the waist with a tape belt. A metal oval 'D' plaque embellishes the collar.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10062-1.png?alt=media&token=eba8174b-42fc-437d-9b6f-343651f02a19"),
                    ProductVariant(color: Color.pink, colorName: "Hot Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10062-2.png?alt=media&token=3c066cb8-881d-4b20-ae47-bf04b634effb")]),
        Product(id: "10063", name: "T-shirt with bleeding-effect logo",
                price: 159, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
This women's regular-fit tee is crafted from soft cotton jersey. The maxi Diesel logo on the front is updated with a bleeding effect, obtained through a special water-based printing technique.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10063-1.png?alt=media&token=818915d9-e9ce-4dc7-a32f-60a4e0cdcad0"),
                    ProductVariant(color: Color.gray, colorName: "Grey", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10063-2.png?alt=media&token=b611009d-43fd-497f-a4ba-1347bf1dca96")]),
        Product(id: "10064", name: "Fluid satin shirt with D embroidery",
                price: 319, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shirts.rawValue,
                description: """
Women's fluid shirt cut from light stretch viscose satin. Its regular-fit profile fastens with a hook-and-eye closure. Embellished with an embroidered oval 'D' logo in tonal thread on the collar.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Hot Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10064-1.png?alt=media&token=3941180a-e0ca-4349-9f3f-ba50ce468703"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10064-2.png?alt=media&token=e8a0cc83-a435-4a3b-8ba5-bec9b91713b1")]),
        Product(id: "10065", name: "Short skirt with bouclé-knit monogram",
                price: 289, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.skirts.rawValue,
                description: """
This short skirt is spun from viscose and features a full front zip and contrasting waistband. The all-over Diesel monogram is jacquard-knitted using bouclé yarn to give the pattern a more pronounced texture.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10065-1.png?alt=media&token=ffee0127-69dc-4159-be97-2a656faf1bfb"),
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10065-2.png?alt=media&token=3b6a5a58-3f52-4477-b4f8-3bbb674c676f")]),
        Product(id: "10066", name: "Hoodie with embroidered D patch",
                price: 219, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
Regular-fit hooded sweatshirt built from cotton jersey, edged with ribbed trims. Branded with a mini embroidered 'D' patch on the chest.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10066-1.png?alt=media&token=cf401673-7165-4adc-b7e8-1944edd3eb43"),
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10066-2.png?alt=media&token=9332b61d-f096-45f0-b70e-9e3a17737fb4"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10066-3.png?alt=media&token=bfb3216e-7eee-47b1-8845-bcc6166bd215")]),
        Product(id: "10067", name: "Track pants with oval 'D' patch",
                price: 189, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
These women's regular-fit tracksuit bottoms flaunt a straight-leg design with zip pockets. Made from organic cotton jersey, they feature an oval 'D' patch on the left leg.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10067-1.png?alt=media&token=9022f23a-8d4b-4ba8-9222-927d417658df"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10067-2.png?alt=media&token=fcf6d663-f312-4630-b7aa-ee078b11d4fe")]),
        Product(id: "10068", name: "Boyfriend Jeans - 2016 D-Air",
                price: 285, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jeans.rawValue,
                description: """
Boyfriend style with regular waist and a slightly low crotch. Designed to hit at ankle-length and finished with a zip fly.
This comfort denim showcases a coloured wash dyed with Earthcolors® technology that includes biosynthetic dyes derived from natural waste products. It's detailed with shaded whiskers for an effortless lived-in look.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10068-1.png?alt=media&token=d7cb9c70-a102-4f9c-996f-2a0ed4b30bc4"),
                    ProductVariant(color: Color.gray, colorName: "Grey", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10068-2.png?alt=media&token=da7d1289-8687-46a3-8239-64a6f57d1605")]),
        Product(id: "10069", name: "Satin shorts with monogram pattern",
                price: 129, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
DIESEL SPORT women's shorts made from a lustrous, moisture-wicking satin, enriched with an all-over jacquard monogram logo. Detailed with contrasting side logo bands, they feature an elasticated waistband that can be worn rolled up or down to expose the logo.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10069-1.png?alt=media&token=a706dcde-d5ce-47d2-848c-c7e47fc2160c"),
                    ProductVariant(color: Color.red, colorName: "Burgundy", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10069-2.png?alt=media&token=8d9f8491-c432-4ca8-bc31-f31f1749e215")]),
        Product(id: "10070", name: "Bomber jacket in light nylon",
                price: 445, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jackets.rawValue,
                description: """
Light nylon bomber jacket with long external zip and gathered sleeves. This women's regular-fit style features an elasticated drawstring hem with double leather adjusters.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.green, colorName: "Dark Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10070-1.png?alt=media&token=e89b63ff-a648-482e-8acf-715064285abd"),
                    ProductVariant(color: Color.pink, colorName: "Hot Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10070-2.png?alt=media&token=46f346d6-560c-426d-b4fd-6b24ecaf737b")]),
        Product(id: "10071", name: "Cage sneakers in mesh and leather",
                price: 499, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
This sneaker for women combines innovation and archival elements. The design is defined by a cage-like harness that intersects the upper of the shoe, made of breathable mesh and leather overlays. Finished with a gripped rubber outsole that wraps around the toe and an industrial tread.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.green, colorName: "Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10071-1.png?alt=media&token=53c716fa-d62a-414b-80d8-3a6623927764"),
                    ProductVariant(color: Color.yellow, colorName: "Yellow", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10071-2.png?alt=media&token=0e7bd494-a730-4f68-95a5-5d0ea98e80f8"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10071-3.png?alt=media&token=aa9fbe55-5df9-4122-9e94-ead6f7140ab6")]),
        Product(id: "10072", name: "Slingback pumps in nappa leather",
                price: 475, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.pumps.rawValue,
                description: """
Crafted from supple nappa leather, these pumps combine a point-toe silhouette with oversized logo hardware. They have a double slingback strap and an 80mm stiletto heel.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.yellow, colorName: "Yellow", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10072-1.png?alt=media&token=3fc57a62-5fd3-4c6f-865c-74953872ff44"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10072-2.png?alt=media&token=4f48811c-2a72-4ced-bdf7-37af9124d297")]),
        Product(id: "10073", name: "Shoulder bag in nappa leather",
                price: 469, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
This structured bag is synonymous with Diesel's distinctive style, and has become a signature accessory. Crafted from nappa leather, it has a handle that fits over the shoulder and an optional belt-like strap for cross-body wear. The flap is embellished with an enamelled metal plaque featuring the oval D logo, making it instantly recognisable.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10073-1.png?alt=media&token=7c5d70a8-ae3c-43fa-b711-da952187a4d4"),
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10073-2.png?alt=media&token=8c3a0d6c-e374-4c39-8fc6-fcaa26fb0e8f"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10073-3.png?alt=media&token=7c71b841-2558-499f-972c-3e1b1eb8ff2f")]),
        Product(id: "10074", name: "Cat-eye style sunglasses",
                price: 195, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.sunglasses.rawValue,
                description: """
This soft cat-eye style features two iconic metal brackets on a sleek yet bold frame. The distinctive metal double wire temples ensure lightness and comfort and subtly twice display the iconic D logo.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Brown", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10074-1.png?alt=media&token=fb04a3f7-3094-4303-9e5d-2a9eeef2b8e8"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10074-2.png?alt=media&token=1c785fcd-817b-4ecf-aba5-deeeaed48ace"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10074-3.png?alt=media&token=b617d045-0284-4e7b-b6db-519f1f362688")]),
        Product(id: "10075", name: "Cliffhanger Leather Watch",
                price: 159, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.watches.rawValue,
                description: """
Diesel's 36mm Cliffhanger watch features a sunray dial, three-hand movement and brown leather strap with leather sourced from LWG Certified tannery.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Brown", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10075-1.png?alt=media&token=a4ceeefc-d19f-45ca-bca2-d38a26422ed2"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10075-2.png?alt=media&token=48c1f43f-7af9-4344-978b-d6ad9c9d2d95")]),
        Product(id: "10076", name: "Belt with D logo buckle",
                price: 125, brand: Brand.diesel.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.belts.rawValue,
                description: """
Part of the SS22 Fashion Show Collection, this belt is crafted from soft Italian leather. Branded with a shiny nickel-free oval 'D' logo buckle.
""",
                sizes: beltsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10076-1.png?alt=media&token=9d65ffe6-9234-4494-83a9-ae8255bc9b34"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Brown", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10076-2.png?alt=media&token=faac1486-cac1-4987-8c0e-69ffe1aaeaa1"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10076-3.png?alt=media&token=7ab85a44-baf6-4efe-8c58-0cdd8230bddd")]),
        
        // MARK: - GUESS Products
        Product(id: "10077", name: "Crochet sweater dress",
                price: 149, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
Cotton dress.
Boat neck.
Long sleeves.
Bodycon.
Open back with drawstring detail.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.yellow, colorName: "Yellow", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10077-1.png?alt=media&token=154b778d-ed36-4cf5-9c62-4d6e16cb8457"),
                    ProductVariant(color: Color.green, colorName: "Light Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10077-2.png?alt=media&token=a86d70cf-dfa7-4f2c-8b20-e8aefa1bfce3"),
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10077-3.png?alt=media&token=4ef62045-549d-48fa-9054-13656e86a95a")]),
        Product(id: "10078", name: "Side logo t-shirt",
                price: 45, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
Cotton t-shirt.
Crew neck.
Short sleeves.
Relaxed fit.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10078-1.png?alt=media&token=68ece2ee-fd0a-4818-8327-0e1274bf80aa"),
                    ProductVariant(color: Color.green, colorName: "Olive Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10078-2.png?alt=media&token=6eeb96b7-407b-4236-b511-9222bdc10e01"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10078-3.png?alt=media&token=96f84035-b1d9-4cd7-9d6a-33744af10ab6")]),
        Product(id: "10079", name: "Faux leather shirt",
                price: 135, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shirts.rawValue,
                description: """
Faux leather shirt.
Classic collar.
Long sleeves.
Relaxed fit.
Buttons fastening.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10079-1.png?alt=media&token=2677198c-c739-430f-80ac-72f332cea7b3"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10079-2.png?alt=media&token=47093900-40b9-4e4d-9a5b-f9f3f9350a6c")]),
        Product(id: "10080", name: "Tweed effect sweater skirt",
                price: 109, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.skirts.rawValue,
                description: """
Cotton blend sweater skirt.
Pencil style.
Mid rise.
Tight fit.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Multi Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10080-1.png?alt=media&token=9ce3f6c3-3968-4412-b25a-fd94eb096dc3"),
                    ProductVariant(color: Color.blue, colorName: "Light Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10080-2.png?alt=media&token=d3bc2d11-0356-487c-9567-fc578acba174")]),
        Product(id: "10081", name: "Front logo sweatshirt",
                price: 135, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
Cotton blend sweatshirt.
High neck with hood.
Long sleeves.
Regular fit.
Front zip fastening.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Teal", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10081-1.png?alt=media&token=e95433e2-da36-433f-ba50-60c661cc7cc9"),
                    ProductVariant(color: Color.orange, colorName: "Orange", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10081-2.png?alt=media&token=6020ee6d-098d-42be-b6d1-7c00ad030357")]),
        Product(id: "10082", name: "4g logo straight pants",
                price: 139, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
Cotton blend trousers.
Straight fit.
High rise, Straight leg.
Classic 5-pockets.
Front zip and button fastening.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10082-1.png?alt=media&token=2a76ddd3-30f0-457f-8038-d88b6be55057"),
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10082-2.png?alt=media&token=90615784-5dea-4ba2-99e1-e31c64cb3bf0"),
                    ProductVariant(color: Color.green, colorName: "Light Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10082-3.png?alt=media&token=152b1dfc-c88e-4a36-8902-1f1b72d2a8a0")]),
        Product(id: "10083", name: "Belted shorts",
                price: 89, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
Synthetic fabric shorts.
Baggy style.
Mid rise.
Relaxed fit.
Front botton and zip fastening.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10083-1.png?alt=media&token=a7deffe2-2ac5-42c3-b51f-0b626b4ad9d6"),
                    ProductVariant(color: Color.blue, colorName: "Light Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10083-2.png?alt=media&token=bcf736f6-b575-4521-b821-988f357dde9b"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10083-3.png?alt=media&token=45b00495-70d4-450b-a85f-653958665ecb")]),
        Product(id: "10084", name: "Marciano slim fit blazer",
                price: 259, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jackets.rawValue,
                description: """
Synthetic fabric blazer.
Crew neck.
Long sleeves.
Slim fit.
Zip fastening.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.green, colorName: "Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10084-1.png?alt=media&token=ea2d69db-a91b-4ebb-874c-286d3d203b2c"),
                    ProductVariant(color: Color.red, colorName: "Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10084-2.png?alt=media&token=4c0e7056-e044-41dd-87de-7dff23676c07"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10084-3.png?alt=media&token=0fe6a7c9-6e62-44da-a922-4ee8e25de654")]),
        Product(id: "10085", name: "Marciano wool blend coat",
                price: 439, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.coats.rawValue,
                description: """
Wool blend coat.
Classic lapel.
Long sleeves.
Regular fit.
Belted.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Light Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10085-1.png?alt=media&token=6934874d-4d06-4a5b-a90a-93ea9f6ac891"),
                    ProductVariant(color: Color.blue, colorName: "Light Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10085-2.png?alt=media&token=174b59b1-987c-4d22-888d-c828c0539f99")]),
        Product(id: "10086", name: "Calebb triangle-logo running shoes",
                price: 139, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
Synthetic material running shoes.
Round toe.
Rubber sole height 6 cm / 2‚4 in.
Lace-up model.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10086-1.png?alt=media&token=d9f14e6f-f74a-4b48-86b9-d27f9ff671c2"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10086-2.png?alt=media&token=ac64455b-7d3d-4d81-b345-1dadaad56ccb")]),
        Product(id: "10087", name: "Faize laminated-detail sandal",
                price: 149, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.sandals.rawValue,
                description: """
Faux leather sandal.
Round toe.
Heel height: 10.5 cm.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Fuchsia", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10087-1.png?alt=media&token=d065135f-2e28-454f-a5db-ba296d47f9c1"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Brown", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10087-2.png?alt=media&token=1d9627e5-978f-4602-a69f-24a75cfb0c08"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10087-3.png?alt=media&token=37838d29-ab31-40ae-bb03-f0089b53751c")]),
        Product(id: "10088", name: "Piera g cube logo court shoe",
                price: 125, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.pumps.rawValue,
                description: """
Synthetic material court shoe.
Pointed toe.
Heel height: 9 cm.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Grey / White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10088-1.png?alt=media&token=47401e88-7f99-4d97-beee-e2bbba02615e"),
                    ProductVariant(color: Color.black, colorName: "Black / Brown", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10088-2.png?alt=media&token=7a21b107-1f79-4a97-a2d4-bb0dd656aea5")]),
        Product(id: "10089", name: "Sabina genuine leather ankle boot",
                price: 125, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.boots.rawValue,
                description: """
Genuine leather ankle boot.
Round toe.
Heel height: 9 cm.
Crêpe sole height: 1.5 cm.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Brown", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10089-1.png?alt=media&token=f825d6b1-902e-4569-9d3e-ed644c70ea5e"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10089-2.png?alt=media&token=88104ab2-7e00-47f4-ba9b-f36c072ec622")]),
        Product(id: "10090", name: "Jaleel 4g logo espadrille",
                price: 79, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.ballerinas.rawValue,
                description: """
Faux leather espadrille.
Round toe.
Crêpe sole height: 2.8 cm.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10090-1.png?alt=media&token=0b132a4c-3909-4129-81b6-230ebed5131e"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10090-2.png?alt=media&token=f6c6b10a-244e-4be8-bfe5-d6bcd5b66807")]),
        Product(id: "10091", name: "Vikky g cube logo crossbody bag",
                price: 109, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
Faux leather exterior.
Zip opening.
Pale gold-coloured hardware.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Orange / Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10091-1.png?alt=media&token=3e19cf1d-c740-4d35-9383-f8b107ddf511"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10091-2.png?alt=media&token=7d5f2728-0168-42ff-a5f0-a656f092caca"),
                    ProductVariant(color: Color.pink, colorName: "Light Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10091-3.png?alt=media&token=33c66c3e-bb80-480d-98ae-0440a0557883")]),
        Product(id: "10092", name: "Geometric sunglasses model",
                price: 119, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.sunglasses.rawValue,
                description: """
Metal model.
Logo-detail metal temples.
Lens diameter: 58 mm.
Bridge: 16 mm.
Temple length: 135 mm.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Grey", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10092-1.png?alt=media&token=dd996e3e-05c2-4264-8152-23474f513e19"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Brown", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10092-2.png?alt=media&token=c62a07c0-a5bb-4eee-ae4f-ada1719f6fd7"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10092-3.png?alt=media&token=9d5edce1-c85c-49e1-b938-5448f38569e7")]),
        Product(id: "10093", name: "Multi-function genuine leather watch",
                price: 259, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.watches.rawValue,
                description: """
Dial colour: white with exposed gears.
Case colour: gold and purple.
Strap colour: white.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10093-1.png?alt=media&token=23d9756e-cdbc-4c7e-baae-ffebefdbf624"),
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10093-2.png?alt=media&token=199cadaa-67c0-449b-9ffe-ffc36a83647c")]),
        Product(id: "10094", name: "Silk g cube logo belt",
                price: 109, brand: Brand.guess.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.belts.rawValue,
                description: """
Silk belt.
Pale gold-coloured hardware.
Logo buckle and tongue fastening.
""",
                sizes: beltsSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Coral", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10094-1.png?alt=media&token=22260899-ce89-479f-85b2-33cf8f9339e8"),
                    ProductVariant(color: Color.pink, colorName: "Light Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10094-2.png?alt=media&token=50af651b-0110-4dfe-8ce5-1ebd460ebc24"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10094-3.png?alt=media&token=0dbdc847-20ee-4df8-aa0b-6154db5be7b6")]),

        // MARK: - REBOOK Products
        Product(id: "10095", name: "Reebok Classics T-Shirt Dress",
                price: 59, brand: Brand.rebook.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
Cotton dress with boat neck and long sleeves.
Open back with drawstring detail.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10095-1.png?alt=media&token=77104fe3-2821-4462-8438-a82f5b5d799c"),
                    ProductVariant(color: Color.white, colorName: "Chalk", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10095-2.png?alt=media&token=dbb4e760-99ba-447f-a9f5-0754a1921124")]),
        Product(id: "10096", name: "Reebok Classics Jersey Muscle Tank Top",
                price: 25, brand: Brand.rebook.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
If you've got it, flaunt it. This women's muscle tank top plays up your shape in a sophisticated way. Cutouts at the waist give it a modern look. Soft cotton jersey feels comfortable from day one. An almost invisible Vector roots your style in Reebok.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Steely Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10096-1.png?alt=media&token=813f25cb-4a96-4084-823e-bb4506fbbb4c"),
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Taupe", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10096-2.png?alt=media&token=f49ab5df-394e-4754-ac5d-50bfec99d3b8"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10096-3.png?alt=media&token=e13fe7c3-5111-45c6-8762-7d69489b4d26")]),
        Product(id: "10097", name: "Yoga Hoodie Cover-Up",
                price: 59, brand: Brand.rebook.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
All good things must come to an end, including yoga class. Pull on this women's Reebok hoodie as you leave the studio and keep the positive vibes going. Soft fleece wraps you in comfort, and the loose fit comes with drop shoulders for flowy, effortless style.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Baked Clay", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10097-1.png?alt=media&token=ad7c36ad-1c8f-40e5-bdbe-f4ce7a514bb7"),
                    ProductVariant(color: Color.blue, colorName: "Sea Spray", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10097-2.png?alt=media&token=35a4cb43-3084-4706-9cc3-b8f34e1664ab")]),
        Product(id: "10098", name: "Classics Franchise Track Pants",
                price: 55, brand: Brand.rebook.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
Simple and comfortable. These women's track pants keep your look straight-up Reebok. Root your style in sport with a Vector logo pulled from the archives. A relaxed fit makes them easy to move in.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.green, colorName: "Harmony Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10098-1.png?alt=media&token=6f2ee19c-24fc-466e-b0e9-53b22528fe52"),
                    ProductVariant(color: Color.black, colorName: "Night Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10098-2.png?alt=media&token=5cd9bfd0-bc74-4952-a75b-3af1a21569f5")]),
        Product(id: "10099", name: "Nano X3 Shoes",
                price: 119, brand: Brand.rebook.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
Believe it or not, there's a training shoe you can actually run in. Meet the Nano X3 training shoes with the all new Lift and Run Chassis system. A dome-shaped heel piece compresses under load when lifting to create a stable platform, then softens when you push off to run. It all rides on award-winning Floatride Energy Foam that gives you lightweight cushioning to make that run the easiest part of the workout.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Vector Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10099-1.png?alt=media&token=6cf36855-82a6-4e51-82a5-7e3b2b845024"),
                    ProductVariant(color: Color.green, colorName: "Hunter Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10099-2.png?alt=media&token=f572dc7f-d312-4319-bcc9-74ccddb15c18"),
                    ProductVariant(color: Color.black, colorName: "Core Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10099-3.png?alt=media&token=53209fe0-8130-420b-a295-451dfce1613b")]),
    
        // MARK: - TOMMY HILFIGER Products
        Product(id: "10100", name: "Sleeveless Linen Mini Dress",
                price: 215, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
Dress for warmer weather in this chic, sleeveless dress that's crafted from pure linen to keep you cool when temperatures rise.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Light Sandalwood", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10100-1.png?alt=media&token=eeaec7d7-bd6a-4420-82ab-9e1890955c5e"),
                    ProductVariant(color: Color.blue, colorName: "Desert Sky", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10100-2.png?alt=media&token=2518c62c-b7bd-4fe4-a3ad-e6effcbba92b")]),
        Product(id: "10101", name: "Stripe Slim Fit Jersey T-Shirt",
                price: 55, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
Add a classic design to your rotation with this slim-fit T-shirt, featuring an all-over micro stripe with contrasting trims for polished detail.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.yellow, colorName: "Vivid Yellow", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10101-1.png?alt=media&token=cc32c26d-52b2-4b03-93d8-ee7c31b7788c"),
                    ProductVariant(color: Color.red, colorName: "Fireworks", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10101-2.png?alt=media&token=65fd33cc-1eb6-4ee9-8bd9-ee6a32e2d6ff"),
                    ProductVariant(color: Color.blue, colorName: "Ultra Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10101-3.png?alt=media&token=eeb3c124-7172-4370-a9b6-c9ff19618f37")]),
        Product(id: "10102", name: "Voile Patch Pocket Oversized Shirt",
                price: 179, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shirts.rawValue,
                description: """
This summer staple is crafted from a lightweight pure cotton voile in a comfy oversized fit and features handy chest pockets.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Light Sandalwood", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10102-1.png?alt=media&token=d18fcb01-7240-4344-a517-5e34797683c4"),
                    ProductVariant(color: Color.black, colorName: "Desert Sky", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10102-2.png?alt=media&token=a663fb65-cafa-4d0f-b267-4d82742d8572")]),
        Product(id: "10103", name: "Rope Print Mini Skirt",
                price: 149, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.skirts.rawValue,
                description: """
Taking inspiration from the coastal trend, this mini skirt is sure to add a dash of outdoor playfulness to your wardrobe.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Carbon Navy", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10103-1.png?alt=media&token=e9454f2f-c240-4f6f-848e-3af0c004ab91"),
                    ProductVariant(color: Color.black, colorName: "Desert Sky", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10103-2.png?alt=media&token=22827715-e713-466a-b07c-cdcafb948140")]),
        Product(id: "10104", name: "Sport Relaxed Fit Waffle Hoody",
                price: 149, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
"The Tommy Hilfiger Sport collection features performance staples made from innovative fabrics to elevate your workout, as well as easy-to-wear athleisure options for next-level comfort.
In a relaxed fit and snug waffle texture, this stylish hoody with a contrast stripe is perfect for throwing on during downtime."
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Light Grey", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10104-1.png?alt=media&token=b2711c1c-cc58-486f-b2f0-82340ac009fc"),
                    ProductVariant(color: Color.black, colorName: "Desert Sky", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10104-2.png?alt=media&token=8cfb2dea-ae0d-4144-ae90-34e23ba3d198")]),
        Product(id: "10105", name: "Slim Fit Twill Chinos",
                price: 139, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
Step up your style game with these elegant slim-fitting chinos in a stretchy fabric for a comfy wear.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Vessel Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10105-1.png?alt=media&token=fc2ed198-b2cf-43a2-8a12-f73de97e04db"),
                    ProductVariant(color: Color.red, colorName: "Fireworks", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10105-2.png?alt=media&token=fe77595c-dee8-435e-91ad-58394a049f4d"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10105-3.png?alt=media&token=61da89d2-52ea-42ae-a97e-9ff454567a40")]),
        Product(id: "10106", name: "Como Mid Rise Skinny TH Flex",
                price: 129, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jeans.rawValue,
                description: """
Innovation and style go hand-in-hand in our TH Flex collection, featuring versatile staples made with cutting-edge fabrics to maximise comfort.
Add a fresh style to your denim rotation with these super-comfortable skinny jeans crafted with Tommy Hilfiger Flex technology.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10106-1.png?alt=media&token=cb896f17-faed-427f-a888-ad08fb853309"),
                    ProductVariant(color: Color.blue, colorName: "Desert Sky", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10106-2.png?alt=media&token=613878b6-84ff-4d54-92cf-b10d69fad62d")]),
        Product(id: "10107", name: "Turn-Up Hem Chino Shorts",
                price: 115, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
A touch of stretch in the cotton-blend fabric ensures freedom of movement in these classic regular-fit chino shorts.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Vessel Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10107-1.png?alt=media&token=5260e1a0-ead3-4e66-93a9-72e65475348f"),
                    ProductVariant(color: Color.pink, colorName: "Light Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10107-2.png?alt=media&token=9c6f2b11-0354-4864-9175-dc4a57b47e58"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10107-3.png?alt=media&token=ce65d241-404c-4ef2-a662-6fe36f10026f")]),
        Product(id: "10108", name: "Varsity Logo Bomber Jacket",
                price: 265, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jackets.rawValue,
                description: """
Bring a collegiate look to your ensemble in this bomber jacket with contrasting striped trims and a TH monogram motif.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Desert Sky", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10108-1.png?alt=media&token=fc259ca3-9e95-4d9a-afda-ca610d4b0d2a"),
                    ProductVariant(color: Color.white, colorName: "Weathered White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10108-2.png?alt=media&token=2f0d11ad-903b-43ae-b9a0-c16f059d45fe")]),
        Product(id: "10109", name: "Hooded Drawstring Waist Parka",
                price: 329, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.coats.rawValue,
                description: """
When the weather takes a turn for the worse, this hooded parka will ensure you look stylish while staying protected.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Fireworks", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10109-1.png?alt=media&token=300f57e8-27a9-4740-bcaa-aa23a5e88fe1"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Light Sandalwood", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10109-2.png?alt=media&token=982595dd-6c0e-4169-854a-9162101c3e0c"),
                    ProductVariant(color: Color.blue, colorName: "Desert Sky", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10109-3.png?alt=media&token=6745a5c2-f30d-4613-a4c2-5ae8f7790186")]),
        Product(id: "10110", name: "TH Modern Prep Runner Trainers",
                price: 139, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
A colourful mix of sporty mesh and suede panels lends these contemporary runner trainers an energetic look and feel.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Peach", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10110-1.png?alt=media&token=2d280d39-724a-4d7c-b0ce-21f1a8a0c5a4"),
                    ProductVariant(color: Color.blue, colorName: "Blue Coast", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10110-2.png?alt=media&token=f16cec86-ff3c-4c41-8d0b-6b0ccf29ca7c"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "White / Ecru", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10110-3.png?alt=media&token=03f65547-b749-44dc-aecb-270494c9384f")]),
        Product(id: "10111", name: "Leather Webbing Mid Heel Sandals",
                price: 129, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.sandals.rawValue,
                description: """
With their low kitten heel and tonal straps, these sandals will make a graceful addition to your warm-weather wardrobe.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "Weathered White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10111-1.png?alt=media&token=cdf83c2b-1e3f-4856-8afa-a5c472bce200"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10111-2.png?alt=media&token=2ade25e5-c36a-4db7-95fa-f79bc6a4fa27")]),
        Product(id: "10112", name: "Leather Monogram High Heels",
                price: 149, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.pumps.rawValue,
                description: """
Crafted from pure leather, the sleek silhouette of these heels is achieved through pointed toes and elegant stilettos in support.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Misty Blush", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10112-1.png?alt=media&token=61120094-6cd3-4940-a6e6-8c5a660858e6"),
                    ProductVariant(color: Color.green, colorName: "Spring Lime", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10112-2.png?alt=media&token=e5f77508-e028-464e-aa6d-3c0be507a4fc"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10112-3.png?alt=media&token=712b1212-59b0-4fac-bd0c-08588b8ca6f4")]),
        Product(id: "10113", name: "Leather Square-Toe Monogram Ankle Boots",
                price: 179, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.boots.rawValue,
                description: """
Crafted from soft leather with a luxe TH monogram plaque, these block-heel ankle boots are full of charming elegance.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "964B00"), colorName: "Oat Milk", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10113-1.png?alt=media&token=f0492d4a-b420-44d8-93eb-47ec64793fe7"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10113-2.png?alt=media&token=d2f3712d-ad94-4515-a588-ee8a2670be65")]),
        Product(id: "10114", name: "Leather Monogram Ballerinas",
                price: 119, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.ballerinas.rawValue,
                description: """
Equally suited to work or play, these ballerinas are crafted from smooth leather, while a metallic monogram plaque ensures a chic finish.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White / Ecru", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10114-1.png?alt=media&token=97be730b-d943-4866-bf75-c1e39a1293de"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10114-2.png?alt=media&token=7944632c-5f36-4e5d-858b-798015745d6a")]),
        Product(id: "10115", name: "Signature Monogram Satchel",
                price: 179, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
A pebble-grain finish and moments of gold-tone hardware ensure this satchel will be a mainstay in your collection.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Space Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10115-1.png?alt=media&token=72a09ccd-4bda-4f76-99b1-4ab9c14f01bf"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Sugarcane", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10115-2.png?alt=media&token=c08b922c-a49e-4be0-93ce-e869514d40db")]),
        Product(id: "10116", name: "Chunky Monogram Cat-Eye Sunglasses",
                price: 139, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.sunglasses.rawValue,
                description: """
These bold cat-eye sunglasses have a timelessly chic look with their gradient lenses and monogram detailing on the arms.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Mauve", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10116-1.png?alt=media&token=3ee1ba7f-46a4-4d9b-bd48-d1b3832e6604"),
                    ProductVariant(color: Color.blue, colorName: "Blue Pattern", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10116-2.png?alt=media&token=c5bc081d-c472-47bd-89ac-4853c03124ed"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10116-3.png?alt=media&token=a10b11be-05d4-4de2-a486-75b6700929fc")]),
        Product(id: "10117", name: "Ionic-Plated Stainless Steel Watch",
                price: 195, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.watches.rawValue,
                description: """
This watch, crafted from robust ionic-plated stainless steel, is both a durable and eye-catching everyday accessory.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.yellow, colorName: "Gold", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10117-1.png?alt=media&token=aa67c5d6-713c-4b8a-80a0-bd0b9b92af0e"),
                    ProductVariant(color: Color.black, colorName: "Blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10117-2.png?alt=media&token=8a4d3fee-3946-40be-977e-1acfc324518c")]),
        Product(id: "10118", name: "Luxe Leather Monogram Belt",
                price: 69, brand: Brand.tommy.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.belts.rawValue,
                description: """
Punctuate tailored separates with this luxurious leather belt, distinctively detailed with a gold-tone buckle and TH monogram plaque keeper.
""",
                sizes: beltsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Stone", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10118-1.png?alt=media&token=954ede47-9d54-4c0b-9e1c-2a1f05c92aff"),
                    ProductVariant(color: Color.blue, colorName: "Blue Coast", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10118-2.png?alt=media&token=4be11eed-d689-462e-8159-4c965c1f7e3c")]),

        // MARK: - ARMANI EXCHANGE Products
        Product(id: "10119", name: "Organic french terry cotton script logo t-shirt dress",
                price: 129, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
Organic french terry gives body to this quarter-sleeved midi t-shirt dress with slits at the bottom; featuring ribbed profiles and a tone-on-tone script logo lettering.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.green, colorName: "Lime Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10119-1.png?alt=media&token=af15ac6f-7324-4c00-8523-a1b2bd8e9497"),
                    ProductVariant(color: Color.blue, colorName: "Azure", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10119-2.png?alt=media&token=3e7c1dba-9f0f-4f01-b498-6ffdcc96908c"),
                    ProductVariant(color: Color.black, colorName: "Navy blue", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10119-3.png?alt=media&token=5d0852a0-b2f2-46c8-9cef-595f92f47fcf")]),
        Product(id: "10120", name: "Icon logo burnout regular fit t-shirt",
                price: 55, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
With a cut worthy of a high quality tailored garment, A|X applies the same knowledge and precision to this pure cotton t-shirt. This style is designed with volumes measured to the millimeter, making it impossible to resist.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10120-1.png?alt=media&token=6f3a57ed-2358-4423-a9c2-3a8b47f8b878"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10120-2.png?alt=media&token=74c87ee3-0706-4c1c-a1a5-f9a1726348cb"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10120-3.png?alt=media&token=e88cf458-131b-46bb-9814-71e746e8ce5a")]),
        Product(id: "10121", name: "Viscose satin blouse",
                price: 129, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shirts.rawValue,
                description: """
Viscose, the great protagonist of the hot season, gives its best in a blouse version: making this model light and fluttering, feminine and ethereal, romantic and contemporary.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10121-1.png?alt=media&token=8c3887c8-aee4-4133-8186-84b765dedcac"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10121-2.png?alt=media&token=b1eb3ec2-059c-4326-8d7a-6c1bdb24d405")]),
        Product(id: "10122", name: "Organic cotton blend hooded logo sweatshirt",
                price: 149, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
Few items are as versatile as the hooded sweatshirt, the undisputed star of casual looks without distinction of gender. And the A|X signature model, with front and back logo print, offers a sustainable version, made as it is in an organic cotton blend.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Dark Gray", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10122-1.png?alt=media&token=ee5d8571-fc39-4f90-98ae-9b3f2dd66878"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10122-2.png?alt=media&token=471b7ceb-fe08-4ff8-9a25-d34de133568d")]),
        Product(id: "10123", name: "Icon logo sweatpants",
                price: 99, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
The Icon Project celebrates the iconic 1991 A|X logo by showcasing it on a selection of must have items for every season and any wardrobe. Made from 100% cotton, these sweatpants feature a front logo, elasticated drawstring at the waist, side pockets and stretch cuffs at the ankles.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Powder Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10123-1.png?alt=media&token=8b5c4e17-f199-476a-95af-2413a1b3018a"),
                    ProductVariant(color: Color.blue, colorName: "Azure", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10123-2.png?alt=media&token=4d99f8d7-76b0-4b67-ad09-a34b7c3c8dda"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10123-3.png?alt=media&token=02fe0ace-dea5-4329-968b-af58938ead6b")]),
        Product(id: "10124", name: "J51 carrot denim jeans",
                price: 139, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jeans.rawValue,
                description: """
Stone washed denim is an enduring trend that continues to win over countless fans. In this version by A|X, however, the clear Y2K inspiration that distinguishes it finds its contemporary counterpart in the tapered fit on the bottom.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10124-1.png?alt=media&token=22e13b05-742e-4e93-88f6-f99dbf6176ca"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10124-2.png?alt=media&token=8b3eee05-e5a1-4959-9aa7-8f8ab808204c")]),
        Product(id: "10125", name: "Milano New York french terry shorts",
                price: 89, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
Armani Exchange scores another stunning victory with these stretch twill shorts. They’ve conquered the casual wardrobe by becoming a must have year round staple.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Nude", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10125-1.png?alt=media&token=62629c61-28d8-4bd3-964d-821c9cd5e8f5"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10125-2.png?alt=media&token=4ca09d0a-7d6c-4edc-b415-edb45a2c4c23")]),
        Product(id: "10126", name: "Plain linen blazer",
                price: 269, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jackets.rawValue,
                description: """
A refined silhouette for the linen blazer with button closures and partly sheer design.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10126-1.png?alt=media&token=90883743-ff08-4a06-b437-72b1f3bd4993"),
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Beige", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10126-2.png?alt=media&token=31f759af-a848-4d47-b5be-89ea5dfc8c58")]),
        Product(id: "10127", name: "Monochromatic action leather metallic logo sneakers",
                price: 199, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
Monochromatic, feminine, with a slight bulkiness that blends trendy, oversized sneakers, with sleek sneakers that make a statement.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Pink", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10127-1.png?alt=media&token=0a80cbb7-f6ba-4e1a-bc80-fb477ed5365f"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10127-2.png?alt=media&token=9066206c-2f8c-4f62-b3fb-165f4d38d17d")]),
        Product(id: "10128", name: "Embossed small tote bag",
                price: 129, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
A best seller that is renewed every season, perfect from every point of view and always cool: the small size tote with removable shoulder strap and band with metal logo buckle is the accessory that must not be missing in the look.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Fuchsia", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10128-1.png?alt=media&token=2d7d2a71-bac9-4b57-a929-fe47d2635b75"),
                    ProductVariant(color: Color.green, colorName: "Lime Green", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10128-2.png?alt=media&token=7f28cda7-b2d6-4def-8112-308b197b9386"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10128-3.png?alt=media&token=b97fd9b9-8126-4936-bf18-2752c7d842b8")]),
        Product(id: "10129", name: "Cat-eye Women’s sunglasses",
                price: 79, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.sunglasses.rawValue,
                description: """
New sustainable story pairing modern constructions with eye-catching details. This sustainable sun style fuses youthful and easy-to-wear bold femininity. Shiny metal temples paired with shiny opaline fronts or classic colors for a stand-out, yet delicate effect. Oversized feminine front in partly bio-based nylon fiber with round lenses and slightly cat-eye frame.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Fuchsia", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10129-1.png?alt=media&token=4b221725-5aad-40c0-8382-788139dadee6"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10129-2.png?alt=media&token=c2684a06-a1d0-418e-98b8-a696ff995a64")]),
        Product(id: "10130", name: "Steel Strap Watches",
                price: 159, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.watches.rawValue,
                description: """
Composition 93% Stainless Steel 6% Crystal 1% Plastic
Brand logo
Case material: stainless steel
Strap material: stainless steel
Water resistant
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Rose Gold", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10130-1.png?alt=media&token=daf43192-ae62-4d08-8b4d-5c628bf47bef"),
                    ProductVariant(color: Color.gray, colorName: "Silver", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10130-2.png?alt=media&token=f2aae5a2-bbe1-406b-9a10-137c4e937ac3")]),
        Product(id: "10131", name: "Logo printed fabric belt",
                price: 55, brand: Brand.armani.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.belts.rawValue,
                description: """
The perfect combination of girly and gritty, this belt enhances any look. From denim mini skirts to formal outfits, it suits any style to a T.
""",
                sizes: beltsSizes,
                variants: [
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10131-1.png?alt=media&token=02921762-e012-4f12-bc09-994b81d31c49"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10131-2.png?alt=media&token=c6c5bc86-7dd0-4161-9568-3f3cb456269a")]),

        // MARK: - PUMA Products
        Product(id: "10132", name: "Classics Women's Sleeveless Dress",
                price: 49, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.dresses.rawValue,
                description: """
Comfy enough to lounge in, stylish enough to take out on the town – this Classics dress brings you the best of both worlds. With a flattering ribbed fit and criss-cross back straps, you'll be serving sporty summer glam, whatever the occasion.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Day Dream", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10132-1.png?alt=media&token=991e0b5b-374a-47e0-a5a5-5f90e7dd213e"),
                    ProductVariant(color: Color.yellow, colorName: "Light Straw", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10132-2.png?alt=media&token=8ff4352e-ed47-4d3e-a2b9-b84c37bbcf4e"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10132-3.png?alt=media&token=3eb94b9f-78a0-491d-b5c8-b817c3085e7c")]),
        Product(id: "10133", name: "Classics Logo Women's Tee",
                price: 29, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.tshirts.rawValue,
                description: """
State your brand loyalty loud and proud in this classic pure cotton tee, featuring an unmissable PUMA Archive No. 1 Logo across the chest. Made with cotton from the Better Cotton Initiative as a step towards a more sustainable future.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.pink, colorName: "Peach Smoothie-pearl", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10133-1.png?alt=media&token=b919bb62-ab9e-42af-91be-830edeec9028"),
                    ProductVariant(color: Color.yellow, colorName: "Light Straw", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10133-2.png?alt=media&token=5e7e9535-20b9-48c5-960a-a64f4804b610"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10133-3.png?alt=media&token=250d4dbc-6663-4b08-9332-c138cb593dcf")]),
        Product(id: "10134", name: "Classics A-Line Women's Skirt",
                price: 49, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.skirts.rawValue,
                description: """
Keep it simple in this lightweight skirt, combining an overlapping A-line design with athletic fabric and a comfy adjustable waist, and finished with an embroidered sign-off at the hem.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.purple, colorName: "Vivid Violet", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10134-1.png?alt=media&token=1330b957-3006-4f09-88fb-0daf47f1451e"),
                    ProductVariant(color: Color.blue, colorName: "Day Dream", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10134-2.png?alt=media&token=d9991f4b-0e36-491e-b7e5-9e0e680e6c37"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10134-3.png?alt=media&token=06fe9e74-067a-426b-a11a-10cdd8899344")]),
        Product(id: "10135", name: "Pivot Cropped Women's Basketball Hoodie",
                price: 69, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.sweatshirts.rawValue,
                description: """
Cut up the court with ease in the Pivot Cropped Basketball Hoodie. The relaxed fit is sharpened up by the boxy length, while ribbed detailing snatches at the cuffs and hem. Adjust the hood using the drawcord for optimum comfort. Whether you wear it to shoot hoops or to get cosy after training sessions, enjoy a fierce style that doesn't compromise on quality.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.purple, colorName: "Vivid Violet", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10135-1.png?alt=media&token=04f59004-309c-4bd5-92db-e40f7f68b9b2"),
                    ProductVariant(color: Color.blue, colorName: "Royal Sapphire", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10135-2.png?alt=media&token=c12914a6-215f-41ae-856f-776c2b281678")]),
        Product(id: "10136", name: "We Are Legends Women's Sweatpants",
                price: 65, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.trousers.rawValue,
                description: """
We Are Legends is PUMA’s new platform celebrating Black excellence in design and fashion – and empowering a new era of Black designers. The first collection by We Are Legends takes inspiration from the HBCU experience, with collegiate details and a bright color palette pulled from HBCU logos across the country. These sweats bring cool to casual. Paired with the WAL Crew, they create an unstoppable full fit.
""",
                sizes: bottomsSizes,
                variants: [
                    ProductVariant(color: Color.purple, colorName: "Purple", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10136-1.png?alt=media&token=2f7c008d-1868-48e8-a5ff-16bc2e571997"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10136-2.png?alt=media&token=6bf6b58a-8d7a-4520-83e4-d9ebbc5690d6"),
                    ProductVariant(color: Color.red, colorName: "Intense Red", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10136-3.png?alt=media&token=b96d4c14-4770-4843-9c6e-e1324218eeeb")]),
        Product(id: "10137", name: "Pivot Women's Basketball Shorts",
                price: 55, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.shorts.rawValue,
                description: """
Be the playmaker and step into your power with these Pivot Basketball Shorts. They may give off a summery vibe on the court, but they're here to domiante the game.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.blue, colorName: "Royal Sapphire", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10137-1.png?alt=media&token=f5694b22-0dcd-4de3-939d-79ff2beba17a"),
                    ProductVariant(color: Color.purple, colorName: "Vivid Violet", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10137-2.png?alt=media&token=09bd0d03-17e1-4716-a77d-87e3405b1e15")]),
        Product(id: "10138", name: "PUMA Fit Women's Sherpa Training Jacket",
                price: 65, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.clothes.rawValue , subCategory: SubCategory.jackets.rawValue,
                description: """
This comfy jacket is ready to take you wherever you’re going, no matter the conditions. It features cozy technical Sherpa, with dryCELL moisture-wicking properties to keep you dry and comfortable.
""",
                sizes: topsSizes,
                variants: [
                    ProductVariant(color: Color.red, colorName: "Aubergine", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10138-1.png?alt=media&token=52e22b1e-f003-4b9a-a0c2-cddf6707bf91"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10138-2.png?alt=media&token=8a737c09-b4c9-484f-beed-238644c71630")]),
        Product(id: "10139", name: "Deviate NITRO 2 Women's Running Shoes",
                price: 159, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
Running faster just got easier. More responsive than its award-winning predecessor, the Deviate NITRO 2 features a full-length layer of premium NITRO Elite foam at the midsole for supreme cushioning and peak propulsion. A reworked PWRPLATE—with an innovative platform design—acts as a lever for maximum energy transfer at toe-off, while the breathable mesh upper offers extra padding and grip around the ankle to prevent heel slip. Improved traction rounds out this tech-packed running shoe that thrives at any distance. The striking gradient colorway checks the style box. Effortless has never felt—or looked—better.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Spring Lavender", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10139-1.png?alt=media&token=fde258a7-c477-4304-88b9-f5aba2668189"),
                    ProductVariant(color: Color.blue, colorName: "Royal Sapphire", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10139-2.png?alt=media&token=b573c8e6-4a43-40e0-8186-55460e981b0e"),
                    ProductVariant(color: Color.orange, colorName: "Sunset Glow", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10139-3.png?alt=media&token=42b2ada2-9e74-4494-925f-710c98d56059")]),
        Product(id: "10140", name: "PRIME Classics Archive Grip Bag",
                price: 59, brand: Brand.puma.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
This classic grip bag is perfect for carrying all your essentials for the day. It has a host of retro details, including the piping and all-over pattern.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.init(hex: "EED9C4"), colorName: "Light Sand", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10140-1.png?alt=media&token=46608692-ab5b-4778-89e8-0323c62cab2f"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10140-2.png?alt=media&token=7a46365b-4518-47d7-b035-f5cc21a3d778")]),

        // MARK: - ASICS Products
        Product(id: "10141", name: "Gel Kayano 30",
                price: 189, brand: Brand.asics.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
The GEL-KAYANO™ 30 running shoe combines maximum support with ultimate comfort for complete peace of mind. Our most advanced stability shoe yet, it’s designed to help you run further for longer. And thanks to its adaptive stability and superior comfort, you’ll wish the road would never end.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Rose Dust", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10141-1.png?alt=media&token=13d115cf-5a16-49ae-b5da-382a58992af4"),
                    ProductVariant(color: Color.green, colorName: "Ocean Haze", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10141-2.png?alt=media&token=ced7ec6a-02fe-466a-82bd-28edd66990b8"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10141-3.png?alt=media&token=32f48649-1f27-4aec-aa3b-d9743fa6a53c")]),

        // MARK: - NIKE Products
        Product(id: "10142", name: "Nike Air Max 270",
                price: 149, brand: Brand.nike.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.shoes.rawValue , subCategory: SubCategory.trainers.rawValue,
                description: """
Legendary Air gets lifted. Nike's 1st lifestyle Air Max brings you style, comfort and 270 degrees of visible cushioning to showcase 1 of our greatest innovations yet. Add a lightweight airy upper, low-cut collar and earthy neutral colourway and you've got the perfect go-to kicks for everyday fun.
""",
                sizes: shoesSizes,
                variants: [
                    ProductVariant(color: Color.gray, colorName: "Ironstone", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10142-1.png?alt=media&token=960a1015-d4ad-42fb-9bf3-4a3a40b2e1d4"),
                    ProductVariant(color: Color.white, colorName: "White", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10142-2.png?alt=media&token=3085134a-96c8-4006-967e-037bf48b5438"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10142-3.png?alt=media&token=51d41acd-f221-4cde-81f0-806d996d9bf7")]),
        Product(id: "10143", name: "Jordan Flight Printed Recycled Cotton Holdall Tote",
                price: 59, brand: Brand.nike.rawValue, gender: Gender.women.rawValue,
                category: MasterCategory.accessories.rawValue , subCategory: SubCategory.bags.rawValue,
                description: """
This classic tote is made from durable recycled cotton canvas for sustainability. The zip main compartment is spacious enough for transporting your shopping, bringing your favourite games and snacks to the beach or whatever you want to haul around during your day. There is an internal slip pocket to help secure the small items you don't want lost in the main compartment, and the carry handles are long enough for you to wear the tote over your shoulder.
""",
                sizes: accessoriesSizes,
                variants: [
                    ProductVariant(color: Color.orange, colorName: "Light Sienna", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10143-1.png?alt=media&token=4fa419b9-da25-4414-9493-b919a284ab18"),
                    ProductVariant(color: Color.black, colorName: "Black", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-b752b.appspot.com/o/10143-2.png?alt=media&token=7138d7ea-8684-427f-ac07-5cbe1083462a")])
    ]
}
#endif
