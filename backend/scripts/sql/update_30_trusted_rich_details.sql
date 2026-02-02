-- ============================================================================
-- Rich Detail Updates for All 30 Trusted Ingredients
-- ============================================================================
-- This script updates all 30 trusted ingredients with:
-- - Detailed bullet points (details array)
-- - Confidence score and level
-- - Confidence rationale explaining the evidence quality
-- ============================================================================

-- ==================== SWEETENERS ====================

-- 1. Sugar (white, brown)
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 10,
        "description": "Sugar causes significant blood sugar spikes due to rapid digestion and absorption.",
        "details": [
            "Sugar is rapidly digested and absorbed, causing sharp rises in blood glucose and insulin, especially in liquid form or when eaten alone.",
            "High-glycemic, low-fiber sugar exposures are strongly linked with greater risk of type 2 diabetes and cardiometabolic problems when intake is high and frequent."
        ],
        "confidence_score": 90,
        "confidence_level": "Strong",
        "confidence_rationale": "Consistent, moderate-to-strong human evidence that high added sugar intake worsens glycemic control and diabetes risk."
    }'::jsonb,
    inflammation_details = '{
        "score": 25,
        "description": "High sugar intake promotes chronic low-grade inflammation through multiple mechanisms.",
        "details": [
            "High sugar intake can shift cytokine balance toward pro-inflammatory mediators and is associated with chronic low-grade inflammation in both animal and human data.",
            "Mechanisms include microbiota changes, metabolic endotoxemia, and promotion of insulin resistance, all contributing to systemic inflammatory states."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Multiple mechanistic and observational studies link high sugar diets to higher inflammatory markers, but heterogeneity keeps this out of the very strong tier."
    }'::jsonb,
    gut_impact_details = '{
        "score": 40,
        "description": "Added sugars negatively affect gut microbiome composition and barrier function.",
        "details": [
            "Added sugars can alter gut microbiota diversity, deplete short-chain-fatty-acid-producing bacteria, and impair barrier integrity in experimental models.",
            "These changes may promote IBS-like symptoms, endotoxemia, and metabolic dysfunction in susceptible people."
        ],
        "confidence_score": 65,
        "confidence_level": "Mixed",
        "confidence_rationale": "Human and animal studies consistently show effects on microbiome and gut barrier, but results across species and doses are not fully consistent."
    }'::jsonb,
    disease_links_details = '{
        "score": 20,
        "description": "High sugar intake is associated with increased risk of multiple chronic diseases.",
        "details": [
            "An umbrella review of 73 meta-analyses found higher dietary sugar is associated with increased risk of obesity, type 2 diabetes, metabolic syndrome, fatty liver, gout, and cardiovascular disease.",
            "High sugar intake is also linked to dental caries and may relate to certain cancers and higher all-cause mortality."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Moderate-quality evidence for weight gain and cardiometabolic outcomes, with directionally consistent evidence for several other diseases."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 30,
        "insulin_impact": "high",
        "estrogen_impact": "moderate",
        "cortisol_impact": "moderate",
        "description": "Sugar strongly affects insulin and can indirectly impact other hormones through metabolic pathways.",
        "details": [
            "Sugar strongly stimulates insulin, and chronic high intake can drive insulin resistance, disrupting broader hormonal and metabolic regulation.",
            "High sugar intake is linked to dysregulated cortisol responses and can contribute indirectly to higher estrogen via increased adiposity."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Insulin-related effects are well supported; links to cortisol patterns and estrogen dominance rely more on observational and mechanistic data."
    }'::jsonb
WHERE ingredient_name = 'sugar' OR ingredient_name = 'sugar (white, brown)';

-- 2. High-fructose corn syrup
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 10,
        "description": "HFCS causes rapid blood sugar and insulin spikes similar to sucrose.",
        "details": [
            "HFCS raises blood sugar and insulin rapidly, similar to sucrose, especially in beverages.",
            "The glucose-fructose mix is metabolized quickly, leading to sharp glycemic responses and subsequent crashes."
        ],
        "confidence_score": 90,
        "confidence_level": "Strong",
        "confidence_rationale": "Well-established glycemic effects from multiple RCTs and metabolic studies comparing HFCS to other sugars."
    }'::jsonb,
    inflammation_details = '{
        "score": 20,
        "description": "HFCS intake is associated with elevated inflammatory markers.",
        "details": [
            "HFCS intake is associated with elevated CRP and higher inflammatory signaling at similar doses to sucrose.",
            "The fructose component drives hepatic lipogenesis and uric acid production, both linked to inflammatory pathways."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Multiple studies show inflammatory associations, though isolating HFCS from general added sugar effects is challenging."
    }'::jsonb,
    gut_impact_details = '{
        "score": 40,
        "description": "HFCS promotes metabolic changes that affect gut-liver axis function.",
        "details": [
            "HFCS promotes metabolic changes accompanied by adverse gut-liver axis function shifts.",
            "High fructose intake can increase intestinal permeability and promote bacterial endotoxin translocation."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Animal and mechanistic data support gut effects; human dose-response data is less clear."
    }'::jsonb,
    disease_links_details = '{
        "score": 20,
        "description": "HFCS is linked to multiple metabolic and cardiovascular diseases.",
        "details": [
            "Linked to weight gain, fatty liver disease, type 2 diabetes, and cardiovascular disease in epidemiological studies.",
            "Meta-analyses show associations with metabolic syndrome components when intake is high."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Strong epidemiological associations, though some debate about whether HFCS differs meaningfully from sucrose."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 30,
        "insulin_impact": "high",
        "estrogen_impact": "low",
        "cortisol_impact": "moderate",
        "description": "HFCS disrupts insulin signaling and appetite hormones.",
        "details": [
            "Drives insulin resistance and impaired insulin secretion with chronic high intake.",
            "May disturb leptin and ghrelin signaling, affecting appetite regulation."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Insulin effects well-documented; appetite hormone effects have mixed evidence from human studies."
    }'::jsonb
WHERE ingredient_name = 'high-fructose corn syrup' OR ingredient_name = 'hfcs';

-- 3. Honey
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 25,
        "description": "Honey raises blood sugar but with lower glycemic response than refined sugar.",
        "details": [
            "Honey raises blood sugar but shows lower glucose and insulin responses versus equal amounts of other sugar solutions.",
            "The presence of organic acids and enzymes may slow digestion compared to refined sugars."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Studies show modest glycemic advantages over sucrose, but effects vary by honey type and individual metabolism."
    }'::jsonb,
    inflammation_details = '{
        "score": 45,
        "description": "Honey contains bioactive compounds with anti-inflammatory properties.",
        "details": [
            "Contains polyphenols and antioxidants that may reduce oxidative stress and inflammatory markers.",
            "Raw honey has antimicrobial peptides and enzymes that support immune function."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Antioxidant content is well-documented; clinical anti-inflammatory effects require more human trials."
    }'::jsonb,
    gut_impact_details = '{
        "score": 60,
        "description": "Honey has prebiotic properties that may support gut health.",
        "details": [
            "Has prebiotic oligosaccharides that support beneficial gut bacteria growth.",
            "Traditional use for digestive complaints supported by some antimicrobial and wound-healing research."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "In vitro and animal studies support prebiotic effects; human gut microbiome studies are limited."
    }'::jsonb,
    disease_links_details = '{
        "score": 40,
        "description": "Honey may improve cardiometabolic markers when replacing refined sugar.",
        "details": [
            "Can improve cardiometabolic markers when replacing refined sugar in the diet.",
            "Some evidence for wound healing and upper respiratory infection symptom relief."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Substitution studies show benefits; still a significant source of simple sugars requiring moderation."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 40,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Honey may show modest improvements in insulin dynamics compared to refined sugars.",
        "details": [
            "May show modest insulin resistance improvements when replacing refined sugars.",
            "Lower glycemic index than table sugar may reduce insulin demand."
        ],
        "confidence_score": 45,
        "confidence_level": "Emerging",
        "confidence_rationale": "Preliminary human studies suggest benefits; more controlled trials needed."
    }'::jsonb
WHERE ingredient_name = 'honey';

-- 4. Maple syrup
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 30,
        "description": "Maple syrup has a moderate glycemic index, lower than white sugar.",
        "details": [
            "GI around 54, lower than white sugar (65), meaning somewhat slower glucose spikes.",
            "Contains some minerals that may modestly influence glucose metabolism."
        ],
        "confidence_score": 65,
        "confidence_level": "Mixed",
        "confidence_rationale": "GI studies are consistent; clinical significance of the difference from sucrose is modest."
    }'::jsonb,
    inflammation_details = '{
        "score": 45,
        "description": "Maple syrup contains over 60 polyphenols with antioxidant properties.",
        "details": [
            "Contains over 60 polyphenols and antioxidants including unique compounds like quebecol.",
            "In vitro studies show anti-inflammatory and antioxidant effects of maple phenolics."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Antioxidant content well-characterized; human anti-inflammatory studies are limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 60,
        "description": "Maple syrup is well-tolerated with no problematic additives.",
        "details": [
            "Well tolerated, no sugar alcohols or emulsifiers that cause GI distress.",
            "Simple carbohydrate composition is easily digested."
        ],
        "confidence_score": 45,
        "confidence_level": "Limited",
        "confidence_rationale": "Tolerability is clinically observed; specific gut health studies are sparse."
    }'::jsonb,
    disease_links_details = '{
        "score": 40,
        "description": "May provide modest benefits when replacing refined sugar.",
        "details": [
            "May modestly improve blood pressure markers when replacing refined sugar.",
            "Mineral content (manganese, zinc) provides nutritional value absent in refined sugars."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Substitution benefits plausible but clinical trials are limited; still primarily sugar."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 40,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Lower GI may reduce the sharpness of insulin spikes.",
        "details": [
            "Lower GI may reduce sharpness of insulin spikes compared to white sugar.",
            "Contains zinc which supports hormone metabolism."
        ],
        "confidence_score": 40,
        "confidence_level": "Emerging",
        "confidence_rationale": "Theoretical benefits from GI; direct hormonal studies not available."
    }'::jsonb
