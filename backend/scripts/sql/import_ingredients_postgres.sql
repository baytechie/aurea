-- Aurea Ingredients Database Import (PostgreSQL)
-- Generated: 2026-01-31T22:59:07.931124
-- Total: 510 ingredients

BEGIN;


INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sugar (white, brown)',
    10,
    75,
    40,
    31,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "institution"}, {"name": "Stanford Med", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "British Medical Journal", "type": "journal"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'high-fructose corn syrup',
    10,
    80,
    40,
    30,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Princeton Research", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Frontiers in Nutrition", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'honey',
    25,
    55,
    60,
    45,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Nature", "type": "journal"}, {"name": "Cardiometabolic Health", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "Mayo Clinic", "type": "institution"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maple syrup',
    30,
    55,
    60,
    46,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Canadian Maple", "type": "other"}, {"name": "Diabetes Care Community", "type": "other"}, {"name": "Indiana Maple Syrup", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'agave nectar',
    35,
    75,
    45,
    40,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "health_media"}, {"name": "WebMD", "type": "health_media"}, {"name": "Medical News Today", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'molasses',
    35,
    50,
    55,
    49,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "health_media"}, {"name": "Dr. Axe", "type": "other"}, {"name": "Taylor & Francis", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'stevia',
    90,
    30,
    70,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "European Food Safety Authority", "type": "regulatory"}, {"name": "Sweeteners.org", "type": "other"}, {"name": "ScienceDirect", "type": "research"}, {"name": "WebMD", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'erythritol',
    95,
    40,
    60,
    67,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Health.com", "type": "other"}, {"name": "Cleveland Clinic", "type": "institution"}, {"name": "WebMD", "type": "health_media"}, {"name": "Nutrition Facts", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'xylitol',
    80,
    45,
    35,
    55,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "health_media"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Sage Journals", "type": "other"}, {"name": "VeryWell Health", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maltose',
    5,
    75,
    60,
    35,
    '{"score": 75, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "MedicineNet", "type": "other"}, {"name": "Blue Circle", "type": "other"}, {"name": "Dr. Axe", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dextrose',
    5,
    75,
    60,
    35,
    '{"score": 75, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Glycemic Index", "type": "other"}, {"name": "WebMD", "type": "health_media"}, {"name": "Cleveland Clinic", "type": "institution"}, {"name": "Medical News Today", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'glucose syrup',
    5,
    75,
    60,
    35,
    '{"score": 75, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Glycemic Index", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Ragus", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "Academic OUP", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fructose',
    60,
    75,
    45,
    47,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Physiology.org", "type": "other"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Glycemic Index", "type": "other"}, {"name": "Penn Medicine", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'invert sugar',
    10,
    75,
    60,
    37,
    '{"score": 75, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "VeryWell Health", "type": "other"}, {"name": "Fitelo", "type": "other"}, {"name": "Vively", "type": "other"}, {"name": "Oreate AI", "type": "other"}, {"name": "Webstaurant Store", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sorbitol',
    80,
    45,
    25,
    53,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "ScienceDirect", "type": "research"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Elchemy", "type": "other"}, {"name": "Hydratis", "type": "other"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'butter',
    95,
    60,
    80,
    67,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Ultrahuman", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Academic OUP", "type": "other"}, {"name": "USU Extension", "type": "other"}, {"name": "Joslin", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'margarine',
    85,
    65,
    70,
    60,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "institution"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Mayo Clinic", "type": "institution"}, {"name": "Eating Well", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vegetable oil',
    95,
    60,
    85,
    65,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Stanford Med", "type": "other"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Nutrition.org", "type": "other"}, {"name": "UC News", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'canola oil',
    98,
    30,
    90,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Managed Healthcare Executive", "type": "other"}, {"name": "Diabetes Journals", "type": "other"}, {"name": "U of T", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sunflower oil',
    65,
    45,
    50,
    57,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Sugarfit", "type": "other"}, {"name": "Zeroacre", "type": "other"}, {"name": "BHF", "type": "other"}, {"name": "Stanford Med", "type": "other"}, {"name": "Health.com", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'olive oil',
    85,
    10,
    80,
    76,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "About Olive Oil", "type": "other"}, {"name": "Nature", "type": "journal"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "BHOOC", "type": "other"}, {"name": "Diabetes Journals", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut oil',
    55,
    40,
    55,
    56,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "BMJ Open", "type": "other"}, {"name": "ACC", "type": "other"}, {"name": "JAMA Network", "type": "other"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'palm oil',
    55,
    40,
    50,
    54,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Nature", "type": "journal"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'shortening',
    45,
    30,
    45,
    55,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "institution"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}, {"name": "Lipid.org", "type": "other"}, {"name": "Dr. Axe", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lard',
    55,
    40,
    50,
    54,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "General saturated fat research", "type": "other"}, {"name": "PubMed cohorts", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ghee',
    60,
    40,
    55,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Cambridge Core", "type": "other"}, {"name": "WebMD", "type": "health_media"}, {"name": "Cleveland Clinic", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'peanut oil',
    75,
    40,
    55,
    60,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "WebMD", "type": "health_media"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'soybean oil',
    55,
    40,
    50,
    54,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "ScienceDirect", "type": "research"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "PLOS ONE", "type": "other"}, {"name": "UC Riverside News", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fish oil',
    70,
    15,
    65,
    67,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "WHO", "type": "other"}, {"name": "Nutrition Insight", "type": "other"}, {"name": "VeryWell Health", "type": "other"}, {"name": "SciTech Daily", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'avocado oil',
    75,
    20,
    65,
    67,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Cleveland Clinic", "type": "institution"}, {"name": "Zoe", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cow milk (whole)',
    65,
    45,
    60,
    58,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard Nutrition", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cow milk (skim)',
    60,
    40,
    65,
    59,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}, {"name": "Dairy Council", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cow milk (2%)',
    62,
    42,
    62,
    58,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'goat milk',
    68,
    40,
    70,
    62,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sheep milk',
    65,
    45,
    68,
    59,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'heavy cream',
    90,
    65,
    75,
    64,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'light cream',
    85,
    60,
    75,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'half and half',
    80,
    55,
    72,
    63,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sour cream',
    85,
    50,
    70,
    65,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'greek yogurt',
    70,
    30,
    80,
    67,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'plain yogurt',
    65,
    35,
    75,
    64,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kefir',
    68,
    25,
    85,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cottage cheese',
    72,
    40,
    70,
    63,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cheddar cheese',
    88,
    55,
    65,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mozzarella cheese',
    85,
    50,
    68,
    65,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'parmesan cheese',
    88,
    52,
    62,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'feta cheese',
    82,
    48,
    65,
    64,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cream cheese',
    85,
    58,
    65,
    62,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ricotta cheese',
    75,
    45,
    70,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brie cheese',
    85,
    50,
    65,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'gouda cheese',
    85,
    52,
    65,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'swiss cheese',
    85,
    50,
    68,
    65,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blue cheese',
    82,
    45,
    62,
    64,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'whey protein',
    75,
    30,
    65,
    64,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'casein protein',
    72,
    35,
    62,
    62,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lactose',
    40,
    50,
    40,
    45,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'soy milk',
    72,
    30,
    75,
    66,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'almond milk (unsweetened)',
    88,
    30,
    75,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oat milk',
    55,
    35,
    72,
    60,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut milk',
    82,
    50,
    70,
    64,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rice milk',
    35,
    45,
    68,
    52,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cashew milk',
    85,
    32,
    72,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hemp milk',
    80,
    28,
    75,
    69,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'macadamia milk',
    85,
    30,
    72,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vegan cheese',
    78,
    45,
    60,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'eggs (whole)',
    85,
    45,
    75,
    66,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'egg whites',
    90,
    30,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'egg yolks',
    82,
    55,
    70,
    62,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tofu (firm)',
    78,
    28,
    75,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tofu (silken)',
    76,
    28,
    78,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tempeh',
    75,
    25,
    82,
    70,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'seitan',
    65,
    45,
    45,
    54,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pea protein isolate',
    78,
    28,
    68,
    66,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'collagen peptides',
    88,
    32,
    72,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'gelatin',
    85,
    35,
    70,
    68,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'textured vegetable protein',
    72,
    38,
    65,
    62,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'edamame',
    72,
    25,
    78,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lentils (red)',
    55,
    22,
    82,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lentils (green)',
    58,
    22,
    82,
    66,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lentils (brown)',
    56,
    22,
    82,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chickpeas',
    52,
    25,
    80,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'black beans',
    50,
    22,
    82,
    63,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kidney beans',
    48,
    25,
    80,
    62,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pinto beans',
    50,
    24,
    80,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'navy beans',
    52,
    24,
    80,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lima beans',
    55,
    28,
    78,
    63,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cannellini beans',
    52,
    26,
    80,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'split peas',
    50,
    25,
    80,
    62,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'quinoa',
    55,
    28,
    78,
    62,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'almonds',
    85,
    22,
    75,
    71,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'walnuts',
    85,
    18,
    75,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cashews',
    80,
    28,
    72,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pistachios',
    78,
    22,
    75,
    70,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pecans',
    88,
    22,
    72,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hazelnuts',
    85,
    22,
    72,
    71,
    '{"score": 26, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brazil nuts',
    88,
    28,
    70,
    70,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'macadamia nuts',
    90,
    25,
    72,
    71,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pine nuts',
    85,
    28,
    72,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pumpkin seeds',
    82,
    25,
    78,
    70,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sunflower seeds',
    80,
    32,
    75,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chia seeds',
    85,
    18,
    88,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'flax seeds',
    88,
    18,
    85,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hemp seeds',
    85,
    22,
    80,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sesame seeds',
    82,
    28,
    75,
    69,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'poppy seeds',
    82,
    32,
    72,
    68,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'wheat flour (white)',
    25,
    65,
    40,
    38,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'all-purpose flour',
    25,
    65,
    42,
    38,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'whole wheat flour',
    48,
    45,
    72,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread flour',
    28,
    62,
    42,
    40,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cake flour',
    22,
    68,
    40,
    36,
    '{"score": 68, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pastry flour',
    24,
    66,
    42,
    38,
    '{"score": 66, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'almond flour',
    88,
    25,
    70,
    70,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut flour',
    75,
    32,
    78,
    67,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rice flour (white)',
    30,
    45,
    70,
    50,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brown rice flour',
    45,
    40,
    72,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oat flour',
    55,
    32,
    78,
    62,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'buckwheat flour',
    58,
    28,
    78,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'spelt flour',
    48,
    40,
    70,
    56,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rye flour',
    52,
    35,
    75,
    60,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cornmeal',
    45,
    45,
    68,
    54,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'corn flour',
    42,
    48,
    65,
    52,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'masa harina',
    48,
    45,
    68,
    55,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'barley flour',
    52,
    32,
    78,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'millet flour',
    55,
    38,
    72,
    59,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sorghum flour',
    52,
    35,
    72,
    59,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'teff flour',
    55,
    32,
    75,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'amaranth flour',
    55,
    30,
    75,
    61,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'quinoa flour',
    55,
    30,
    75,
    61,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chickpea flour',
    55,
    30,
    75,
    62,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lentil flour',
    52,
    28,
    75,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cassava flour',
    35,
    45,
    68,
    52,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tapioca flour',
    25,
    50,
    65,
    47,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cornstarch',
    20,
    55,
    60,
    44,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'potato starch',
    15,
    52,
    55,
    42,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'arrowroot starch',
    25,
    45,
    65,
    48,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'white rice',
    30,
    55,
    65,
    47,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brown rice',
    50,
    38,
    75,
    59,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'basmati rice (white)',
    42,
    50,
    68,
    52,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Glycemic Index", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'jasmine rice',
    28,
    55,
    65,
    47,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Glycemic Index", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'wild rice',
    55,
    35,
    78,
    61,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'black rice',
    58,
    28,
    78,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oats (rolled)',
    55,
    28,
    82,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'steel-cut oats',
    60,
    28,
    82,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'instant oats',
    45,
    35,
    78,
    58,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'barley (pearled)',
    48,
    32,
    78,
    60,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'barley (hulled)',
    55,
    28,
    80,
    63,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bulgur wheat',
    52,
    32,
    78,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'couscous',
    35,
    50,
    62,
    49,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'whole wheat couscous',
    50,
    42,
    72,
    57,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'semolina',
    35,
    52,
    60,
    48,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'farro',
    52,
    35,
    75,
    60,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'freekeh',
    55,
    32,
    78,
    62,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kamut',
    52,
    35,
    75,
    60,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'baking soda',
    95,
    30,
    60,
    69,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'baking powder',
    92,
    32,
    62,
    68,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'active dry yeast',
    88,
    32,
    70,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'instant yeast',
    88,
    32,
    70,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fresh yeast',
    88,
    30,
    72,
    71,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'nutritional yeast',
    85,
    25,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cream of tartar',
    92,
    35,
    65,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ammonium bicarbonate',
    90,
    35,
    55,
    66,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Baking references", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'agar-agar',
    90,
    28,
    75,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'gelatin',
    88,
    35,
    68,
    68,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pectin',
    88,
    28,
    78,
    72,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'xanthan gum',
    92,
    38,
    55,
    66,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'guar gum',
    88,
    35,
    55,
    65,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'locust bean gum',
    90,
    35,
    60,
    67,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'carrageenan',
    88,
    55,
    35,
    56,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "EFSA controversies", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cellulose gum',
    90,
    42,
    55,
    64,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'methylcellulose',
    90,
    45,
    52,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'modified food starch',
    70,
    45,
    55,
    58,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maltodextrin',
    15,
    65,
    45,
    36,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dextrin',
    20,
    60,
    50,
    40,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lecithin (soy)',
    92,
    32,
    70,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lecithin (sunflower)',
    92,
    30,
    72,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mono and diglycerides',
    88,
    50,
    50,
    61,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'polysorbate 80',
    88,
    60,
    35,
    55,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium alginate',
    90,
    35,
    65,
    68,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'salt (sodium chloride)',
    90,
    50,
    70,
    66,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "AHA", "type": "other"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'citric acid',
    92,
    28,
    65,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ascorbic acid',
    92,
    20,
    75,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tocopherols',
    92,
    18,
    72,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rosemary extract',
    92,
    20,
    75,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "European Food Safety Authority", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium benzoate',
    90,
    50,
    45,
    61,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'potassium sorbate',
    90,
    45,
    50,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium nitrite',
    88,
    65,
    40,
    56,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "IARC", "type": "other"}, {"name": "WHO", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium nitrate',
    88,
    65,
    40,
    56,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "IARC", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'calcium propionate',
    90,
    45,
    50,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sulfur dioxide',
    88,
    50,
    40,
    59,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sodium sulfite',
    88,
    52,
    38,
    58,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bha (butylated hydroxyanisole)',
    88,
    60,
    45,
    58,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "IARC", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bht (butylated hydroxytoluene)',
    88,
    58,
    45,
    58,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tbhq',
    88,
    62,
    42,
    57,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'calcium disodium edta',
    90,
    45,
    50,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'msg (monosodium glutamate)',
    90,
    35,
    58,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'disodium inosinate',
    90,
    38,
    58,
    66,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'disodium guanylate',
    90,
    38,
    58,
    66,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'autolyzed yeast extract',
    88,
    35,
    60,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hydrolyzed vegetable protein',
    82,
    42,
    55,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'natural flavors',
    85,
    40,
    60,
    65,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'artificial flavors',
    85,
    45,
    55,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vanilla extract',
    88,
    28,
    72,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vanillin',
    88,
    38,
    65,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'smoke flavor',
    88,
    45,
    55,
    64,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beta-carotene',
    92,
    20,
    75,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'annatto',
    90,
    32,
    68,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'turmeric (curcumin)',
    88,
    15,
    75,
    74,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beet juice',
    75,
    25,
    78,
    69,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'paprika extract',
    90,
    28,
    72,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'saffron',
    90,
    22,
    72,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'spirulina extract',
    88,
    22,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chlorophyll',
    90,
    28,
    72,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'caramel color',
    78,
    45,
    55,
    61,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'red 40 (allura red)',
    90,
    55,
    40,
    59,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "CSPI", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'yellow 5 (tartrazine)',
    90,
    55,
    40,
    59,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'yellow 6 (sunset yellow)',
    90,
    55,
    40,
    59,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blue 1 (brilliant blue)',
    90,
    52,
    45,
    60,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blue 2 (indigotine)',
    90,
    52,
    45,
    60,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'red 3 (erythrosine)',
    88,
    58,
    38,
    57,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vinegar (distilled)',
    88,
    28,
    72,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'apple cider vinegar',
    85,
    25,
    75,
    71,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'balsamic vinegar',
    75,
    28,
    72,
    67,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rice vinegar',
    85,
    30,
    70,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lemon juice',
    88,
    22,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lime juice',
    88,
    22,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lactic acid',
    90,
    28,
    75,
    72,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'malic acid',
    90,
    32,
    68,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tartaric acid',
    90,
    35,
    65,
    68,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'phosphoric acid',
    88,
    60,
    45,
    59,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acetic acid',
    88,
    30,
    70,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cinnamon',
    85,
    18,
    78,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ginger',
    88,
    15,
    82,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'turmeric',
    88,
    12,
    78,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'black pepper',
    92,
    25,
    75,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cayenne pepper',
    88,
    22,
    72,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'paprika',
    90,
    28,
    72,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cumin',
    90,
    25,
    78,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coriander',
    90,
    28,
    75,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oregano',
    92,
    20,
    78,
    75,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'basil',
    92,
    22,
    78,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rosemary',
    92,
    18,
    78,
    75,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'thyme',
    92,
    20,
    78,
    75,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sage',
    90,
    22,
    75,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'parsley',
    92,
    25,
    78,
    74,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dill',
    92,
    28,
    75,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mint',
    92,
    25,
    80,
    74,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'garlic (powder)',
    88,
    15,
    80,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'onion (powder)',
    85,
    22,
    78,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chili powder',
    88,
    22,
    72,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'curry powder',
    88,
    18,
    75,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'nutmeg',
    90,
    30,
    68,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cloves',
    90,
    20,
    72,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cardamom',
    90,
    25,
    75,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fennel',
    90,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mustard (powder)',
    88,
    28,
    72,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'apple (raw)',
    65,
    22,
    82,
    68,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'banana (raw)',
    48,
    28,
    78,
    60,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'orange (raw)',
    62,
    22,
    78,
    65,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'strawberries (raw)',
    72,
    18,
    82,
    70,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blueberries (raw)',
    70,
    12,
    85,
    71,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'raspberries (raw)',
    78,
    18,
    85,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'blackberries (raw)',
    78,
    18,
    85,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'grapes (raw)',
    52,
    25,
    75,
    61,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mango (raw)',
    45,
    28,
    75,
    59,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pineapple (raw)',
    50,
    28,
    72,
    59,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'papaya (raw)',
    55,
    25,
    78,
    63,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kiwi (raw)',
    68,
    22,
    82,
    68,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pomegranate',
    72,
    15,
    80,
    70,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cherries (raw)',
    65,
    20,
    78,
    66,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'peaches (raw)',
    62,
    28,
    78,
    64,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'plums (raw)',
    60,
    28,
    80,
    64,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'apricots (raw)',
    62,
    28,
    78,
    64,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'watermelon',
    40,
    32,
    75,
    56,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cantaloupe',
    55,
    30,
    75,
    61,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'honeydew',
    50,
    32,
    72,
    58,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'avocado',
    88,
    18,
    82,
    74,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut (raw)',
    78,
    40,
    75,
    66,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dried cranberries',
    35,
    38,
    55,
    50,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'raisins',
    38,
    38,
    60,
    52,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dates',
    42,
    32,
    72,
    57,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'prunes',
    48,
    28,
    82,
    61,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dried apricots',
    45,
    32,
    65,
    56,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dried figs',
    45,
    30,
    75,
    59,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'freeze-dried fruit',
    55,
    28,
    70,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fruit juice concentrate',
    20,
    70,
    35,
    34,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'spinach (raw)',
    92,
    12,
    85,
    78,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kale (raw)',
    92,
    10,
    82,
    77,
    '{"score": 12, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'arugula',
    92,
    18,
    82,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'swiss chard',
    92,
    15,
    82,
    76,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'romaine lettuce',
    92,
    25,
    80,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'broccoli (raw)',
    90,
    12,
    85,
    77,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cauliflower (raw)',
    90,
    18,
    82,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'brussels sprouts',
    88,
    15,
    78,
    74,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cabbage (raw)',
    90,
    22,
    82,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bok choy',
    92,
    20,
    82,
    75,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'carrots (raw)',
    65,
    25,
    80,
    66,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sweet potato',
    55,
    22,
    82,
    64,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beets (raw)',
    58,
    22,
    82,
    65,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'turnips',
    72,
    28,
    78,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'radishes',
    88,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'parsnips',
    52,
    30,
    78,
    61,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'celery',
    92,
    28,
    78,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'asparagus',
    88,
    22,
    82,
    73,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'artichoke',
    82,
    22,
    88,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bell peppers',
    85,
    18,
    80,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tomatoes (raw)',
    78,
    20,
    80,
    71,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'eggplant',
    85,
    25,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'zucchini',
    88,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'yellow squash',
    88,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'butternut squash',
    58,
    25,
    78,
    64,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acorn squash',
    60,
    28,
    78,
    64,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pumpkin',
    62,
    25,
    78,
    64,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cucumber',
    92,
    30,
    80,
    73,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mushrooms (button)',
    92,
    25,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'shiitake mushrooms',
    90,
    18,
    80,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'portobello mushrooms',
    90,
    25,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'onions',
    78,
    22,
    80,
    70,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'garlic',
    85,
    12,
    82,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'leeks',
    82,
    25,
    82,
    71,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'scallions',
    88,
    25,
    80,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'corn (sweet)',
    48,
    35,
    72,
    58,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'green peas',
    58,
    28,
    78,
    63,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'green beans',
    85,
    28,
    78,
    71,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'snow peas',
    82,
    28,
    78,
    70,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coffee (black)',
    88,
    22,
    75,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'green tea',
    90,
    15,
    82,
    76,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'black tea',
    88,
    22,
    78,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'matcha',
    88,
    12,
    80,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'herbal tea (chamomile)',
    92,
    25,
    80,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'herbal tea (peppermint)',
    92,
    28,
    82,
    74,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cocoa powder (unsweetened)',
    82,
    15,
    78,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dark chocolate (70%+)',
    68,
    18,
    72,
    67,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'milk chocolate',
    40,
    50,
    60,
    50,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'alcohol (red wine)',
    55,
    38,
    50,
    55,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "AHA", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'alcohol (beer)',
    35,
    55,
    45,
    44,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'alcohol (spirits)',
    70,
    60,
    40,
    52,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut water',
    62,
    28,
    75,
    63,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sparkling water',
    95,
    25,
    78,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'soy sauce',
    85,
    45,
    55,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tamari',
    85,
    42,
    58,
    64,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fish sauce',
    88,
    48,
    52,
    62,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'worcestershire sauce',
    82,
    42,
    55,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hot sauce',
    88,
    25,
    65,
    69,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sriracha',
    75,
    28,
    62,
    64,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ketchup',
    52,
    45,
    60,
    54,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mustard (yellow)',
    92,
    28,
    72,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dijon mustard',
    92,
    28,
    72,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mayonnaise',
    88,
    50,
    65,
    64,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ranch dressing',
    78,
    58,
    55,
    58,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'italian dressing',
    82,
    38,
    65,
    65,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'balsamic glaze',
    45,
    35,
    65,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tahini',
    82,
    25,
    75,
    70,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'peanut butter (natural)',
    78,
    28,
    72,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'almond butter',
    82,
    22,
    72,
    69,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hummus',
    70,
    25,
    78,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'guacamole',
    82,
    20,
    80,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'salsa (fresh)',
    85,
    22,
    78,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pesto',
    82,
    25,
    72,
    69,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'teriyaki sauce',
    42,
    52,
    52,
    48,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hoisin sauce',
    38,
    55,
    50,
    46,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oyster sauce',
    72,
    48,
    52,
    57,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'miso paste',
    75,
    28,
    80,
    68,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'nutritional yeast',
    85,
    25,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chicken breast (skinless)',
    92,
    32,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chicken thigh (skinless)',
    90,
    38,
    78,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chicken (with skin)',
    88,
    45,
    75,
    67,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'turkey breast',
    92,
    30,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ground turkey (lean)',
    88,
    35,
    75,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'duck',
    85,
    45,
    72,
    66,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beef (lean cuts)',
    88,
    45,
    72,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beef (ground, 90% lean)',
    85,
    48,
    70,
    65,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beef (ground, 80% lean)',
    82,
    55,
    68,
    63,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'steak (sirloin)',
    88,
    45,
    72,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'steak (ribeye)',
    82,
    52,
    70,
    64,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pork tenderloin',
    88,
    38,
    75,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pork chop (lean)',
    85,
    42,
    72,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pork (ground)',
    82,
    52,
    68,
    63,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bacon',
    78,
    70,
    55,
    56,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "IARC", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ham',
    80,
    60,
    55,
    58,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "IARC", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sausage (pork)',
    75,
    65,
    52,
    55,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "IARC", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hot dog',
    72,
    72,
    48,
    52,
    '{"score": 68, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "IARC", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'deli turkey',
    82,
    52,
    55,
    60,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lamb (lean)',
    85,
    45,
    70,
    66,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'venison',
    90,
    32,
    75,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bison',
    88,
    35,
    75,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'liver (beef)',
    80,
    40,
    68,
    66,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'liver (chicken)',
    82,
    38,
    70,
    67,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'salmon (wild)',
    88,
    12,
    80,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'salmon (farmed)',
    85,
    18,
    78,
    73,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tuna (fresh)',
    90,
    20,
    78,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tuna (canned, light)',
    88,
    25,
    75,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tuna (canned, albacore)',
    85,
    28,
    72,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sardines',
    90,
    15,
    82,
    76,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mackerel',
    88,
    15,
    80,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'herring',
    88,
    15,
    80,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'anchovies',
    90,
    18,
    78,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cod',
    92,
    28,
    78,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tilapia',
    90,
    40,
    75,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'halibut',
    90,
    28,
    78,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mahi-mahi',
    90,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'snapper',
    90,
    30,
    78,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'catfish',
    88,
    35,
    75,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'trout (rainbow)',
    88,
    18,
    78,
    74,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sea bass',
    90,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'flounder',
    92,
    30,
    78,
    73,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sole',
    92,
    30,
    78,
    73,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'shrimp',
    90,
    32,
    75,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lobster',
    90,
    32,
    75,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'crab',
    90,
    30,
    75,
    71,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'scallops',
    90,
    30,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mussels',
    88,
    25,
    78,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oysters',
    88,
    22,
    78,
    72,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'clams',
    88,
    25,
    78,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'calamari (squid)',
    88,
    35,
    72,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'octopus',
    88,
    35,
    72,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (white)',
    28,
    62,
    48,
    41,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (whole wheat)',
    50,
    42,
    70,
    57,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (sourdough)',
    55,
    38,
    72,
    59,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (rye)',
    55,
    38,
    72,
    59,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bread (multigrain)',
    52,
    42,
    68,
    57,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tortilla (flour)',
    35,
    55,
    55,
    46,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tortilla (corn)',
    48,
    45,
    68,
    55,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pasta (white)',
    38,
    55,
    55,
    47,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pasta (whole wheat)',
    52,
    42,
    72,
    58,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pasta (gluten-free)',
    38,
    48,
    60,
    50,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'crackers (whole grain)',
    48,
    45,
    62,
    54,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'crackers (refined)',
    30,
    60,
    52,
    43,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chips (potato)',
    35,
    68,
    42,
    41,
    '{"score": 68, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chips (tortilla)',
    38,
    62,
    48,
    45,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'popcorn (air-popped)',
    70,
    32,
    78,
    66,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'popcorn (butter)',
    55,
    52,
    68,
    55,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pretzels',
    35,
    58,
    55,
    46,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'granola bar',
    42,
    52,
    55,
    49,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'protein bar',
    55,
    45,
    55,
    53,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cereal (sugary)',
    20,
    70,
    40,
    36,
    '{"score": 72, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cereal (whole grain, low sugar)',
    55,
    38,
    72,
    59,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'oatmeal (instant, flavored)',
    45,
    42,
    72,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pancake mix',
    28,
    62,
    48,
    41,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'waffle (frozen)',
    30,
    62,
    48,
    42,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'pizza (frozen)',
    32,
    65,
    42,
    40,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'frozen vegetables',
    85,
    25,
    82,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'frozen fruit',
    72,
    25,
    80,
    68,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'canned tomatoes',
    78,
    22,
    75,
    69,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'canned beans',
    55,
    28,
    78,
    62,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'canned soup',
    55,
    52,
    55,
    52,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'instant noodles',
    25,
    70,
    38,
    37,
    '{"score": 72, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bouillon/stock cubes',
    82,
    60,
    52,
    58,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'soy protein isolate',
    78,
    38,
    62,
    63,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rice protein',
    80,
    35,
    68,
    66,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'protein powder (blend)',
    78,
    35,
    62,
    64,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mct oil',
    92,
    32,
    55,
    67,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'monk fruit',
    95,
    28,
    72,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'allulose',
    92,
    30,
    60,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tagatose',
    85,
    35,
    55,
    64,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'yacon syrup',
    75,
    28,
    80,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'coconut sugar',
    40,
    52,
    58,
    49,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Glycemic Index", "type": "other"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'date sugar',
    48,
    42,
    68,
    56,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lucuma',
    68,
    35,
    68,
    63,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'sucralose',
    95,
    45,
    45,
    63,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'aspartame',
    95,
    48,
    50,
    64,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'saccharin',
    95,
    50,
    48,
    63,
    '{"score": 50, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acesulfame-k',
    95,
    48,
    50,
    64,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'neotame',
    95,
    45,
    52,
    65,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'advantame',
    95,
    45,
    52,
    65,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'glycerol/glycerin',
    78,
    42,
    45,
    58,
    '{"score": 42, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mannitol',
    80,
    45,
    25,
    54,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'isomalt',
    85,
    45,
    30,
    56,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "European Food Safety Authority", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lactitol',
    82,
    45,
    28,
    55,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "European Food Safety Authority", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maltitol',
    55,
    52,
    30,
    46,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'hydrogenated starch hydrolysates',
    72,
    48,
    35,
    53,
    '{"score": 50, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'trehalose',
    55,
    45,
    58,
    55,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'isomaltulose',
    68,
    38,
    65,
    61,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'nutritional yeast',
    85,
    25,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'spirulina',
    85,
    18,
    75,
    72,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'chlorella',
    85,
    20,
    78,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'wheatgrass',
    88,
    22,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'maca powder',
    82,
    30,
    72,
    68,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ashwagandha',
    88,
    22,
    72,
    70,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'ginseng',
    82,
    28,
    68,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'rhodiola',
    88,
    28,
    70,
    69,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'matcha powder',
    88,
    12,
    80,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cacao nibs',
    82,
    15,
    78,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'carob powder',
    65,
    30,
    78,
    65,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acai powder',
    75,
    18,
    75,
    69,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'goji berries (dried)',
    58,
    22,
    72,
    63,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'bee pollen',
    72,
    28,
    68,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'royal jelly',
    78,
    32,
    65,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'propolis',
    90,
    22,
    72,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'inulin',
    88,
    28,
    75,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'fos (fructooligosaccharides)',
    85,
    28,
    72,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'gos (galactooligosaccharides)',
    85,
    28,
    75,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'resistant dextrin',
    78,
    32,
    78,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'psyllium husk',
    85,
    22,
    85,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'acacia fiber',
    88,
    28,
    82,
    73,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beta-glucan (oat)',
    80,
    22,
    82,
    71,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'konjac/glucomannan',
    88,
    28,
    78,
    72,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'seaweed (nori)',
    92,
    20,
    78,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'kelp',
    90,
    22,
    75,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'wakame',
    90,
    22,
    78,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'dulse',
    90,
    22,
    75,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'irish moss',
    88,
    30,
    72,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'tempeh bacon',
    78,
    32,
    72,
    67,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'beyond meat',
    65,
    45,
    58,
    57,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'impossible burger',
    65,
    45,
    58,
    57,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'jackfruit (young)',
    62,
    28,
    78,
    64,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'vital wheat gluten',
    72,
    42,
    40,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'lupin flour',
    78,
    28,
    72,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'cricket flour',
    82,
    28,
    72,
    69,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'mycoprotein (quorn)',
    75,
    32,
    65,
    64,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}'::jsonb,
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    'aquafaba',
    85,
    32,
    70,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}'::jsonb,
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();

COMMIT;