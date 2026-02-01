-- Aurea Ingredients Database Import (SQLite)
-- Generated: 2026-01-31T22:59:07.931118
-- Total: 510 ingredients

BEGIN TRANSACTION;


INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3a76e95e-1a4c-4cf0-bbe0-f645642529cc',
    'sugar (white, brown)',
    10,
    75,
    40,
    31,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "institution"}, {"name": "Stanford Med", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "British Medical Journal", "type": "journal"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd0fe7130-7a5d-4f4d-a9e9-b93dfba9c2cd',
    'high-fructose corn syrup',
    10,
    80,
    40,
    30,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Princeton Research", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Frontiers in Nutrition", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd309f380-85be-49af-ab42-2a108a30f063',
    'honey',
    25,
    55,
    60,
    45,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Nature", "type": "journal"}, {"name": "Cardiometabolic Health", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "Mayo Clinic", "type": "institution"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b70b8c0d-6abe-4e20-97f5-d1d59326e380',
    'maple syrup',
    30,
    55,
    60,
    46,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Canadian Maple", "type": "other"}, {"name": "Diabetes Care Community", "type": "other"}, {"name": "Indiana Maple Syrup", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f500f620-2a4d-48fd-bc4d-a85e325d77c7',
    'agave nectar',
    35,
    75,
    45,
    40,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "health_media"}, {"name": "WebMD", "type": "health_media"}, {"name": "Medical News Today", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5053f3e8-58c7-4baa-aff6-b08960d74adc',
    'molasses',
    35,
    50,
    55,
    49,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "health_media"}, {"name": "Dr. Axe", "type": "other"}, {"name": "Taylor & Francis", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f73a8a78-ed3f-4c5a-a1cd-db0ff22f2409',
    'stevia',
    90,
    30,
    70,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "European Food Safety Authority", "type": "regulatory"}, {"name": "Sweeteners.org", "type": "other"}, {"name": "ScienceDirect", "type": "research"}, {"name": "WebMD", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '233b92a4-9a0d-4d17-b43b-a52fdd1c1c0c',
    'erythritol',
    95,
    40,
    60,
    67,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Health.com", "type": "other"}, {"name": "Cleveland Clinic", "type": "institution"}, {"name": "WebMD", "type": "health_media"}, {"name": "Nutrition Facts", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd054aee7-68a8-4dd4-b4dc-722d1b76583a',
    'xylitol',
    80,
    45,
    35,
    55,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Healthline", "type": "health_media"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Sage Journals", "type": "other"}, {"name": "VeryWell Health", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '23bbd2f4-c8cf-46c3-a08e-bfd30a38b772',
    'maltose',
    5,
    75,
    60,
    35,
    '{"score": 75, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "MedicineNet", "type": "other"}, {"name": "Blue Circle", "type": "other"}, {"name": "Dr. Axe", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '99c38811-23b7-409e-851d-8ebf094ea911',
    'dextrose',
    5,
    75,
    60,
    35,
    '{"score": 75, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Glycemic Index", "type": "other"}, {"name": "WebMD", "type": "health_media"}, {"name": "Cleveland Clinic", "type": "institution"}, {"name": "Medical News Today", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ef62a911-fb2c-4d2c-812b-a0d6cb57cd2c',
    'glucose syrup',
    5,
    75,
    60,
    35,
    '{"score": 75, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Glycemic Index", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Ragus", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "Academic OUP", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ca783e7e-0e51-41fe-b37e-71d8de3787f2',
    'fructose',
    60,
    75,
    45,
    47,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Physiology.org", "type": "other"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Glycemic Index", "type": "other"}, {"name": "Penn Medicine", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a614946b-0294-47e2-91c0-df7679bbb334',
    'invert sugar',
    10,
    75,
    60,
    37,
    '{"score": 75, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "VeryWell Health", "type": "other"}, {"name": "Fitelo", "type": "other"}, {"name": "Vively", "type": "other"}, {"name": "Oreate AI", "type": "other"}, {"name": "Webstaurant Store", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '06479ba8-eeff-418f-91fd-56a33671dd00',
    'sorbitol',
    80,
    45,
    25,
    53,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "ScienceDirect", "type": "research"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Elchemy", "type": "other"}, {"name": "Hydratis", "type": "other"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a095b79d-306f-4e2e-99fd-2cbc2b390a90',
    'butter',
    95,
    60,
    80,
    67,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Ultrahuman", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Academic OUP", "type": "other"}, {"name": "USU Extension", "type": "other"}, {"name": "Joslin", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0fd6c1c4-5f53-4dc0-a459-99b18c9efb7c',
    'margarine',
    85,
    65,
    70,
    60,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "institution"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Mayo Clinic", "type": "institution"}, {"name": "Eating Well", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2bfd30fd-4976-4b10-8c04-cedc59eaae35',
    'vegetable oil',
    95,
    60,
    85,
    65,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Stanford Med", "type": "other"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Nutrition.org", "type": "other"}, {"name": "UC News", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b7b53eb0-5f33-4cab-ba4e-891169375531',
    'canola oil',
    98,
    30,
    90,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Managed Healthcare Executive", "type": "other"}, {"name": "Diabetes Journals", "type": "other"}, {"name": "U of T", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd7ca6c5d-e7bd-44ae-bc20-f6f88251cbb5',
    'sunflower oil',
    65,
    45,
    50,
    57,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Sugarfit", "type": "other"}, {"name": "Zeroacre", "type": "other"}, {"name": "BHF", "type": "other"}, {"name": "Stanford Med", "type": "other"}, {"name": "Health.com", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '913a8236-9c94-4728-a370-74e5afa47e82',
    'olive oil',
    85,
    10,
    80,
    76,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "About Olive Oil", "type": "other"}, {"name": "Nature", "type": "journal"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "BHOOC", "type": "other"}, {"name": "Diabetes Journals", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ab71b3db-fb13-432b-972f-e6b7770c4a1f',
    'coconut oil',
    55,
    40,
    55,
    56,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "BMJ Open", "type": "other"}, {"name": "ACC", "type": "other"}, {"name": "JAMA Network", "type": "other"}, {"name": "ScienceDirect", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2c7d1571-d525-40b1-be80-7bfc22acc8c8',
    'palm oil',
    55,
    40,
    50,
    54,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Nature", "type": "journal"}, {"name": "ScienceDirect", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '291f9717-c786-4e9b-bccb-fbff4b168f77',
    'shortening',
    45,
    30,
    45,
    55,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "Harvard Nutrition Source", "type": "institution"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}, {"name": "Lipid.org", "type": "other"}, {"name": "Dr. Axe", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '70844da6-bdbc-4e2e-9ff0-c9e68723488f',
    'lard',
    55,
    40,
    50,
    54,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "General saturated fat research", "type": "other"}, {"name": "PubMed cohorts", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '28e6b334-ae52-43dc-8602-1cb4d7c32474',
    'ghee',
    60,
    40,
    55,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "ScienceDirect", "type": "research"}, {"name": "Cambridge Core", "type": "other"}, {"name": "WebMD", "type": "health_media"}, {"name": "Cleveland Clinic", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0d490add-7ebb-4920-9ef9-ead66ea23228',
    'peanut oil',
    75,
    40,
    55,
    60,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "WebMD", "type": "health_media"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'df6d6eb3-3643-401d-8bb9-ec348b9fa697',
    'soybean oil',
    55,
    40,
    50,
    54,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "ScienceDirect", "type": "research"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "PLOS ONE", "type": "other"}, {"name": "UC Riverside News", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f6773e6c-17d7-4077-9e81-9b2bdc7bc74c',
    'fish oil',
    70,
    15,
    65,
    67,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "WHO", "type": "other"}, {"name": "Nutrition Insight", "type": "other"}, {"name": "VeryWell Health", "type": "other"}, {"name": "SciTech Daily", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4998c7f3-2851-44d5-a598-f5dceeec56ea',
    'avocado oil',
    75,
    20,
    65,
    67,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "User Research (Verified)", "type": "primary", "trusted": true}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Cleveland Clinic", "type": "institution"}, {"name": "Zoe", "type": "other"}, {"name": "Healthline", "type": "health_media"}, {"name": "ScienceDirect", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '22bdec08-17bf-4db1-afed-b762d763a16e',
    'cow milk (whole)',
    65,
    45,
    60,
    58,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard Nutrition", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5cc35177-25d7-484a-a0a6-6b3793cecdd9',
    'cow milk (skim)',
    60,
    40,
    65,
    59,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}, {"name": "Dairy Council", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '94a9cc59-6d02-485e-8117-f90e2717c1bc',
    'cow milk (2%)',
    62,
    42,
    62,
    58,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fc97a2b8-85ee-4fc0-bd6d-ccbbb1013a2f',
    'goat milk',
    68,
    40,
    70,
    62,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5598bfba-9084-4daf-b66b-e737b64975a4',
    'sheep milk',
    65,
    45,
    68,
    59,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "ScienceDirect", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '09e44ede-d0be-40be-a685-f0ba32e4aef0',
    'heavy cream',
    90,
    65,
    75,
    64,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1880e241-13fb-4c56-82a9-20084923c7cd',
    'light cream',
    85,
    60,
    75,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd88e6a36-568d-4f61-94c9-15948c42fe21',
    'half and half',
    80,
    55,
    72,
    63,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1c3d8931-eaab-4a35-8178-bcddcc5eb6c7',
    'sour cream',
    85,
    50,
    70,
    65,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '91383557-48e1-42df-82a1-c9d9134d94aa',
    'greek yogurt',
    70,
    30,
    80,
    67,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1cb60403-f334-4736-ac3a-7f080df9a35e',
    'plain yogurt',
    65,
    35,
    75,
    64,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0e385d78-8913-463a-a879-0cc0e1a17ee9',
    'kefir',
    68,
    25,
    85,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fa64467d-4a76-4fe3-930b-753d3ebaa8b2',
    'cottage cheese',
    72,
    40,
    70,
    63,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '298ada9a-cc5e-43bb-b689-6b1291822bed',
    'cheddar cheese',
    88,
    55,
    65,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '135e825b-9850-436f-8e40-e6db6604124f',
    'mozzarella cheese',
    85,
    50,
    68,
    65,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f61f9b36-c381-4588-a002-b32232ca17de',
    'parmesan cheese',
    88,
    52,
    62,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '7f2c8489-fdcc-47f2-bd75-1a330d4a2726',
    'feta cheese',
    82,
    48,
    65,
    64,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '03917ce4-635b-40f9-91f7-60467596a4af',
    'cream cheese',
    85,
    58,
    65,
    62,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2681a663-515b-4d70-9948-9f171b0ae3e1',
    'ricotta cheese',
    75,
    45,
    70,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e303d58f-1c85-426a-b809-3e00d3f06295',
    'brie cheese',
    85,
    50,
    65,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '22bfc5f0-52b2-4c41-bab1-6ea0cae4ab5e',
    'gouda cheese',
    85,
    52,
    65,
    64,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e2b1492a-1c89-4f23-b448-7b00074143a1',
    'swiss cheese',
    85,
    50,
    68,
    65,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '002d5fa8-830d-4cf4-b42b-9d6fa2087ade',
    'blue cheese',
    82,
    45,
    62,
    64,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b6579597-e578-4614-9f28-e56a23bb73f0',
    'whey protein',
    75,
    30,
    65,
    64,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c6f382e6-da65-4fb1-a1b9-03d5eec61ff6',
    'casein protein',
    72,
    35,
    62,
    62,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c9d92082-bcfc-4edf-8eb6-9325f93d7df2',
    'lactose',
    40,
    50,
    40,
    45,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4da02b7d-e595-4dd2-ba29-06dfb414a47c',
    'soy milk',
    72,
    30,
    75,
    66,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd84602c9-657f-4283-8c15-cd37b743ebd6',
    'almond milk (unsweetened)',
    88,
    30,
    75,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '80886e34-5dc7-4073-a4e5-84947916f2c1',
    'oat milk',
    55,
    35,
    72,
    60,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0b6e3a85-ef1a-44dd-9e2e-b689096e2b4f',
    'coconut milk',
    82,
    50,
    70,
    64,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '7ed7288a-cd6b-4ea9-ab2a-92df2fd67c03',
    'rice milk',
    35,
    45,
    68,
    52,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ccb65f64-f13b-459b-acce-cffb962e2cfc',
    'cashew milk',
    85,
    32,
    72,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '71b20bbd-318e-473c-b0d1-75fd56183499',
    'hemp milk',
    80,
    28,
    75,
    69,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '20f6186a-2542-448d-b10c-448cb76c24ea',
    'macadamia milk',
    85,
    30,
    72,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f55b6ab7-10e3-4962-ad03-2cf33f907d26',
    'vegan cheese',
    78,
    45,
    60,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '071e7ae7-b71c-4847-ae91-5bd6bfdce66d',
    'eggs (whole)',
    85,
    45,
    75,
    66,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '07d57a8f-699a-42fd-92fc-0917b05f7152',
    'egg whites',
    90,
    30,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '60921728-26f4-46b5-b581-1bc31618be1c',
    'egg yolks',
    82,
    55,
    70,
    62,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e33d522b-df75-4010-a567-585999ea6137',
    'tofu (firm)',
    78,
    28,
    75,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '216b896c-ec59-43c5-a94a-c72ad296f292',
    'tofu (silken)',
    76,
    28,
    78,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1122b548-e368-47df-ade8-e02d580772af',
    'tempeh',
    75,
    25,
    82,
    70,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9d37fd4a-e828-41af-b7e2-c64152c7d359',
    'seitan',
    65,
    45,
    45,
    54,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a090f481-c2ae-4882-9f63-5e11f5b83d03',
    'pea protein isolate',
    78,
    28,
    68,
    66,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd92108e0-3462-491e-8885-1f1097340f5e',
    'collagen peptides',
    88,
    32,
    72,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '11f7db3d-5ad3-445b-b331-c65454e1c2c2',
    'gelatin',
    85,
    35,
    70,
    68,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e0b092d3-4c6f-423e-b1c5-ec18e266f5d0',
    'textured vegetable protein',
    72,
    38,
    65,
    62,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0bf7718d-f85b-4c3b-8fd0-4f2988bda5e4',
    'edamame',
    72,
    25,
    78,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bc69f365-7f4e-42cc-b5e6-d60d208eb276',
    'lentils (red)',
    55,
    22,
    82,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cab93b7f-230d-482a-80d4-e1eeccb898d8',
    'lentils (green)',
    58,
    22,
    82,
    66,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c3cbdf2c-89e5-4bcf-b75c-00ab3d9db8c0',
    'lentils (brown)',
    56,
    22,
    82,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'eec44b97-a2c3-46a7-9725-08844dc33cbf',
    'chickpeas',
    52,
    25,
    80,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3144513e-12fd-4f2c-a43e-7c744e44d829',
    'black beans',
    50,
    22,
    82,
    63,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5e2e0004-e48c-4348-a5b2-4d4ded166515',
    'kidney beans',
    48,
    25,
    80,
    62,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c16b5222-cf11-4c5d-9941-a460c2d9279d',
    'pinto beans',
    50,
    24,
    80,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0aa2ccab-10ec-4f85-98c4-32d1080aa85a',
    'navy beans',
    52,
    24,
    80,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4e10b4bd-ecc1-4263-99f0-7b0a93c85ab9',
    'lima beans',
    55,
    28,
    78,
    63,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '29a0ec58-76f3-4339-b904-6229679be0a5',
    'cannellini beans',
    52,
    26,
    80,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '00de2df0-58bc-40cc-8a9b-53322a7cb703',
    'split peas',
    50,
    25,
    80,
    62,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fa266269-0b9e-493e-aeeb-588d72c39cb9',
    'quinoa',
    55,
    28,
    78,
    62,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '147fe41d-ec91-4d51-b28e-8529c490a726',
    'almonds',
    85,
    22,
    75,
    71,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b5298925-9bcc-4e5a-ba83-13760c91c078',
    'walnuts',
    85,
    18,
    75,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'de9535ec-511e-44bf-8a4b-d7058d5469e8',
    'cashews',
    80,
    28,
    72,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f0a6a9fc-fdab-4531-acbd-0303c05b68dc',
    'pistachios',
    78,
    22,
    75,
    70,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '83a88bab-4b90-4c3e-a8d1-9cb0f7ee7bf8',
    'pecans',
    88,
    22,
    72,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ec410b0b-424a-463f-b689-69bf6f785a02',
    'hazelnuts',
    85,
    22,
    72,
    71,
    '{"score": 26, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '07114e53-98a8-46bc-ac9d-5752a2616a4d',
    'brazil nuts',
    88,
    28,
    70,
    70,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '98fb6d8b-b2fb-4613-b249-16531d37802a',
    'macadamia nuts',
    90,
    25,
    72,
    71,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a26eb783-0e5a-4dcc-8711-d9ad0408def1',
    'pine nuts',
    85,
    28,
    72,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd41ac414-7192-402e-8a6a-5d5a05e987a6',
    'pumpkin seeds',
    82,
    25,
    78,
    70,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '759bc53f-a4c3-4db6-adc2-3fe14bee266f',
    'sunflower seeds',
    80,
    32,
    75,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '12fe054f-12fc-47f8-92fb-b8bc31f27c88',
    'chia seeds',
    85,
    18,
    88,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0b75d35f-95b1-4393-8fd0-d204e7f49296',
    'flax seeds',
    88,
    18,
    85,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bf2dfaf7-1080-49cf-a246-746d253880f2',
    'hemp seeds',
    85,
    22,
    80,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd57b0826-11d4-4bf8-95a8-7151a5e70fdf',
    'sesame seeds',
    82,
    28,
    75,
    69,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '90d869b7-cd88-46ad-bc52-c21349dc7c4a',
    'poppy seeds',
    82,
    32,
    72,
    68,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4818de36-d2cf-483a-aa03-cbccbd40db4f',
    'wheat flour (white)',
    25,
    65,
    40,
    38,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '56d7ae9c-650b-4228-b65b-b2b17cf5af89',
    'all-purpose flour',
    25,
    65,
    42,
    38,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a9f647a7-7a7a-4bdd-ab6e-73a639094638',
    'whole wheat flour',
    48,
    45,
    72,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '72d2f062-d7f5-4082-a092-b7baf3194998',
    'bread flour',
    28,
    62,
    42,
    40,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '49130200-cb45-4938-88b7-c3692b6d7ecb',
    'cake flour',
    22,
    68,
    40,
    36,
    '{"score": 68, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5150614e-d245-40ce-9c34-c8aa953996cc',
    'pastry flour',
    24,
    66,
    42,
    38,
    '{"score": 66, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '66f79bff-d068-4fb2-b08e-013ff6246cf2',
    'almond flour',
    88,
    25,
    70,
    70,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1081e11d-2c0b-4851-adb4-542edc75c299',
    'coconut flour',
    75,
    32,
    78,
    67,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '968b77dc-70e5-427f-9a6f-e5619e01bf8f',
    'rice flour (white)',
    30,
    45,
    70,
    50,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'dbb22ea0-fb8f-4718-ad08-31600c595993',
    'brown rice flour',
    45,
    40,
    72,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1e857928-6b32-4b69-9958-642b47d32748',
    'oat flour',
    55,
    32,
    78,
    62,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c61d66b4-9837-457e-b72a-16776dee1ea0',
    'buckwheat flour',
    58,
    28,
    78,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e86d15db-6029-4cdf-b9ed-f068d22fa702',
    'spelt flour',
    48,
    40,
    70,
    56,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5b5b2e17-d3ce-42d2-a954-f8c3f009817f',
    'rye flour',
    52,
    35,
    75,
    60,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ce923554-efb4-46f7-8f94-6c9a97e4d37f',
    'cornmeal',
    45,
    45,
    68,
    54,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '232537fb-e4ab-4620-be2b-ba50236e84db',
    'corn flour',
    42,
    48,
    65,
    52,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'db57e30f-d663-47ee-8c91-24b28443ce30',
    'masa harina',
    48,
    45,
    68,
    55,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0d8a649b-50cf-4d73-b36f-cfb5be7b9fc4',
    'barley flour',
    52,
    32,
    78,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ad83f1a7-fb38-4fd4-96be-6fed74e8bbe2',
    'millet flour',
    55,
    38,
    72,
    59,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2f16c70e-289e-499e-ae39-a96a10d910b3',
    'sorghum flour',
    52,
    35,
    72,
    59,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6ff1847f-825e-46fe-ae39-33fc18974d0e',
    'teff flour',
    55,
    32,
    75,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cdcfc32d-8a7d-4297-8de8-8991da61420f',
    'amaranth flour',
    55,
    30,
    75,
    61,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '221dd20c-b3ed-403d-b971-ea19cd77fb21',
    'quinoa flour',
    55,
    30,
    75,
    61,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '563178e8-9adf-4027-ba63-485353e43350',
    'chickpea flour',
    55,
    30,
    75,
    62,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '38b11935-bee1-46a9-ba6f-492a63f1b628',
    'lentil flour',
    52,
    28,
    75,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '07c8fe1e-d5da-48ef-a508-682192a406f1',
    'cassava flour',
    35,
    45,
    68,
    52,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a481b4c0-a968-48eb-9e80-a4ddf9705505',
    'tapioca flour',
    25,
    50,
    65,
    47,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1ba73648-6088-40e5-ab2c-fdfb72c5a939',
    'cornstarch',
    20,
    55,
    60,
    44,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5ca92023-4a83-4d2d-a192-a81f2b6ad4f5',
    'potato starch',
    15,
    52,
    55,
    42,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6dfa7bb1-9a8c-430f-beeb-df695ef77a1c',
    'arrowroot starch',
    25,
    45,
    65,
    48,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4a0aa7b4-fb9b-4a1a-b731-4c32966ecf55',
    'white rice',
    30,
    55,
    65,
    47,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b5cd8e79-dd69-4982-9639-3a9cebfaad11',
    'brown rice',
    50,
    38,
    75,
    59,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9d33e97c-c2c6-4c15-8c28-1cff5fd29305',
    'basmati rice (white)',
    42,
    50,
    68,
    52,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Glycemic Index", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9a4372f6-2988-4785-89a8-ab1b1db572f7',
    'jasmine rice',
    28,
    55,
    65,
    47,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Glycemic Index", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ab1ab68d-50ac-406b-9711-3a65a7e5eb6d',
    'wild rice',
    55,
    35,
    78,
    61,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fff9a125-5b8e-4f38-aeab-4cbc9dbad30b',
    'black rice',
    58,
    28,
    78,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fc185201-1a03-4df8-8625-4b81f250d392',
    'oats (rolled)',
    55,
    28,
    82,
    63,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '55f79f7e-22d9-4b72-983f-d2ac54d88d1c',
    'steel-cut oats',
    60,
    28,
    82,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '285109c4-926b-4b42-a320-57c6843cc5d5',
    'instant oats',
    45,
    35,
    78,
    58,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '596694de-4a75-422c-8ed2-445a63aba3c4',
    'barley (pearled)',
    48,
    32,
    78,
    60,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f0fafb7a-8bde-4445-b8fd-10abf6ac0e3e',
    'barley (hulled)',
    55,
    28,
    80,
    63,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f99ad768-0c01-4295-92f0-c3abf232b1c9',
    'bulgur wheat',
    52,
    32,
    78,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '06f7020f-86cc-447f-9afd-0a055f9c94f0',
    'couscous',
    35,
    50,
    62,
    49,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '03a46072-4b21-4297-a1c9-8dab454a7287',
    'whole wheat couscous',
    50,
    42,
    72,
    57,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '73286820-5a7e-4dbf-babb-bcf31851e5c8',
    'semolina',
    35,
    52,
    60,
    48,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fe5a2985-ed2d-4f3d-8efa-164247e0be56',
    'farro',
    52,
    35,
    75,
    60,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1d1b4654-92b0-4e8c-89e8-b96b62afcd84',
    'freekeh',
    55,
    32,
    78,
    62,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0aa5d426-6795-4d9f-8007-550489f8016b',
    'kamut',
    52,
    35,
    75,
    60,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c5dcae53-805d-4adb-ba77-a4003a3ec265',
    'baking soda',
    95,
    30,
    60,
    69,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6fcf43e7-ff76-43dd-95da-d543213c987c',
    'baking powder',
    92,
    32,
    62,
    68,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8ce92bfd-35e8-4400-8d43-cea20867f950',
    'active dry yeast',
    88,
    32,
    70,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ead9d977-bea4-4f9b-8761-384690847b37',
    'instant yeast',
    88,
    32,
    70,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b9fd1035-8075-4a69-8594-773e50b71a17',
    'fresh yeast',
    88,
    30,
    72,
    71,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '90dc0a28-369c-473a-988e-ee01b3220921',
    'nutritional yeast',
    85,
    25,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '10dac2bd-1ff0-4bd5-af29-175043494d55',
    'cream of tartar',
    92,
    35,
    65,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '84e491ba-3864-4a67-9c9e-739424ec08f5',
    'ammonium bicarbonate',
    90,
    35,
    55,
    66,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Baking references", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '813947d7-4dca-4c78-a4f4-76c4cc46d641',
    'agar-agar',
    90,
    28,
    75,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd754f074-4e88-4eaf-a55f-9a526dcf028c',
    'gelatin',
    88,
    35,
    68,
    68,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '800dca05-fc07-4a79-bd48-077181aa504a',
    'pectin',
    88,
    28,
    78,
    72,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '245df849-d063-4f85-b2ad-75185d55d568',
    'xanthan gum',
    92,
    38,
    55,
    66,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '13077670-7acc-4208-8190-939f6cca6de1',
    'guar gum',
    88,
    35,
    55,
    65,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6f31eeef-0637-4472-9e58-cececef70785',
    'locust bean gum',
    90,
    35,
    60,
    67,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4a3a5273-2390-42cd-ad98-2719a493533e',
    'carrageenan',
    88,
    55,
    35,
    56,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "EFSA controversies", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'de731f3f-01e6-49bd-be64-fed15d9aaa83',
    'cellulose gum',
    90,
    42,
    55,
    64,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f4f8882b-c0a6-4f9e-9c78-5ff2323f6522',
    'methylcellulose',
    90,
    45,
    52,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '01331cab-5573-4399-ad2c-08d7cb38ec18',
    'modified food starch',
    70,
    45,
    55,
    58,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '88e717b8-a734-4c49-82df-2da23e76bd91',
    'maltodextrin',
    15,
    65,
    45,
    36,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bf53acd1-ada6-4ede-a792-2aae8d1db44a',
    'dextrin',
    20,
    60,
    50,
    40,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a03c0c17-ed15-4300-8bfa-4ff18b0a41a7',
    'lecithin (soy)',
    92,
    32,
    70,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'df4f3141-8415-4b42-9eec-ac0e24356a42',
    'lecithin (sunflower)',
    92,
    30,
    72,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '172a69b0-583f-488a-85cd-28a7ae7bbd5d',
    'mono and diglycerides',
    88,
    50,
    50,
    61,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1053804c-61ce-47fb-a6f7-81f4ff22f646',
    'polysorbate 80',
    88,
    60,
    35,
    55,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9d2b6397-0156-4dfd-9a49-becab4f21114',
    'sodium alginate',
    90,
    35,
    65,
    68,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8f2b0329-67ca-49ca-93a5-1943ea30dd48',
    'salt (sodium chloride)',
    90,
    50,
    70,
    66,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "AHA", "type": "other"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5bbbb829-0ff2-4c6c-99a4-d209f063115a',
    'citric acid',
    92,
    28,
    65,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '06db8863-3813-4470-8024-d30e1ada467e',
    'ascorbic acid',
    92,
    20,
    75,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '34e88cd4-9598-4472-9c71-d7a638ac34e4',
    'tocopherols',
    92,
    18,
    72,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9a231deb-e5b1-4aac-b893-f713cde3a742',
    'rosemary extract',
    92,
    20,
    75,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "European Food Safety Authority", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c965acea-7c2f-4374-8e09-03523b440557',
    'sodium benzoate',
    90,
    50,
    45,
    61,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd985a171-c629-4954-8886-6df1fe9cb0ad',
    'potassium sorbate',
    90,
    45,
    50,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3608cc3a-b032-4a6f-9ae6-d1aaf58d9a8f',
    'sodium nitrite',
    88,
    65,
    40,
    56,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "IARC", "type": "other"}, {"name": "WHO", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '675ae840-74dd-4e42-8025-df1bb9efb167',
    'sodium nitrate',
    88,
    65,
    40,
    56,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "IARC", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a53677b7-3832-4a2d-92e4-dd7e3cf6c88a',
    'calcium propionate',
    90,
    45,
    50,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fbf10eeb-658e-4410-9df0-d59acb35f4a0',
    'sulfur dioxide',
    88,
    50,
    40,
    59,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '49308cc7-612e-4f88-95cf-a79987c9ff84',
    'sodium sulfite',
    88,
    52,
    38,
    58,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ea8c1163-7814-498a-972f-554975d16213',
    'bha (butylated hydroxyanisole)',
    88,
    60,
    45,
    58,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "IARC", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9406d5ad-2ab4-4f64-b2f0-e802978538e0',
    'bht (butylated hydroxytoluene)',
    88,
    58,
    45,
    58,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'af04d8df-e8bc-4a1a-8ebb-af68a33da54a',
    'tbhq',
    88,
    62,
    42,
    57,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '68b2d73c-a11f-4447-ad6b-ef845ecf1c47',
    'calcium disodium edta',
    90,
    45,
    50,
    63,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6728c7d5-fa17-44af-90f3-f85c632730ed',
    'msg (monosodium glutamate)',
    90,
    35,
    58,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '275ace61-a144-47ba-90de-176c6946cd17',
    'disodium inosinate',
    90,
    38,
    58,
    66,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a84c77de-8613-43c1-a763-c5ecdad853b4',
    'disodium guanylate',
    90,
    38,
    58,
    66,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fe826229-1792-4a0c-8d09-893c81d9bc40',
    'autolyzed yeast extract',
    88,
    35,
    60,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e4948464-b704-4c10-9329-50b911190f10',
    'hydrolyzed vegetable protein',
    82,
    42,
    55,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fb3f932c-bd8a-4c26-bc5e-aad382546543',
    'natural flavors',
    85,
    40,
    60,
    65,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '75639144-6edc-4922-b861-445d16721dd4',
    'artificial flavors',
    85,
    45,
    55,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '46aff237-f838-4f6f-93d5-a9ef691d9fff',
    'vanilla extract',
    88,
    28,
    72,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e4933352-2018-458c-856e-2014e3fc374f',
    'vanillin',
    88,
    38,
    65,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6da00791-3a52-41ae-a074-f95fb39c0565',
    'smoke flavor',
    88,
    45,
    55,
    64,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd5514398-a31c-401a-87fa-8b525f90db59',
    'beta-carotene',
    92,
    20,
    75,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cc3ee615-6cb9-4ff5-8e30-e43f7164376c',
    'annatto',
    90,
    32,
    68,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c9b99542-679a-4f60-93d5-60ba7f9ac3c7',
    'turmeric (curcumin)',
    88,
    15,
    75,
    74,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6c3f6b3b-1d72-4e42-ba79-d1bb3e658311',
    'beet juice',
    75,
    25,
    78,
    69,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'abdeaca0-7447-4d61-81d1-108a2b11ef93',
    'paprika extract',
    90,
    28,
    72,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '7e1a711d-247e-4c5b-b10a-d58e44300c82',
    'saffron',
    90,
    22,
    72,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1b878c6b-3423-426a-af5e-99622561c45c',
    'spirulina extract',
    88,
    22,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2772db27-2e1b-4d1d-a5a1-0b17c2cd1d9a',
    'chlorophyll',
    90,
    28,
    72,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f90eb985-784d-4b87-a53a-ff18c8b2f478',
    'caramel color',
    78,
    45,
    55,
    61,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8cd4a0ac-7834-46b8-825b-79ba65f3a6a5',
    'red 40 (allura red)',
    90,
    55,
    40,
    59,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "CSPI", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '54adf326-780a-4821-91e9-2b7ad4a5cc07',
    'yellow 5 (tartrazine)',
    90,
    55,
    40,
    59,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6fd6d8e8-d567-4490-861f-49f9697b531b',
    'yellow 6 (sunset yellow)',
    90,
    55,
    40,
    59,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f7c97a8f-d3d7-45df-bea0-9e7477c57f1d',
    'blue 1 (brilliant blue)',
    90,
    52,
    45,
    60,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9625bdd5-f2db-4657-813c-26f6bf1c62b0',
    'blue 2 (indigotine)',
    90,
    52,
    45,
    60,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0be86772-3592-4334-907e-de9f5f7aa3b5',
    'red 3 (erythrosine)',
    88,
    58,
    38,
    57,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9b4d4480-547b-432d-b432-da9ab70b8ac6',
    'vinegar (distilled)',
    88,
    28,
    72,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '235eeb38-54cf-4ecf-9c00-0fe7c6f6921f',
    'apple cider vinegar',
    85,
    25,
    75,
    71,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bfc25397-1800-422f-a1f5-4e1fa0d4eb04',
    'balsamic vinegar',
    75,
    28,
    72,
    67,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4e2258c4-d992-4c23-ac5f-9c974ac8e49b',
    'rice vinegar',
    85,
    30,
    70,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '835d3915-0b95-49c4-a847-b2bdd9e46f1d',
    'lemon juice',
    88,
    22,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '10adbb1e-aeb3-445e-ab52-e23b2ba3cd71',
    'lime juice',
    88,
    22,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b6451ac9-9881-4223-84cc-8783fd5e254f',
    'lactic acid',
    90,
    28,
    75,
    72,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '060c3b25-159f-4347-8800-c54a39e024ea',
    'malic acid',
    90,
    32,
    68,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f9346432-4105-4ae4-8da5-993071674f98',
    'tartaric acid',
    90,
    35,
    65,
    68,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '11cbb68a-aacc-45d0-9930-743089bad14f',
    'phosphoric acid',
    88,
    60,
    45,
    59,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c1ef9e6c-4524-4f55-821b-7237b806512c',
    'acetic acid',
    88,
    30,
    70,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f48ee4a4-7557-4469-b4e6-d3204fbd5791',
    'cinnamon',
    85,
    18,
    78,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '7069ac98-366b-40ab-bd61-dab6184d05a9',
    'ginger',
    88,
    15,
    82,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Healthline", "type": "health_media"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '14969350-ac94-43a8-850f-026e75750971',
    'turmeric',
    88,
    12,
    78,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1e75265b-af28-4205-a41c-83a264f28b15',
    'black pepper',
    92,
    25,
    75,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'df249bd2-59fd-458c-b15a-e4130bff148b',
    'cayenne pepper',
    88,
    22,
    72,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '7f479d9e-8056-44e8-ac01-0440a814dc2e',
    'paprika',
    90,
    28,
    72,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '37ce3544-58b5-4421-a8bc-d8f9634f21a9',
    'cumin',
    90,
    25,
    78,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4252f65c-60a9-4cd3-b522-0d81c1924a25',
    'coriander',
    90,
    28,
    75,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fcf085d2-770a-427d-8996-b6b392db8d76',
    'oregano',
    92,
    20,
    78,
    75,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e7ef265c-96f0-4753-8505-46491d7381d5',
    'basil',
    92,
    22,
    78,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ed718808-198e-4cf9-ad89-eacf2a80fdf9',
    'rosemary',
    92,
    18,
    78,
    75,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6bcdf1df-3585-422e-a65a-5247e8bab8dd',
    'thyme',
    92,
    20,
    78,
    75,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9c9aaf7c-363c-4b9a-b919-ed099e34d812',
    'sage',
    90,
    22,
    75,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '14e5efc7-b785-4c41-86e4-10ca0533d6a8',
    'parsley',
    92,
    25,
    78,
    74,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3c1df09c-66aa-4671-abdf-ab7da7e8fdfc',
    'dill',
    92,
    28,
    75,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '752f37e2-4070-4790-a4a9-4155e4e8e18e',
    'mint',
    92,
    25,
    80,
    74,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b21351af-8a5a-4ca5-b08e-94ca1aca0d42',
    'garlic (powder)',
    88,
    15,
    80,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cd40a70c-49a3-4045-9707-dec53fe08ef2',
    'onion (powder)',
    85,
    22,
    78,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2d463162-8027-409e-8eb6-6edd274b8280',
    'chili powder',
    88,
    22,
    72,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5421ab11-67ee-4625-8dc5-0be4e4523046',
    'curry powder',
    88,
    18,
    75,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '47062649-b7d7-4bc4-832d-a5c8f00fdcf7',
    'nutmeg',
    90,
    30,
    68,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1edab937-7d05-4c4d-a294-c88a07e16eb7',
    'cloves',
    90,
    20,
    72,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '89dcf0d3-5fce-46d6-b35c-372cb6458439',
    'cardamom',
    90,
    25,
    75,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9b1e3053-7d1e-47fd-a1fb-491b109aa7bf',
    'fennel',
    90,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8980ac55-10bf-4662-b624-98ea37679d48',
    'mustard (powder)',
    88,
    28,
    72,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '29a7d3fe-a4a6-462b-a957-7e8c703249aa',
    'apple (raw)',
    65,
    22,
    82,
    68,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '7a1b91a4-4ca1-4ed2-b4bc-2ca260a532ad',
    'banana (raw)',
    48,
    28,
    78,
    60,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '210fe840-0a6b-473e-905c-de40f92b0d20',
    'orange (raw)',
    62,
    22,
    78,
    65,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '50588374-8c74-4d70-98e2-29786bf1af89',
    'strawberries (raw)',
    72,
    18,
    82,
    70,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '70a1808c-ce4b-4936-a59e-00ade5078832',
    'blueberries (raw)',
    70,
    12,
    85,
    71,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bf78dd3e-2015-4d63-b39a-8991c20ef57c',
    'raspberries (raw)',
    78,
    18,
    85,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e0f57143-1665-4e93-885b-11214c84149a',
    'blackberries (raw)',
    78,
    18,
    85,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2a4b2a19-ef58-440b-93cd-393b651a48fa',
    'grapes (raw)',
    52,
    25,
    75,
    61,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5201c047-3114-45e0-94b6-44749392af80',
    'mango (raw)',
    45,
    28,
    75,
    59,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd36b4375-33bc-459a-8be4-01a32afd405a',
    'pineapple (raw)',
    50,
    28,
    72,
    59,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3e4a0bac-b4c4-4213-80a7-faa072a0870c',
    'papaya (raw)',
    55,
    25,
    78,
    63,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '32513d28-08d4-49a6-b87d-bad2be5c75c7',
    'kiwi (raw)',
    68,
    22,
    82,
    68,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '93fed810-81f7-49e4-bff7-905b9d078c03',
    'pomegranate',
    72,
    15,
    80,
    70,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0ba39957-651f-44fe-b66e-3a0cacb82653',
    'cherries (raw)',
    65,
    20,
    78,
    66,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a73c7030-ca7f-4f99-a4ab-25a0c827d0ce',
    'peaches (raw)',
    62,
    28,
    78,
    64,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ed212635-a665-4e66-8d30-46870bbb3212',
    'plums (raw)',
    60,
    28,
    80,
    64,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'aa5478e5-0408-4bab-951a-2c4842f9719a',
    'apricots (raw)',
    62,
    28,
    78,
    64,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd0336c05-20ad-48ab-9062-c4645e5f86dc',
    'watermelon',
    40,
    32,
    75,
    56,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5970b8fe-a2ad-4c67-9475-9d57a22afab6',
    'cantaloupe',
    55,
    30,
    75,
    61,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd71e064a-e9c4-484c-9313-30a22993d7eb',
    'honeydew',
    50,
    32,
    72,
    58,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f08bb53a-dbd3-4df6-86e7-8faab86b966c',
    'avocado',
    88,
    18,
    82,
    74,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '62112a1f-194a-4918-abb2-5f653c0c81ef',
    'coconut (raw)',
    78,
    40,
    75,
    66,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '40ea3ea0-efec-43b6-bdc1-96a640bf1662',
    'dried cranberries',
    35,
    38,
    55,
    50,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '664aa31c-9650-471a-b122-3287f07b29c9',
    'raisins',
    38,
    38,
    60,
    52,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6671f0f6-d017-48f9-9635-91c7dfb8c498',
    'dates',
    42,
    32,
    72,
    57,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f1833d4b-bb74-412b-9e3d-bc28603997b5',
    'prunes',
    48,
    28,
    82,
    61,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '229d5a26-520d-4941-ae5c-d36c0b6473ae',
    'dried apricots',
    45,
    32,
    65,
    56,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9fb8206e-c0e3-470b-8279-10cb5be86a4c',
    'dried figs',
    45,
    30,
    75,
    59,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c7384849-62d8-444b-89ac-a16fc42d2f8a',
    'freeze-dried fruit',
    55,
    28,
    70,
    61,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a2c550d9-347a-4020-a28b-084b9057ead6',
    'fruit juice concentrate',
    20,
    70,
    35,
    34,
    '{"score": 70, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'df545aec-bf36-4f11-a9d3-e65fc3dc2d6e',
    'spinach (raw)',
    92,
    12,
    85,
    78,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '953a9e28-30d9-4644-abb4-27adc7072fe0',
    'kale (raw)',
    92,
    10,
    82,
    77,
    '{"score": 12, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cfbab27c-25dc-4401-8318-67b3198002f6',
    'arugula',
    92,
    18,
    82,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8fdd4ff1-8ee5-4b99-8a6d-4443836d8c6e',
    'swiss chard',
    92,
    15,
    82,
    76,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bd009c81-2412-4f39-8b64-f285041860be',
    'romaine lettuce',
    92,
    25,
    80,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3dc31fe3-b0a8-419d-968a-9f56fb0eff59',
    'broccoli (raw)',
    90,
    12,
    85,
    77,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f5da975f-e9e8-488b-8dd2-642bcc4cfb32',
    'cauliflower (raw)',
    90,
    18,
    82,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '34c6315c-158e-4ed8-8677-52190e9f45cc',
    'brussels sprouts',
    88,
    15,
    78,
    74,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f8bc9b9b-8ee8-4af5-a61f-5c7979114aa2',
    'cabbage (raw)',
    90,
    22,
    82,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2a02c70a-777c-456a-ad1d-06fe071afb29',
    'bok choy',
    92,
    20,
    82,
    75,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '20fca25b-52e3-460b-8cf0-920311c1957e',
    'carrots (raw)',
    65,
    25,
    80,
    66,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '7a61f163-f36f-4f0b-9ee6-a33e69b6d7ac',
    'sweet potato',
    55,
    22,
    82,
    64,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '87c3b60b-3e85-4f49-9c3a-99d21f4f1001',
    'beets (raw)',
    58,
    22,
    82,
    65,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bf25ecf6-3ab8-4fdc-8c5c-f9edad0349c9',
    'turnips',
    72,
    28,
    78,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b285b4c0-d9b8-4512-a8a9-f78b0587fe06',
    'radishes',
    88,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1c41d55c-e0ba-43a7-b850-804c9fa5955c',
    'parsnips',
    52,
    30,
    78,
    61,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '89e8c1de-4aa1-429f-a66b-097715f93ab2',
    'celery',
    92,
    28,
    78,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c3644971-999d-41b2-b7bd-6c1b855a641c',
    'asparagus',
    88,
    22,
    82,
    73,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '00324f37-2541-4880-bac2-029877680593',
    'artichoke',
    82,
    22,
    88,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2f650257-a0f0-4151-9c29-a89fe4d9e024',
    'bell peppers',
    85,
    18,
    80,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cccf95c0-2691-44e7-bf93-f4e3f06e1d65',
    'tomatoes (raw)',
    78,
    20,
    80,
    71,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '50d0d01a-adac-46f0-9e1a-cc03911e22b2',
    'eggplant',
    85,
    25,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '87f20266-b849-4d6a-8936-d66ea6ae5c94',
    'zucchini',
    88,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '595b062a-3a6b-4032-a82c-7ee6f0befdb3',
    'yellow squash',
    88,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6f657b1c-53bb-485a-ad2c-32f42f47b628',
    'butternut squash',
    58,
    25,
    78,
    64,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '106d4394-7eb2-490e-803f-fa596763e540',
    'acorn squash',
    60,
    28,
    78,
    64,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a0c716a1-8804-45b7-917f-ee3fd4af605d',
    'pumpkin',
    62,
    25,
    78,
    64,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0e84ccec-e139-45fd-aec8-431d5a667ea0',
    'cucumber',
    92,
    30,
    80,
    73,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c8884858-ccc7-4cc3-92d8-16f441b54ad0',
    'mushrooms (button)',
    92,
    25,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c029c1c1-4a07-4480-b945-3735476ffad0',
    'shiitake mushrooms',
    90,
    18,
    80,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '058bec7c-f147-4a2c-9ed3-7a31aecfbda5',
    'portobello mushrooms',
    90,
    25,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c796c3a5-0338-4562-ad9c-71d4299212fa',
    'onions',
    78,
    22,
    80,
    70,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6492b915-f5c7-4f4d-9ee7-b04069f5b906',
    'garlic',
    85,
    12,
    82,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f0330c34-2491-4856-b146-e8e6132819bc',
    'leeks',
    82,
    25,
    82,
    71,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bfbf61fe-fc39-4417-801f-b19fbea05718',
    'scallions',
    88,
    25,
    80,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cfe991d8-75dc-4e2e-b7a0-55836be8dbbd',
    'corn (sweet)',
    48,
    35,
    72,
    58,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b83bf4c6-3878-4dc7-8c26-aa3101fad956',
    'green peas',
    58,
    28,
    78,
    63,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '913701a3-c65f-4bb1-b5ff-4e206e03c7cb',
    'green beans',
    85,
    28,
    78,
    71,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '50bb9595-967e-4c0a-a8d8-5ccf41793127',
    'snow peas',
    82,
    28,
    78,
    70,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f5ae1c66-b706-4a65-b1ac-8ade482955d9',
    'coffee (black)',
    88,
    22,
    75,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '72ac8df1-e470-4e74-90be-1f366782dfeb',
    'green tea',
    90,
    15,
    82,
    76,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3eb48ae1-1167-4d18-b5ab-4158e752446e',
    'black tea',
    88,
    22,
    78,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd928fb36-acfd-4f39-a97b-506edcd8a0a6',
    'matcha',
    88,
    12,
    80,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8c49ef5c-a425-4b40-b53f-4448edf5a627',
    'herbal tea (chamomile)',
    92,
    25,
    80,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '93fcc5cc-4d0e-4780-a8cc-3afc57109589',
    'herbal tea (peppermint)',
    92,
    28,
    82,
    74,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f756c504-d819-4713-a22e-73f23dfb26c0',
    'cocoa powder (unsweetened)',
    82,
    15,
    78,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '79b744f3-3c90-4eb3-82bc-5800cbcbb087',
    'dark chocolate (70%+)',
    68,
    18,
    72,
    67,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a8d8b94b-cbdc-4c6f-9e92-cd3463a60ee6',
    'milk chocolate',
    40,
    50,
    60,
    50,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8a9edd3c-11e8-4f7d-8cf0-7e68e0420052',
    'alcohol (red wine)',
    55,
    38,
    50,
    55,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "AHA", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b59a7aca-afb4-4507-8700-13780753cf24',
    'alcohol (beer)',
    35,
    55,
    45,
    44,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5ddd501e-f490-4944-ad95-1cac82b89113',
    'alcohol (spirits)',
    70,
    60,
    40,
    52,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a80515da-5fa4-4be2-9c00-435c9987bbf8',
    'coconut water',
    62,
    28,
    75,
    63,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4e43891b-aa13-4a79-8b24-a49abf381078',
    'sparkling water',
    95,
    25,
    78,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0edb30ab-ee17-4497-ac5a-e07afa9f9c5c',
    'soy sauce',
    85,
    45,
    55,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '95cd9588-6f82-49f0-a60b-240b09f440dc',
    'tamari',
    85,
    42,
    58,
    64,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5cd95aa9-9d15-4a66-8a12-85ed154eba4f',
    'fish sauce',
    88,
    48,
    52,
    62,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '290241ef-a372-4fd9-8337-613f4334f033',
    'worcestershire sauce',
    82,
    42,
    55,
    62,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2977c572-2e46-46b4-bd2e-d909879c5d28',
    'hot sauce',
    88,
    25,
    65,
    69,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4da41e21-fe51-4a5a-b027-d057fbed312f',
    'sriracha',
    75,
    28,
    62,
    64,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd7965769-96f1-4acf-a627-f29b41cf7cbb',
    'ketchup',
    52,
    45,
    60,
    54,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6da43b66-f5be-44f3-80a9-de45cac89b12',
    'mustard (yellow)',
    92,
    28,
    72,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0fa91323-789b-4972-8449-6e83b08bbb66',
    'dijon mustard',
    92,
    28,
    72,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '70dbb876-6ddd-440a-b63c-ce0e49f6c5e8',
    'mayonnaise',
    88,
    50,
    65,
    64,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'dbd19589-b1c7-4001-a02d-bd9e067023fa',
    'ranch dressing',
    78,
    58,
    55,
    58,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '49d4eae8-0bf3-4016-bfd0-b005193c2f35',
    'italian dressing',
    82,
    38,
    65,
    65,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2ef864b9-7e00-4792-bffa-83456c2c8451',
    'balsamic glaze',
    45,
    35,
    65,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'da42199e-047b-4a32-9c67-9f069bad7817',
    'tahini',
    82,
    25,
    75,
    70,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '110536fb-5880-454a-a8c0-30e7de251e66',
    'peanut butter (natural)',
    78,
    28,
    72,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '73698550-f831-406b-9d4f-7c6b7de3d9a8',
    'almond butter',
    82,
    22,
    72,
    69,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2f796ceb-68cf-407e-909a-0ee413a55175',
    'hummus',
    70,
    25,
    78,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b3f5edf4-40e5-4966-b78b-582671c6b24f',
    'guacamole',
    82,
    20,
    80,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f0534952-6d3e-4cb5-ba61-ebcead10827d',
    'salsa (fresh)',
    85,
    22,
    78,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3299eaf8-11de-4c89-8263-793043342871',
    'pesto',
    82,
    25,
    72,
    69,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ee50f7b8-a256-41a2-888d-d587d126bcf8',
    'teriyaki sauce',
    42,
    52,
    52,
    48,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c87d6be3-0527-49b1-9968-acb92b7868a4',
    'hoisin sauce',
    38,
    55,
    50,
    46,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '03054094-018d-4245-8cf2-fe9f572c400b',
    'oyster sauce',
    72,
    48,
    52,
    57,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2d9fe399-59e5-463d-a40a-b1447d605674',
    'miso paste',
    75,
    28,
    80,
    68,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd292ad95-4bc5-4165-a05f-5129de0c85b4',
    'nutritional yeast',
    85,
    25,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6e481a19-53ab-4872-9cde-35e0edf471e8',
    'chicken breast (skinless)',
    92,
    32,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5a356238-8f3b-4ed6-947c-e5101631fcfd',
    'chicken thigh (skinless)',
    90,
    38,
    78,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '93f596fa-3b3b-4bf4-85cc-5be12749e88f',
    'chicken (with skin)',
    88,
    45,
    75,
    67,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ef7a1a8f-f397-4d37-838f-7872dbb3442f',
    'turkey breast',
    92,
    30,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e9e7c56a-6629-4058-ae0a-38a41a898803',
    'ground turkey (lean)',
    88,
    35,
    75,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '59de6441-f95c-482d-9b94-daf317544492',
    'duck',
    85,
    45,
    72,
    66,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6f04e2de-fad1-471f-aba6-ca31b2911b7e',
    'beef (lean cuts)',
    88,
    45,
    72,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f14a5daf-d9fe-4aa5-977a-dd96cbda5a5a',
    'beef (ground, 90% lean)',
    85,
    48,
    70,
    65,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '021a9d33-7fce-4421-987c-a761966ea75e',
    'beef (ground, 80% lean)',
    82,
    55,
    68,
    63,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '59820cc8-d0f8-49d3-901b-1402b37f5fac',
    'steak (sirloin)',
    88,
    45,
    72,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3ae137f9-7ace-437b-8c8e-e91f2c43c451',
    'steak (ribeye)',
    82,
    52,
    70,
    64,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '00e84e20-6de5-4074-b07c-2bfa366f34f8',
    'pork tenderloin',
    88,
    38,
    75,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4f29238f-7361-4038-a73d-b52b22885cd6',
    'pork chop (lean)',
    85,
    42,
    72,
    67,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd8c13d56-256a-429f-94a9-a50afcf0456e',
    'pork (ground)',
    82,
    52,
    68,
    63,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '983af7b0-bb6b-4310-821a-b37d579aca0b',
    'bacon',
    78,
    70,
    55,
    56,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "IARC", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '44bc53c8-baaf-4ba8-8785-b695f8f29b1d',
    'ham',
    80,
    60,
    55,
    58,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "IARC", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2a3cc666-d15d-46fe-97d6-8e91cfb475f5',
    'sausage (pork)',
    75,
    65,
    52,
    55,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "IARC", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4e8c2241-9cf1-48c9-b4b4-5e543de2c9c9',
    'hot dog',
    72,
    72,
    48,
    52,
    '{"score": 68, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "IARC", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bde9608b-3144-4e7b-b311-67fa4f564d58',
    'deli turkey',
    82,
    52,
    55,
    60,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd8291dd8-720b-41eb-9819-182e9389ab8f',
    'lamb (lean)',
    85,
    45,
    70,
    66,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6239e2fd-62fb-4b2b-bff2-7d81d7f09c10',
    'venison',
    90,
    32,
    75,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c445d49c-017a-4e5d-8a13-2cd21da7a852',
    'bison',
    88,
    35,
    75,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '74d84c4c-33ce-4d9a-91ef-3fb27d0a0ba6',
    'liver (beef)',
    80,
    40,
    68,
    66,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '427f3e2d-f77c-4c60-90ca-aa62b01e4768',
    'liver (chicken)',
    82,
    38,
    70,
    67,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6a0b0d7d-dc04-42d1-8090-f5ba79d86884',
    'salmon (wild)',
    88,
    12,
    80,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '054d5ef9-2948-4490-9fec-def8e6b484d3',
    'salmon (farmed)',
    85,
    18,
    78,
    73,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd9c38d7c-5c74-42f3-98ee-9833f53150e2',
    'tuna (fresh)',
    90,
    20,
    78,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3a26dcfe-b6bf-47f0-8ed5-50edfd26096d',
    'tuna (canned, light)',
    88,
    25,
    75,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '64b649b8-8d40-4dfc-a2e9-6e7475971e58',
    'tuna (canned, albacore)',
    85,
    28,
    72,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9e4618e1-4ce4-4a6c-aa0b-ae70f17dc6aa',
    'sardines',
    90,
    15,
    82,
    76,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1884fb6c-8e67-434b-b40b-5eeba21df4a5',
    'mackerel',
    88,
    15,
    80,
    75,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '50d57724-07ea-4cfb-a9dc-f66388160830',
    'herring',
    88,
    15,
    80,
    75,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '77e2ab7c-d632-454c-8ab4-c987226dc599',
    'anchovies',
    90,
    18,
    78,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '6f7b85d3-6e15-4607-b0ce-4f73a8fa4230',
    'cod',
    92,
    28,
    78,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '659f5444-0766-4aec-8c9b-7ef5fbedf6c7',
    'tilapia',
    90,
    40,
    75,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0bf85535-f5c2-4ceb-80b9-9263c6d190ab',
    'halibut',
    90,
    28,
    78,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0d8b7e4e-3b9c-4fb5-bbf2-137b50b6805a',
    'mahi-mahi',
    90,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '81b94ded-54d2-4f8c-9102-b9022ab5809a',
    'snapper',
    90,
    30,
    78,
    72,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1be27df6-8418-4f9a-9736-53a142563210',
    'catfish',
    88,
    35,
    75,
    70,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2f10a764-13f0-4b71-8836-1248d82d1b25',
    'trout (rainbow)',
    88,
    18,
    78,
    74,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b019b249-d83e-4930-bdd7-44a261731d8d',
    'sea bass',
    90,
    28,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cba71fb9-433b-41b5-baa7-5f56355c3797',
    'flounder',
    92,
    30,
    78,
    73,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd42dd42b-b70e-4663-bd8d-3f344b20589d',
    'sole',
    92,
    30,
    78,
    73,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4e1664dd-fcdf-4feb-9d6e-89315349b00c',
    'shrimp',
    90,
    32,
    75,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fc281fa4-7aab-4146-b072-15739d118ae1',
    'lobster',
    90,
    32,
    75,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1a484515-bc56-48b8-94c6-e2ead3343afb',
    'crab',
    90,
    30,
    75,
    71,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9d41ed42-6c80-492d-9a07-80d00e226b43',
    'scallops',
    90,
    30,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '82ab8593-ccfe-4527-9341-b8329c264e40',
    'mussels',
    88,
    25,
    78,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5ee39c4b-e2dd-41d2-89ec-43bdba681682',
    'oysters',
    88,
    22,
    78,
    72,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c545632c-d0ff-4e3c-94a1-87e36d626a0b',
    'clams',
    88,
    25,
    78,
    72,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e4141cf7-d645-49bd-b7af-c49710005f2c',
    'calamari (squid)',
    88,
    35,
    72,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f0428925-effb-4dc9-a771-3380500c49e5',
    'octopus',
    88,
    35,
    72,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1526b474-b3be-4e73-9092-fc0c682b75e9',
    'bread (white)',
    28,
    62,
    48,
    41,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'eab20904-a805-4b2d-99f2-d22c8ca4e01a',
    'bread (whole wheat)',
    50,
    42,
    70,
    57,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '399d7eb0-5ce4-48e4-95fd-e350e4f44796',
    'bread (sourdough)',
    55,
    38,
    72,
    59,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a899307b-5d0b-4ed1-85ac-a7b84212e8f1',
    'bread (rye)',
    55,
    38,
    72,
    59,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a1e10d2f-06c2-4c12-93ac-4d5994652e5c',
    'bread (multigrain)',
    52,
    42,
    68,
    57,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '18b5c9ac-755f-46f1-ad13-a59995ae7b6e',
    'tortilla (flour)',
    35,
    55,
    55,
    46,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f34b3bab-866a-4e2e-8dcc-8eb168487bcf',
    'tortilla (corn)',
    48,
    45,
    68,
    55,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f246a84f-ec43-4ea4-8188-a1519709aff4',
    'pasta (white)',
    38,
    55,
    55,
    47,
    '{"score": 58, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd95ee9dd-4645-4fcc-8bdf-333898fba77b',
    'pasta (whole wheat)',
    52,
    42,
    72,
    58,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5f962754-9544-454f-bb01-48a2aa142496',
    'pasta (gluten-free)',
    38,
    48,
    60,
    50,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '7c16cf1e-881d-489a-a6b5-a58d52fa55d6',
    'crackers (whole grain)',
    48,
    45,
    62,
    54,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '50046868-e03c-4d24-8423-2a2704bafa17',
    'crackers (refined)',
    30,
    60,
    52,
    43,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '69e73220-3e05-4da6-a61f-d42071f24f32',
    'chips (potato)',
    35,
    68,
    42,
    41,
    '{"score": 68, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '57131fbf-3f15-48c1-ab47-7835bba78707',
    'chips (tortilla)',
    38,
    62,
    48,
    45,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b6cb7177-871f-49d2-b169-cfc181ebc206',
    'popcorn (air-popped)',
    70,
    32,
    78,
    66,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '25589ca2-b49f-4844-9fc9-38151b430ea8',
    'popcorn (butter)',
    55,
    52,
    68,
    55,
    '{"score": 48, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fe9a1068-c54d-4255-a4cf-184ade2ae5f6',
    'pretzels',
    35,
    58,
    55,
    46,
    '{"score": 60, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '71de48d3-7532-42f1-b238-b20557e42177',
    'granola bar',
    42,
    52,
    55,
    49,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '972f6de0-d75b-4a88-a9b6-927149dd8651',
    'protein bar',
    55,
    45,
    55,
    53,
    '{"score": 42, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '79620f39-43c2-4680-89f5-60f38df520f1',
    'cereal (sugary)',
    20,
    70,
    40,
    36,
    '{"score": 72, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a9658871-6161-4ad1-b57d-8c6c4a7d112e',
    'cereal (whole grain, low sugar)',
    55,
    38,
    72,
    59,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '51c860d9-de11-4744-834d-fae0268f95bf',
    'oatmeal (instant, flavored)',
    45,
    42,
    72,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e1634222-8e36-4aaa-9c87-5e5404b050d3',
    'pancake mix',
    28,
    62,
    48,
    41,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8940d1f7-cc4d-457f-a222-a74512a16276',
    'waffle (frozen)',
    30,
    62,
    48,
    42,
    '{"score": 62, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '0e8c527e-e737-4805-be06-eca8a1c45193',
    'pizza (frozen)',
    32,
    65,
    42,
    40,
    '{"score": 65, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '151ace9d-6ef1-47ea-a943-843dac9d1a50',
    'frozen vegetables',
    85,
    25,
    82,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8539faaf-83ec-4d00-b3b3-4cd17b57ae63',
    'frozen fruit',
    72,
    25,
    80,
    68,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e00619ba-6b15-4866-8ff7-6b55de3020e9',
    'canned tomatoes',
    78,
    22,
    75,
    69,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '28caf7f2-5078-4f25-a321-dc59b72576bb',
    'canned beans',
    55,
    28,
    78,
    62,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3a9096a0-c53f-4979-91d1-d04d06f09810',
    'canned soup',
    55,
    52,
    55,
    52,
    '{"score": 50, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3718183b-e741-4045-9990-af52e0a10d08',
    'instant noodles',
    25,
    70,
    38,
    37,
    '{"score": 72, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e244423a-6262-4506-b6a7-5547d65e8af3',
    'bouillon/stock cubes',
    82,
    60,
    52,
    58,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'd987e6ec-684f-4800-ae74-63c421025fdd',
    'soy protein isolate',
    78,
    38,
    62,
    63,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cd2c764d-2c85-41ca-8e69-c9836b3ce3f1',
    'rice protein',
    80,
    35,
    68,
    66,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '78050c6d-f153-4b8c-bb3a-71299866be51',
    'protein powder (blend)',
    78,
    35,
    62,
    64,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3c6efbcb-d9e2-41d3-ac8d-9cd56aaaa521',
    'mct oil',
    92,
    32,
    55,
    67,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9df87735-45c2-4819-9a96-5ff88c397d0a',
    'monk fruit',
    95,
    28,
    72,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '71d7047e-155f-47a4-966a-46449d12fee8',
    'allulose',
    92,
    30,
    60,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'b0aff388-e389-4e86-a254-4a6ef3ccf9f7',
    'tagatose',
    85,
    35,
    55,
    64,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '43f894f2-acee-4b3a-9de6-7131c5d9a32b',
    'yacon syrup',
    75,
    28,
    80,
    69,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '94a44020-83f2-4b32-bfd6-1845b5001088',
    'coconut sugar',
    40,
    52,
    58,
    49,
    '{"score": 55, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "Glycemic Index", "type": "other"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c9a14fee-4648-4bed-91ac-6368923a706f',
    'date sugar',
    48,
    42,
    68,
    56,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ba6749d1-8f42-4203-a68c-94991ead8e69',
    'lucuma',
    68,
    35,
    68,
    63,
    '{"score": 38, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'f818df8e-a113-4cd2-9689-cb0b337964ff',
    'sucralose',
    95,
    45,
    45,
    63,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '5d5cc3fa-bd65-498e-9ea9-f14de09bcb1b',
    'aspartame',
    95,
    48,
    50,
    64,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8bdcc9e1-2efc-47f5-bfb7-903a812696f2',
    'saccharin',
    95,
    50,
    48,
    63,
    '{"score": 50, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '46c7752c-54d7-4252-a48e-cbce2dc26245',
    'acesulfame-k',
    95,
    48,
    50,
    64,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e68654c2-873a-495f-a841-02995a6ff0ae',
    'neotame',
    95,
    45,
    52,
    65,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '96774937-16b1-4223-bc98-b6e88ae18694',
    'advantame',
    95,
    45,
    52,
    65,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '1f56f680-6b71-4ad8-a0f3-3bc9006c9308',
    'glycerol/glycerin',
    78,
    42,
    45,
    58,
    '{"score": 42, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c89fcc90-781d-433b-821a-1fcda4c917ae',
    'mannitol',
    80,
    45,
    25,
    54,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '118a854f-c821-4cd5-ac52-bf4675d03419',
    'isomalt',
    85,
    45,
    30,
    56,
    '{"score": 45, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "European Food Safety Authority", "type": "regulatory"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e5196f63-d17e-4a4a-a4ec-d76d46dd0a59',
    'lactitol',
    82,
    45,
    28,
    55,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "European Food Safety Authority", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8531adfa-cf99-47f7-aed4-080eaaee4b91',
    'maltitol',
    55,
    52,
    30,
    46,
    '{"score": 52, "insulin_impact": "high", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c510663f-2d35-4a37-b7f4-0567096aa7b1',
    'hydrogenated starch hydrolysates',
    72,
    48,
    35,
    53,
    '{"score": 50, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'ce08a3de-4b27-4a80-a66d-50fb413d00a7',
    'trehalose',
    55,
    45,
    58,
    55,
    '{"score": 48, "insulin_impact": "high", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '968b6ca2-ffd1-40e1-94e7-78f45578ca81',
    'isomaltulose',
    68,
    38,
    65,
    61,
    '{"score": 40, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9c9d30c6-3db8-4e9f-85f3-c0663792908d',
    'nutritional yeast',
    85,
    25,
    78,
    72,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cb949c2a-0ba5-4e9b-b842-c70177b83517',
    'spirulina',
    85,
    18,
    75,
    72,
    '{"score": 20, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'dcf1ad70-9bd5-4d9d-9a5e-250d7bf79799',
    'chlorella',
    85,
    20,
    78,
    72,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '08eb2d3e-2bf9-43b6-ba40-e73d7f695a5d',
    'wheatgrass',
    88,
    22,
    78,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '469d7692-36ea-4797-a447-82d6fcd41710',
    'maca powder',
    82,
    30,
    72,
    68,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '383c47ca-ff25-4e1f-a95f-f2c5c1b9091f',
    'ashwagandha',
    88,
    22,
    72,
    70,
    '{"score": 18, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '26378766-2691-4545-998e-cb2030c8d152',
    'ginseng',
    82,
    28,
    68,
    67,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '59ae8d8b-8108-4a45-a2ce-a1ddc542f78b',
    'rhodiola',
    88,
    28,
    70,
    69,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "Examine.com", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '4033289e-9bb3-4024-bba0-fac7d2e7d292',
    'matcha powder',
    88,
    12,
    80,
    75,
    '{"score": 15, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'high',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '464fffd2-ac5d-45d5-a2f4-3dda3777cab0',
    'cacao nibs',
    82,
    15,
    78,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '86ff5238-85a5-4b88-9512-a94d9cbf728c',
    'carob powder',
    65,
    30,
    78,
    65,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a741f6de-83fc-4c82-9bf5-15222be18b25',
    'acai powder',
    75,
    18,
    75,
    69,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c95c97a7-c821-478f-b162-9793dd317e8b',
    'goji berries (dried)',
    58,
    22,
    72,
    63,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '42b11139-7257-4396-8423-ba5a4aaa5ba6',
    'bee pollen',
    72,
    28,
    68,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '382970ed-dbf2-4a6f-99ba-23aebce24146',
    'royal jelly',
    78,
    32,
    65,
    65,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'a25063f8-a8c2-4e80-8fb8-4a6070144c38',
    'propolis',
    90,
    22,
    72,
    73,
    '{"score": 28, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '59304eac-cc1f-4151-ba22-9402abb78069',
    'inulin',
    88,
    28,
    75,
    71,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'eaaa437c-f35c-42cc-9b8b-ba6ca45201c3',
    'fos (fructooligosaccharides)',
    85,
    28,
    72,
    70,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c2442430-c566-4403-bf41-523b0913bda2',
    'gos (galactooligosaccharides)',
    85,
    28,
    75,
    71,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e2faeef9-0498-4d8a-a730-d8818632bdf6',
    'resistant dextrin',
    78,
    32,
    78,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8285f0e6-6662-4ff2-80bb-3184fe4e2c0a',
    'psyllium husk',
    85,
    22,
    85,
    73,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'c36573a2-2e08-4b9b-bd03-d9edeb8da120',
    'acacia fiber',
    88,
    28,
    82,
    73,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'bc3aeffe-b3cd-4352-a1cc-f4584ee5f04b',
    'beta-glucan (oat)',
    80,
    22,
    82,
    71,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "U.S. Food & Drug Administration", "type": "regulatory"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '13989a81-4ace-46a2-88ba-d2105b7689b2',
    'konjac/glucomannan',
    88,
    28,
    78,
    72,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8bfc3590-4e13-4b5e-901b-70bf6aaa1135',
    'seaweed (nori)',
    92,
    20,
    78,
    74,
    '{"score": 22, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '29e891af-ec6b-4795-bf83-12768bf2e70d',
    'kelp',
    90,
    22,
    75,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '2a0e944e-3427-40a4-a391-ffca645503a5',
    'wakame',
    90,
    22,
    78,
    74,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '9e078fac-bf09-4268-bb04-9cc704b81dbd',
    'dulse',
    90,
    22,
    75,
    73,
    '{"score": 25, "insulin_impact": "low", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'fe132f4e-beff-4b0c-bc6e-a84b2993125e',
    'irish moss',
    88,
    30,
    72,
    70,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '83c86d14-e27e-4b4e-add1-3c7540a2ca8f',
    'tempeh bacon',
    78,
    32,
    72,
    67,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e77d4608-aa24-4100-9360-712bed31ee9e',
    'beyond meat',
    65,
    45,
    58,
    57,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'e0d5c202-8071-4dee-8a75-dd5f98201b9a',
    'impossible burger',
    65,
    45,
    58,
    57,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '341d3f25-b888-4cfd-a142-34937f18e87b',
    'jackfruit (young)',
    62,
    28,
    78,
    64,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '853a1df7-da68-4c0a-ab18-1ea88823b209',
    'vital wheat gluten',
    72,
    42,
    40,
    56,
    '{"score": 45, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "moderate"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '3633d206-d6ac-4b84-b825-1b7563c87472',
    'lupin flour',
    78,
    28,
    72,
    68,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    'cd7437f2-1a59-47bf-8d91-17cffdb934b1',
    'cricket flour',
    82,
    28,
    72,
    69,
    '{"score": 30, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '8eeb610a-3ac6-4970-b387-fae438ce4169',
    'mycoprotein (quorn)',
    75,
    32,
    65,
    64,
    '{"score": 32, "insulin_impact": "moderate", "estrogen_impact": "moderate", "cortisol_impact": "low"}',
    'medium',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "PubMed/NCBI", "type": "research"}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '62d47016-1cdf-4d4d-b4bd-155000783d76',
    'aquafaba',
    85,
    32,
    70,
    69,
    '{"score": 35, "insulin_impact": "moderate", "estrogen_impact": "low", "cortisol_impact": "low"}',
    'low',
    '[{"name": "Public Database (Derived)", "type": "secondary", "trusted": false}, {"name": "USDA FoodData Central", "type": "database"}]',
    datetime('now'),
    datetime('now')
);

COMMIT;