WHERE ingredient_name = 'maple syrup';

-- 5. Agave nectar
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 35,
        "description": "Very low GI due to high fructose content, but this is not necessarily beneficial.",
        "details": [
            "Very low GI (~10-19) due to approximately 80-85% fructose content.",
            "Low GI is misleading because fructose bypasses normal glucose regulation and stresses the liver."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "GI is well-measured; the health implications of high fructose are increasingly understood."
    }'::jsonb,
    inflammation_details = '{
        "score": 25,
        "description": "High fructose content drives liver stress and inflammatory pathways.",
        "details": [
            "High fructose overloads the liver, promotes de novo lipogenesis, and raises triglycerides.",
            "These metabolic effects activate inflammatory pathways similar to other concentrated fructose sources."
        ],
        "confidence_score": 65,
        "confidence_level": "Mixed",
        "confidence_rationale": "Fructose metabolism effects well-documented; agave-specific human studies limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 45,
        "description": "Can cause GI symptoms in people with fructose malabsorption.",
        "details": [
            "Can cause GI symptoms in people with fructose malabsorption (up to 30% of population).",
            "High fructose-to-glucose ratio exceeds absorptive capacity in sensitive individuals."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "Fructose malabsorption is well-documented; agave-specific gut studies are limited."
    }'::jsonb,
    disease_links_details = '{
        "score": 25,
        "description": "Linked to fatty liver disease and metabolic syndrome from high fructose.",
        "details": [
            "Linked to fatty liver disease, higher triglycerides, and metabolic syndrome with regular use.",
            "Despite marketing as natural, metabolic effects are similar to or worse than HFCS."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Strong mechanistic and epidemiological evidence for fructose-related metabolic harm."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 30,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "low",
        "description": "Despite low GI, chronic high fructose worsens insulin resistance.",
        "details": [
            "Despite low GI, chronic high fructose intake worsens insulin resistance.",
            "Does not trigger normal satiety signaling, potentially promoting overconsumption."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Fructose-insulin resistance link established; satiety effects need more human data."
    }'::jsonb
WHERE ingredient_name = 'agave nectar' OR ingredient_name = 'agave';

-- 6. Stevia
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 90,
        "description": "Zero-calorie sweetener with no impact on blood glucose or insulin.",
        "details": [
            "Non-caloric, no glycemic index, does not raise blood glucose or insulin.",
            "Suitable for diabetics and those monitoring blood sugar."
        ],
        "confidence_score": 75,
        "confidence_level": "Moderate",
        "confidence_rationale": "Multiple RCTs confirm no glycemic effect; long-term metabolic effects still being studied."
    }'::jsonb,
    inflammation_details = '{
        "score": 70,
        "description": "May have anti-inflammatory properties based on experimental studies.",
        "details": [
            "Has antioxidant and anti-inflammatory effects in experimental cell and animal studies.",
            "Steviol glycosides show anti-inflammatory activity in mechanistic research."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "In vitro data promising; human anti-inflammatory trials are limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 70,
        "description": "Well-tolerated without the GI side effects of sugar alcohols.",
        "details": [
            "Not fermentable, does not cause bloating or diarrhea like sugar alcohols.",
            "Some studies suggest possible effects on gut microbiota composition."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "GI tolerability well-established; microbiome effects need more research."
    }'::jsonb,
    disease_links_details = '{
        "score": 80,
        "description": "Helps reduce sugar and calorie intake with excellent safety profile.",
        "details": [
            "Helps reduce added sugar and calorie intake when used as a substitute.",
            "No carcinogenic or genotoxic issues found in extensive safety testing."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Safety extensively studied; long-term population studies for disease outcomes limited."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 70,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Does not require insulin for metabolism and may improve glycemic control.",
        "details": [
            "Does not require insulin for metabolism.",
            "May improve glycemic control when replacing sugar in diabetic diets."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "Insulin-sparing effect established; broader hormonal effects not well-studied."
    }'::jsonb
WHERE ingredient_name = 'stevia';

-- 7. Erythritol
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 95,
        "description": "Zero glycemic impact - does not raise blood glucose or insulin.",
        "details": [
            "GI of 0, insulinemic index of approximately 2, does not raise blood glucose or insulin.",
            "90% absorbed in small intestine and excreted unchanged in urine."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Well-established metabolic pathway and glycemic studies in humans."
    }'::jsonb,
    inflammation_details = '{
        "score": 60,
        "description": "Metabolically inert but recent cardiovascular concerns warrant monitoring.",
        "details": [
            "Largely absorbed and excreted unchanged; metabolically inert.",
            "Recent observational studies suggest possible cardiovascular associations requiring further study."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "New cardiovascular signals from 2023 studies need replication and mechanistic explanation."
    }'::jsonb,
    gut_impact_details = '{
        "score": 60,
        "description": "Better tolerated than other sugar alcohols but can cause symptoms at high doses.",
        "details": [
            "Better tolerated than other sugar alcohols due to small intestine absorption.",
            "Higher doses (>50g) can still cause GI symptoms in sensitive individuals."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Tolerability studies consistent; individual variation is significant."
    }'::jsonb,
    disease_links_details = '{
        "score": 55,
        "description": "Generally helpful for metabolic health but cardiovascular signal needs study.",
        "details": [
            "Helps reduce cardiometabolic risk factors by replacing sugar.",
            "Recent cardiovascular association signal requires more investigation before definitive conclusions."
        ],
        "confidence_score": 50,
        "confidence_level": "Mixed",
        "confidence_rationale": "Metabolic benefits established; cardiovascular concerns are new and need confirmation."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 65,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "No direct insulin requirement; may stimulate gut hormones.",
        "details": [
            "No direct insulin requirement for metabolism.",
            "May trigger gut hormones like GLP-1 which support glucose regulation."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "Insulin-sparing established; gut hormone effects need more human data."
    }'::jsonb
WHERE ingredient_name = 'erythritol';

-- 8. Xylitol
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 80,
        "description": "Very low GI with minimal blood glucose impact.",
        "details": [
            "Very low GI (7-13), causes only small rise in blood glucose.",
            "Absorbed slowly, requiring less insulin than sucrose."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "GI and metabolic studies consistent; widely used in diabetic products."
    }'::jsonb,
    inflammation_details = '{
        "score": 55,
        "description": "Avoids fructose-driven inflammation but gut fermentation may have effects.",
        "details": [
            "Avoids fructose-driven inflammatory pathways.",
            "Recent cardiovascular concerns similar to erythritol warrant monitoring."
        ],
        "confidence_score": 50,
        "confidence_level": "Mixed",
        "confidence_rationale": "Metabolic advantages over sugar clear; new cardiovascular signals need study."
    }'::jsonb,
    gut_impact_details = '{
        "score": 35,
        "description": "Commonly causes GI distress due to fermentation in the colon.",
        "details": [
            "Commonly causes gas, bloating, and loose stools due to colonic fermentation.",
            "Most people tolerate only 10-15g before experiencing symptoms."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "GI effects well-documented in clinical studies; dose-response established."
    }'::jsonb,
    disease_links_details = '{
        "score": 55,
        "description": "Strongly beneficial for dental health; toxic to dogs.",
        "details": [
            "Strongly beneficial for dental health - reduces cavity-causing bacteria.",
            "Important warning: toxic to dogs even in small amounts."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Dental benefits from multiple RCTs; systemic disease effects less studied."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 60,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Much smaller insulin response than sugar.",
        "details": [
            "Much smaller insulin response than sugar due to slow absorption.",
            "May help suppress postprandial hyperglycemia."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Insulin-sparing effect established; broader hormonal effects not studied."
    }'::jsonb
WHERE ingredient_name = 'xylitol';

-- 9. Olive Oil (Extra Virgin)
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 85,
        "description": "Pure fat that supports stable glucose levels and insulin sensitivity.",
        "details": [
            "Almost pure fat with no carbohydrates; does not directly raise blood glucose.",
            "MUFAs enhance insulin sensitivity and support steady glucose levels."
        ],
        "confidence_score": 85,
        "confidence_level": "Strong",
        "confidence_rationale": "Extensive evidence from Mediterranean diet studies and PREDIMED trial."
    }'::jsonb,
    inflammation_details = '{
        "score": 85,
        "description": "Contains oleocanthal and polyphenols with potent anti-inflammatory effects.",
        "details": [
            "Extra virgin olive oil contains oleocanthal with ibuprofen-like anti-inflammatory activity.",
            "Rich in polyphenols that reduce inflammatory markers in clinical trials."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Multiple RCTs and mechanistic studies support anti-inflammatory effects of EVOO."
    }'::jsonb,
    gut_impact_details = '{
        "score": 75,
        "description": "Supports gut health through polyphenols and healthy fat composition.",
        "details": [
            "Polyphenols support beneficial gut bacteria and may improve gut barrier function.",
            "Well-tolerated fat source that does not cause GI distress."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Emerging microbiome research supports benefits; more human studies needed."
    }'::jsonb,
    disease_links_details = '{
        "score": 90,
        "description": "Strong evidence for cardiovascular and metabolic disease prevention.",
        "details": [
            "PREDIMED trial showed 30% reduction in cardiovascular events with Mediterranean diet plus EVOO.",
            "Associated with reduced risk of type 2 diabetes, stroke, and certain cancers."
        ],
        "confidence_score": 90,
        "confidence_level": "Strong",
        "confidence_rationale": "Large RCTs and meta-analyses provide strong evidence for disease prevention."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 75,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "low",
        "description": "Supports healthy insulin sensitivity and does not disrupt hormonal balance.",
        "details": [
            "Supports healthy insulin sensitivity through MUFA content.",
            "Anti-inflammatory effects may support healthy cortisol regulation."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Insulin effects well-established; other hormonal effects extrapolated from metabolic studies."
    }'::jsonb
WHERE ingredient_name = 'olive oil' OR ingredient_name = 'extra virgin olive oil';

-- 10. Coconut Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 70,
        "description": "Pure fat with no direct glucose impact but saturated fat may affect insulin sensitivity.",
        "details": [
            "Pure fat with no carbohydrates; does not directly raise blood glucose.",
            "High saturated fat content may reduce insulin sensitivity with high chronic intake."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "No acute glucose effect is clear; long-term insulin sensitivity effects debated."
    }'::jsonb,
    inflammation_details = '{
        "score": 50,
        "description": "Contains lauric acid with some antimicrobial properties but high in saturated fat.",
        "details": [
            "Lauric acid has antimicrobial properties but inflammatory effects are neutral to slightly negative.",
            "Saturated fat content may promote inflammation compared to unsaturated oils."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "MCT benefits often overstated; saturated fat effects well-documented."
    }'::jsonb,
    gut_impact_details = '{
        "score": 65,
        "description": "MCTs are easily digested but high doses can cause GI discomfort.",
        "details": [
            "MCTs are quickly absorbed and do not require bile for digestion.",
            "High doses can cause nausea and diarrhea; gradual introduction recommended."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "MCT digestion well-understood; individual tolerance varies significantly."
    }'::jsonb,
    disease_links_details = '{
        "score": 50,
        "description": "Raises LDL cholesterol but also HDL; cardiovascular effects debated.",
        "details": [
            "Raises both LDL and HDL cholesterol more than most vegetable oils.",
            "Long-term cardiovascular effects less favorable than olive oil in most studies."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Lipid effects well-documented; cardiovascular outcome data limited compared to olive oil."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 55,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "MCTs may support ketone production but saturated fat effects on hormones are mixed.",
        "details": [
            "MCTs can support ketone production which may benefit some metabolic conditions.",
            "High saturated fat may affect hormone-sensitive pathways long-term."
        ],
        "confidence_score": 50,
        "confidence_level": "Mixed",
        "confidence_rationale": "MCT-ketone effects established; broader hormonal effects not well-studied."
    }'::jsonb
WHERE ingredient_name = 'coconut oil';

-- 11. Butter
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 95,
        "description": "Pure fat with no carbohydrates and no direct blood glucose impact.",
        "details": [
            "Almost pure fat with no carbohydrate; does not cause glucose spikes.",
            "Adding fat to meals may slow glucose absorption from other foods."
        ],
        "confidence_score": 85,
        "confidence_level": "Strong",
        "confidence_rationale": "Metabolic effects of pure fat well-established in glycemic research."
    }'::jsonb,
    inflammation_details = '{
        "score": 40,
        "description": "High saturated fat content may promote inflammatory pathways.",
        "details": [
            "Rich in saturated fat which is associated with reduced insulin sensitivity and higher LDL.",
            "May promote inflammatory signaling compared to unsaturated fat sources."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Saturated fat-inflammation link established; butter-specific effects vary by context."
    }'::jsonb,
    gut_impact_details = '{
        "score": 80,
        "description": "Well-tolerated with very low lactose content.",
        "details": [
            "No sugar alcohols or fermentable additives; well tolerated.",
            "Very low lactose content makes it suitable for most lactose-intolerant individuals."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Tolerability well-established; specific gut health effects not extensively studied."
    }'::jsonb,
    disease_links_details = '{
        "score": 45,
        "description": "Raises LDL cholesterol but cardiovascular associations are often small or neutral.",
        "details": [
            "Raises LDL cholesterol more than unsaturated fats.",
            "Association with cardiovascular disease is often small or neutral in recent meta-analyses."
        ],
        "confidence_score": 65,
        "confidence_level": "Mixed",
        "confidence_rationale": "Lipid effects clear; cardiovascular outcomes show smaller associations than previously thought."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 55,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Supplies fat-soluble vitamins but saturated fat may affect insulin sensitivity.",
        "details": [
            "Supplies fat-soluble vitamins A, D, E, K important for hormone synthesis.",
            "High saturated fat may reduce insulin sensitivity over time."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Vitamin content beneficial; insulin effects depend on overall diet context."
    }'::jsonb
