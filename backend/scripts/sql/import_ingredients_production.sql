-- Aurea Ingredients Database - VALIDATED Production Import
-- Generated: 2026-02-01T20:46:09.847594
-- Total: 510 ingredients (30 Fully Trusted, 480 Less Trusted)
-- All data scientifically validated

BEGIN;

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sugar (white, brown)',
    'Sweeteners',
    10,
    25,
    40,
    20,
    22,
    '{"score": 30, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "research"}, {"name": "Stanford Med", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "BMJ", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'high-fructose corn syrup',
    'Sweeteners',
    10,
    20,
    40,
    20,
    21,
    '{"score": 30, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Princeton Research", "type": "research"}, {"name": "Healthline", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "Frontiers in Nutrition", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'honey',
    'Sweeteners',
    25,
    45,
    60,
    40,
    40,
    '{"score": 40, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Nature", "type": "research"}, {"name": "Cardiometabolic Health", "type": "research"}, {"name": "Healthline", "type": "research"}, {"name": "Mayo Clinic", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maple syrup',
    'Sweeteners',
    30,
    45,
    60,
    40,
    41,
    '{"score": 40, "confidence": 40, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Canadian Maple", "type": "research"}, {"name": "Diabetes Care Community", "type": "research"}, {"name": "Indiana Maple Syrup", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'agave nectar',
    'Sweeteners',
    35,
    25,
    45,
    25,
    32,
    '{"score": 30, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "research"}, {"name": "WebMD", "type": "research"}, {"name": "Medical News Today", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'molasses',
    'Sweeteners',
    35,
    50,
    55,
    35,
    41,
    '{"score": 35, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "research"}, {"name": "Dr. Axe", "type": "research"}, {"name": "Taylor & Francis", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'stevia',
    'Sweeteners',
    90,
    70,
    70,
    80,
    79,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "EFSA", "type": "research"}, {"name": "Sweeteners.org", "type": "research"}, {"name": "ScienceDirect", "type": "research"}, {"name": "WebMD", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'erythritol',
    'Sweeteners',
    95,
    60,
    60,
    55,
    70,
    '{"score": 65, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "Health.com", "type": "research"}, {"name": "Cleveland Clinic", "type": "research"}, {"name": "WebMD", "type": "research"}, {"name": "Nutrition Facts", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'xylitol',
    'Sweeteners',
    80,
    55,
    35,
    55,
    60,
    '{"score": 60, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "Sage Journals", "type": "research"}, {"name": "VeryWell Health", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maltose',
    'Sweeteners',
    5,
    25,
    60,
    20,
    23,
    '{"score": 25, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "MedicineNet", "type": "research"}, {"name": "Blue Circle", "type": "research"}, {"name": "Dr. Axe", "type": "research"}, {"name": "Healthline", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dextrose',
    'Sweeteners',
    5,
    25,
    60,
    20,
    23,
    '{"score": 25, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "Glycemic Index", "type": "research"}, {"name": "WebMD", "type": "research"}, {"name": "Cleveland Clinic", "type": "research"}, {"name": "Medical News Today", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'glucose syrup',
    'Sweeteners',
    5,
    25,
    60,
    20,
    23,
    '{"score": 25, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Glycemic Index", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "Ragus", "type": "research"}, {"name": "Healthline", "type": "research"}, {"name": "Academic OUP", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fructose',
    'Sweeteners',
    60,
    25,
    45,
    25,
    39,
    '{"score": 30, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "Physiology.org", "type": "research"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Glycemic Index", "type": "research"}, {"name": "Penn Medicine", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'invert sugar',
    'Sweeteners',
    10,
    25,
    60,
    20,
    24,
    '{"score": 25, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "VeryWell Health", "type": "research"}, {"name": "Fitelo", "type": "research"}, {"name": "Vively", "type": "research"}, {"name": "Oreate AI", "type": "research"}, {"name": "Webstaurant Store", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sorbitol',
    'Sweeteners',
    80,
    55,
    25,
    55,
    59,
    '{"score": 60, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "ScienceDirect", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "Elchemy", "type": "research"}, {"name": "Hydratis", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'butter',
    'Fats & Oils',
    95,
    40,
    80,
    45,
    65,
    '{"score": 55, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Ultrahuman", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "Academic OUP", "type": "research"}, {"name": "USU Extension", "type": "research"}, {"name": "Joslin", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'margarine',
    'Fats & Oils',
    85,
    35,
    70,
    40,
    60,
    '{"score": 60, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "Mayo Clinic", "type": "research"}, {"name": "Eating Well", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vegetable oil',
    'Fats & Oils',
    95,
    40,
    85,
    60,
    72,
    '{"score": 80, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "Stanford Med", "type": "research"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Nutrition.org", "type": "research"}, {"name": "UC News", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'canola oil',
    'Fats & Oils',
    98,
    70,
    90,
    75,
    82,
    '{"score": 85, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "Managed Healthcare Executive", "type": "research"}, {"name": "Diabetes Journals", "type": "research"}, {"name": "U of T", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sunflower oil',
    'Fats & Oils',
    65,
    55,
    50,
    60,
    59,
    '{"score": 45, "confidence": 35, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "Sugarfit", "type": "research"}, {"name": "Zeroacre", "type": "research"}, {"name": "BHF", "type": "research"}, {"name": "Stanford Med", "type": "research"}, {"name": "Health.com", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'olive oil',
    'Fats & Oils',
    85,
    90,
    80,
    88,
    85,
    '{"score": 80, "confidence": 75, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "About Olive Oil", "type": "research"}, {"name": "Nature", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "BHOOC", "type": "research"}, {"name": "Diabetes Journals", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut oil',
    'Fats & Oils',
    55,
    60,
    55,
    45,
    53,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "BMJ Open", "type": "research"}, {"name": "ACC", "type": "research"}, {"name": "JAMA Network", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'palm oil',
    'Fats & Oils',
    55,
    60,
    50,
    50,
    54,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "Nature", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'shortening',
    'Fats & Oils',
    45,
    70,
    45,
    35,
    47,
    '{"score": 40, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}, {"name": "Lipid.org", "type": "research"}, {"name": "Dr. Axe", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lard',
    'Fats & Oils',
    55,
    60,
    50,
    50,
    53,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "General saturated fat research", "type": "research"}, {"name": "PubMed cohorts", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ghee',
    'Fats & Oils',
    60,
    60,
    55,
    55,
    57,
    '{"score": 55, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Cambridge Core", "type": "research"}, {"name": "WebMD", "type": "research"}, {"name": "Cleveland Clinic", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'peanut oil',
    'Fats & Oils',
    75,
    60,
    55,
    70,
    67,
    '{"score": 65, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "WebMD", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'soybean oil',
    'Fats & Oils',
    55,
    60,
    50,
    60,
    56,
    '{"score": 55, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "ScienceDirect", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "PLOS ONE", "type": "research"}, {"name": "UC Riverside News", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fish oil',
    'Fats & Oils',
    70,
    85,
    65,
    80,
    75,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "WHO", "type": "research"}, {"name": "Nutrition Insight", "type": "research"}, {"name": "VeryWell Health", "type": "research"}, {"name": "SciTech Daily", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'avocado oil',
    'Fats & Oils',
    75,
    80,
    65,
    80,
    75,
    '{"score": 70, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed", "type": "research"}, {"name": "Cleveland Clinic", "type": "research"}, {"name": "Zoe", "type": "research"}, {"name": "Healthline", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    1,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cow milk (whole)',
    'Dairy & Alternatives',
    65,
    55,
    60,
    60,
    60,
    '{"score": 55, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Nutrition", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cow milk (skim)',
    'Dairy & Alternatives',
    60,
    60,
    65,
    65,
    62,
    '{"score": 55, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}, {"name": "Dairy Council", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cow milk (2%)',
    'Dairy & Alternatives',
    62,
    58,
    62,
    62,
    60,
    '{"score": 55, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'goat milk',
    'Dairy & Alternatives',
    68,
    60,
    70,
    65,
    65,
    '{"score": 60, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sheep milk',
    'Dairy & Alternatives',
    65,
    55,
    68,
    60,
    62,
    '{"score": 58, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'heavy cream',
    'Dairy & Alternatives',
    90,
    35,
    75,
    40,
    60,
    '{"score": 45, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'light cream',
    'Dairy & Alternatives',
    85,
    40,
    75,
    45,
    61,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'half and half',
    'Dairy & Alternatives',
    80,
    45,
    72,
    50,
    62,
    '{"score": 52, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sour cream',
    'Dairy & Alternatives',
    85,
    50,
    70,
    50,
    64,
    '{"score": 55, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'greek yogurt',
    'Dairy & Alternatives',
    70,
    70,
    80,
    75,
    72,
    '{"score": 65, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'plain yogurt',
    'Dairy & Alternatives',
    65,
    65,
    75,
    70,
    67,
    '{"score": 60, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kefir',
    'Dairy & Alternatives',
    68,
    75,
    85,
    75,
    74,
    '{"score": 68, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cottage cheese',
    'Dairy & Alternatives',
    72,
    60,
    70,
    68,
    67,
    '{"score": 60, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cheddar cheese',
    'Dairy & Alternatives',
    88,
    45,
    65,
    45,
    61,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mozzarella cheese',
    'Dairy & Alternatives',
    85,
    50,
    68,
    50,
    63,
    '{"score": 52, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'parmesan cheese',
    'Dairy & Alternatives',
    88,
    48,
    62,
    48,
    62,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'feta cheese',
    'Dairy & Alternatives',
    82,
    52,
    65,
    52,
    63,
    '{"score": 52, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cream cheese',
    'Dairy & Alternatives',
    85,
    42,
    65,
    42,
    59,
    '{"score": 48, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ricotta cheese',
    'Dairy & Alternatives',
    75,
    55,
    70,
    58,
    64,
    '{"score": 55, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brie cheese',
    'Dairy & Alternatives',
    85,
    50,
    65,
    48,
    62,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'gouda cheese',
    'Dairy & Alternatives',
    85,
    48,
    65,
    48,
    62,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'swiss cheese',
    'Dairy & Alternatives',
    85,
    50,
    68,
    50,
    63,
    '{"score": 52, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blue cheese',
    'Dairy & Alternatives',
    82,
    55,
    62,
    50,
    63,
    '{"score": 52, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'whey protein',
    'Dairy & Alternatives',
    75,
    70,
    65,
    78,
    73,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'casein protein',
    'Dairy & Alternatives',
    72,
    65,
    62,
    72,
    68,
    '{"score": 65, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lactose',
    'Dairy & Alternatives',
    40,
    50,
    40,
    50,
    45,
    '{"score": 45, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'soy milk',
    'Dairy & Alternatives',
    72,
    70,
    75,
    72,
    72,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'almond milk (unsweetened)',
    'Dairy & Alternatives',
    88,
    70,
    75,
    78,
    78,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oat milk',
    'Dairy & Alternatives',
    55,
    65,
    72,
    62,
    62,
    '{"score": 60, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut milk',
    'Dairy & Alternatives',
    82,
    50,
    70,
    55,
    64,
    '{"score": 55, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rice milk',
    'Dairy & Alternatives',
    35,
    55,
    68,
    50,
    49,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cashew milk',
    'Dairy & Alternatives',
    85,
    68,
    72,
    72,
    75,
    '{"score": 68, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hemp milk',
    'Dairy & Alternatives',
    80,
    72,
    75,
    72,
    75,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'macadamia milk',
    'Dairy & Alternatives',
    85,
    70,
    72,
    70,
    75,
    '{"score": 68, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vegan cheese',
    'Dairy & Alternatives',
    78,
    55,
    60,
    60,
    64,
    '{"score": 55, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'eggs (whole)',
    'Proteins',
    85,
    55,
    75,
    70,
    72,
    '{"score": 65, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "USDA", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'egg whites',
    'Proteins',
    90,
    70,
    78,
    80,
    80,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'egg yolks',
    'Proteins',
    82,
    45,
    70,
    55,
    64,
    '{"score": 58, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tofu (firm)',
    'Proteins',
    78,
    72,
    75,
    75,
    75,
    '{"score": 70, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tofu (silken)',
    'Proteins',
    76,
    72,
    78,
    74,
    74,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tempeh',
    'Proteins',
    75,
    75,
    82,
    78,
    76,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'seitan',
    'Proteins',
    65,
    55,
    45,
    62,
    58,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pea protein isolate',
    'Proteins',
    78,
    72,
    68,
    75,
    74,
    '{"score": 72, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'collagen peptides',
    'Proteins',
    88,
    68,
    72,
    70,
    75,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'gelatin',
    'Proteins',
    85,
    65,
    70,
    68,
    72,
    '{"score": 65, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'textured vegetable protein',
    'Proteins',
    72,
    62,
    65,
    68,
    67,
    '{"score": 60, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'edamame',
    'Proteins',
    72,
    75,
    78,
    78,
    75,
    '{"score": 70, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lentils (red)',
    'Proteins',
    55,
    78,
    82,
    80,
    71,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lentils (green)',
    'Proteins',
    58,
    78,
    82,
    80,
    72,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lentils (brown)',
    'Proteins',
    56,
    78,
    82,
    80,
    72,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chickpeas',
    'Proteins',
    52,
    75,
    80,
    78,
    69,
    '{"score": 68, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'black beans',
    'Proteins',
    50,
    78,
    82,
    80,
    70,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kidney beans',
    'Proteins',
    48,
    75,
    80,
    78,
    68,
    '{"score": 68, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pinto beans',
    'Proteins',
    50,
    76,
    80,
    78,
    68,
    '{"score": 68, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'navy beans',
    'Proteins',
    52,
    76,
    80,
    78,
    69,
    '{"score": 68, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lima beans',
    'Proteins',
    55,
    72,
    78,
    75,
    68,
    '{"score": 65, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cannellini beans',
    'Proteins',
    52,
    74,
    80,
    76,
    68,
    '{"score": 68, "confidence": 64, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'split peas',
    'Proteins',
    50,
    75,
    80,
    78,
    68,
    '{"score": 68, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'quinoa',
    'Proteins',
    55,
    72,
    78,
    75,
    68,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'almonds',
    'Proteins',
    85,
    78,
    75,
    82,
    80,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'walnuts',
    'Proteins',
    85,
    82,
    75,
    85,
    82,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cashews',
    'Proteins',
    80,
    72,
    72,
    75,
    75,
    '{"score": 70, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pistachios',
    'Proteins',
    78,
    78,
    75,
    80,
    78,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pecans',
    'Proteins',
    88,
    78,
    72,
    80,
    80,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hazelnuts',
    'Proteins',
    85,
    78,
    72,
    80,
    79,
    '{"score": 74, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brazil nuts',
    'Proteins',
    88,
    72,
    70,
    78,
    78,
    '{"score": 72, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'macadamia nuts',
    'Proteins',
    90,
    75,
    72,
    78,
    80,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pine nuts',
    'Proteins',
    85,
    72,
    72,
    75,
    76,
    '{"score": 70, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pumpkin seeds',
    'Proteins',
    82,
    75,
    78,
    80,
    79,
    '{"score": 78, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sunflower seeds',
    'Proteins',
    80,
    68,
    75,
    75,
    75,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chia seeds',
    'Proteins',
    85,
    82,
    88,
    85,
    84,
    '{"score": 80, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'flax seeds',
    'Proteins',
    88,
    82,
    85,
    85,
    85,
    '{"score": 82, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hemp seeds',
    'Proteins',
    85,
    78,
    80,
    82,
    81,
    '{"score": 78, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sesame seeds',
    'Proteins',
    82,
    72,
    75,
    78,
    77,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'poppy seeds',
    'Proteins',
    82,
    68,
    72,
    72,
    74,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'wheat flour (white)',
    'Grains & Flours',
    25,
    35,
    40,
    35,
    33,
    '{"score": 35, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'all-purpose flour',
    'Grains & Flours',
    25,
    35,
    42,
    35,
    33,
    '{"score": 35, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'whole wheat flour',
    'Grains & Flours',
    48,
    55,
    72,
    60,
    57,
    '{"score": 55, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread flour',
    'Grains & Flours',
    28,
    38,
    42,
    38,
    36,
    '{"score": 38, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cake flour',
    'Grains & Flours',
    22,
    32,
    40,
    32,
    30,
    '{"score": 32, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pastry flour',
    'Grains & Flours',
    24,
    34,
    42,
    34,
    32,
    '{"score": 34, "confidence": 56, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'almond flour',
    'Grains & Flours',
    88,
    75,
    70,
    82,
    80,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut flour',
    'Grains & Flours',
    75,
    68,
    78,
    72,
    73,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rice flour (white)',
    'Grains & Flours',
    30,
    55,
    70,
    55,
    49,
    '{"score": 50, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brown rice flour',
    'Grains & Flours',
    45,
    60,
    72,
    62,
    57,
    '{"score": 55, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oat flour',
    'Grains & Flours',
    55,
    68,
    78,
    72,
    66,
    '{"score": 65, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'buckwheat flour',
    'Grains & Flours',
    58,
    72,
    78,
    72,
    68,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'spelt flour',
    'Grains & Flours',
    48,
    60,
    70,
    62,
    58,
    '{"score": 58, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rye flour',
    'Grains & Flours',
    52,
    65,
    75,
    68,
    63,
    '{"score": 62, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cornmeal',
    'Grains & Flours',
    45,
    55,
    68,
    55,
    54,
    '{"score": 52, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'corn flour',
    'Grains & Flours',
    42,
    52,
    65,
    52,
    51,
    '{"score": 50, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'masa harina',
    'Grains & Flours',
    48,
    55,
    68,
    58,
    56,
    '{"score": 55, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'barley flour',
    'Grains & Flours',
    52,
    68,
    78,
    72,
    65,
    '{"score": 65, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'millet flour',
    'Grains & Flours',
    55,
    62,
    72,
    65,
    62,
    '{"score": 60, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sorghum flour',
    'Grains & Flours',
    52,
    65,
    72,
    68,
    63,
    '{"score": 62, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'teff flour',
    'Grains & Flours',
    55,
    68,
    75,
    72,
    66,
    '{"score": 65, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'amaranth flour',
    'Grains & Flours',
    55,
    70,
    75,
    72,
    66,
    '{"score": 68, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'quinoa flour',
    'Grains & Flours',
    55,
    70,
    75,
    72,
    66,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chickpea flour',
    'Grains & Flours',
    55,
    70,
    75,
    72,
    66,
    '{"score": 65, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lentil flour',
    'Grains & Flours',
    52,
    72,
    75,
    72,
    66,
    '{"score": 65, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cassava flour',
    'Grains & Flours',
    35,
    55,
    68,
    50,
    49,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tapioca flour',
    'Grains & Flours',
    25,
    50,
    65,
    45,
    43,
    '{"score": 45, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cornstarch',
    'Grains & Flours',
    20,
    45,
    60,
    40,
    38,
    '{"score": 40, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'potato starch',
    'Grains & Flours',
    15,
    48,
    55,
    40,
    36,
    '{"score": 40, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'arrowroot starch',
    'Grains & Flours',
    25,
    55,
    65,
    52,
    46,
    '{"score": 48, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'white rice',
    'Grains & Flours',
    30,
    45,
    65,
    40,
    42,
    '{"score": 42, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brown rice',
    'Grains & Flours',
    50,
    62,
    75,
    65,
    61,
    '{"score": 58, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'basmati rice (white)',
    'Grains & Flours',
    42,
    50,
    68,
    50,
    50,
    '{"score": 48, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Glycemic Index", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'jasmine rice',
    'Grains & Flours',
    28,
    45,
    65,
    42,
    42,
    '{"score": 42, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Glycemic Index", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'wild rice',
    'Grains & Flours',
    55,
    65,
    78,
    72,
    65,
    '{"score": 62, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'black rice',
    'Grains & Flours',
    58,
    72,
    78,
    75,
    69,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oats (rolled)',
    'Grains & Flours',
    55,
    72,
    82,
    78,
    70,
    '{"score": 68, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'steel-cut oats',
    'Grains & Flours',
    60,
    72,
    82,
    80,
    72,
    '{"score": 70, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'instant oats',
    'Grains & Flours',
    45,
    65,
    78,
    68,
    61,
    '{"score": 60, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'barley (pearled)',
    'Grains & Flours',
    48,
    68,
    78,
    72,
    64,
    '{"score": 65, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'barley (hulled)',
    'Grains & Flours',
    55,
    72,
    80,
    78,
    69,
    '{"score": 70, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bulgur wheat',
    'Grains & Flours',
    52,
    68,
    78,
    72,
    65,
    '{"score": 65, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'couscous',
    'Grains & Flours',
    35,
    50,
    62,
    52,
    48,
    '{"score": 48, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'whole wheat couscous',
    'Grains & Flours',
    50,
    58,
    72,
    62,
    59,
    '{"score": 58, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'semolina',
    'Grains & Flours',
    35,
    48,
    60,
    50,
    46,
    '{"score": 48, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'farro',
    'Grains & Flours',
    52,
    65,
    75,
    68,
    63,
    '{"score": 62, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'freekeh',
    'Grains & Flours',
    55,
    68,
    78,
    72,
    66,
    '{"score": 65, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kamut',
    'Grains & Flours',
    52,
    65,
    75,
    68,
    63,
    '{"score": 62, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'baking soda',
    'Leavening Agents',
    95,
    70,
    60,
    80,
    78,
    '{"score": 70, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'baking powder',
    'Leavening Agents',
    92,
    68,
    62,
    78,
    77,
    '{"score": 68, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'active dry yeast',
    'Leavening Agents',
    88,
    68,
    70,
    72,
    75,
    '{"score": 65, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'instant yeast',
    'Leavening Agents',
    88,
    68,
    70,
    72,
    75,
    '{"score": 65, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fresh yeast',
    'Leavening Agents',
    88,
    70,
    72,
    72,
    76,
    '{"score": 65, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'nutritional yeast',
    'Leavening Agents',
    85,
    75,
    78,
    80,
    79,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cream of tartar',
    'Leavening Agents',
    92,
    65,
    65,
    78,
    76,
    '{"score": 65, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ammonium bicarbonate',
    'Leavening Agents',
    90,
    65,
    55,
    72,
    72,
    '{"score": 62, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Baking references", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'agar-agar',
    'Thickeners & Stabilizers',
    90,
    72,
    75,
    75,
    78,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pectin',
    'Thickeners & Stabilizers',
    88,
    72,
    78,
    75,
    78,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'xanthan gum',
    'Thickeners & Stabilizers',
    92,
    62,
    55,
    72,
    72,
    '{"score": 62, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'guar gum',
    'Thickeners & Stabilizers',
    88,
    65,
    55,
    72,
    72,
    '{"score": 62, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'locust bean gum',
    'Thickeners & Stabilizers',
    90,
    65,
    60,
    72,
    73,
    '{"score": 62, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'carrageenan',
    'Thickeners & Stabilizers',
    88,
    45,
    35,
    55,
    59,
    '{"score": 50, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "EFSA controversies", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cellulose gum',
    'Thickeners & Stabilizers',
    90,
    58,
    55,
    68,
    70,
    '{"score": 58, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'methylcellulose',
    'Thickeners & Stabilizers',
    90,
    55,
    52,
    65,
    68,
    '{"score": 55, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'modified food starch',
    'Thickeners & Stabilizers',
    70,
    55,
    55,
    60,
    61,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maltodextrin',
    'Thickeners & Stabilizers',
    15,
    35,
    45,
    35,
    30,
    '{"score": 35, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dextrin',
    'Thickeners & Stabilizers',
    20,
    40,
    50,
    40,
    36,
    '{"score": 40, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lecithin (soy)',
    'Thickeners & Stabilizers',
    92,
    68,
    70,
    75,
    77,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lecithin (sunflower)',
    'Thickeners & Stabilizers',
    92,
    70,
    72,
    75,
    78,
    '{"score": 68, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mono and diglycerides',
    'Thickeners & Stabilizers',
    88,
    50,
    50,
    60,
    64,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'polysorbate 80',
    'Thickeners & Stabilizers',
    88,
    40,
    35,
    50,
    57,
    '{"score": 45, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium alginate',
    'Thickeners & Stabilizers',
    90,
    65,
    65,
    72,
    74,
    '{"score": 62, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'salt (sodium chloride)',
    'Preservatives',
    90,
    50,
    70,
    45,
    64,
    '{"score": 55, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "AHA", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'citric acid',
    'Preservatives',
    92,
    72,
    65,
    78,
    78,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ascorbic acid',
    'Preservatives',
    92,
    80,
    75,
    85,
    84,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tocopherols',
    'Preservatives',
    92,
    82,
    72,
    82,
    83,
    '{"score": 78, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rosemary extract',
    'Preservatives',
    92,
    80,
    75,
    80,
    82,
    '{"score": 75, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "EFSA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium benzoate',
    'Preservatives',
    90,
    50,
    45,
    55,
    62,
    '{"score": 50, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'potassium sorbate',
    'Preservatives',
    90,
    55,
    50,
    62,
    66,
    '{"score": 55, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium nitrite',
    'Preservatives',
    88,
    35,
    40,
    30,
    51,
    '{"score": 40, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "IARC", "type": "research"}, {"name": "WHO", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium nitrate',
    'Preservatives',
    88,
    35,
    40,
    30,
    51,
    '{"score": 40, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "IARC", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'calcium propionate',
    'Preservatives',
    90,
    55,
    50,
    65,
    67,
    '{"score": 55, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sulfur dioxide',
    'Preservatives',
    88,
    50,
    40,
    55,
    61,
    '{"score": 50, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium sulfite',
    'Preservatives',
    88,
    48,
    38,
    52,
    60,
    '{"score": 48, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bha (butylated hydroxyanisole)',
    'Preservatives',
    88,
    40,
    45,
    40,
    56,
    '{"score": 45, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "IARC", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bht (butylated hydroxytoluene)',
    'Preservatives',
    88,
    42,
    45,
    42,
    56,
    '{"score": 45, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tbhq',
    'Preservatives',
    88,
    38,
    42,
    38,
    54,
    '{"score": 42, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'calcium disodium edta',
    'Preservatives',
    90,
    55,
    50,
    60,
    66,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'msg (monosodium glutamate)',
    'Flavor Enhancers',
    90,
    65,
    58,
    72,
    73,
    '{"score": 60, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'disodium inosinate',
    'Flavor Enhancers',
    90,
    62,
    58,
    68,
    71,
    '{"score": 58, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'disodium guanylate',
    'Flavor Enhancers',
    90,
    62,
    58,
    68,
    71,
    '{"score": 58, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'autolyzed yeast extract',
    'Flavor Enhancers',
    88,
    65,
    60,
    70,
    72,
    '{"score": 60, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hydrolyzed vegetable protein',
    'Flavor Enhancers',
    82,
    58,
    55,
    62,
    65,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'natural flavors',
    'Flavor Enhancers',
    85,
    60,
    60,
    65,
    68,
    '{"score": 58, "confidence": 40, "confidence_level": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'artificial flavors',
    'Flavor Enhancers',
    85,
    55,
    55,
    60,
    65,
    '{"score": 55, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vanilla extract',
    'Flavor Enhancers',
    88,
    72,
    72,
    78,
    78,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vanillin',
    'Flavor Enhancers',
    88,
    62,
    65,
    70,
    72,
    '{"score": 60, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'smoke flavor',
    'Flavor Enhancers',
    88,
    55,
    55,
    55,
    65,
    '{"score": 52, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beta-carotene',
    'Colorings',
    92,
    80,
    75,
    82,
    83,
    '{"score": 78, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'annatto',
    'Colorings',
    90,
    68,
    68,
    72,
    75,
    '{"score": 65, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'turmeric (curcumin)',
    'Colorings',
    88,
    85,
    75,
    85,
    84,
    '{"score": 80, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beet juice',
    'Colorings',
    75,
    75,
    78,
    80,
    76,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'paprika extract',
    'Colorings',
    90,
    72,
    72,
    75,
    78,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'saffron',
    'Colorings',
    90,
    78,
    72,
    78,
    80,
    '{"score": 75, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'spirulina extract',
    'Colorings',
    88,
    78,
    78,
    80,
    81,
    '{"score": 75, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chlorophyll',
    'Colorings',
    90,
    72,
    72,
    75,
    78,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'caramel color',
    'Colorings',
    78,
    55,
    55,
    55,
    62,
    '{"score": 52, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'red 40 (allura red)',
    'Colorings',
    90,
    45,
    40,
    45,
    58,
    '{"score": 45, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "CSPI", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'yellow 5 (tartrazine)',
    'Colorings',
    90,
    45,
    40,
    45,
    58,
    '{"score": 45, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'yellow 6 (sunset yellow)',
    'Colorings',
    90,
    45,
    40,
    45,
    58,
    '{"score": 45, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blue 1 (brilliant blue)',
    'Colorings',
    90,
    48,
    45,
    50,
    61,
    '{"score": 48, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blue 2 (indigotine)',
    'Colorings',
    90,
    48,
    45,
    50,
    61,
    '{"score": 48, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'red 3 (erythrosine)',
    'Colorings',
    88,
    42,
    38,
    40,
    55,
    '{"score": 42, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vinegar (distilled)',
    'Acids',
    88,
    72,
    72,
    78,
    78,
    '{"score": 68, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'apple cider vinegar',
    'Acids',
    85,
    75,
    75,
    78,
    78,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'balsamic vinegar',
    'Acids',
    75,
    72,
    72,
    75,
    73,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rice vinegar',
    'Acids',
    85,
    70,
    70,
    75,
    75,
    '{"score": 65, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lemon juice',
    'Acids',
    88,
    78,
    78,
    82,
    82,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lime juice',
    'Acids',
    88,
    78,
    78,
    82,
    82,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lactic acid',
    'Acids',
    90,
    72,
    75,
    75,
    78,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'malic acid',
    'Acids',
    90,
    68,
    68,
    72,
    75,
    '{"score": 65, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tartaric acid',
    'Acids',
    90,
    65,
    65,
    70,
    74,
    '{"score": 62, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'phosphoric acid',
    'Acids',
    88,
    40,
    45,
    35,
    54,
    '{"score": 40, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acetic acid',
    'Acids',
    88,
    70,
    70,
    75,
    76,
    '{"score": 65, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cinnamon',
    'Spices & Herbs',
    85,
    82,
    78,
    82,
    82,
    '{"score": 78, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ginger',
    'Spices & Herbs',
    88,
    85,
    82,
    85,
    85,
    '{"score": 80, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Healthline", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'turmeric',
    'Spices & Herbs',
    88,
    88,
    78,
    88,
    86,
    '{"score": 82, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'black pepper',
    'Spices & Herbs',
    92,
    75,
    75,
    78,
    80,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cayenne pepper',
    'Spices & Herbs',
    88,
    78,
    72,
    78,
    80,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'paprika',
    'Spices & Herbs',
    90,
    72,
    72,
    75,
    78,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cumin',
    'Spices & Herbs',
    90,
    75,
    78,
    78,
    80,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coriander',
    'Spices & Herbs',
    90,
    72,
    75,
    75,
    78,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oregano',
    'Spices & Herbs',
    92,
    80,
    78,
    80,
    83,
    '{"score": 75, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'basil',
    'Spices & Herbs',
    92,
    78,
    78,
    78,
    82,
    '{"score": 75, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rosemary',
    'Spices & Herbs',
    92,
    82,
    78,
    82,
    84,
    '{"score": 78, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'thyme',
    'Spices & Herbs',
    92,
    80,
    78,
    80,
    83,
    '{"score": 75, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sage',
    'Spices & Herbs',
    90,
    78,
    75,
    78,
    81,
    '{"score": 75, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'parsley',
    'Spices & Herbs',
    92,
    75,
    78,
    78,
    81,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dill',
    'Spices & Herbs',
    92,
    72,
    75,
    75,
    79,
    '{"score": 70, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mint',
    'Spices & Herbs',
    92,
    75,
    80,
    78,
    81,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'garlic (powder)',
    'Spices & Herbs',
    88,
    85,
    80,
    88,
    86,
    '{"score": 82, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'onion (powder)',
    'Spices & Herbs',
    85,
    78,
    78,
    82,
    81,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chili powder',
    'Spices & Herbs',
    88,
    78,
    72,
    78,
    80,
    '{"score": 75, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'curry powder',
    'Spices & Herbs',
    88,
    82,
    75,
    82,
    82,
    '{"score": 78, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'nutmeg',
    'Spices & Herbs',
    90,
    70,
    68,
    72,
    76,
    '{"score": 68, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cloves',
    'Spices & Herbs',
    90,
    80,
    72,
    80,
    81,
    '{"score": 75, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cardamom',
    'Spices & Herbs',
    90,
    75,
    75,
    78,
    80,
    '{"score": 72, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fennel',
    'Spices & Herbs',
    90,
    72,
    78,
    75,
    79,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mustard (powder)',
    'Spices & Herbs',
    88,
    72,
    72,
    75,
    77,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'apple (raw)',
    'Fruits',
    65,
    78,
    82,
    82,
    75,
    '{"score": 72, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'banana (raw)',
    'Fruits',
    48,
    72,
    78,
    75,
    66,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'orange (raw)',
    'Fruits',
    62,
    78,
    78,
    82,
    74,
    '{"score": 75, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'strawberries (raw)',
    'Fruits',
    72,
    82,
    82,
    85,
    79,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blueberries (raw)',
    'Fruits',
    70,
    88,
    85,
    88,
    82,
    '{"score": 82, "confidence": 75, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'raspberries (raw)',
    'Fruits',
    78,
    82,
    85,
    85,
    82,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blackberries (raw)',
    'Fruits',
    78,
    82,
    85,
    85,
    82,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'grapes (raw)',
    'Fruits',
    52,
    75,
    75,
    78,
    68,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mango (raw)',
    'Fruits',
    45,
    72,
    75,
    72,
    64,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pineapple (raw)',
    'Fruits',
    50,
    72,
    72,
    75,
    66,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'papaya (raw)',
    'Fruits',
    55,
    75,
    78,
    78,
    70,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kiwi (raw)',
    'Fruits',
    68,
    78,
    82,
    82,
    76,
    '{"score": 75, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pomegranate',
    'Fruits',
    72,
    85,
    80,
    88,
    81,
    '{"score": 80, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cherries (raw)',
    'Fruits',
    65,
    80,
    78,
    82,
    76,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'peaches (raw)',
    'Fruits',
    62,
    72,
    78,
    78,
    71,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'plums (raw)',
    'Fruits',
    60,
    72,
    80,
    78,
    71,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'apricots (raw)',
    'Fruits',
    62,
    72,
    78,
    78,
    71,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'watermelon',
    'Fruits',
    40,
    68,
    75,
    72,
    62,
    '{"score": 68, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cantaloupe',
    'Fruits',
    55,
    70,
    75,
    75,
    68,
    '{"score": 70, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'honeydew',
    'Fruits',
    50,
    68,
    72,
    72,
    64,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'avocado',
    'Fruits',
    88,
    82,
    82,
    88,
    85,
    '{"score": 82, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut (raw)',
    'Fruits',
    78,
    60,
    75,
    60,
    68,
    '{"score": 62, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dried cranberries',
    'Fruits',
    35,
    62,
    55,
    55,
    50,
    '{"score": 52, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'raisins',
    'Fruits',
    38,
    62,
    60,
    58,
    53,
    '{"score": 55, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dates',
    'Fruits',
    42,
    68,
    72,
    55,
    56,
    '{"score": 58, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'prunes',
    'Fruits',
    48,
    72,
    82,
    72,
    66,
    '{"score": 68, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dried apricots',
    'Fruits',
    45,
    68,
    65,
    62,
    58,
    '{"score": 60, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dried figs',
    'Fruits',
    45,
    70,
    75,
    62,
    60,
    '{"score": 62, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'freeze-dried fruit',
    'Fruits',
    55,
    72,
    70,
    70,
    65,
    '{"score": 65, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fruit juice concentrate',
    'Fruits',
    20,
    30,
    35,
    25,
    26,
    '{"score": 30, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'spinach (raw)',
    'Vegetables',
    92,
    88,
    85,
    92,
    89,
    '{"score": 85, "confidence": 75, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kale (raw)',
    'Vegetables',
    92,
    90,
    82,
    92,
    90,
    '{"score": 88, "confidence": 75, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'arugula',
    'Vegetables',
    92,
    82,
    82,
    88,
    86,
    '{"score": 82, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'swiss chard',
    'Vegetables',
    92,
    85,
    82,
    88,
    87,
    '{"score": 82, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'romaine lettuce',
    'Vegetables',
    92,
    75,
    80,
    82,
    83,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'broccoli (raw)',
    'Vegetables',
    90,
    88,
    85,
    92,
    89,
    '{"score": 85, "confidence": 75, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cauliflower (raw)',
    'Vegetables',
    90,
    82,
    82,
    88,
    86,
    '{"score": 80, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brussels sprouts',
    'Vegetables',
    88,
    85,
    78,
    88,
    85,
    '{"score": 82, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cabbage (raw)',
    'Vegetables',
    90,
    78,
    82,
    85,
    84,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bok choy',
    'Vegetables',
    92,
    80,
    82,
    85,
    85,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'carrots (raw)',
    'Vegetables',
    65,
    75,
    80,
    82,
    74,
    '{"score": 75, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sweet potato',
    'Vegetables',
    55,
    78,
    82,
    82,
    73,
    '{"score": 78, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beets (raw)',
    'Vegetables',
    58,
    78,
    82,
    82,
    74,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'turnips',
    'Vegetables',
    72,
    72,
    78,
    78,
    74,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'radishes',
    'Vegetables',
    88,
    72,
    78,
    78,
    79,
    '{"score": 72, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'parsnips',
    'Vegetables',
    52,
    70,
    78,
    72,
    66,
    '{"score": 68, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'celery',
    'Vegetables',
    92,
    72,
    78,
    78,
    80,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'asparagus',
    'Vegetables',
    88,
    78,
    82,
    85,
    84,
    '{"score": 80, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'artichoke',
    'Vegetables',
    82,
    78,
    88,
    85,
    82,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bell peppers',
    'Vegetables',
    85,
    82,
    80,
    85,
    83,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tomatoes (raw)',
    'Vegetables',
    78,
    80,
    80,
    85,
    80,
    '{"score": 78, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'eggplant',
    'Vegetables',
    85,
    75,
    78,
    78,
    79,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'zucchini',
    'Vegetables',
    88,
    72,
    78,
    78,
    79,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'yellow squash',
    'Vegetables',
    88,
    72,
    78,
    78,
    79,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'butternut squash',
    'Vegetables',
    58,
    75,
    78,
    78,
    71,
    '{"score": 72, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acorn squash',
    'Vegetables',
    60,
    72,
    78,
    75,
    70,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pumpkin',
    'Vegetables',
    62,
    75,
    78,
    78,
    72,
    '{"score": 75, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cucumber',
    'Vegetables',
    92,
    70,
    80,
    78,
    80,
    '{"score": 70, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mushrooms (button)',
    'Vegetables',
    92,
    75,
    78,
    80,
    82,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'shiitake mushrooms',
    'Vegetables',
    90,
    82,
    80,
    85,
    85,
    '{"score": 80, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'portobello mushrooms',
    'Vegetables',
    90,
    75,
    78,
    80,
    81,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'onions',
    'Vegetables',
    78,
    78,
    80,
    82,
    79,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'garlic',
    'Vegetables',
    85,
    88,
    82,
    90,
    86,
    '{"score": 85, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'leeks',
    'Vegetables',
    82,
    75,
    82,
    80,
    79,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'scallions',
    'Vegetables',
    88,
    75,
    80,
    80,
    81,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'corn (sweet)',
    'Vegetables',
    48,
    65,
    72,
    65,
    61,
    '{"score": 62, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'green peas',
    'Vegetables',
    58,
    72,
    78,
    75,
    69,
    '{"score": 70, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'green beans',
    'Vegetables',
    85,
    72,
    78,
    78,
    78,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'snow peas',
    'Vegetables',
    82,
    72,
    78,
    78,
    77,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coffee (black)',
    'Beverages',
    88,
    78,
    75,
    82,
    82,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'green tea',
    'Beverages',
    90,
    85,
    82,
    88,
    86,
    '{"score": 82, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'black tea',
    'Beverages',
    88,
    78,
    78,
    82,
    82,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'matcha',
    'Beverages',
    88,
    88,
    80,
    88,
    86,
    '{"score": 85, "confidence": 75, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'herbal tea (chamomile)',
    'Beverages',
    92,
    75,
    80,
    78,
    82,
    '{"score": 75, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'herbal tea (peppermint)',
    'Beverages',
    92,
    72,
    82,
    78,
    81,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cocoa powder (unsweetened)',
    'Beverages',
    82,
    85,
    78,
    85,
    82,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dark chocolate (70%+)',
    'Beverages',
    68,
    82,
    72,
    82,
    76,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'milk chocolate',
    'Beverages',
    40,
    50,
    60,
    45,
    47,
    '{"score": 50, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'alcohol (red wine)',
    'Beverages',
    55,
    62,
    50,
    52,
    54,
    '{"score": 48, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "AHA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'alcohol (beer)',
    'Beverages',
    35,
    45,
    45,
    35,
    39,
    '{"score": 40, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'alcohol (spirits)',
    'Beverages',
    70,
    40,
    40,
    35,
    48,
    '{"score": 40, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut water',
    'Beverages',
    62,
    72,
    75,
    75,
    70,
    '{"score": 70, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sparkling water',
    'Beverages',
    95,
    75,
    78,
    82,
    83,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'soy sauce',
    'Condiments',
    85,
    55,
    55,
    55,
    64,
    '{"score": 55, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tamari',
    'Condiments',
    85,
    58,
    58,
    58,
    66,
    '{"score": 55, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fish sauce',
    'Condiments',
    88,
    52,
    52,
    52,
    63,
    '{"score": 50, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'worcestershire sauce',
    'Condiments',
    82,
    58,
    55,
    58,
    64,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hot sauce',
    'Condiments',
    88,
    75,
    65,
    75,
    77,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sriracha',
    'Condiments',
    75,
    72,
    62,
    70,
    70,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ketchup',
    'Condiments',
    52,
    55,
    60,
    55,
    55,
    '{"score": 52, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mustard (yellow)',
    'Condiments',
    92,
    72,
    72,
    78,
    79,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dijon mustard',
    'Condiments',
    92,
    72,
    72,
    78,
    79,
    '{"score": 70, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mayonnaise',
    'Condiments',
    88,
    50,
    65,
    55,
    65,
    '{"score": 55, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ranch dressing',
    'Condiments',
    78,
    42,
    55,
    45,
    56,
    '{"score": 45, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'italian dressing',
    'Condiments',
    82,
    62,
    65,
    65,
    69,
    '{"score": 60, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'balsamic glaze',
    'Condiments',
    45,
    65,
    65,
    58,
    56,
    '{"score": 55, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tahini',
    'Condiments',
    82,
    75,
    75,
    80,
    78,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'peanut butter (natural)',
    'Condiments',
    78,
    72,
    72,
    78,
    75,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'almond butter',
    'Condiments',
    82,
    78,
    72,
    82,
    79,
    '{"score": 78, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hummus',
    'Condiments',
    70,
    75,
    78,
    78,
    74,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'guacamole',
    'Condiments',
    82,
    80,
    80,
    85,
    82,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'salsa (fresh)',
    'Condiments',
    85,
    78,
    78,
    82,
    81,
    '{"score": 75, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pesto',
    'Condiments',
    82,
    75,
    72,
    78,
    77,
    '{"score": 72, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'teriyaki sauce',
    'Condiments',
    42,
    48,
    52,
    45,
    46,
    '{"score": 45, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hoisin sauce',
    'Condiments',
    38,
    45,
    50,
    42,
    43,
    '{"score": 42, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oyster sauce',
    'Condiments',
    72,
    52,
    52,
    55,
    59,
    '{"score": 52, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'miso paste',
    'Condiments',
    75,
    72,
    80,
    78,
    76,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chicken breast (skinless)',
    'Meats & Poultry',
    92,
    68,
    78,
    75,
    79,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chicken thigh (skinless)',
    'Meats & Poultry',
    90,
    62,
    78,
    72,
    76,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chicken (with skin)',
    'Meats & Poultry',
    88,
    55,
    75,
    65,
    71,
    '{"score": 62, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'turkey breast',
    'Meats & Poultry',
    92,
    70,
    78,
    78,
    80,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ground turkey (lean)',
    'Meats & Poultry',
    88,
    65,
    75,
    72,
    76,
    '{"score": 68, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'duck',
    'Meats & Poultry',
    85,
    55,
    72,
    60,
    68,
    '{"score": 58, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beef (lean cuts)',
    'Meats & Poultry',
    88,
    55,
    72,
    62,
    70,
    '{"score": 60, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beef (ground, 90% lean)',
    'Meats & Poultry',
    85,
    52,
    70,
    58,
    66,
    '{"score": 55, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beef (ground, 80% lean)',
    'Meats & Poultry',
    82,
    45,
    68,
    52,
    62,
    '{"score": 50, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'steak (sirloin)',
    'Meats & Poultry',
    88,
    55,
    72,
    62,
    70,
    '{"score": 60, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'steak (ribeye)',
    'Meats & Poultry',
    82,
    48,
    70,
    55,
    64,
    '{"score": 52, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pork tenderloin',
    'Meats & Poultry',
    88,
    62,
    75,
    68,
    74,
    '{"score": 65, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pork chop (lean)',
    'Meats & Poultry',
    85,
    58,
    72,
    62,
    69,
    '{"score": 60, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pork (ground)',
    'Meats & Poultry',
    82,
    48,
    68,
    52,
    63,
    '{"score": 52, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bacon',
    'Meats & Poultry',
    78,
    30,
    55,
    25,
    47,
    '{"score": 35, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "IARC", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ham',
    'Meats & Poultry',
    80,
    40,
    55,
    35,
    53,
    '{"score": 42, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "IARC", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sausage (pork)',
    'Meats & Poultry',
    75,
    35,
    52,
    30,
    49,
    '{"score": 38, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "IARC", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hot dog',
    'Meats & Poultry',
    72,
    28,
    48,
    25,
    44,
    '{"score": 32, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "IARC", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'deli turkey',
    'Meats & Poultry',
    82,
    48,
    55,
    48,
    59,
    '{"score": 50, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lamb (lean)',
    'Meats & Poultry',
    85,
    55,
    70,
    58,
    67,
    '{"score": 58, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'venison',
    'Meats & Poultry',
    90,
    68,
    75,
    72,
    77,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bison',
    'Meats & Poultry',
    88,
    65,
    75,
    70,
    75,
    '{"score": 68, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'liver (beef)',
    'Meats & Poultry',
    80,
    60,
    68,
    65,
    68,
    '{"score": 55, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'liver (chicken)',
    'Meats & Poultry',
    82,
    62,
    70,
    68,
    70,
    '{"score": 58, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'salmon (wild)',
    'Seafood',
    88,
    88,
    80,
    90,
    87,
    '{"score": 85, "confidence": 75, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'salmon (farmed)',
    'Seafood',
    85,
    82,
    78,
    82,
    82,
    '{"score": 80, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tuna (fresh)',
    'Seafood',
    90,
    80,
    78,
    82,
    83,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tuna (canned, light)',
    'Seafood',
    88,
    75,
    75,
    78,
    79,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tuna (canned, albacore)',
    'Seafood',
    85,
    72,
    72,
    75,
    76,
    '{"score": 70, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sardines',
    'Seafood',
    90,
    85,
    82,
    88,
    86,
    '{"score": 82, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mackerel',
    'Seafood',
    88,
    85,
    80,
    85,
    85,
    '{"score": 82, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'herring',
    'Seafood',
    88,
    85,
    80,
    85,
    85,
    '{"score": 80, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'anchovies',
    'Seafood',
    90,
    82,
    78,
    85,
    84,
    '{"score": 78, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cod',
    'Seafood',
    92,
    72,
    78,
    78,
    80,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tilapia',
    'Seafood',
    90,
    60,
    75,
    72,
    75,
    '{"score": 65, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'halibut',
    'Seafood',
    90,
    72,
    78,
    80,
    81,
    '{"score": 75, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mahi-mahi',
    'Seafood',
    90,
    72,
    78,
    78,
    80,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'snapper',
    'Seafood',
    90,
    70,
    78,
    78,
    79,
    '{"score": 70, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'catfish',
    'Seafood',
    88,
    65,
    75,
    72,
    75,
    '{"score": 65, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'trout (rainbow)',
    'Seafood',
    88,
    82,
    78,
    85,
    84,
    '{"score": 80, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sea bass',
    'Seafood',
    90,
    72,
    78,
    78,
    80,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'flounder',
    'Seafood',
    92,
    70,
    78,
    78,
    80,
    '{"score": 70, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sole',
    'Seafood',
    92,
    70,
    78,
    78,
    80,
    '{"score": 70, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'shrimp',
    'Seafood',
    90,
    68,
    75,
    75,
    78,
    '{"score": 70, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lobster',
    'Seafood',
    90,
    68,
    75,
    75,
    77,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'crab',
    'Seafood',
    90,
    70,
    75,
    78,
    79,
    '{"score": 72, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'scallops',
    'Seafood',
    90,
    70,
    78,
    78,
    79,
    '{"score": 72, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mussels',
    'Seafood',
    88,
    75,
    78,
    82,
    81,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oysters',
    'Seafood',
    88,
    78,
    78,
    85,
    83,
    '{"score": 80, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'clams',
    'Seafood',
    88,
    75,
    78,
    82,
    81,
    '{"score": 75, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'calamari (squid)',
    'Seafood',
    88,
    65,
    72,
    72,
    75,
    '{"score": 65, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'octopus',
    'Seafood',
    88,
    65,
    72,
    72,
    75,
    '{"score": 65, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (white)',
    'Processed Foods',
    28,
    38,
    48,
    35,
    36,
    '{"score": 38, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Harvard Health", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (whole wheat)',
    'Processed Foods',
    50,
    58,
    70,
    58,
    57,
    '{"score": 55, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (sourdough)',
    'Processed Foods',
    55,
    62,
    72,
    62,
    61,
    '{"score": 58, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (rye)',
    'Processed Foods',
    55,
    62,
    72,
    65,
    62,
    '{"score": 60, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (multigrain)',
    'Processed Foods',
    52,
    58,
    68,
    58,
    57,
    '{"score": 55, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tortilla (flour)',
    'Processed Foods',
    35,
    45,
    55,
    42,
    42,
    '{"score": 42, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tortilla (corn)',
    'Processed Foods',
    48,
    55,
    68,
    55,
    54,
    '{"score": 52, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pasta (white)',
    'Processed Foods',
    38,
    45,
    55,
    42,
    43,
    '{"score": 42, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pasta (whole wheat)',
    'Processed Foods',
    52,
    58,
    72,
    60,
    58,
    '{"score": 55, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pasta (gluten-free)',
    'Processed Foods',
    38,
    52,
    60,
    50,
    48,
    '{"score": 48, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'crackers (whole grain)',
    'Processed Foods',
    48,
    55,
    62,
    55,
    54,
    '{"score": 52, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'crackers (refined)',
    'Processed Foods',
    30,
    40,
    52,
    38,
    38,
    '{"score": 38, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chips (potato)',
    'Processed Foods',
    35,
    32,
    42,
    28,
    33,
    '{"score": 32, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chips (tortilla)',
    'Processed Foods',
    38,
    38,
    48,
    35,
    38,
    '{"score": 35, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'popcorn (air-popped)',
    'Processed Foods',
    70,
    68,
    78,
    72,
    71,
    '{"score": 68, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'popcorn (butter)',
    'Processed Foods',
    55,
    48,
    68,
    52,
    54,
    '{"score": 52, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pretzels',
    'Processed Foods',
    35,
    42,
    55,
    40,
    41,
    '{"score": 40, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'granola bar',
    'Processed Foods',
    42,
    48,
    55,
    48,
    47,
    '{"score": 48, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'protein bar',
    'Processed Foods',
    55,
    55,
    55,
    58,
    56,
    '{"score": 58, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cereal (sugary)',
    'Processed Foods',
    20,
    30,
    40,
    25,
    27,
    '{"score": 28, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cereal (whole grain, low sugar)',
    'Processed Foods',
    55,
    62,
    72,
    65,
    62,
    '{"score": 60, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oatmeal (instant, flavored)',
    'Processed Foods',
    45,
    58,
    72,
    55,
    55,
    '{"score": 55, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pancake mix',
    'Processed Foods',
    28,
    38,
    48,
    35,
    36,
    '{"score": 38, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'waffle (frozen)',
    'Processed Foods',
    30,
    38,
    48,
    35,
    36,
    '{"score": 38, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pizza (frozen)',
    'Processed Foods',
    32,
    35,
    42,
    32,
    34,
    '{"score": 35, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'frozen vegetables',
    'Processed Foods',
    85,
    75,
    82,
    82,
    81,
    '{"score": 78, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'frozen fruit',
    'Processed Foods',
    72,
    75,
    80,
    80,
    76,
    '{"score": 75, "confidence": 70, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'canned tomatoes',
    'Processed Foods',
    78,
    78,
    75,
    82,
    78,
    '{"score": 75, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'canned beans',
    'Processed Foods',
    55,
    72,
    78,
    75,
    68,
    '{"score": 68, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'canned soup',
    'Processed Foods',
    55,
    48,
    55,
    50,
    52,
    '{"score": 50, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'instant noodles',
    'Processed Foods',
    25,
    30,
    38,
    28,
    29,
    '{"score": 28, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bouillon/stock cubes',
    'Processed Foods',
    82,
    40,
    52,
    50,
    57,
    '{"score": 45, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'soy protein isolate',
    'Processed Foods',
    78,
    62,
    62,
    68,
    68,
    '{"score": 62, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rice protein',
    'Processed Foods',
    80,
    65,
    68,
    70,
    71,
    '{"score": 62, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'protein powder (blend)',
    'Processed Foods',
    78,
    65,
    62,
    70,
    70,
    '{"score": 65, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mct oil',
    'Processed Foods',
    92,
    68,
    55,
    72,
    74,
    '{"score": 68, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'monk fruit',
    'Sweeteners',
    95,
    72,
    72,
    82,
    81,
    '{"score": 72, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'allulose',
    'Sweeteners',
    92,
    70,
    60,
    78,
    77,
    '{"score": 70, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tagatose',
    'Sweeteners',
    85,
    65,
    55,
    72,
    71,
    '{"score": 65, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'yacon syrup',
    'Sweeteners',
    75,
    72,
    80,
    72,
    74,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut sugar',
    'Sweeteners',
    40,
    48,
    58,
    45,
    46,
    '{"score": 45, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "Glycemic Index", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'date sugar',
    'Sweeteners',
    48,
    58,
    68,
    52,
    54,
    '{"score": 52, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lucuma',
    'Sweeteners',
    68,
    65,
    68,
    68,
    67,
    '{"score": 62, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sucralose',
    'Sweeteners',
    95,
    55,
    45,
    68,
    69,
    '{"score": 55, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'aspartame',
    'Sweeteners',
    95,
    52,
    50,
    55,
    65,
    '{"score": 52, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'saccharin',
    'Sweeteners',
    95,
    50,
    48,
    55,
    64,
    '{"score": 50, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acesulfame-k',
    'Sweeteners',
    95,
    52,
    50,
    58,
    66,
    '{"score": 52, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'neotame',
    'Sweeteners',
    95,
    55,
    52,
    62,
    68,
    '{"score": 55, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'advantame',
    'Sweeteners',
    95,
    55,
    52,
    62,
    68,
    '{"score": 55, "confidence": 42, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'glycerol/glycerin',
    'Sweeteners',
    78,
    58,
    45,
    65,
    64,
    '{"score": 58, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mannitol',
    'Sweeteners',
    80,
    55,
    25,
    62,
    60,
    '{"score": 55, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'isomalt',
    'Sweeteners',
    85,
    55,
    30,
    65,
    63,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "EFSA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lactitol',
    'Sweeteners',
    82,
    55,
    28,
    62,
    60,
    '{"score": 52, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "EFSA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maltitol',
    'Sweeteners',
    55,
    48,
    30,
    52,
    48,
    '{"score": 48, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hydrogenated starch hydrolysates',
    'Sweeteners',
    72,
    52,
    35,
    58,
    57,
    '{"score": 50, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'trehalose',
    'Sweeteners',
    55,
    55,
    58,
    55,
    55,
    '{"score": 52, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'isomaltulose',
    'Sweeteners',
    68,
    62,
    65,
    68,
    66,
    '{"score": 60, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'spirulina',
    'Specialty Ingredients',
    85,
    82,
    75,
    82,
    82,
    '{"score": 80, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chlorella',
    'Specialty Ingredients',
    85,
    80,
    78,
    80,
    81,
    '{"score": 78, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'wheatgrass',
    'Specialty Ingredients',
    88,
    78,
    78,
    78,
    81,
    '{"score": 75, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maca powder',
    'Specialty Ingredients',
    82,
    70,
    72,
    72,
    75,
    '{"score": 72, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ashwagandha',
    'Specialty Ingredients',
    88,
    78,
    72,
    78,
    80,
    '{"score": 82, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ginseng',
    'Specialty Ingredients',
    82,
    72,
    68,
    75,
    75,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rhodiola',
    'Specialty Ingredients',
    88,
    72,
    70,
    75,
    78,
    '{"score": 75, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'matcha powder',
    'Specialty Ingredients',
    88,
    88,
    80,
    88,
    86,
    '{"score": 85, "confidence": 75, "confidence_level": "medium"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cacao nibs',
    'Specialty Ingredients',
    82,
    85,
    78,
    85,
    82,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'carob powder',
    'Specialty Ingredients',
    65,
    70,
    78,
    72,
    70,
    '{"score": 65, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acai powder',
    'Specialty Ingredients',
    75,
    82,
    75,
    82,
    78,
    '{"score": 78, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'goji berries (dried)',
    'Specialty Ingredients',
    58,
    78,
    72,
    78,
    70,
    '{"score": 72, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bee pollen',
    'Specialty Ingredients',
    72,
    72,
    68,
    72,
    71,
    '{"score": 70, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'royal jelly',
    'Specialty Ingredients',
    78,
    68,
    65,
    70,
    71,
    '{"score": 70, "confidence": 45, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'propolis',
    'Specialty Ingredients',
    90,
    78,
    72,
    78,
    80,
    '{"score": 72, "confidence": 50, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'inulin',
    'Specialty Ingredients',
    88,
    72,
    75,
    78,
    78,
    '{"score": 70, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fos (fructooligosaccharides)',
    'Specialty Ingredients',
    85,
    72,
    72,
    75,
    76,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'gos (galactooligosaccharides)',
    'Specialty Ingredients',
    85,
    72,
    75,
    75,
    77,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'resistant dextrin',
    'Specialty Ingredients',
    78,
    68,
    78,
    72,
    73,
    '{"score": 65, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'psyllium husk',
    'Specialty Ingredients',
    85,
    78,
    85,
    85,
    83,
    '{"score": 78, "confidence": 68, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acacia fiber',
    'Specialty Ingredients',
    88,
    72,
    82,
    78,
    80,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beta-glucan (oat)',
    'Specialty Ingredients',
    80,
    78,
    82,
    85,
    81,
    '{"score": 78, "confidence": 72, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "FDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'konjac/glucomannan',
    'Specialty Ingredients',
    88,
    72,
    78,
    78,
    79,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'seaweed (nori)',
    'Specialty Ingredients',
    92,
    80,
    78,
    82,
    84,
    '{"score": 78, "confidence": 65, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kelp',
    'Specialty Ingredients',
    90,
    78,
    75,
    80,
    81,
    '{"score": 75, "confidence": 60, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'wakame',
    'Specialty Ingredients',
    90,
    78,
    78,
    80,
    82,
    '{"score": 75, "confidence": 62, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dulse',
    'Specialty Ingredients',
    90,
    78,
    75,
    78,
    81,
    '{"score": 75, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'irish moss',
    'Specialty Ingredients',
    88,
    70,
    72,
    72,
    76,
    '{"score": 70, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tempeh bacon',
    'Processed Foods',
    78,
    68,
    72,
    72,
    73,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beyond meat',
    'Processed Foods',
    65,
    55,
    58,
    58,
    59,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'impossible burger',
    'Processed Foods',
    65,
    55,
    58,
    58,
    59,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'jackfruit (young)',
    'Fruits',
    62,
    72,
    78,
    72,
    70,
    '{"score": 68, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vital wheat gluten',
    'Proteins',
    72,
    58,
    40,
    65,
    61,
    '{"score": 55, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lupin flour',
    'Grains & Flours',
    78,
    72,
    72,
    75,
    74,
    '{"score": 70, "confidence": 58, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cricket flour',
    'Proteins',
    82,
    72,
    72,
    78,
    76,
    '{"score": 70, "confidence": 52, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mycoprotein (quorn)',
    'Proteins',
    75,
    68,
    65,
    72,
    71,
    '{"score": 68, "confidence": 55, "confidence_level": "medium"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed", "type": "research"}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, category, blood_sugar_impact, inflammation_potential,
    gut_impact, disease_links, overall_score, hormonal_relevance, evidence_confidence,
    sources, is_trusted, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'aquafaba',
    'Specialty Ingredients',
    85,
    68,
    70,
    72,
    74,
    '{"score": 65, "confidence": 48, "confidence_level": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA", "type": "research"}]'::jsonb,
    0,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    category = EXCLUDED.category,
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    disease_links = EXCLUDED.disease_links,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    is_trusted = EXCLUDED.is_trusted,
    updated_at = NOW();

COMMIT;

-- Import complete: 507 ingredients (3 duplicates skipped)