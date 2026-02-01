#!/usr/bin/env python3
"""
Import 30 Fully Researched Ingredients into Aurea Database

This script imports the comprehensive health research data for 30 ingredients
(15 Sweeteners + 15 Fats & Oils) from the user's research.

Usage:
    # For local SQLite development:
    python scripts/import_30_ingredients.py

    # For production PostgreSQL:
    DATABASE_URL="postgresql://..." python scripts/import_30_ingredients.py

Features:
    - Imports all health category scores (blood sugar, inflammation, gut, disease, hormonal)
    - Includes detailed descriptions for each category
    - Stores source URLs
    - Marks all as "trusted" (is_trusted=1)
    - Uses UPSERT to update existing records
"""

import os
import sys
import json
import uuid
from datetime import datetime
from pathlib import Path

# Add parent to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

# Load environment if available
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

# Get database URL
DATABASE_URL = os.environ.get('DATABASE_URL', 'sqlite:///aurea.db')

# The 30 fully researched ingredients with complete data
INGREDIENTS = [
    # ==================== SWEETENERS (15) ====================
    {
        "name": "Sugar (white, brown)",
        "category": "Sweeteners",
        "blood_sugar_impact": 10,
        "blood_sugar_details": {
            "score": 10,
            "confidence": 90,
            "confidence_level": "high",
            "description": "Sugar is rapidly digested and absorbed, causing sharp rises in blood glucose and insulin, especially in liquid form or when eaten alone. High‑glycemic, low‑fiber sugar exposures are strongly linked with greater risk of type 2 diabetes and cardiometabolic problems when intake is high and frequent."
        },
        "inflammation_potential": 75,  # Inverted: 100 - 25 = 75 (higher = more inflammatory in DB)
        "inflammation_details": {
            "score": 25,  # Original score (higher = less inflammatory)
            "confidence": 70,
            "confidence_level": "medium",
            "description": "High sugar intake can shift cytokine balance toward pro‑inflammatory mediators and is associated with chronic low‑grade inflammation in both animal and human data."
        },
        "gut_impact": 40,
        "gut_impact_details": {
            "score": 40,
            "confidence": 65,
            "confidence_level": "mixed",
            "description": "Added sugars can alter gut microbiota diversity, deplete short‑chain‑fatty‑acid–producing bacteria, and impair barrier integrity in experimental models."
        },
        "disease_links": 20,
        "disease_links_details": {
            "score": 20,
            "confidence": 80,
            "confidence_level": "high",
            "description": "An umbrella review of 73 meta‑analyses found that higher dietary sugar is associated with increased risk of obesity, type 2 diabetes, metabolic syndrome, fatty liver, gout, and cardiovascular disease."
        },
        "hormonal_relevance": {
            "score": 30,
            "confidence": 60,
            "confidence_level": "mixed",
            "description": "Sugar strongly stimulates insulin, and chronic high intake can drive insulin resistance, disrupting broader hormonal regulation."
        },
        "overall_score": 22,
        "evidence_confidence": "medium",
        "sources": [
            "https://nutritionsource.hsph.harvard.edu/carbohydrates/carbohydrates-and-blood-sugar/",
            "https://pubmed.ncbi.nlm.nih.gov/37019448/",
            "https://www.bmj.com/content/381/bmj-2022-071609"
        ]
    },
    {
        "name": "High-fructose corn syrup",
        "category": "Sweeteners",
        "blood_sugar_impact": 10,
        "blood_sugar_details": {"score": 10, "confidence": 90, "confidence_level": "high", "description": "HFCS raises blood sugar and insulin rapidly, similar to sucrose, especially in drinks."},
        "inflammation_potential": 80,
        "inflammation_details": {"score": 20, "confidence": 70, "confidence_level": "medium", "description": "HFCS intake is associated with elevated CRP and higher inflammatory signaling at similar doses to sucrose."},
        "gut_impact": 40,
        "gut_impact_details": {"score": 40, "confidence": 60, "confidence_level": "mixed", "description": "HFCS promotes metabolic changes accompanied by adverse gut–liver axis function shifts."},
        "disease_links": 20,
        "disease_links_details": {"score": 20, "confidence": 80, "confidence_level": "high", "description": "Linked to weight gain, fatty liver disease, type 2 diabetes, and cardiovascular disease."},
        "hormonal_relevance": {"score": 30, "confidence": 60, "confidence_level": "mixed", "description": "Drives insulin resistance and impaired insulin secretion, disturbs leptin and appetite signaling."},
        "overall_score": 21,
        "evidence_confidence": "medium",
        "sources": ["https://www.healthline.com/nutrition/why-high-fructose-corn-syrup-is-bad", "https://pmc.ncbi.nlm.nih.gov/articles/PMC8150719/"]
    },
    {
        "name": "Honey",
        "category": "Sweeteners",
        "blood_sugar_impact": 25,
        "blood_sugar_details": {"score": 25, "confidence": 60, "confidence_level": "mixed", "description": "Honey raises blood sugar but shows lower glucose and insulin responses versus equal amounts of other sugar solutions."},
        "inflammation_potential": 55,
        "inflammation_details": {"score": 45, "confidence": 60, "confidence_level": "mixed", "description": "Contains polyphenols and antioxidants that may reduce oxidative stress and inflammatory markers."},
        "gut_impact": 60,
        "gut_impact_details": {"score": 60, "confidence": 55, "confidence_level": "emerging", "description": "Has prebiotic properties supporting beneficial gut bacteria."},
        "disease_links": 40,
        "disease_links_details": {"score": 40, "confidence": 60, "confidence_level": "mixed", "description": "Can improve cardiometabolic markers when replacing refined sugar."},
        "hormonal_relevance": {"score": 40, "confidence": 45, "confidence_level": "emerging", "description": "May show modest insulin resistance improvements when replacing refined sugars."},
        "overall_score": 40,
        "evidence_confidence": "medium",
        "sources": ["https://www.nature.com/articles/s41387-025-00403-9", "https://pmc.ncbi.nlm.nih.gov/articles/PMC10346535/"]
    },
    {
        "name": "Maple syrup",
        "category": "Sweeteners",
        "blood_sugar_impact": 30,
        "blood_sugar_details": {"score": 30, "confidence": 65, "confidence_level": "mixed", "description": "GI around 55, lower than white sugar, meaning somewhat slower spikes."},
        "inflammation_potential": 55,
        "inflammation_details": {"score": 45, "confidence": 50, "confidence_level": "emerging", "description": "Contains over 60 polyphenols and antioxidants including quebecol."},
        "gut_impact": 60,
        "gut_impact_details": {"score": 60, "confidence": 45, "confidence_level": "limited", "description": "Well tolerated, no sugar alcohols or emulsifiers."},
        "disease_links": 40,
        "disease_links_details": {"score": 40, "confidence": 55, "confidence_level": "mixed", "description": "May modestly improve blood pressure when replacing refined sugar."},
        "hormonal_relevance": {"score": 40, "confidence": 40, "confidence_level": "emerging", "description": "Lower GI may reduce sharpness of insulin spikes."},
        "overall_score": 41,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC10469071/"]
    },
    {
        "name": "Agave nectar",
        "category": "Sweeteners",
        "blood_sugar_impact": 35,
        "blood_sugar_details": {"score": 35, "confidence": 70, "confidence_level": "medium", "description": "Very low GI (~10-19) due to ~80-85% fructose content."},
        "inflammation_potential": 75,
        "inflammation_details": {"score": 25, "confidence": 65, "confidence_level": "mixed", "description": "High fructose overloads liver, promotes lipogenesis, raises triglycerides."},
        "gut_impact": 45,
        "gut_impact_details": {"score": 45, "confidence": 55, "confidence_level": "emerging", "description": "Can cause GI symptoms in fructose malabsorption."},
        "disease_links": 25,
        "disease_links_details": {"score": 25, "confidence": 70, "confidence_level": "medium", "description": "Linked to fatty liver disease, higher triglycerides, metabolic syndrome."},
        "hormonal_relevance": {"score": 30, "confidence": 50, "confidence_level": "emerging", "description": "Despite low GI, chronic high fructose worsens insulin resistance."},
        "overall_score": 32,
        "evidence_confidence": "medium",
        "sources": ["https://www.healthline.com/nutrition/agave-nectar-is-even-worse-than-sugar"]
    },
    {
        "name": "Molasses",
        "category": "Sweeteners",
        "blood_sugar_impact": 35,
        "blood_sugar_details": {"score": 35, "confidence": 60, "confidence_level": "mixed", "description": "Shows lower post-meal glucose when added to carb-rich foods."},
        "inflammation_potential": 50,
        "inflammation_details": {"score": 50, "confidence": 55, "confidence_level": "emerging", "description": "Rich in polyphenol antioxidants, can reduce pro-inflammatory cytokines."},
        "gut_impact": 55,
        "gut_impact_details": {"score": 55, "confidence": 45, "confidence_level": "limited", "description": "Well tolerated, magnesium content may aid as mild laxative."},
        "disease_links": 35,
        "disease_links_details": {"score": 35, "confidence": 55, "confidence_level": "mixed", "description": "Better than refined sugar due to mineral and polyphenol content."},
        "hormonal_relevance": {"score": 35, "confidence": 45, "confidence_level": "emerging", "description": "Lower insulin responses; minerals may support carb metabolism."},
        "overall_score": 41,
        "evidence_confidence": "medium",
        "sources": ["https://www.healthline.com/health/food-nutrition/benefits-blackstrap-molasses"]
    },
    {
        "name": "Stevia",
        "category": "Sweeteners",
        "blood_sugar_impact": 90,
        "blood_sugar_details": {"score": 90, "confidence": 75, "confidence_level": "medium", "description": "Non-caloric, no glycemic index, does not raise blood glucose or insulin."},
        "inflammation_potential": 30,
        "inflammation_details": {"score": 70, "confidence": 55, "confidence_level": "emerging", "description": "Has antioxidant and anti-inflammatory effects in experimental studies."},
        "gut_impact": 70,
        "gut_impact_details": {"score": 70, "confidence": 55, "confidence_level": "emerging", "description": "Not fermentable, does not cause bloating or diarrhea like sugar alcohols."},
        "disease_links": 80,
        "disease_links_details": {"score": 80, "confidence": 70, "confidence_level": "medium", "description": "Helps reduce added sugar and calorie intake; no carcinogenic or genotoxic issues."},
        "hormonal_relevance": {"score": 70, "confidence": 55, "confidence_level": "emerging", "description": "Does not require insulin; may improve glycemic control."},
        "overall_score": 79,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC9028423/", "https://www.efsa.europa.eu/en/press/news/ans100414"]
    },
    {
        "name": "Erythritol",
        "category": "Sweeteners",
        "blood_sugar_impact": 95,
        "blood_sugar_details": {"score": 95, "confidence": 80, "confidence_level": "high", "description": "GI of 0, insulinemic index of ~2, does not raise blood glucose or insulin."},
        "inflammation_potential": 40,
        "inflammation_details": {"score": 60, "confidence": 55, "confidence_level": "emerging", "description": "Largely absorbed and excreted unchanged; some cardiovascular concerns in observational studies."},
        "gut_impact": 60,
        "gut_impact_details": {"score": 60, "confidence": 65, "confidence_level": "medium", "description": "Better tolerated than other sugar alcohols; higher doses can cause GI symptoms."},
        "disease_links": 55,
        "disease_links_details": {"score": 55, "confidence": 50, "confidence_level": "mixed", "description": "Helps reduce cardiometabolic risk; recent cardiovascular association signal needs more study."},
        "hormonal_relevance": {"score": 65, "confidence": 55, "confidence_level": "emerging", "description": "No direct insulin requirement; triggers gut hormones like GLP-1."},
        "overall_score": 70,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC4995183/", "https://health.clevelandclinic.org/erythritol"]
    },
    {
        "name": "Xylitol",
        "category": "Sweeteners",
        "blood_sugar_impact": 80,
        "blood_sugar_details": {"score": 80, "confidence": 70, "confidence_level": "medium", "description": "Very low GI (7-13), causes only small rise in blood glucose."},
        "inflammation_potential": 45,
        "inflammation_details": {"score": 55, "confidence": 50, "confidence_level": "mixed", "description": "Avoids fructose-driven inflammatory pathways; some cardiovascular concerns."},
        "gut_impact": 35,
        "gut_impact_details": {"score": 35, "confidence": 70, "confidence_level": "medium", "description": "Commonly causes gas, bloating, and loose stools; many tolerate only under 10-15g."},
        "disease_links": 55,
        "disease_links_details": {"score": 55, "confidence": 65, "confidence_level": "medium", "description": "Strongly beneficial for dental health; toxic to dogs."},
        "hormonal_relevance": {"score": 60, "confidence": 50, "confidence_level": "emerging", "description": "Much smaller insulin response than sugar; may suppress postprandial hyperglycemia."},
        "overall_score": 60,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC3128359/", "https://www.healthline.com/nutrition/xylitol-101"]
    },
    {
        "name": "Maltose",
        "category": "Sweeteners",
        "blood_sugar_impact": 5,
        "blood_sugar_details": {"score": 5, "confidence": 80, "confidence_level": "high", "description": "Very high GI (~105), higher than pure glucose, causes rapid blood glucose rises."},
        "inflammation_potential": 75,
        "inflammation_details": {"score": 25, "confidence": 60, "confidence_level": "mixed", "description": "Contributes to high glycemic load and cardiometabolic stress."},
        "gut_impact": 60,
        "gut_impact_details": {"score": 60, "confidence": 55, "confidence_level": "limited", "description": "Efficiently absorbed as glucose, does not cause gas/diarrhea like sugar alcohols."},
        "disease_links": 20,
        "disease_links_details": {"score": 20, "confidence": 70, "confidence_level": "medium", "description": "No meaningful micronutrients; contributes to heart disease, diabetes, fatty liver risk."},
        "hormonal_relevance": {"score": 25, "confidence": 55, "confidence_level": "mixed", "description": "Demands strong insulin responses; promotes insulin resistance with frequent high intake."},
        "overall_score": 23,
        "evidence_confidence": "medium",
        "sources": ["https://www.healthline.com/nutrition/maltose"]
    },
    {
        "name": "Dextrose",
        "category": "Sweeteners",
        "blood_sugar_impact": 5,
        "blood_sugar_details": {"score": 5, "confidence": 90, "confidence_level": "high", "description": "Chemically identical to glucose, GI of 100, extremely fast absorption."},
        "inflammation_potential": 75,
        "inflammation_details": {"score": 25, "confidence": 70, "confidence_level": "medium", "description": "High intake promotes weight gain, visceral fat, and dyslipidemia."},
        "gut_impact": 60,
        "gut_impact_details": {"score": 60, "confidence": 55, "confidence_level": "limited", "description": "Fully digestible, does not cause gas/bloating like sugar alcohols."},
        "disease_links": 20,
        "disease_links_details": {"score": 20, "confidence": 75, "confidence_level": "medium", "description": "Associated with increased risk of type 2 diabetes, heart disease."},
        "hormonal_relevance": {"score": 25, "confidence": 60, "confidence_level": "mixed", "description": "Elicits large insulin spikes; repeated high intake contributes to insulin resistance."},
        "overall_score": 23,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC6627922/", "https://glycemic-index.net/glucose-dextrose/"]
    },
    {
        "name": "Glucose syrup",
        "category": "Sweeteners",
        "blood_sugar_impact": 5,
        "blood_sugar_details": {"score": 5, "confidence": 85, "confidence_level": "high", "description": "GI of about 100, produces large, fast glucose and insulin spikes."},
        "inflammation_potential": 75,
        "inflammation_details": {"score": 25, "confidence": 65, "confidence_level": "medium", "description": "High glycemic load with no protective nutrients promotes metabolic stress."},
        "gut_impact": 60,
        "gut_impact_details": {"score": 60, "confidence": 50, "confidence_level": "limited", "description": "Fully digestible, does not typically cause gas and bloating."},
        "disease_links": 20,
        "disease_links_details": {"score": 20, "confidence": 70, "confidence_level": "medium", "description": "100% empty-calorie carbohydrate; associated with diabetes, fatty liver, obesity."},
        "hormonal_relevance": {"score": 25, "confidence": 55, "confidence_level": "mixed", "description": "Provokes strong insulin spikes; regular high intake worsens insulin resistance."},
        "overall_score": 23,
        "evidence_confidence": "medium",
        "sources": ["https://glycemic-index.net/glucose-syrup/", "https://www.healthline.com/nutrition/glucose-syrup"]
    },
    {
        "name": "Fructose",
        "category": "Sweeteners",
        "blood_sugar_impact": 60,
        "blood_sugar_details": {"score": 60, "confidence": 75, "confidence_level": "medium", "description": "Low GI (~19-25), much smaller short-term blood glucose rise than glucose."},
        "inflammation_potential": 75,
        "inflammation_details": {"score": 25, "confidence": 70, "confidence_level": "medium", "description": "High intake increases triglycerides, promotes liver fat and inflammatory states."},
        "gut_impact": 45,
        "gut_impact_details": {"score": 45, "confidence": 60, "confidence_level": "mixed", "description": "Can cause GI symptoms when intake exceeds absorptive capacity."},
        "disease_links": 25,
        "disease_links_details": {"score": 25, "confidence": 70, "confidence_level": "medium", "description": "Linked to fatty liver disease, hypertriglyceridemia, insulin resistance."},
        "hormonal_relevance": {"score": 30, "confidence": 60, "confidence_level": "mixed", "description": "Triggers much less insulin than glucose; may impair satiety signaling."},
        "overall_score": 39,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC2714385/", "https://journals.physiology.org/doi/full/10.1152/physrev.00019.2009"]
    },
    {
        "name": "Invert sugar",
        "category": "Sweeteners",
        "blood_sugar_impact": 10,
        "blood_sugar_details": {"score": 10, "confidence": 70, "confidence_level": "medium", "description": "Roughly half glucose and half fructose; similar or higher GI than sucrose."},
        "inflammation_potential": 75,
        "inflammation_details": {"score": 25, "confidence": 60, "confidence_level": "mixed", "description": "Associated with insulin resistance, weight gain, and inflammatory burden."},
        "gut_impact": 60,
        "gut_impact_details": {"score": 60, "confidence": 50, "confidence_level": "limited", "description": "Fully digestible, does not cause major bloating at typical doses."},
        "disease_links": 20,
        "disease_links_details": {"score": 20, "confidence": 70, "confidence_level": "medium", "description": "Nutritionally similar to sucrose; contributes to weight gain and dental caries."},
        "hormonal_relevance": {"score": 25, "confidence": 55, "confidence_level": "mixed", "description": "Rapidly elevates glucose, drives substantial insulin responses."},
        "overall_score": 24,
        "evidence_confidence": "medium",
        "sources": ["https://www.verywellhealth.com/invert-sugar-11713334"]
    },
    {
        "name": "Sorbitol",
        "category": "Sweeteners",
        "blood_sugar_impact": 80,
        "blood_sugar_details": {"score": 80, "confidence": 70, "confidence_level": "medium", "description": "Low GI (4-9), may lower blood glucose by slowing gastric emptying."},
        "inflammation_potential": 45,
        "inflammation_details": {"score": 55, "confidence": 55, "confidence_level": "mixed", "description": "Avoids fructose-driven pathways; long-term high intake may alter gut microbiota."},
        "gut_impact": 25,
        "gut_impact_details": {"score": 25, "confidence": 75, "confidence_level": "high", "description": "Poorly absorbed, commonly causes gas, bloating, and diarrhea (FODMAP)."},
        "disease_links": 55,
        "disease_links_details": {"score": 55, "confidence": 60, "confidence_level": "medium", "description": "Reduces hyperglycemia risk; non-cariogenic (dental benefits)."},
        "hormonal_relevance": {"score": 60, "confidence": 50, "confidence_level": "emerging", "description": "Low GI supports better insulin dynamics."},
        "overall_score": 59,
        "evidence_confidence": "medium",
        "sources": ["https://www.healthline.com/nutrition/sugar-alcohols-good-or-bad"]
    },
    # ==================== FATS & OILS (15) ====================
    {
        "name": "Butter",
        "category": "Fats & Oils",
        "blood_sugar_impact": 95,
        "blood_sugar_details": {"score": 95, "confidence": 85, "confidence_level": "high", "description": "Almost pure fat with no carbohydrate; does not cause glucose spikes."},
        "inflammation_potential": 60,
        "inflammation_details": {"score": 40, "confidence": 65, "confidence_level": "mixed", "description": "Rich in saturated fat; associated with reduced insulin sensitivity and higher LDL."},
        "gut_impact": 80,
        "gut_impact_details": {"score": 80, "confidence": 60, "confidence_level": "mixed", "description": "No sugar alcohols or fermentable additives; well tolerated, very low lactose."},
        "disease_links": 45,
        "disease_links_details": {"score": 45, "confidence": 65, "confidence_level": "mixed", "description": "Raises LDL cholesterol; association with CVD often small or neutral."},
        "hormonal_relevance": {"score": 55, "confidence": 50, "confidence_level": "emerging", "description": "Supplies fat-soluble vitamins; high saturated fat may reduce insulin sensitivity over time."},
        "overall_score": 65,
        "evidence_confidence": "medium",
        "sources": ["https://blog.ultrahuman.com/blog/butter-up-for-better-blood-sugar-how-this-fat-can-improve-glucose-metabolism/"]
    },
    {
        "name": "Margarine",
        "category": "Fats & Oils",
        "blood_sugar_impact": 85,
        "blood_sugar_details": {"score": 85, "confidence": 75, "confidence_level": "medium", "description": "Almost pure fat with minimal direct blood glucose effect."},
        "inflammation_potential": 65,
        "inflammation_details": {"score": 35, "confidence": 70, "confidence_level": "mixed", "description": "Traditional margarines had trans fats; modern versions use refined seed oils and emulsifiers."},
        "gut_impact": 70,
        "gut_impact_details": {"score": 70, "confidence": 60, "confidence_level": "emerging", "description": "Minimal fermentable carbs; some emulsifiers may affect gut mucus."},
        "disease_links": 50,
        "disease_links_details": {"score": 50, "confidence": 80, "confidence_level": "high", "description": "Historical trans-fat margarines strongly linked to heart disease."},
        "hormonal_relevance": {"score": 60, "confidence": 50, "confidence_level": "emerging", "description": "Little direct insulin effect per serving."},
        "overall_score": 60,
        "evidence_confidence": "medium",
        "sources": ["https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/expert-answers/butter-vs-margarine/faq-20058152"]
    },
    {
        "name": "Vegetable oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 95,
        "blood_sugar_details": {"score": 95, "confidence": 95, "confidence_level": "high", "description": "Pure fat with zero carbs; negligible direct blood glucose impact."},
        "inflammation_potential": 60,
        "inflammation_details": {"score": 40, "confidence": 65, "confidence_level": "mixed", "description": "High omega-6; can produce pro-inflammatory compounds when heated or oxidized."},
        "gut_impact": 85,
        "gut_impact_details": {"score": 85, "confidence": 80, "confidence_level": "high", "description": "No fermentable carbs, sugar alcohols, or thickeners; well-tolerated."},
        "disease_links": 60,
        "disease_links_details": {"score": 60, "confidence": 70, "confidence_level": "mixed", "description": "Heavy frying use associates with type 2 diabetes risk."},
        "hormonal_relevance": {"score": 80, "confidence": 55, "confidence_level": "emerging", "description": "Neutral-to-minor insulin effects."},
        "overall_score": 72,
        "evidence_confidence": "medium",
        "sources": ["https://med.stanford.edu/news/insights/2025/03/5-things-to-know-about-the-effects-of-seed-oils-on-health.html"]
    },
    {
        "name": "Canola oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 98,
        "blood_sugar_details": {"score": 98, "confidence": 95, "confidence_level": "high", "description": "No carbohydrates; RCTs show HbA1c reduction of 0.47% in type 2 diabetes."},
        "inflammation_potential": 30,
        "inflammation_details": {"score": 70, "confidence": 75, "confidence_level": "medium", "description": "High MUFA and ALA counters inflammation better than high omega-6 oils."},
        "gut_impact": 90,
        "gut_impact_details": {"score": 90, "confidence": 85, "confidence_level": "high", "description": "Highly tolerable; MUFAs may support microbiota via reduced inflammation."},
        "disease_links": 75,
        "disease_links_details": {"score": 75, "confidence": 80, "confidence_level": "high", "description": "Associated with lower diabetes progression and CVD risk."},
        "hormonal_relevance": {"score": 85, "confidence": 65, "confidence_level": "mixed", "description": "Neutral-to-positive on insulin sensitivity."},
        "overall_score": 82,
        "evidence_confidence": "high",
        "sources": ["https://pubmed.ncbi.nlm.nih.gov/24929428/", "https://diabetesjournals.org/care/article/37/7/1806/37782/"]
    },
    {
        "name": "Sunflower oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 65,
        "blood_sugar_details": {"score": 65, "confidence": 60, "confidence_level": "mixed", "description": "Carbohydrate-free; high omega-6 might subtly promote insulin resistance over time."},
        "inflammation_potential": 45,
        "inflammation_details": {"score": 55, "confidence": 70, "confidence_level": "high", "description": "Heavy omega-6 load can convert to pro-inflammatory signaling molecules."},
        "gut_impact": 50,
        "gut_impact_details": {"score": 50, "confidence": 40, "confidence_level": "emerging", "description": "Passes smoothly but offers scant microbiota support."},
        "disease_links": 60,
        "disease_links_details": {"score": 60, "confidence": 65, "confidence_level": "mixed", "description": "High consumption linked to cardiovascular issues and diabetes risk."},
        "hormonal_relevance": {"score": 45, "confidence": 35, "confidence_level": "emerging", "description": "Indirect insulin effects from chronic high intake."},
        "overall_score": 59,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC3441046/"]
    },
    {
        "name": "Olive oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 85,
        "blood_sugar_details": {"score": 85, "confidence": 85, "confidence_level": "high", "description": "Supports steady glucose levels; MUFAs enhance insulin sensitivity."},
        "inflammation_potential": 10,
        "inflammation_details": {"score": 90, "confidence": 90, "confidence_level": "high", "description": "Reliably lowers inflammation through oleic acid and polyphenols like oleuropein."},
        "gut_impact": 80,
        "gut_impact_details": {"score": 80, "confidence": 75, "confidence_level": "medium", "description": "Fosters healthier gut environment; polyphenols act as prebiotics."},
        "disease_links": 88,
        "disease_links_details": {"score": 88, "confidence": 90, "confidence_level": "high", "description": "Tied to lower risks of type 2 diabetes, CVD, and certain cancers."},
        "hormonal_relevance": {"score": 80, "confidence": 75, "confidence_level": "medium", "description": "Boosts insulin action; polyphenols fine-tune insulin signaling."},
        "overall_score": 85,
        "evidence_confidence": "high",
        "sources": ["https://diabetesjournals.org/care/article/39/4/518/29062/Extra-Virgin-Olive-Oil-Reduces-Glycemic-Response"]
    },
    {
        "name": "Coconut oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 55,
        "blood_sugar_details": {"score": 55, "confidence": 60, "confidence_level": "mixed", "description": "Does not raise blood glucose directly; may worsen insulin resistance with high intake."},
        "inflammation_potential": 40,
        "inflammation_details": {"score": 60, "confidence": 55, "confidence_level": "emerging", "description": "Complex: can promote LDL but some models show reduced adipose inflammation."},
        "gut_impact": 55,
        "gut_impact_details": {"score": 55, "confidence": 40, "confidence_level": "emerging", "description": "MCTs rapidly absorbed; large doses can cause loose stools."},
        "disease_links": 45,
        "disease_links_details": {"score": 45, "confidence": 75, "confidence_level": "medium", "description": "Raises LDL cholesterol; heart groups advise against treating as 'healthy' fat."},
        "hormonal_relevance": {"score": 50, "confidence": 50, "confidence_level": "emerging", "description": "Indirect influence through insulin sensitivity and lipid metabolism."},
        "overall_score": 53,
        "evidence_confidence": "medium",
        "sources": ["https://jamanetwork.com/journals/jama/article-abstract/2764429"]
    },
    {
        "name": "Palm oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 55,
        "blood_sugar_details": {"score": 55, "confidence": 55, "confidence_level": "mixed", "description": "Doesn't acutely raise blood glucose; interesterified forms may impair insulin signaling."},
        "inflammation_potential": 40,
        "inflammation_details": {"score": 60, "confidence": 60, "confidence_level": "mixed", "description": "Interesterified palm oil increases inflammatory cytokines in animal studies."},
        "gut_impact": 50,
        "gut_impact_details": {"score": 50, "confidence": 45, "confidence_level": "emerging", "description": "Generally well tolerated; high-fat diets linked to increased gut permeability in mice."},
        "disease_links": 50,
        "disease_links_details": {"score": 50, "confidence": 70, "confidence_level": "medium", "description": "Raises LDL cholesterol compared with unsaturated oils."},
        "hormonal_relevance": {"score": 50, "confidence": 50, "confidence_level": "emerging", "description": "May indirectly influence insulin dynamics."},
        "overall_score": 54,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC5831100/"]
    },
    {
        "name": "Shortening",
        "category": "Fats & Oils",
        "blood_sugar_impact": 45,
        "blood_sugar_details": {"score": 45, "confidence": 55, "confidence_level": "mixed", "description": "Almost pure fat; trans and interesterified fats linked to worsened insulin sensitivity."},
        "inflammation_potential": 30,
        "inflammation_details": {"score": 70, "confidence": 80, "confidence_level": "high", "description": "Historical source of industrial trans fats; strongly pro-inflammatory."},
        "gut_impact": 45,
        "gut_impact_details": {"score": 45, "confidence": 45, "confidence_level": "emerging", "description": "Tolerated in small amounts; animal studies show gut tissue inflammation."},
        "disease_links": 35,
        "disease_links_details": {"score": 35, "confidence": 90, "confidence_level": "high", "description": "Trans-fat versions strongly associated with heart disease, stroke."},
        "hormonal_relevance": {"score": 40, "confidence": 45, "confidence_level": "emerging", "description": "Trans/interesterified fats worsen insulin resistance."},
        "overall_score": 47,
        "evidence_confidence": "high",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC1483173/"]
    },
    {
        "name": "Lard",
        "category": "Fats & Oils",
        "blood_sugar_impact": 55,
        "blood_sugar_details": {"score": 55, "confidence": 60, "confidence_level": "mixed", "description": "Pure fat, no direct glucose rise; high saturated fat may worsen insulin sensitivity over time."},
        "inflammation_potential": 40,
        "inflammation_details": {"score": 60, "confidence": 65, "confidence_level": "mixed", "description": "Rich in saturated fats; linked to inflammatory markers and activated immune cells."},
        "gut_impact": 50,
        "gut_impact_details": {"score": 50, "confidence": 50, "confidence_level": "emerging", "description": "Tolerated in modest amounts; high-lard diets shift microbiome toward pro-inflammatory species."},
        "disease_links": 50,
        "disease_links_details": {"score": 50, "confidence": 70, "confidence_level": "medium", "description": "Contributes to saturated fat and cholesterol intake; associated with higher LDL."},
        "hormonal_relevance": {"score": 50, "confidence": 50, "confidence_level": "emerging", "description": "No direct hormone alteration; indirect influence through weight and fat distribution."},
        "overall_score": 53,
        "evidence_confidence": "medium",
        "sources": ["https://pmc.ncbi.nlm.nih.gov/articles/PMC3215354/"]
    },
    {
        "name": "Ghee",
        "category": "Fats & Oils",
        "blood_sugar_impact": 60,
        "blood_sugar_details": {"score": 60, "confidence": 60, "confidence_level": "mixed", "description": "Pure milk fat; does not directly raise blood glucose but may worsen insulin sensitivity with high intake."},
        "inflammation_potential": 40,
        "inflammation_details": {"score": 60, "confidence": 55, "confidence_level": "emerging", "description": "Rich in saturated fats; contains some anti-inflammatory short-chain fats."},
        "gut_impact": 55,
        "gut_impact_details": {"score": 55, "confidence": 45, "confidence_level": "emerging", "description": "Well tolerated; milk proteins and lactose largely removed."},
        "disease_links": 55,
        "disease_links_details": {"score": 55, "confidence": 65, "confidence_level": "mixed", "description": "Contributes saturated fat; context of overall diet matters."},
        "hormonal_relevance": {"score": 55, "confidence": 50, "confidence_level": "emerging", "description": "No direct hormone alteration; indirect influence through metabolic effects."},
        "overall_score": 57,
        "evidence_confidence": "medium",
        "sources": ["https://health.clevelandclinic.org/better-than-butter-separating-ghee-fact-from-fiction"]
    },
    {
        "name": "Peanut oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 75,
        "blood_sugar_details": {"score": 75, "confidence": 70, "confidence_level": "mixed", "description": "Doesn't raise blood glucose directly; slows sugar absorption; supports insulin sensitivity."},
        "inflammation_potential": 40,
        "inflammation_details": {"score": 60, "confidence": 60, "confidence_level": "mixed", "description": "Rich in MUFAs and vitamin E; also contains omega-6 linoleic acid."},
        "gut_impact": 55,
        "gut_impact_details": {"score": 55, "confidence": 45, "confidence_level": "emerging", "description": "Generally well tolerated; no fiber or prebiotic effects."},
        "disease_links": 70,
        "disease_links_details": {"score": 70, "confidence": 75, "confidence_level": "medium", "description": "Tends to improve lipid profiles when replacing saturated fats."},
        "hormonal_relevance": {"score": 65, "confidence": 60, "confidence_level": "mixed", "description": "Improves insulin sensitivity and blunts post-meal glucose spikes."},
        "overall_score": 67,
        "evidence_confidence": "medium",
        "sources": ["https://www.healthline.com/nutrition/is-peanut-oil-healthy"]
    },
    {
        "name": "Soybean oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 55,
        "blood_sugar_details": {"score": 55, "confidence": 60, "confidence_level": "mixed", "description": "Pure fat; rodent studies show glucose intolerance at high doses, but human data more neutral."},
        "inflammation_potential": 40,
        "inflammation_details": {"score": 60, "confidence": 65, "confidence_level": "mixed", "description": "Rich in omega-6; can push toward pro-inflammatory balance without adequate omega-3."},
        "gut_impact": 50,
        "gut_impact_details": {"score": 50, "confidence": 45, "confidence_level": "emerging", "description": "Well tolerated; animal experiments show intestinal permeability changes at high doses."},
        "disease_links": 60,
        "disease_links_details": {"score": 60, "confidence": 65, "confidence_level": "mixed", "description": "High PUFA can lower LDL; mouse data suggests harm at high doses."},
        "hormonal_relevance": {"score": 55, "confidence": 55, "confidence_level": "emerging", "description": "Doesn't directly alter hormones; mouse studies show insulin resistance at high doses."},
        "overall_score": 56,
        "evidence_confidence": "medium",
        "sources": ["https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0132672"]
    },
    {
        "name": "Fish oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 70,
        "blood_sugar_details": {"score": 70, "confidence": 80, "confidence_level": "high", "description": "Pure fat; no glucose effect; reliably lowers triglycerides by 25-30%."},
        "inflammation_potential": 15,
        "inflammation_details": {"score": 85, "confidence": 85, "confidence_level": "high", "description": "One of the most reliably anti-inflammatory fats; EPA/DHA produce resolvins and protectins."},
        "gut_impact": 65,
        "gut_impact_details": {"score": 65, "confidence": 60, "confidence_level": "mixed", "description": "Well tolerated at standard doses; may cause fishy burps; supports gut barrier."},
        "disease_links": 80,
        "disease_links_details": {"score": 80, "confidence": 80, "confidence_level": "high", "description": "Consistently lowers triglycerides; associated with modest cardiac event reductions in high-risk groups."},
        "hormonal_relevance": {"score": 70, "confidence": 65, "confidence_level": "mixed", "description": "May modestly improve insulin sensitivity through reduced inflammation."},
        "overall_score": 75,
        "evidence_confidence": "high",
        "sources": ["https://scitechdaily.com/diabetes-breakthrough-fish-oil-may-reverse-insulin-resistance/"]
    },
    {
        "name": "Avocado oil",
        "category": "Fats & Oils",
        "blood_sugar_impact": 75,
        "blood_sugar_details": {"score": 75, "confidence": 70, "confidence_level": "mixed", "description": "Doesn't raise blood glucose; improves post-meal insulin when replacing butter."},
        "inflammation_potential": 20,
        "inflammation_details": {"score": 80, "confidence": 75, "confidence_level": "medium", "description": "Rich in MUFAs and antioxidants; dampens oxidative stress and inflammation."},
        "gut_impact": 65,
        "gut_impact_details": {"score": 65, "confidence": 55, "confidence_level": "emerging", "description": "Easy on digestion; enhances carotenoid absorption from vegetables."},
        "disease_links": 80,
        "disease_links_details": {"score": 80, "confidence": 75, "confidence_level": "medium", "description": "Lowers LDL and triglycerides; benefits blood pressure and liver function."},
        "hormonal_relevance": {"score": 70, "confidence": 60, "confidence_level": "mixed", "description": "Improves lipid profiles and insulin sensitivity; creates less 'stressed' hormonal environment."},
        "overall_score": 75,
        "evidence_confidence": "medium",
        "sources": ["https://health.clevelandclinic.org/is-avocado-oil-good-for-you", "https://www.healthline.com/nutrition/9-avocado-oil-benefits"]
    },
]