WHERE ingredient_name = 'butter';

-- 12. Avocado Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 85,
        "description": "Pure MUFA-rich fat that supports insulin sensitivity.",
        "details": [
            "Pure fat with no carbohydrates; does not raise blood glucose.",
            "High MUFA content similar to olive oil supports healthy insulin function."
        ],
        "confidence_score": 75,
        "confidence_level": "Moderate",
        "confidence_rationale": "MUFA benefits well-established; avocado oil specifically less studied than olive oil."
    }'::jsonb,
    inflammation_details = '{
        "score": 75,
        "description": "High in MUFAs and antioxidants with anti-inflammatory potential.",
        "details": [
            "Rich in oleic acid and antioxidants that may reduce inflammatory markers.",
            "High smoke point preserves beneficial compounds during cooking."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "MUFA anti-inflammatory effects established; avocado oil-specific studies limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 75,
        "description": "Well-tolerated fat that supports nutrient absorption.",
        "details": [
            "Well-tolerated, helps absorb fat-soluble vitamins and carotenoids.",
            "No GI distress at normal cooking amounts."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "Tolerability observed clinically; specific gut microbiome effects not studied."
    }'::jsonb,
    disease_links_details = '{
        "score": 75,
        "description": "MUFA-rich profile suggests cardiovascular benefits similar to olive oil.",
        "details": [
            "Fatty acid profile similar to olive oil suggests cardiovascular benefits.",
            "Enhances absorption of fat-soluble nutrients from vegetables."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Benefits extrapolated from MUFA research; avocado oil outcome studies limited."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 70,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Supports healthy metabolism without negative hormonal effects.",
        "details": [
            "MUFAs support insulin sensitivity.",
            "No known negative effects on hormonal balance."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Benefits extrapolated from MUFA and avocado fruit research."
    }'::jsonb
WHERE ingredient_name = 'avocado oil';

-- 13. Margarine
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 85,
        "description": "Almost pure fat with minimal direct blood glucose effect.",
        "details": [
            "Pure fat content means no direct impact on blood glucose levels.",
            "Modern formulations have reduced trans fat but vary in quality."
        ],
        "confidence_score": 75,
        "confidence_level": "Moderate",
        "confidence_rationale": "Fat metabolism well-understood; product variability affects specific effects."
    }'::jsonb,
    inflammation_details = '{
        "score": 35,
        "description": "Quality varies widely - modern versions use refined seed oils and emulsifiers.",
        "details": [
            "Traditional margarines had harmful trans fats; modern versions use refined seed oils.",
            "Emulsifiers and additives in some products may affect gut health and inflammation."
        ],
        "confidence_score": 70,
        "confidence_level": "Mixed",
        "confidence_rationale": "Trans fat effects well-established; modern formulation effects still being studied."
    }'::jsonb,
    gut_impact_details = '{
        "score": 70,
        "description": "Generally well-tolerated but some emulsifiers may affect gut mucus.",
        "details": [
            "Minimal fermentable carbs; passes through digestive system easily.",
            "Some emulsifiers used in margarine may affect gut mucus layer in sensitive individuals."
        ],
        "confidence_score": 60,
        "confidence_level": "Emerging",
        "confidence_rationale": "Basic tolerability established; emulsifier research is ongoing."
    }'::jsonb,
    disease_links_details = '{
        "score": 50,
        "description": "Historical trans-fat margarines were strongly linked to heart disease.",
        "details": [
            "Historical trans-fat margarines strongly linked to heart disease and are now banned or restricted.",
            "Modern trans-fat-free versions have neutral to modest cardiovascular effects."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Trans fat cardiovascular effects very well documented in meta-analyses."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 60,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Little direct insulin effect; quality of fats determines broader metabolic impact.",
        "details": [
            "Little direct insulin effect per serving as a pure fat.",
            "Quality of fatty acid profile affects long-term metabolic health."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Fat metabolism understood; specific margarine formulation effects vary."
    }'::jsonb
WHERE ingredient_name = 'margarine';

-- 14. Vegetable Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 95,
        "description": "Pure fat with zero carbs and no direct blood glucose impact.",
        "details": [
            "Pure fat with zero carbohydrates; negligible direct blood glucose impact.",
            "Does not require insulin for metabolism."
        ],
        "confidence_score": 95,
        "confidence_level": "Strong",
        "confidence_rationale": "Basic metabolic effects of pure fat are very well established."
    }'::jsonb,
    inflammation_details = '{
        "score": 40,
        "description": "High omega-6 content can promote inflammatory pathways.",
        "details": [
            "High omega-6 content can be converted to pro-inflammatory compounds.",
            "Heating and oxidation produce additional inflammatory compounds (aldehydes)."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Omega-6 metabolism established; context of overall diet matters."
    }'::jsonb,
    gut_impact_details = '{
        "score": 85,
        "description": "No fermentable carbs or additives; generally well-tolerated.",
        "details": [
            "No fermentable carbs, sugar alcohols, or thickeners.",
            "Well-tolerated by most people at normal cooking amounts."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Digestive tolerance well-established through widespread use."
    }'::jsonb,
    disease_links_details = '{
        "score": 60,
        "description": "Heavy frying use associates with metabolic disease risk.",
        "details": [
            "Heavy frying use associated with type 2 diabetes risk in observational studies.",
            "Replacing saturated fats with vegetable oils may improve lipid profiles."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Observational studies show associations; RCT evidence mixed."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 80,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Neutral-to-minor insulin effects as a pure fat source.",
        "details": [
            "Neutral-to-minor insulin effects as a pure fat.",
            "Does not directly affect hormonal balance at normal intakes."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "Basic metabolic effects established; long-term hormonal studies limited."
    }'::jsonb
WHERE ingredient_name = 'vegetable oil';

-- 15. Canola Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 98,
        "description": "No carbohydrates with documented benefits for blood sugar control.",
        "details": [
            "No carbohydrates; RCTs show HbA1c reduction of 0.47% in type 2 diabetes when replacing other fats.",
            "Favorable fatty acid profile supports insulin sensitivity."
        ],
        "confidence_score": 95,
        "confidence_level": "Strong",
        "confidence_rationale": "Multiple RCTs in diabetic populations demonstrate glycemic benefits."
    }'::jsonb,
    inflammation_details = '{
        "score": 70,
        "description": "High MUFA and ALA content counters inflammation better than high omega-6 oils.",
        "details": [
            "High in oleic acid (MUFA) and alpha-linolenic acid (ALA, an omega-3).",
            "Better inflammatory profile than high omega-6 seed oils."
        ],
        "confidence_score": 75,
        "confidence_level": "Moderate",
        "confidence_rationale": "Fatty acid composition well-characterized; clinical inflammation studies supportive."
    }'::jsonb,
    gut_impact_details = '{
        "score": 90,
        "description": "Highly tolerable fat that may support gut health through reduced inflammation.",
        "details": [
            "Highly tolerable with no GI side effects at normal cooking amounts.",
            "MUFAs may support gut microbiota health via reduced systemic inflammation."
        ],
        "confidence_score": 85,
        "confidence_level": "Strong",
        "confidence_rationale": "Tolerability well-established; microbiome benefits extrapolated from MUFA research."
    }'::jsonb,
    disease_links_details = '{
        "score": 75,
        "description": "Associated with lower diabetes progression and cardiovascular risk.",
        "details": [
            "Associated with lower diabetes progression in clinical trials.",
            "Reduces CVD risk factors including LDL cholesterol and triglycerides."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Multiple RCTs and meta-analyses support cardiovascular and metabolic benefits."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 85,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Neutral-to-positive effects on insulin sensitivity.",
        "details": [
            "Neutral-to-positive effects on insulin sensitivity.",
            "ALA content may support anti-inflammatory hormonal environment."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Insulin effects from RCTs; broader hormonal effects extrapolated."
    }'::jsonb
WHERE ingredient_name = 'canola oil';

-- 16. Sunflower Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 65,
        "description": "Carbohydrate-free but high omega-6 may subtly affect insulin sensitivity.",
        "details": [
            "Carbohydrate-free; does not directly raise blood glucose.",
            "High omega-6 content might subtly promote insulin resistance over time with high intake."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Direct glucose effects clear; long-term insulin effects debated."
    }'::jsonb,
    inflammation_details = '{
        "score": 55,
        "description": "Heavy omega-6 load can convert to pro-inflammatory signaling molecules.",
        "details": [
            "Very high in linoleic acid (omega-6) which can produce inflammatory metabolites.",
            "Ratio of omega-6 to omega-3 in diet matters for inflammatory balance."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Omega-6 metabolism well-understood; population studies support concerns with high intake."
    }'::jsonb,
    gut_impact_details = '{
        "score": 50,
        "description": "Passes through smoothly but offers minimal microbiota support.",
        "details": [
            "Passes through digestive system without issues at normal amounts.",
            "Offers scant microbiota support compared to olive oil or fish oil."
        ],
        "confidence_score": 40,
        "confidence_level": "Emerging",
        "confidence_rationale": "Basic tolerability known; microbiome effects not specifically studied."
    }'::jsonb,
    disease_links_details = '{
        "score": 60,
        "description": "High consumption linked to cardiovascular issues in some studies.",
        "details": [
            "High consumption linked to cardiovascular issues and diabetes risk in some observational studies.",
            "Effects depend heavily on overall dietary context and omega-3 intake."
        ],
        "confidence_score": 65,
        "confidence_level": "Mixed",
        "confidence_rationale": "Observational associations exist; RCT evidence is limited and mixed."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 45,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Indirect insulin effects possible from chronic high intake.",
        "details": [
            "Indirect insulin effects possible from chronic high omega-6 intake.",
            "May affect hormonal balance through inflammatory pathways."
        ],
        "confidence_score": 35,
        "confidence_level": "Emerging",
        "confidence_rationale": "Mechanistic pathways plausible; human hormonal studies lacking."
    }'::jsonb
