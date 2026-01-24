"""
Common ingredients database for autocomplete functionality.
"""

COMMON_INGREDIENTS = {
    "sweeteners": [
        "sugar", "white sugar", "brown sugar", "cane sugar", "raw sugar",
        "high fructose corn syrup", "corn syrup", "glucose syrup", "maltose",
        "honey", "maple syrup", "agave nectar", "molasses", "stevia",
        "aspartame", "sucralose", "saccharin", "acesulfame potassium",
        "erythritol", "xylitol", "sorbitol", "mannitol", "maltitol",
        "coconut sugar", "date sugar", "monk fruit", "turbinado sugar"
    ],
    "oils_fats": [
        "olive oil", "extra virgin olive oil", "vegetable oil", "canola oil",
        "sunflower oil", "safflower oil", "corn oil", "soybean oil",
        "coconut oil", "palm oil", "palm kernel oil", "peanut oil",
        "sesame oil", "avocado oil", "grapeseed oil", "walnut oil",
        "butter", "margarine", "ghee", "lard", "shortening",
        "flaxseed oil", "fish oil", "mct oil"
    ],
    "additives_preservatives": [
        "salt", "sodium chloride", "msg", "monosodium glutamate",
        "sodium benzoate", "potassium sorbate", "sodium nitrate", "sodium nitrite",
        "bht", "bha", "tbhq", "citric acid", "ascorbic acid",
        "carrageenan", "xanthan gum", "guar gum", "locust bean gum",
        "cellulose gum", "pectin", "agar", "gelatin",
        "polysorbate 80", "polysorbate 60", "soy lecithin", "lecithin",
        "mono and diglycerides", "sodium stearoyl lactylate"
    ],
    "colorings": [
        "red 40", "yellow 5", "yellow 6", "blue 1", "blue 2",
        "caramel color", "annatto", "turmeric extract", "paprika extract",
        "beet juice", "carmine", "titanium dioxide", "iron oxide"
    ],
    "grains_starches": [
        "wheat flour", "white flour", "whole wheat flour", "bread flour",
        "rice", "white rice", "brown rice", "jasmine rice", "basmati rice",
        "oats", "rolled oats", "steel cut oats", "oat bran",
        "corn", "cornmeal", "cornstarch", "wheat", "barley", "rye",
        "quinoa", "buckwheat", "millet", "tapioca", "potato starch",
        "pasta", "noodles", "bread", "white bread", "whole grain bread"
    ],
    "proteins": [
        "chicken", "chicken breast", "chicken thigh", "turkey",
        "beef", "ground beef", "steak", "pork", "ham", "bacon",
        "lamb", "veal", "duck", "salmon", "tuna", "cod", "tilapia",
        "shrimp", "crab", "lobster", "sardines", "mackerel",
        "eggs", "egg whites", "egg yolks", "tofu", "tempeh", "seitan"
    ],
    "dairy": [
        "milk", "whole milk", "skim milk", "cream", "heavy cream",
        "cheese", "cheddar cheese", "mozzarella cheese", "parmesan cheese",
        "feta cheese", "cottage cheese", "cream cheese", "ricotta cheese",
        "yogurt", "greek yogurt", "kefir", "sour cream", "buttermilk"
    ],
    "vegetables": [
        "broccoli", "cauliflower", "cabbage", "brussels sprouts", "kale",
        "spinach", "lettuce", "arugula", "swiss chard", "collard greens",
        "carrot", "celery", "cucumber", "zucchini", "squash",
        "tomato", "bell pepper", "onion", "garlic", "leek", "shallot",
        "potato", "sweet potato", "beet", "turnip", "radish",
        "asparagus", "artichoke", "green beans", "peas", "eggplant", "mushroom", "avocado"
    ],
    "fruits": [
        "apple", "banana", "orange", "lemon", "lime", "grapefruit",
        "strawberry", "blueberry", "raspberry", "blackberry", "cranberry",
        "grape", "cherry", "peach", "plum", "apricot", "nectarine",
        "mango", "pineapple", "papaya", "kiwi", "coconut",
        "watermelon", "cantaloupe", "honeydew", "pear", "fig", "date"
    ],
    "nuts_seeds": [
        "almond", "almonds", "walnut", "walnuts", "cashew", "cashews",
        "peanut", "peanuts", "pistachio", "pistachios",
        "pecan", "pecans", "macadamia", "hazelnut", "hazelnuts",
        "sunflower seeds", "pumpkin seeds", "chia seeds", "flaxseed",
        "hemp seeds", "sesame seeds", "peanut butter", "almond butter", "tahini"
    ],
    "legumes": [
        "black beans", "kidney beans", "pinto beans", "navy beans",
        "chickpeas", "garbanzo beans", "lentils", "red lentils", "green lentils",
        "split peas", "soybeans", "lima beans", "cannellini beans"
    ],
    "herbs_spices": [
        "pepper", "black pepper", "cayenne pepper",
        "cinnamon", "ginger", "turmeric", "cumin", "coriander",
        "paprika", "chili powder", "oregano", "basil", "thyme",
        "rosemary", "sage", "parsley", "cilantro", "dill",
        "mint", "bay leaf", "nutmeg", "cloves", "cardamom", "vanilla"
    ],
    "fermented": [
        "yogurt", "kefir", "sauerkraut", "kimchi", "kombucha",
        "miso", "tempeh", "natto", "pickles", "vinegar",
        "apple cider vinegar", "sourdough"
    ],
    "processed": [
        "hot dog", "sausage", "deli meat", "spam",
        "chips", "crackers", "cookies", "cake", "candy",
        "ice cream", "frozen pizza", "instant noodles",
        "mayonnaise", "ketchup", "mustard"
    ]
}


def get_all_ingredients():
    all_ingredients = []
    for ingredients in COMMON_INGREDIENTS.values():
        all_ingredients.extend(ingredients)
    return list(set(all_ingredients))


def get_ingredient_category(ingredient_name: str) -> str:
    ingredient_lower = ingredient_name.lower()
    for category, ingredients in COMMON_INGREDIENTS.items():
        if ingredient_lower in [i.lower() for i in ingredients]:
            return category
    return "general"


def search_ingredients(query: str, limit: int = 10) -> list:
    query_lower = query.lower().strip()
    if len(query_lower) < 2:
        return []

    results = []
    seen = set()

    for category, ingredients in COMMON_INGREDIENTS.items():
        for ingredient in ingredients:
            ingredient_lower = ingredient.lower()
            if ingredient_lower in seen:
                continue
            seen.add(ingredient_lower)

            match_score = 0.0
            if ingredient_lower == query_lower:
                match_score = 1.0
            elif ingredient_lower.startswith(query_lower):
                match_score = 0.9 - (len(ingredient_lower) - len(query_lower)) * 0.01
            elif query_lower in ingredient_lower:
                position = ingredient_lower.index(query_lower)
                match_score = 0.6 - position * 0.01

            if match_score > 0:
                results.append({
                    "ingredient_name": ingredient,
                    "match_score": round(min(match_score, 1.0), 3),
                    "category": category
                })

    results.sort(key=lambda x: x["match_score"], reverse=True)
    return results[:limit]