def import_ingredients():
    """Import all 30 ingredients into the database."""
    from sqlalchemy import create_engine, text
    from sqlalchemy.orm import sessionmaker

    engine = create_engine(DATABASE_URL)

    # Check if we're using SQLite or PostgreSQL
    is_sqlite = 'sqlite' in DATABASE_URL.lower()

    with engine.connect() as conn:
        now = datetime.now().isoformat()

        for ing in INGREDIENTS:
            # Prepare JSON fields
            hormonal_relevance = json.dumps(ing['hormonal_relevance'])
            blood_sugar_details = json.dumps(ing['blood_sugar_details'])
            inflammation_details = json.dumps(ing['inflammation_details'])
            gut_impact_details = json.dumps(ing['gut_impact_details'])
            disease_links_details = json.dumps(ing['disease_links_details'])
            sources = json.dumps([{"url": url, "type": "research"} for url in ing['sources']])

            if is_sqlite:
                # SQLite uses INSERT OR REPLACE
                # Normalize ingredient name to lowercase for consistent API querying
                conn.execute(text("""
                    INSERT OR REPLACE INTO ingredient_scores
                    (id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
                     gut_impact, disease_links, overall_score, evidence_confidence,
                     hormonal_relevance, blood_sugar_details, inflammation_details,
                     gut_impact_details, disease_links_details, sources, is_trusted,
                     cached_at, updated_at)
                    VALUES
                    (:id, :name, :category, :blood_sugar, :inflammation,
                     :gut, :disease, :overall, :confidence,
                     :hormonal, :blood_details, :inflammation_details,
                     :gut_details, :disease_details, :sources, 1,
                     :cached_at, :updated_at)
                """), {
                    'id': str(uuid.uuid4()),
                    'name': ing['name'].lower(),
                    'category': ing['category'],
                    'blood_sugar': ing['blood_sugar_impact'],
                    'inflammation': ing['inflammation_potential'],
                    'gut': ing['gut_impact'],
                    'disease': ing['disease_links'],
                    'overall': ing['overall_score'],
                    'confidence': ing['evidence_confidence'],
                    'hormonal': hormonal_relevance,
                    'blood_details': blood_sugar_details,
                    'inflammation_details': inflammation_details,
                    'gut_details': gut_impact_details,
                    'disease_details': disease_links_details,
                    'sources': sources,
                    'cached_at': now,
                    'updated_at': now
                })
            else:
                # PostgreSQL uses ON CONFLICT
                conn.execute(text("""
                    INSERT INTO ingredient_scores
                    (id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
                     gut_impact, disease_links, overall_score, evidence_confidence,
                     hormonal_relevance, blood_sugar_details, inflammation_details,
                     gut_impact_details, disease_links_details, sources, is_trusted,
                     cached_at, updated_at)
                    VALUES
                    (gen_random_uuid(), :name, :category, :blood_sugar, :inflammation,
                     :gut, :disease, :overall, :confidence,
                     :hormonal::jsonb, :blood_details::jsonb, :inflammation_details::jsonb,
                     :gut_details::jsonb, :disease_details::jsonb, :sources::jsonb, 1,
                     :cached_at, :updated_at)
                    ON CONFLICT (ingredient_name) DO UPDATE SET
                        category = EXCLUDED.category,
                        blood_sugar_impact = EXCLUDED.blood_sugar_impact,
                        inflammation_potential = EXCLUDED.inflammation_potential,
                        gut_impact = EXCLUDED.gut_impact,
                        disease_links = EXCLUDED.disease_links,
                        overall_score = EXCLUDED.overall_score,
                        evidence_confidence = EXCLUDED.evidence_confidence,
                        hormonal_relevance = EXCLUDED.hormonal_relevance,
                        blood_sugar_details = EXCLUDED.blood_sugar_details,
                        inflammation_details = EXCLUDED.inflammation_details,
                        gut_impact_details = EXCLUDED.gut_impact_details,
                        disease_links_details = EXCLUDED.disease_links_details,
                        sources = EXCLUDED.sources,
                        is_trusted = EXCLUDED.is_trusted,
                        updated_at = EXCLUDED.updated_at
                """), {
                    'name': ing['name'].lower(),
                    'category': ing['category'],
                    'blood_sugar': ing['blood_sugar_impact'],
                    'inflammation': ing['inflammation_potential'],
                    'gut': ing['gut_impact'],
                    'disease': ing['disease_links'],
                    'overall': ing['overall_score'],
                    'confidence': ing['evidence_confidence'],
                    'hormonal': hormonal_relevance,
                    'blood_details': blood_sugar_details,
                    'inflammation_details': inflammation_details,
                    'gut_details': gut_impact_details,
                    'disease_details': disease_links_details,
                    'sources': sources,
                    'cached_at': now,
                    'updated_at': now
                })

        conn.commit()

    print(f"✅ Successfully imported {len(INGREDIENTS)} ingredients")
    print(f"   - 15 Sweeteners")
    print(f"   - 15 Fats & Oils")
    print(f"   - All marked as trusted (is_trusted=1)")


if __name__ == "__main__":
    import_ingredients()