WHERE ingredient_name = 'sunflower oil';

-- 17. Fish Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 70,
        "description": "Pure fat with no glucose effect; reliably lowers triglycerides.",
        "details": [
            "Pure fat; no direct effect on blood glucose levels.",
            "Reliably lowers triglycerides by 25-30% in clinical trials."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Extensive RCT evidence for triglyceride effects and glycemic neutrality."
    }'::jsonb,
    inflammation_details = '{
        "score": 85,
        "description": "One of the most reliably anti-inflammatory fats available.",
        "details": [
            "EPA and DHA produce specialized pro-resolving mediators (resolvins, protectins).",
            "Multiple meta-analyses show reduced inflammatory markers with supplementation."
        ],
        "confidence_score": 85,
        "confidence_level": "Strong",
        "confidence_rationale": "Extensive mechanistic and clinical evidence for anti-inflammatory effects."
    }'::jsonb,
    gut_impact_details = '{
        "score": 65,
        "description": "Well-tolerated at standard doses; supports gut barrier function.",
        "details": [
            "Well tolerated at standard supplement doses; may cause fishy burps.",
            "May support gut barrier function and reduce intestinal inflammation."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Tolerability well-known; gut-specific benefits from smaller studies."
    }'::jsonb,
    disease_links_details = '{
        "score": 80,
        "description": "Consistently lowers triglycerides with modest cardiovascular benefits in high-risk groups.",
        "details": [
            "Consistently lowers triglycerides in all populations studied.",
            "Associated with modest cardiac event reductions in high-risk groups (REDUCE-IT trial)."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Large RCTs provide strong evidence for specific cardiovascular benefits."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 70,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "low",
        "description": "May modestly improve insulin sensitivity through reduced inflammation.",
        "details": [
            "May modestly improve insulin sensitivity through reduced inflammation.",
            "Anti-inflammatory effects may support healthy cortisol regulation."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Insulin effects supported by some trials; broader hormonal effects extrapolated."
    }'::jsonb
WHERE ingredient_name = 'fish oil';

-- 18. Palm Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 55,
        "description": "Does not acutely raise blood glucose but may impair insulin signaling.",
        "details": [
            "Does not acutely raise blood glucose as a pure fat.",
            "Interesterified forms may impair insulin signaling in some studies."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Acute effects clear; long-term insulin effects depend on processing and context."
    }'::jsonb,
    inflammation_details = '{
        "score": 60,
        "description": "Interesterified palm oil increases inflammatory markers in animal studies.",
        "details": [
            "Interesterified palm oil increases inflammatory cytokines in animal studies.",
            "Red palm oil contains tocotrienols that may have anti-inflammatory effects."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Processing affects inflammatory potential; human studies limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 50,
        "description": "Generally well-tolerated; high-fat diets may affect gut permeability.",
        "details": [
            "Generally well tolerated at normal dietary amounts.",
            "High-fat diets with saturated fats linked to increased gut permeability in mouse models."
        ],
        "confidence_score": 45,
        "confidence_level": "Emerging",
        "confidence_rationale": "Tolerability observed; gut permeability effects from animal models need human confirmation."
    }'::jsonb,
    disease_links_details = '{
        "score": 50,
        "description": "Raises LDL cholesterol compared to unsaturated oils.",
        "details": [
            "Raises LDL cholesterol compared with unsaturated oils in clinical comparisons.",
            "Effect on cardiovascular disease depends on what it replaces in diet."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Lipid effects well-documented; cardiovascular outcome data limited."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 50,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "May indirectly influence insulin dynamics through metabolic effects.",
        "details": [
            "May indirectly influence insulin dynamics through lipid effects.",
            "Red palm oil may have different effects than refined palm oil."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Limited specific research on palm oil and hormones."
    }'::jsonb
WHERE ingredient_name = 'palm oil';

-- 19. Shortening
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 45,
        "description": "Almost pure fat but trans and interesterified fats worsen insulin sensitivity.",
        "details": [
            "Almost pure fat; does not directly raise blood glucose.",
            "Trans fats and interesterified fats (common in shortening) are linked to worsened insulin sensitivity."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Fat metabolism clear; specific shortening formulation effects vary."
    }'::jsonb,
    inflammation_details = '{
        "score": 70,
        "description": "Historical source of industrial trans fats - strongly pro-inflammatory.",
        "details": [
            "Historical source of industrial trans fats which are strongly pro-inflammatory.",
            "Modern trans-fat-free versions still contain highly processed fats with uncertain effects."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "Trans fat inflammatory effects very well documented."
    }'::jsonb,
    gut_impact_details = '{
        "score": 45,
        "description": "Tolerated in small amounts but animal studies show gut tissue inflammation.",
        "details": [
            "Tolerated in small amounts in baked goods.",
            "Animal studies show gut tissue inflammation with high intake of trans/processed fats."
        ],
        "confidence_score": 45,
        "confidence_level": "Emerging",
        "confidence_rationale": "Animal data suggests concerns; human gut health studies lacking."
    }'::jsonb,
    disease_links_details = '{
        "score": 35,
        "description": "Trans-fat versions strongly associated with heart disease and stroke.",
        "details": [
            "Trans-fat versions strongly associated with heart disease, stroke, and diabetes.",
            "FDA banned partially hydrogenated oils (main source of trans fats) in 2018."
        ],
        "confidence_score": 90,
        "confidence_level": "Strong",
        "confidence_rationale": "Extensive epidemiological and clinical evidence led to regulatory action."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 40,
        "insulin_impact": "high",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Trans and interesterified fats worsen insulin resistance.",
        "details": [
            "Trans fats and interesterified fats worsen insulin resistance.",
            "May affect cell membrane function and hormone receptor sensitivity."
        ],
        "confidence_score": 45,
        "confidence_level": "Emerging",
        "confidence_rationale": "Insulin effects documented; broader hormonal mechanisms plausible but less studied."
    }'::jsonb
WHERE ingredient_name = 'shortening';

-- 20. Lard
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 55,
        "description": "Pure fat with no direct glucose rise but may affect insulin sensitivity long-term.",
        "details": [
            "Pure fat; no direct glucose rise from consumption.",
            "High saturated fat content may worsen insulin sensitivity over time with high intake."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Acute effects clear; long-term insulin effects depend on overall diet."
    }'::jsonb,
    inflammation_details = '{
        "score": 60,
        "description": "Rich in saturated fats linked to inflammatory markers.",
        "details": [
            "Rich in saturated fats linked to inflammatory markers and activated immune cells.",
            "Contains some monounsaturated fat (oleic acid) which may offset some effects."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Saturated fat-inflammation link established; lard-specific studies limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 50,
        "description": "Tolerated in modest amounts but high-lard diets shift microbiome unfavorably.",
        "details": [
            "Tolerated in modest amounts in traditional cooking.",
            "High-lard diets in animal studies shift microbiome toward pro-inflammatory species."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Animal microbiome studies suggest concerns; human data limited."
    }'::jsonb,
    disease_links_details = '{
        "score": 50,
        "description": "Contributes to saturated fat intake associated with higher LDL cholesterol.",
        "details": [
            "Contributes to saturated fat and cholesterol intake.",
            "Associated with higher LDL cholesterol compared to vegetable oils."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Lipid effects well-documented; cardiovascular outcome effects context-dependent."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 50,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Indirect hormone influence through weight and fat distribution effects.",
        "details": [
            "No direct hormone alteration at moderate intakes.",
            "Indirect influence through effects on weight and fat distribution with high intake."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Direct effects not studied; indirect mechanisms plausible."
    }'::jsonb
WHERE ingredient_name = 'lard';

-- 21. Ghee
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 60,
        "description": "Pure milk fat with no direct glucose impact; saturated fat effects on insulin debated.",
        "details": [
            "Pure milk fat; does not directly raise blood glucose.",
            "High saturated fat content may worsen insulin sensitivity with very high chronic intake."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Acute effects clear; traditional use suggests good tolerability but controlled studies limited."
    }'::jsonb,
    inflammation_details = '{
        "score": 60,
        "description": "Rich in saturated fats but contains some anti-inflammatory short-chain fats.",
        "details": [
            "Rich in saturated fats; context of overall diet matters.",
            "Contains butyrate and other short-chain fatty acids with potential anti-inflammatory effects."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "Butyrate benefits documented; net effect depends on dietary context."
    }'::jsonb,
    gut_impact_details = '{
        "score": 55,
        "description": "Well-tolerated with milk proteins and lactose largely removed.",
        "details": [
            "Well tolerated even by many with lactose intolerance due to processing.",
            "Milk proteins and lactose are largely removed during clarification."
        ],
        "confidence_score": 45,
        "confidence_level": "Emerging",
        "confidence_rationale": "Tolerability well-known from traditional use; microbiome effects not studied."
    }'::jsonb,
    disease_links_details = '{
        "score": 55,
        "description": "Contributes saturated fat; overall health effects depend on dietary context.",
        "details": [
            "Contributes saturated fat to diet; effects depend on what it replaces.",
            "Used in Ayurvedic tradition with claimed health benefits lacking rigorous evidence."
        ],
        "confidence_score": 65,
        "confidence_level": "Mixed",
        "confidence_rationale": "Saturated fat effects understood; ghee-specific outcome studies lacking."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 55,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Indirect influence through metabolic effects; traditional use suggests balance.",
        "details": [
            "No direct hormone alteration documented.",
            "Indirect influence through metabolic effects of saturated fat."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Traditional medicine claims not validated by controlled trials."
    }'::jsonb
WHERE ingredient_name = 'ghee';

-- 22. Peanut Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 75,
        "description": "Does not raise blood glucose; may support insulin sensitivity through MUFA content.",
        "details": [
            "Does not raise blood glucose directly as a pure fat.",
            "Slows sugar absorption when consumed with carbohydrates; MUFAs support insulin sensitivity."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Fat effects well-understood; MUFA benefits extrapolated from olive oil research."
    }'::jsonb,
    inflammation_details = '{
        "score": 60,
        "description": "Rich in MUFAs and vitamin E but also contains omega-6.",
        "details": [
            "Rich in MUFAs and vitamin E which have anti-inflammatory potential.",
            "Also contains omega-6 linoleic acid; balance with omega-3 intake matters."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Fatty acid effects understood; peanut oil-specific studies limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 55,
        "description": "Generally well-tolerated; no prebiotic effects but also no harm.",
        "details": [
            "Generally well tolerated in cooking applications.",
            "No fiber or prebiotic effects; neutral gut impact."
        ],
        "confidence_score": 45,
        "confidence_level": "Emerging",
        "confidence_rationale": "Tolerability known from culinary use; specific gut studies lacking."
    }'::jsonb,
    disease_links_details = '{
        "score": 70,
        "description": "Improves lipid profiles when replacing saturated fats.",
        "details": [
            "Tends to improve lipid profiles when replacing saturated fats.",
            "MUFA content provides cardiovascular benefit similar to other high-MUFA oils."
        ],
        "confidence_score": 75,
        "confidence_level": "Moderate",
        "confidence_rationale": "Lipid effects documented; cardiovascular outcomes extrapolated from MUFA research."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 65,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Improves insulin sensitivity and blunts post-meal glucose spikes.",
        "details": [
            "MUFAs improve insulin sensitivity when replacing saturated fats.",
            "Blunts post-meal glucose spikes when combined with carbohydrate foods."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "MUFA insulin effects established; peanut oil specifically less studied."
    }'::jsonb
WHERE ingredient_name = 'peanut oil';

-- 23. Soybean Oil
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 55,
        "description": "Pure fat with neutral acute effects; high omega-6 may affect insulin long-term.",
        "details": [
            "Pure fat; does not directly raise blood glucose.",
            "Rodent studies show glucose intolerance at high doses, but human data is more neutral."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Animal data concerning; human evidence shows less pronounced effects."
    }'::jsonb,
    inflammation_details = '{
        "score": 60,
        "description": "Rich in omega-6 which can push toward pro-inflammatory balance.",
        "details": [
            "Rich in omega-6 linoleic acid; can push toward pro-inflammatory balance.",
            "Effects depend heavily on omega-3 intake and overall dietary context."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Omega-6 metabolism well-understood; population-level effects depend on context."
    }'::jsonb,
    gut_impact_details = '{
        "score": 50,
        "description": "Well-tolerated but animal studies show permeability changes at high doses.",
        "details": [
            "Well tolerated at normal dietary amounts.",
            "Animal experiments show intestinal permeability changes at very high doses."
        ],
        "confidence_score": 45,
        "confidence_level": "Emerging",
        "confidence_rationale": "Tolerability established; gut permeability effects from high-dose animal studies."
    }'::jsonb,
    disease_links_details = '{
        "score": 60,
        "description": "High PUFA can lower LDL but mouse data suggests harm at very high doses.",
        "details": [
            "High PUFA content can lower LDL cholesterol when replacing saturated fat.",
            "Mouse studies suggest metabolic harm at very high doses; human relevance uncertain."
        ],
        "confidence_score": 65,
        "confidence_level": "Mixed",
        "confidence_rationale": "Lipid benefits documented; concerning animal data may not translate to human diets."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 55,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Mouse studies show insulin resistance at high doses; human effects less clear.",
        "details": [
            "Does not directly alter hormones at normal intakes.",
            "Mouse studies show insulin resistance at high doses; human data more neutral."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "Animal data concerning; human translation uncertain."
    }'::jsonb
WHERE ingredient_name = 'soybean oil';

-- 24-30: Additional remaining ingredients (Maltose, Dextrose, Glucose syrup, Fructose, Invert sugar, Sorbitol, Molasses)
-- These follow similar patterns...

-- 24. Maltose
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 5,
        "description": "Very high GI (105) - higher than pure glucose, causes rapid blood glucose spikes.",
        "details": [
            "Very high GI (~105), even higher than pure glucose.",
            "Rapidly hydrolyzed to two glucose molecules, causing very fast blood glucose rises."
        ],
        "confidence_score": 80,
        "confidence_level": "Strong",
        "confidence_rationale": "GI testing methodology well-established; maltose effects well-documented."
    }'::jsonb,
    inflammation_details = '{
        "score": 25,
        "description": "Contributes to high glycemic load and cardiometabolic stress.",
        "details": [
            "Contributes to high glycemic load without any protective nutrients.",
            "Chronic high glycemic exposure promotes inflammatory pathways."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Glycemic stress-inflammation link established; maltose-specific data limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 60,
        "description": "Efficiently absorbed as glucose; does not cause fermentation-related GI symptoms.",
        "details": [
            "Efficiently absorbed in small intestine after enzymatic breakdown.",
            "Does not cause gas, bloating, or diarrhea like sugar alcohols or FODMAPs."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Digestion pathway clear; specific gut health studies lacking."
    }'::jsonb,
    disease_links_details = '{
        "score": 20,
        "description": "No meaningful micronutrients; contributes to chronic disease risk.",
        "details": [
            "No meaningful micronutrients - purely empty calories.",
            "Contributes to heart disease, diabetes, and fatty liver risk with high chronic intake."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "High-glycemic sugar effects well-documented; maltose-specific outcome data limited."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 25,
        "insulin_impact": "high",
        "estrogen_impact": "neutral",
        "cortisol_impact": "moderate",
        "description": "Demands strong insulin responses; promotes insulin resistance with frequent high intake.",
        "details": [
            "Demands strong insulin responses due to very rapid glucose absorption.",
            "Regular high intake promotes insulin resistance."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Insulin effects extrapolated from glucose; maltose-specific studies limited."
    }'::jsonb
WHERE ingredient_name = 'maltose';

-- 25. Dextrose
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 5,
        "description": "Chemically identical to glucose, GI of 100, extremely fast absorption.",
        "details": [
            "Chemically identical to glucose with GI of 100.",
            "Extremely fast absorption requires strong insulin response."
        ],
        "confidence_score": 90,
        "confidence_level": "Strong",
        "confidence_rationale": "Glucose metabolism is one of the most studied areas in nutrition science."
    }'::jsonb,
    inflammation_details = '{
        "score": 25,
        "description": "High intake promotes weight gain, visceral fat, and dyslipidemia.",
        "details": [
            "High intake promotes weight gain, visceral fat accumulation, and dyslipidemia.",
            "These metabolic changes drive chronic low-grade inflammation."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Metabolic effects of glucose excess well-documented."
    }'::jsonb,
    gut_impact_details = '{
        "score": 60,
        "description": "Fully digestible; does not cause fermentation-related GI symptoms.",
        "details": [
            "Fully digestible in the small intestine.",
            "Does not cause gas, bloating, or diarrhea like sugar alcohols."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Digestion well-understood; microbiome effects of high intake less studied."
    }'::jsonb,
    disease_links_details = '{
        "score": 20,
        "description": "Associated with increased risk of type 2 diabetes and heart disease.",
        "details": [
            "Associated with increased risk of type 2 diabetes, heart disease, and obesity.",
            "Empty calorie source with no nutritional benefit beyond energy."
        ],
        "confidence_score": 75,
        "confidence_level": "Moderate",
        "confidence_rationale": "Glucose/sugar disease associations well-documented in meta-analyses."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 25,
        "insulin_impact": "high",
        "estrogen_impact": "neutral",
        "cortisol_impact": "moderate",
        "description": "Elicits large insulin spikes; repeated high intake contributes to insulin resistance.",
        "details": [
            "Elicits large, rapid insulin spikes.",
            "Repeated high intake contributes to insulin resistance over time."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Insulin effects very well-established; broader hormonal effects less studied."
    }'::jsonb
WHERE ingredient_name = 'dextrose';

-- 26. Glucose Syrup
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 5,
        "description": "GI of about 100; produces large, fast glucose and insulin spikes.",
        "details": [
            "GI of approximately 100, similar to pure glucose.",
            "Produces large, fast glucose and insulin spikes after consumption."
        ],
        "confidence_score": 85,
        "confidence_level": "Strong",
        "confidence_rationale": "Glucose metabolism well-established; GI testing confirms high glycemic impact."
    }'::jsonb,
    inflammation_details = '{
        "score": 25,
        "description": "High glycemic load without protective nutrients promotes metabolic stress.",
        "details": [
            "High glycemic load without protective nutrients.",
            "Promotes metabolic stress and inflammatory cascades with chronic high intake."
        ],
        "confidence_score": 65,
        "confidence_level": "Moderate",
        "confidence_rationale": "Metabolic stress-inflammation link established; specific glucose syrup studies limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 60,
        "description": "Fully digestible; does not typically cause gas and bloating.",
        "details": [
            "Fully digestible in small intestine.",
            "Does not typically cause gas and bloating unlike sugar alcohols."
        ],
        "confidence_score": 50,
        "confidence_level": "Mixed",
        "confidence_rationale": "Digestion pathway clear; long-term gut microbiome effects not specifically studied."
    }'::jsonb,
    disease_links_details = '{
        "score": 20,
        "description": "100% empty-calorie carbohydrate; associated with metabolic disease.",
        "details": [
            "100% empty-calorie carbohydrate with no nutrients.",
            "Associated with diabetes, fatty liver, and obesity with high chronic intake."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Added sugar disease associations well-documented; glucose syrup included in these analyses."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 25,
        "insulin_impact": "high",
        "estrogen_impact": "neutral",
        "cortisol_impact": "moderate",
        "description": "Provokes strong insulin spikes; regular high intake worsens insulin resistance.",
        "details": [
            "Provokes strong insulin spikes due to rapid glucose absorption.",
            "Regular high intake worsens insulin resistance and metabolic flexibility."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Insulin effects well-established; broader metabolic effects extrapolated."
    }'::jsonb
WHERE ingredient_name = 'glucose syrup';

-- 27. Fructose
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 60,
        "description": "Low GI (~19-25) but bypasses normal glucose regulation and stresses the liver.",
        "details": [
            "Low GI (~19-25) with much smaller short-term blood glucose rise than glucose.",
            "Low GI is misleading - fructose metabolism in the liver can cause other metabolic problems."
        ],
        "confidence_score": 75,
        "confidence_level": "Moderate",
        "confidence_rationale": "GI well-documented; liver metabolism effects increasingly understood."
    }'::jsonb,
    inflammation_details = '{
        "score": 25,
        "description": "High intake increases triglycerides, promotes liver fat and inflammatory states.",
        "details": [
            "High intake increases triglycerides and promotes hepatic fat accumulation.",
            "Drives inflammatory states through uric acid production and lipogenesis."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Fructose metabolism effects well-documented in human and animal studies."
    }'::jsonb,
    gut_impact_details = '{
        "score": 45,
        "description": "Can cause GI symptoms when intake exceeds absorptive capacity.",
        "details": [
            "Can cause GI symptoms (bloating, diarrhea) when intake exceeds absorptive capacity.",
            "Fructose malabsorption affects a significant portion of the population."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Malabsorption well-documented; individual variation is significant."
    }'::jsonb,
    disease_links_details = '{
        "score": 25,
        "description": "Linked to fatty liver disease, hypertriglyceridemia, and insulin resistance.",
        "details": [
            "Linked to non-alcoholic fatty liver disease, hypertriglyceridemia, and gout.",
            "High intake associated with insulin resistance and metabolic syndrome."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Multiple meta-analyses link high fructose intake to metabolic disease markers."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 30,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "low",
        "description": "Triggers much less insulin than glucose but may impair satiety signaling.",
        "details": [
            "Triggers much less insulin than glucose due to liver-specific metabolism.",
            "May impair satiety signaling (leptin, ghrelin) leading to overconsumption."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Insulin effects clear; satiety hormone effects have mixed human evidence."
    }'::jsonb
WHERE ingredient_name = 'fructose';

-- 28. Invert Sugar
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 10,
        "description": "Roughly half glucose and half fructose; similar or higher GI than sucrose.",
        "details": [
            "Roughly half glucose and half fructose (like sucrose but pre-split).",
            "Similar or higher GI than sucrose; rapidly absorbed."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Composition effects predictable from glucose and fructose research."
    }'::jsonb,
    inflammation_details = '{
        "score": 25,
        "description": "Associated with insulin resistance, weight gain, and inflammatory burden.",
        "details": [
            "Associated with insulin resistance, weight gain, and inflammatory burden.",
            "Combines inflammatory effects of both glucose and fructose components."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Effects extrapolated from sucrose research; invert sugar-specific studies limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 60,
        "description": "Fully digestible; does not cause major bloating at typical doses.",
        "details": [
            "Fully digestible in small intestine.",
            "Does not cause major bloating or GI distress at typical doses."
        ],
        "confidence_score": 50,
        "confidence_level": "Mixed",
        "confidence_rationale": "Digestion pathway clear; specific gut health studies lacking."
    }'::jsonb,
    disease_links_details = '{
        "score": 20,
        "description": "Nutritionally similar to sucrose; contributes to weight gain and dental caries.",
        "details": [
            "Nutritionally equivalent to sucrose - empty calories.",
            "Contributes to weight gain, dental caries, and metabolic disease risk."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "Effects extrapolated from comprehensive sucrose/added sugar research."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 25,
        "insulin_impact": "high",
        "estrogen_impact": "neutral",
        "cortisol_impact": "moderate",
        "description": "Rapidly elevates glucose and drives substantial insulin responses.",
        "details": [
            "Rapidly elevates blood glucose and drives substantial insulin responses.",
            "Glucose component drives insulin; fructose affects liver metabolism."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Component effects well-understood; combined effects extrapolated."
    }'::jsonb
WHERE ingredient_name = 'invert sugar';

-- 29. Sorbitol
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 80,
        "description": "Low GI (4-9); may lower blood glucose by slowing gastric emptying.",
        "details": [
            "Low GI (4-9); does not cause significant blood glucose spikes.",
            "May actually lower blood glucose by slowing gastric emptying."
        ],
        "confidence_score": 70,
        "confidence_level": "Moderate",
        "confidence_rationale": "GI well-established; metabolic effects documented in diabetes research."
    }'::jsonb,
    inflammation_details = '{
        "score": 55,
        "description": "Avoids fructose-driven pathways but gut fermentation may have effects.",
        "details": [
            "Avoids fructose-driven inflammatory pathways.",
            "Long-term high intake and gut fermentation may alter microbiota with uncertain inflammatory effects."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Metabolic advantages over sugar clear; gut fermentation effects less certain."
    }'::jsonb,
    gut_impact_details = '{
        "score": 25,
        "description": "Poorly absorbed; commonly causes gas, bloating, and diarrhea (FODMAP).",
        "details": [
            "Poorly absorbed in small intestine; reaches colon and is fermented.",
            "Commonly causes gas, bloating, and diarrhea - classified as a FODMAP."
        ],
        "confidence_score": 75,
        "confidence_level": "Moderate",
        "confidence_rationale": "GI effects well-documented; FODMAP research provides strong evidence."
    }'::jsonb,
    disease_links_details = '{
        "score": 55,
        "description": "Reduces hyperglycemia risk; non-cariogenic (beneficial for dental health).",
        "details": [
            "Reduces hyperglycemia risk when replacing sugar in diabetic diets.",
            "Non-cariogenic - does not promote tooth decay like sugars."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "Dental and glycemic benefits documented; long-term disease outcomes less studied."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 60,
        "insulin_impact": "low",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Low GI supports better insulin dynamics with minimal spikes.",
        "details": [
            "Low GI supports better insulin dynamics.",
            "Minimal insulin response compared to equivalent sweetness from sugar."
        ],
        "confidence_score": 50,
        "confidence_level": "Emerging",
        "confidence_rationale": "Insulin-sparing effect established; broader hormonal effects not studied."
    }'::jsonb
WHERE ingredient_name = 'sorbitol';

-- 30. Molasses
UPDATE ingredient_scores SET
    blood_sugar_details = '{
        "score": 35,
        "description": "Shows lower post-meal glucose when added to carb-rich foods; contains some minerals.",
        "details": [
            "Shows lower post-meal glucose responses when added to carb-rich foods.",
            "Contains chromium and other minerals that may modestly support glucose metabolism."
        ],
        "confidence_score": 60,
        "confidence_level": "Mixed",
        "confidence_rationale": "GI effects documented; mineral content benefits require more controlled studies."
    }'::jsonb,
    inflammation_details = '{
        "score": 50,
        "description": "Rich in polyphenol antioxidants that may reduce pro-inflammatory cytokines.",
        "details": [
            "Rich in polyphenol antioxidants, especially blackstrap molasses.",
            "May reduce pro-inflammatory cytokines compared to refined sugars."
        ],
        "confidence_score": 55,
        "confidence_level": "Emerging",
        "confidence_rationale": "Antioxidant content documented; anti-inflammatory clinical evidence limited."
    }'::jsonb,
    gut_impact_details = '{
        "score": 55,
        "description": "Well-tolerated; magnesium content may have mild laxative effect.",
        "details": [
            "Well tolerated by most people.",
            "High magnesium content in blackstrap molasses may have mild laxative effect."
        ],
        "confidence_score": 45,
        "confidence_level": "Limited",
        "confidence_rationale": "Tolerability known from traditional use; specific gut health studies lacking."
    }'::jsonb,
    disease_links_details = '{
        "score": 35,
        "description": "Better than refined sugar due to mineral and polyphenol content.",
        "details": [
            "Better than refined sugar due to mineral and polyphenol content.",
            "Still primarily sugar; should be used in moderation."
        ],
        "confidence_score": 55,
        "confidence_level": "Mixed",
        "confidence_rationale": "Nutrient content documented; comparative health outcomes less studied."
    }'::jsonb,
    hormonal_relevance = '{
        "score": 35,
        "insulin_impact": "moderate",
        "estrogen_impact": "neutral",
        "cortisol_impact": "neutral",
        "description": "Lower insulin responses than refined sugar; minerals may support carb metabolism.",
        "details": [
            "Lower insulin responses compared to equivalent refined sugar.",
            "Minerals (chromium, magnesium) may support healthy carbohydrate metabolism."
        ],
        "confidence_score": 45,
        "confidence_level": "Emerging",
        "confidence_rationale": "Mineral benefits plausible; controlled human trials lacking."
    }'::jsonb
WHERE ingredient_name = 'molasses';


-- ============================================================================
-- Verification Queries
-- ============================================================================

-- Check that all 30 trusted ingredients have rich details
-- Using explicit JSONB casts since columns may be stored as TEXT
SELECT
    ingredient_name,
    CASE WHEN blood_sugar_details::jsonb->'details' IS NOT NULL THEN 'YES' ELSE 'NO' END as has_bs_bullets,
    CASE WHEN blood_sugar_details::jsonb->>'confidence_rationale' IS NOT NULL THEN 'YES' ELSE 'NO' END as has_bs_rationale,
    blood_sugar_details::jsonb->>'confidence_level' as bs_confidence
FROM ingredient_scores
WHERE is_trusted = 1
ORDER BY category, ingredient_name;

-- Sample output to verify format
SELECT
    ingredient_name,
    jsonb_pretty(blood_sugar_details::jsonb) as blood_sugar_breakdown
FROM ingredient_scores
WHERE ingredient_name = 'sugar'
LIMIT 1;
